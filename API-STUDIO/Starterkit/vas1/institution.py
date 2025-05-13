from django.contrib import messages
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
import requests
import json
import fitz
from datetime import datetime

from user_management.settings_views import user_bundle_settings
from vas1.mbbs_proforma import nursing_student_data_get, ApplicationPHCTable, ApplicationWorkFlowTable

API_STUDIO_URL = user_bundle_settings()


def check_list_make_data(rec_parent_id, _field_name):
    media_obj_all = media_table_get_data(rec_parent_id)
    media_obj = next((obj for obj in media_obj_all if _field_name == obj['file_name']), None)

    if media_obj:
        url = f"{API_STUDIO_URL}crudapp/view/media/phpm02_application_301_master_dc1_media/{media_obj['psk_id']}?download=false"
        response = requests.get(url)

        if response.status_code == 200:
            pdf_bytes = response.content  # Get the PDF content in bytes
            pdf_size_bytes = len(pdf_bytes)

            # Convert size dynamically
            if pdf_size_bytes >= 1_048_576:  # 1 MB = 1024 * 1024 bytes
                pdf_size = f"{pdf_size_bytes / 1_048_576:.2f} MB"
            else:
                pdf_size = f"{pdf_size_bytes / 1024:.2f} KB"

            doc = fitz.open(stream=pdf_bytes, filetype="pdf")  # Open the PDF from memory
            result = {
                "pdf_uploaded": "Yes",
                "pdf_page_count": len(doc),
                "pdf_size": pdf_size
            }
        else:
            result = {"pdf_uploaded": "No", "pdf_page_count": "NA", "pdf_size": "NA"}
    else:
        result = {"pdf_uploaded": "No", "pdf_page_count": "NA", "pdf_size": "NA"}

    return result


