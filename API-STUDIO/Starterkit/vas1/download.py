import requests
import json
from io import BytesIO
from django.http import HttpResponse
from reportlab.lib.pagesizes import letter
from django.shortcuts import render
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph

from vas1 import institution


def download_pdf(request, psk_id):
    # API URL to fetch parent (district) data

    institution.work_flow_table_insert(request, psk_id, status="DOWNLOAD")
    institution.application_status_update(psk_id, "DOWNLOAD")

    url = f"https://api.apistudio.app/getapi/phpm02_application_301_master_dc1/{psk_id}"
    headers = {}

    # Sending GET request to fetch parent data
    parent_response = requests.get(url, headers=headers)

    if parent_response.status_code != 200:
        # Handle API failure gracefully
        return HttpResponse("Failed to fetch data for psk_id", status=500)

    parent_data = parent_response.json()

    # Extract required fields
    document_id = parent_data.get('document_id', 'N/A')
    gov_order_date = parent_data.get('gov_order_date', 'N/A')
    gov_order_number = parent_data.get('gov_order_number', 'N/A')

    institution_id = parent_data.get('institution_psk_id', None)
    print("institution_id:", institution_id)
    if not institution_id:
        return HttpResponse("Institution ID not found", status=400)

    # Fetch institution details
    institution_url = f"https://api.apistudio.app/getapi/phpm02_institution_59/{institution_id}"
    institution_response = requests.get(institution_url, headers=headers)

    if institution_response.status_code != 200:
        return HttpResponse("Failed to fetch institution data", status=500)

    institution_data = institution_response.json()
    institution_name = institution_data.get('institution_name', 'N/A')
    institution_address_text = institution_data.get('institution_address_text', 'N/A')

    # Checklist data
    checklist_url = "https://api.apistudio.app/getapi/phpm02_application_304_final_dc4"
    payload = json.dumps({
        "queries": [{
            "field": "parent_psk_id",
            "value": psk_id,
            "operation": "equal"
        }],
        "search_type": "all"
    })

    checklist_headers = {'Content-Type': 'application/json'}
    checklist_response = requests.post(checklist_url, headers=checklist_headers, data=payload)

    if checklist_response.status_code != 200:
        checklist_data = []
    else:
        checklist_data = checklist_response.json()

    # Create PDF response
    buffer = BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=letter)

    # Sample styles
    styles = getSampleStyleSheet()
    title_style = styles['Title']
    table_style = styles['Normal']

    # Set margin and content width
    margin_left, margin_top, margin_right, margin_bottom = 50, 50, 50, 50
    content_width = letter[0] - margin_left - margin_right
    content_height = letter[1] - margin_top - margin_bottom

    # Modify title_style to include space after the title
    title_style = ParagraphStyle('TitleStyle', parent=styles['Title'], fontName='Times-Roman', fontSize=20, leading=24,
                                 alignment=1, spaceAfter=25)

    # Title paragraph (this will now have space after it)
    title = Paragraph("Public Health Department - MBBS College", title_style)
    # # Title - wrapped in Paragraph to be a Flowable
    # title = Paragraph("Public Health Department - Nursing College", title_style)

    table_style = ParagraphStyle('Normal', parent=styles['Normal'], fontName='Times-Roman', fontSize=12, leading=15,
                                 alignment=0, spaceBefore=2, spaceAfter=2)

    normal_style = ParagraphStyle('Normal', parent=styles['Normal'], fontName='Times-Roman', fontSize=12, leading=18,
                                  alignment=0, spaceBefore=2, spaceAfter=2, leftIndent=-27.5)

    signature_style = ParagraphStyle('Normal', parent=styles['Normal'], fontName='Times-Roman', fontSize=12, leading=18,
                                     alignment=2, spaceBefore=5, spaceAfter=2, leftIndent=-27.5)
    # Add document_id to the PDF before the table (optional)
    document_id = Paragraph(f"Applicant ID: {document_id}", normal_style)
    institution_name = Paragraph(f"Institution Name: {institution_name}", normal_style)
    institution_address_text = Paragraph(f"Institution Address: {institution_address_text}", normal_style)

    check_list_data = {
        "check1": {
            "label": "1. Copy of G.O in which the institution was permitted to start MBBS., MD., MS., Medical Course",
            "go_number": parent_data.get('gov_order_number', 'NA'),
            "date": parent_data.get('gov_order_date', 'NA'),
        },
        "check2": {
            "label": "2. Whether the students of the institution were already permitted for the practical training in PHC. If so copies enclosed.",
            "go_number": parent_data.get('permitted_in_phc_gov_no', 'NA'),
            "date": parent_data.get('permitted_in_phc_gov_date', 'NA'),
        },
        "check3": {
            "label": "3. Continuance of provisional affiliation granted by the Tamil Nadu MGR Medical University.",
            "go_number": parent_data.get('affiliation_mgr_university_gov_no', 'NA'),
            "date": parent_data.get('affiliation_mgr_university_gov_date', 'NA'),
        },
        "check4": {
            "label": "4. Whether the Management is willing to pay the fees prescribed by the Government to impart training to their Medical students.",
            "go_number": "NA",
            "date": "NA",
        },
        "check5": {
            "label": "5. Copy of Letter of Permission from the Medical Council of India New Delhi.",
            "go_number": parent_data.get('letter_from_medical_council_gov_no', 'NA'),
            "date": parent_data.get('letter_from_medical_council_gov_date', 'NA'),
        },
        "check6": {
            "label": "6. Copy of essentiality Certificate letter from the Health and Family Welfare Department.",
            "go_number": parent_data.get('permitted_in_phc_gov_no', 'NA'),
            "date": parent_data.get('permitted_in_phc_gov_date', 'NA'),
        },
        "check7": {
            "label": "7. Previous Tie-Up with Public Health Department G.O and G.O date.",
            "go_number": parent_data.get('affiliation_mgr_university_gov_no', 'NA'),
            "date": parent_data.get('affiliation_mgr_university_gov_date', 'NA'),
        },
        "check8": {
            "label": "8.No due certificate of your previous batch of the internship training fees payment along with a copy of the challan duly authenticated by the Chairman of the Trust.",
            "go_number": "NA",
            "date": "NA",
        },
        "check9": {
            "label": "9. Consent Letter for 1000 Sq.Ft building.",
            "go_number": parent_data.get('permitted_in_phc_gov_no', 'NA'),
            "date": parent_data.get('permitted_in_phc_gov_date', 'NA'),
        },
        "check10": {
            "label": "10. List of Students studied currently in your Institutions (1st, 2nd, 3rd, 4th and 5th)",
            "go_number": "NA",
            "date": "NA",
        },
        "check11": {
            "label": "11. In case, whether the students were already permitted to avail facilities in PHC and more than 3 years for Medical courses whether the institution is willing to remit double the rate of fee structure to each student for continuance of permission.",
            "go_number": "NA",
            "date": "NA",
        },
    }

    # Table Data
    table_data = [["Description", "GO Number", "GO Date"], ]

    # Loop through the checklist data and add rows to table
    for key, value in check_list_data.items():
        table_data.append([value['label'], value['go_number'], value['date']])

    # Increase column widths even more to make the table even larger
    col_widths = [content_width * 0.6, content_width * 0.2, content_width * 0.2]  # Increase the first column width

    # Create the table with text wrapping for the first column
    table = Table(table_data, colWidths=col_widths)

    # Apply styles to the table with larger font sizes, cell padding, and Times New Roman font
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),  # Header Background Color
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),  # Header Text Color
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),  # Align text horizontally and vertically in center
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),  # Bold Font for headers
        ('FONTSIZE', (0, 0), (-1, -1), 14),  # Increased font size for all cells
        ('BOTTOMPADDING', (0, 0), (-1, 0), 15),  # Increased padding for header row
        ('BACKGROUND', (0, 1), (-1, -1), colors.white),  # Row Background Color
        ('GRID', (0, 0), (-1, -1), 1, colors.black),  # Border color and width
        ('PADDING', (0, 0), (-1, -1), 10),  # Padding for all cells (increased padding)
        ('ROWHEIGHT', (0, 0), (-1, -1), 40),  # Set row height to 40 (even row height for all rows)
    ]))

    # We can also handle wrapping text in specific columns using Paragraphs instead of plain strings
    # This ensures better text wrapping and control over long text in cells
    for i in range(1, len(table_data)):  # Skip the header row (index 0)
        for j in range(len(table_data[i])):
            table_data[i][j] = Paragraph(table_data[i][j], table_style)  # Wrap text in paragraphs

    # Recreate the table with wrapped text
    table = Table(table_data, colWidths=col_widths)

    # Apply styles again after updating the table with wrapped content
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),  # Text alignment in center
        ('FONTNAME', (0, 0), (-1, 0), 'Times-Roman'),  # Change font to Times New Roman
        ('FONTSIZE', (0, 0), (-1, -1), 14),  # Increased font size for all cells
        ('BOTTOMPADDING', (0, 0), (-1, 0), 15),  # Increased padding for header row
        ('BACKGROUND', (0, 1), (-1, -1), colors.white),
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ('PADDING', (0, 0), (-1, -1), 20),  # Padding for all cells (increased padding)
        ('ROWHEIGHT', (0, 0), (-1, -1), 40),  # Set row height to 40 (even row height for all rows)
    ]))

    signature = Paragraph("Principal of the MBBS College.", signature_style)

    # Build the PDF with the title, document_id, and table
    doc.build([title, document_id, institution_name, institution_address_text, table, signature])

    # Get PDF from buffer
    buffer.seek(0)
    response = HttpResponse(buffer, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="phd_checklist.pdf"'

    return response
