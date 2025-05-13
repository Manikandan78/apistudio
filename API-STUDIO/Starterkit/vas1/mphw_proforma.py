from django.contrib import messages
from django.shortcuts import render, redirect
import requests as req
from user_management.views import API_STUDIO_URL
from vas1.applicant_user_master import get_applicant_user_data
import json

from vas1.nursing_proforma import nursing_student_data_get

Proforma_ANM_Table = "phpm02_proforma_anm_103_dc1"
Proforma_ANM_Student = "phpm02_proforma_anm_104_student_dc2"


# def anm_application(request):
#     saved_username = request.COOKIES.get('saved_username', None)
#     applicant_data = get_applicant_user_data(request, username=saved_username)
#     psk_id = applicant_data.get('psk_id')
#
#     if request.method == 'POST':
#         # Extract form values
#         institute_name = request.POST.get('institute_name', '')
#         institute_type = request.POST.get('institute_type', '')
#         year_established = request.POST.get('year_established', '')
#         affiliation_authority = request.POST.get('affiliation_authority', '')
#         financial_year = request.POST.get('financial_year', '')
#         application_date = request.POST.get('application_date', '')
#         pay_fees_by = request.POST.get('pay_fees_by', '')
#         phc_facilities = request.POST.get('phc_facilities', '')
#         avail_government = request.POST.get('avail_government', '')
#
#         # Extract file uploads
#         go_institution = request.FILES.get('go_institution')
#         permitted_in_phc = request.FILES.get('permitted_in_phc')
#         granted_recognition = request.FILES.get('granted_recognition')
#         feasability_report = request.FILES.get('feasability_report')
#
#         payload = {
#             "data": {
#                 "institution_name": psk_id,
#                 "institution_type": institute_type,
#                 "year_of_establishment": year_established,
#                 "affiliation_authority": affiliation_authority,
#                 "Financial_year": financial_year,
#                 "document_date": application_date,
#                 "pay_fees_by": pay_fees_by,
#                 "phc_facilities": phc_facilities,
#                 "avail_government": avail_government
#             }
#         }
#
#         # Send POST request to API to save application data
#         dc1url = f"https://api.apistudio.app/postapi/create/{Proforma_ANM_Table}"
#         headers = {'Content-Type': 'application/json'}
#         response = req.post(dc1url, headers=headers, data=json.dumps(payload))
#
#         print(response.text)
#
#         if response.status_code == 200:
#             print("success")
#             res_data = response.json()
#
#             rec_parent_id = res_data['psk_id']
#
#             # List of all file fields
#             file_fields = [
#                 ('go_institution', go_institution),
#                 ('permitted_in_phc', permitted_in_phc),
#                 ('granted_recognition', granted_recognition),
#                 ('feasability_report', feasability_report)
#             ]
#
#             for field_name, upload_file in file_fields:
#
#                 url = f"{API_STUDIO_URL}crudapp/upload/media/{Proforma_ANM_Table}_media"
#                 payload = {'parent_psk_id': rec_parent_id}
#
#                 files = {
#                     'media': (field_name, upload_file.read(), 'image/png')
#                 }
#
#                 headers = {}  # Include any necessary headers
#
#                 response = req.request("POST", url, headers=headers, data=payload, files=files)
#
#                 if response.status_code == 200:
#                     print(f"Successfully uploaded {field_name}")
#                 else:
#                     print(f"Failed to upload {field_name}")
#
#             messages.success(request, message="Successfully registered. Enter the next details.")
#             return redirect('anm_student', rec_parent_id)
#
#     context = {"obj": applicant_data}
#     return render(request, "proforma/anm/mphw_application.html", context)


def mphw_application(request):

    return render(request, "proforma/mphw/mphw_application.html")


def mphw_student(request, rec_parent_id):
    print(rec_parent_id)

    nursing_student_data = nursing_student_data_get(request, rec_parent_id, Proforma_ANM_Student)

    if request.method == 'POST':
        # course_name = request.POST.get('course_name')
        course_name = 1
        year_or_semester = request.POST.get('year_or_semester')
        no_of_students = request.POST.get('no_of_students')
        training_period = request.POST.get('training_period')
        no_of_period = request.POST.get('no_of_period')

        # Preparing payload for API request
        payload = {
            "data": {
                "transaction_id": rec_parent_id,
                "course_name": course_name,
                "year_or_semester": year_or_semester,
                "no_of_students": no_of_students,
                "training_period": training_period,
                "no_of_period": no_of_period,
            }
        }

        # API endpoint URL
        dc1url = f"https://api.apistudio.app/postapi/create/{Proforma_ANM_Student}"
        headers = {'Content-Type': 'application/json'}

        # Sending POST request
        response = req.post(dc1url, headers=headers, data=json.dumps(payload))

        print(response.text)

        if response.status_code == 200:
            # Displaying success message and redirecting
            messages.success(request, message='Data Added successfully!')
            return redirect('anm_student', rec_parent_id=rec_parent_id)

    context = {"anm_student_data": nursing_student_data, "rec_parent_id": rec_parent_id}
    return render(request, "proforma/mphw/mphw_student.html", context)


def mphw_phc_form(request, rec_parent_id):
    # nursing_phc_data = nursing_student_data_get(request, rec_parent_id, Proforma_Nursing_Phc)
    # print("nursing_phc_form", rec_parent_id)
    #
    # if request.method == 'POST':
    #     academic_year = request.POST.get('academic_year')
    #     academic_no_of_student = request.POST.get('academic_no_of_student')
    #     facility_type = request.POST.get('facility_type')
    #     name_of_phc = request.POST.get('name_of_phc')
    #
    #     payload = {
    #         "data": {
    #             "transaction_id": rec_parent_id,
    #             "academic_no_of_student": academic_no_of_student,
    #             "facility_type": facility_type,
    #             "academic_year": academic_year,
    #             "name_of_phc": name_of_phc,
    #
    #         }
    #     }
    #
    #     # API endpoint URL
    #     dc1url = f"https://api.apistudio.app/postapi/create/{Proforma_Nursing_Phc}"
    #     headers = {'Content-Type': 'application/json'}
    #
    #     # Sending POST request
    #     response = req.post(dc1url, headers=headers, data=json.dumps(payload))
    #
    #     print(response.text)
    #
    #     if response.status_code == 200:
    #         # Displaying success message and redirecting
    #         messages.success(request, message='Data Added successfully!')
    #         return redirect('nursing_phc_form', rec_parent_id=rec_parent_id)
    #
    # context = {"nursing_phc_data": nursing_phc_data, "rec_parent_id": rec_parent_id}

    # return render(request, "proforma/nursing/nursing_phc_form.html", context)
    return render(request, "proforma/mphw/mphw_phc_form.html")


def mphw_check_list(request, rec_parent_id):
    return render(request, 'proforma/mphw/mphw_check_list.html')