def check_list_failure_case(parent_id):
    course_url = f"{API_STUDIO_URL}getapi/phpm02_application_304_final_dc4"
    payload = json.dumps({
        "queries": [
            {
                "field": "parent_psk_id",
                "value": parent_id,
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {'Content-Type': 'application/json'}

    response = requests.post(course_url, headers=headers, data=payload)

    if response.status_code == 200:
        check_list_data = response.json()

        for check in check_list_data:
            url = f"{API_STUDIO_URL}deleteapi/delete/phpm02_application_304_final_dc4/{check['psk_id']}"
            response = requests.delete(url)
            print(response.text)


def update_course_id_in_application_dc1(psk_id, course_id, document_id):
    url = f"{API_STUDIO_URL}updateapi/update/phpm02_application_301_master_dc1/{psk_id}"
    payload = json.dumps({
        "data": {
            "course_type_psk_id": course_id,
            "document_id": document_id,
        }
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.put(url, headers=headers, data=payload)

    if response.status_code == 200:
        return


def work_flow_table_insert(request, rec_parent_id, status):
    saved_username = request.COOKIES.get('saved_username', None)
    current_date = datetime.now().strftime("%Y-%m-%d")
    work_flow_payload = {
        "data": {
            "parent_psk_id": rec_parent_id,
            "app_level": 1,
            "approval_status": status,
            "due_on": current_date,
            "from_whom": saved_username,
            # "to_whom": hud_base_ao['officer_name'],
            "tranasaction_name": "APPLICANT",

        }
    }

    work_flow_url = f"{API_STUDIO_URL}postapi/create/{ApplicationWorkFlowTable}"
    headers = {'Content-Type': 'application/json'}

    # Sending POST request
    response = requests.post(work_flow_url, headers=headers, data=json.dumps(work_flow_payload))
    print(response.text)

    if response.status_code != 200:
        print("error")
    return


def update_phc_status(psk_id, status):
    url = f"{API_STUDIO_URL}updateapi/update/phpm02_phc_54/{psk_id}"
    payload = json.dumps({
        "data": {
            "phc_status": status
        }
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.put(url, headers=headers, data=payload)

    if response.status_code == 200:
        return


def media_table_get_data(parent_id):
    block_url = f"{API_STUDIO_URL}crudapp/get/media/phpm02_application_301_master_dc1_media/parent/{parent_id}"
    block_response = requests.get(block_url)

    if block_response.status_code == 200:
        block_data = block_response.json()
    else:
        block_data = []
    return block_data


def check_application(institution_psk_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_application_301_master_dc1"
    payload = json.dumps({
        "queries": [
            {
                "field": "institution_psk_id",
                "value": institution_psk_id,
                "operation": "equal"
            },
            {
                "field": "application_status",
                "value": "DRAFT",
                "operation": "equal"
            }
        ],
        "search_type": "first"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    print(response.text)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = {}

    return phc_data


def application_status_update(psk_id, _value):
    apiurl = f"{API_STUDIO_URL}updateapi/update/phpm02_application_301_master_dc1/{psk_id}"
    payload = json.dumps({
        "data": {
            "application_status": _value
        }
    })
    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.request("PUT", apiurl, headers=headers, data=payload)
    print(response.text)


def course_data_get(_type):
    course_url = f"{API_STUDIO_URL}getapi/phpm02_course_55"

    payload = json.dumps({
        "queries": [
            {
                "field": "course_type",
                "value": _type,
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", course_url, headers=headers, data=payload)

    if response.status_code == 200:
        course_data = response.json()
    else:
        course_data = []
    return course_data


def student_details_filter_id_base_get(parent_psk_id):
    course_url = f"{API_STUDIO_URL}getapi/phpm02_application_302_student_dc2"

    payload = json.dumps({
        "queries": [
            {
                "field": "parent_psk_id",
                "value": parent_psk_id,
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", course_url, headers=headers, data=payload)

    if response.status_code == 200:
        course_data = response.json()
    else:
        course_data = []
    return course_data


def hud_relevant_get_ao(hud_psk_id):
    course_url = f"{API_STUDIO_URL}getapi/phpm02_inspection_officer_57"

    payload = json.dumps({
        "queries": [
            {
                "field": "officer_district_psk_id",
                "value": hud_psk_id,
                "operation": "equal"
            }
        ],
        "search_type": "first"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", course_url, headers=headers, data=payload)

    if response.status_code == 200:
        course_data = response.json()
    else:
        course_data = []
    return course_data


def company_master_data_get():
    course_url = f"{API_STUDIO_URL}getapi/phpm02_company_50/all"
    course_response = requests.get(course_url)

    if course_response.status_code == 200:
        course_data = course_response.json()
    else:
        course_data = []
    return course_data


def block_data_get():
    block_url = f"{API_STUDIO_URL}getapi/phpm02_block_53/all"
    block_response = requests.get(block_url)

    if block_response.status_code == 200:
        block_data = block_response.json()
    else:
        block_data = []
    return block_data


def hud_data_get():
    # Fetch HUD data from the API
    hud_url = f"{API_STUDIO_URL}getapi/phpm02_hud_52/all"
    hud_response = requests.get(hud_url)

    if hud_response.status_code == 200:
        hud_data = hud_response.json()
    else:
        hud_data = []
    return hud_data


def insituition_data_get():
    # Fetch district data from the API
    url_get_district = f"{API_STUDIO_URL}getapi/phpm02_institution_59/all"
    district_response = requests.get(url_get_district)

    if district_response.status_code == 200:
        districts = district_response.json()
    else:
        districts = []
    return districts


def district_data_get():
    # Fetch district data from the API
    url_get_district = f"{API_STUDIO_URL}getapi/phpm02_district_51/all"
    district_response = requests.get(url_get_district)

    if district_response.status_code == 200:
        districts = district_response.json()
    else:
        districts = []
    return districts


def phc_data_get():
    block_url = f"{API_STUDIO_URL}getapi/phpm02_phc_54/all"
    block_response = requests.get(block_url)

    if block_response.status_code == 200:
        block_data = block_response.json()
    else:
        block_data = []
    return block_data


def block_against_block_load(block_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_phc_54"
    payload = json.dumps({
        "queries": [
            {
                "field": "block_psk_id",
                "value": block_id,
                "operation": "equal"
            },
            {
                "field": "phc_status",
                "value": "UN-ALLOCATED",
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def block_against_phc_load(block_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_phc_54"
    payload = json.dumps({
        "queries": [
            {
                "field": "block_psk_id",
                "value": block_id,
                "operation": "equal"
            },
            {
                "field": "phc_status",
                "value": "ALLOCATED",
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def block_against_phc_allocated_load(block_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_phc_54"
    payload = json.dumps({
        "queries": [
            {
                "field": "block_psk_id",
                "value": block_id,
                "operation": "equal"
            },
            {
                "field": "phc_status",
                "value": "ALLOCATED",
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def district_relevant_hud(district_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_hud_52"
    payload = json.dumps({
        "queries": [
            {
                "field": "district_psk_id",
                "value": district_id,
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def hud_relevant_block(hud_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_block_53"
    payload = json.dumps({
        "queries": [
            {
                "field": "hud_psk_id",
                "value": hud_id,
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def create_institution(request):
    block_data = block_data_get()
    hud_data = hud_data_get()
    district_data = district_data_get()

    if request.method == 'POST':
        active = True
        institution_code = request.POST['institution_code']
        institution_trust_name = request.POST['institution_trust_name']
        institution_name = request.POST['institution_name']
        institution_address = request.POST.get('institution_addr')
        institution_distirict_psk_id = request.POST['institution_distirict_psk_id']
        institution_hud_psk_id = request.POST['institution_hud_psk_id']
        institution_block_psk_id = request.POST['institution_block_psk_id']
        institution_pincode = request.POST['institution_pincode']
        institution_date_of_incorporation = request.POST['institution_date_of_incorporation']
        institution_gstin = request.POST['institution_gstin']
        year_of_established = request.POST['year_of_established']

        # contact_type = request.POST['contact_type']
        contact_name = request.POST['contact_name']
        contact_no = request.POST['contact_no']
        contact_email = request.POST['contact_email']

        institution_email = request.POST['institution_email']
        umis = request.POST['umis']

        company_logo = request.FILES.get('file')

        contact_details = {"contact_details": [
            {"contact_type": "Principal", "contact_name": contact_name, "contact_no": contact_no,
             "contact_email": contact_email}]}

        url_post = f"{API_STUDIO_URL}postapi/create/phpm02_institution_59"

        # Prepare payload for the API request
        payload = json.dumps({
            "data": {
                "active": active,
                "institution_code": institution_code,
                "institution_trust_name": institution_trust_name,
                "institution_name": institution_name,
                "institution_address_text": institution_address,
                "institution_distirict_psk_id": institution_distirict_psk_id,
                "institution_hud_psk_id": institution_hud_psk_id,
                "institution_block_psk_id": institution_block_psk_id,
                "year_of_established": year_of_established,

                "institution_pincode": institution_pincode,
                "institution_date_of_incorporation": institution_date_of_incorporation,
                "institution_gstin": institution_gstin,
                "contact_details_text": json.dumps(contact_details, indent=4),

                "umis": umis,
                "institution_email": institution_email,
            }
        })

        headers = {
            'Content-Type': 'application/json'
        }

        response = requests.post(url_post, headers=headers, data=payload)

        if response.status_code == 200:
            res_data = response.json()
            psk_id = res_data.get('psk_id')

            if company_logo:
                url = f"{API_STUDIO_URL}crudapp/upload/media/phpm02_institution_59_media"

                payload = {'parent_psk_id': psk_id}
                files = [
                    ('media', (company_logo.name, company_logo, company_logo.content_type))
                ]
                headers = {
                    'api_name': 'phpm02_institution_59_media'
                }

                response = requests.request("POST", url, headers=headers, data=payload, files=files)

                if response.status_code == 200:
                    messages.success(request, "Institution details Register successfully")
                    return redirect('registerpage')
                else:
                    messages.success(request, "Failed to upload logo")
            else:
                return redirect('registerpage')

        else:
            messages.error(request, f"Error: {response.text}")

    context = {
        'block_data': block_data,
        'hud_data': hud_data,
        'districts': district_data
    }

    return render(request, 'institution/create_institution.html', context)


def institution_id_data_get(psk_id):
    url_institution = f"{API_STUDIO_URL}getapi/phpm02_institution_59/{psk_id}"
    institution_response = requests.get(url_institution)

    if institution_response.status_code == 200:
        institution = institution_response.json()
    else:
        institution = {}
    return institution


def district_id_data_get(psk_id):
    url_district = f"{API_STUDIO_URL}getapi/phpm02_district_51/{psk_id}"
    district_response = requests.get(url_district)

    if district_response.status_code == 200:
        district = district_response.json()
    else:
        district = {}
    return district


def hud_id_data_get(psk_id):
    url_hud = f"{API_STUDIO_URL}getapi/phpm02_hud_52/{psk_id}"
    hud_response = requests.get(url_hud)

    if hud_response.status_code == 200:
        hud = hud_response.json()
    else:
        hud = {}
    return hud


def block_id_data_get(psk_id):
    url_block = f"{API_STUDIO_URL}getapi/phpm02_block_53/{psk_id}"
    block_response = requests.get(url_block)

    if block_response.status_code == 200:
        block = block_response.json()
    else:
        block = {}
    return block


def phc_id_data_get(psk_id):
    url_district = f"{API_STUDIO_URL}getapi/phpm02_phc_54/{psk_id}"
    district_response = requests.get(url_district)

    if district_response.status_code == 200:
        district = district_response.json()
    else:
        district = {}
    return district


def course_id_data_get(psk_id):
    url_block = f"{API_STUDIO_URL}getapi/phpm02_course_55/{psk_id}"
    block_response = requests.get(url_block)

    if block_response.status_code == 200:
        block = block_response.json()
    else:
        block = {}
    return block


def application_data_get():
    block_url = f"{API_STUDIO_URL}getapi/phpm02_application_301_master_dc1/all"
    block_response = requests.get(block_url)

    if block_response.status_code == 200:
        block_data = block_response.json()
    else:
        block_data = []
    return block_data


def application_media_data_get(psk_id):
    url_block = f"{API_STUDIO_URL}crudapp/get/media/phpm02_application_301_master_dc1_media/parent/{psk_id}"
    block_response = requests.get(url_block)

    if block_response.status_code == 200:
        block = block_response.json()
    else:
        block = []
    return block


def application_id_data_get(psk_id):
    url_block = f"{API_STUDIO_URL}getapi/phpm02_application_301_master_dc1/{psk_id}"
    block_response = requests.get(url_block)

    if block_response.status_code == 200:
        block = block_response.json()
    else:
        block = {}
    return block


def ajax_institution_data(request):
    if request.method == "GET":
        institution_id = request.GET['institutionVal']
        institution_data = institution_id_data_get(institution_id)

        district_psk_id = institution_data['institution_distirict_psk_id']
        hud_psk_id = institution_data['institution_hud_psk_id']
        block_psk_id = institution_data['institution_block_psk_id']
        contact_details = institution_data['contact_details_text']

        district_data = district_id_data_get(district_psk_id)
        hud_data = hud_id_data_get(hud_psk_id)
        block_data = block_id_data_get(block_psk_id)

        contact_data = json.loads(contact_details)
        contact_details = contact_data["contact_details"][0]

        district = district_data.get('district_name')
        hud = hud_data.get('hud_name')
        block = block_data.get('block_name')
        trust_name = institution_data['institution_trust_name']
        address = institution_data['institution_address_text']
        pincode = institution_data['institution_pincode']
        principal_name = contact_details["contact_name"]
        principal_no = contact_details["contact_no"]
        principal_email = contact_details["contact_email"]

        data = {
            "trust_name": trust_name,
            "address": address,
            "district": district,
            "hud": hud,
            "block": block,
            "pincode": pincode,
            "principal_name": principal_name,
            "principal_no": principal_no,
            "principal_email": principal_email,
        }

        return JsonResponse(data)


def five_random_num_generate():
    import random as r
    ph_no = []

    ph_no.append(r.randint(1, 9))
    for _ in range(4):
        ph_no.append(r.randint(0, 9))
    phone_number = "".join(map(str, ph_no))
    print(phone_number)
    return phone_number


def application_status_download_load(institution_psk_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_application_301_master_dc1"
    payload = json.dumps({
        "queries": [
            {
                "field": "institution_psk_id",
                "value": institution_psk_id,
                "operation": "equal"
            },

        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def application_status_upload_load(institution_psk_id):
    api_url = f"{API_STUDIO_URL}getapi/phpm02_application_301_master_dc1"
    payload = json.dumps({
        "queries": [
            {
                "field": "institution_psk_id",
                "value": institution_psk_id,
                "operation": "equal"
            },

        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", api_url, headers=headers, data=payload)
    if response.status_code == 200:
        phc_data = response.json()
    else:
        phc_data = []

    return phc_data


def ajax_application_id(request):
    if request.method == "GET":
        # rec_parent_id = request.GET['rec_parent_id']
        course_id = request.GET['course_id']

        print("course_id", course_id)

        # app_obj = application_id_data_get(rec_parent_id)
        # print(app_obj['course_type_psk_id'])
        #
        # if app_obj['course_type_psk_id'] != course_id:
        #     update_course_id_in_application_dc1(rec_parent_id, course_id)

        company = company_master_data_get()[0]
        acd_year = company['company_academic_year']
        year_split = acd_year.replace('-', '')
        course = course_id_data_get(course_id)
        course_code = course['course_code']

        five_number = five_random_num_generate()

        application_id = f"{course_code + year_split + five_number}"

        data = {
            "application_id": application_id,

        }

        return JsonResponse(data)


# def ajax_district_relevant_hud(request):
#     if request.method == "GET":
#         district_id = request.GET['district_id']
#         hud_data = district_relevant_hud(district_id)
#         return JsonResponse({"hud_data": hud_data})


def ajax_district_relevant_hud(request):
    if request.method == "GET":
        district_id = request.GET['district_id']
        district_obj = district_id_data_get(district_id)
        district_code = district_obj['district_code']
        print(district_code)
        hud_data = district_relevant_hud(district_id)
        institution_obj = insituition_data_get()
        print(institution_obj)

        # Extract existing institution codes related to the district
        relevant_codes = [
            inst['institution_code']
            for inst in institution_obj
            if inst['institution_distirict_psk_id'] == int(district_id)
        ]

        # Find the highest numeric suffix
        max_suffix = 0
        for code in relevant_codes:
            if code.startswith(district_code):  # Ensure it's related to district
                suffix = code[len(district_code):]  # Extract numeric part
                if suffix.isdigit():
                    max_suffix = max(max_suffix, int(suffix))

        # Increment the suffix
        new_suffix = str(max_suffix + 1).zfill(3)  # 001, 002, etc.
        new_institution_code = f"{district_code}{new_suffix}"
        print("New District Code:", new_institution_code)
        return JsonResponse({"hud_data": hud_data, "ins_code": new_institution_code})


def ajax_block_relevant_hud(request):
    if request.method == "GET":
        hud_id = request.GET['hud_id']
        hud_data = hud_relevant_block(hud_id)
        return JsonResponse({"block_data": hud_data})


def ajax_phc_allocated(request):
    if request.method == "GET":
        allocated = request.GET['allocated']
        rec_parent_id = request.GET['rec_parent_id']

        application = application_id_data_get(rec_parent_id)
        institution_psk_id = application['institution_psk_id']
        institution_obj = institution_id_data_get(institution_psk_id)
        block_id = institution_obj['institution_block_psk_id']

        allocated_phc = block_against_phc_load(block_id)
        return JsonResponse({"allocated_phc": allocated_phc})


def ajax_phc_un_allocated(request):
    if request.method == "GET":
        allocated = request.GET['allocated']
        rec_parent_id = request.GET['rec_parent_id']

        application = application_id_data_get(rec_parent_id)
        institution_psk_id = application['institution_psk_id']
        institution_obj = institution_id_data_get(institution_psk_id)
        block_id = institution_obj['institution_block_psk_id']

        allocated_phc = block_against_block_load(block_id)
        return JsonResponse({"allocated_phc": allocated_phc})
