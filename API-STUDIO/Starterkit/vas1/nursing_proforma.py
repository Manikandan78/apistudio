from django.contrib import messages
from django.shortcuts import render, redirect
import requests as req
from user_management.views import API_STUDIO_URL
from vas1.applicant_user_master import get_applicant_user_data
import json
from datetime import datetime
from vas1 import institution
from vas1.mbbs_proforma import ApplicationTableName


def nursingapplication(request):
    saved_username = request.COOKIES.get('saved_username', None)
    applicant_data = get_applicant_user_data(request, username=saved_username)
    institution_id = applicant_data.get('institution_name')
    psk_id = applicant_data.get('psk_id')

    institution_obj = institution.institution_id_data_get(int(institution_id))
    course_data = institution.course_data_get(_type="Nursing")
    company = institution.company_master_data_get()[0]

    current_date = datetime.now().strftime("%Y-%m-%d")

    if request.method == "POST":

        # upper Card data
        institution_psk_id = institution_id
        year_of_establishment = request.POST.get("year_of_establishment")
        course_type_psk_id = request.POST.get("course_type_psk_id")
        academic_year = request.POST.get("academic_year")
        document_id = request.POST.get("document_id")
        document_date = request.POST.get("document_date")

        # Retrieving text inputs and dates
        gov_order_number = request.POST.get("gov_order_number")
        gov_order_date = request.POST.get("gov_order_date")

        permitted_in_phc_gov_no = request.POST.get("permitted_in_phc_gov_no")
        permitted_in_phc_gov_date = request.POST.get("permitted_in_phc_gov_date")

        affiliation_mgr_university_gov_no = request.POST.get("affiliation_mgr_university_gov_no")
        affiliation_mgr_university_gov_date = request.POST.get("affiliation_mgr_university_gov_date")

        letter_from_medical_counsil_gov_no = request.POST.get("letter_from_medical_counsil_gov_no")
        letter_from_medical_counsil_gov_date = request.POST.get("letter_from_medical_counsil_gov_date")

        letter_from_hfw_department_gov_no = request.POST.get("letter_from_hfw_department_gov_no")
        letter_from_hfw_department_gov_date = request.POST.get("letter_from_hfw_department_gov_date")

        previous_tieup_gov_no = request.POST.get("previous_tieup_gov_no")
        previous_tieup_gov_date = request.POST.get("previous_tieup_gov_date")

        # Retrieving file inputs
        gov_order_upload_uid = request.FILES.get("gov_order_upload_uid")
        permitted_in_phc_upload_uid = request.FILES.get("permitted_in_phc_upload_uid")
        affiliation_mgr_university_upload_uid = request.FILES.get("affiliation_mgr_university_upload_uid")
        pay_fees_by_upload_uid = request.FILES.get("pay_fees_by_upload_uid")
        letter_from_medical_counsil_upload_uid = request.FILES.get("letter_from_medical_counsil_upload_uid")
        letter_from_hfw_department_upload_uid = request.FILES.get("letter_from_hfw_department_upload_uid")
        pervious_tieup_upload_uid = request.FILES.get("pervious_tieup_upload_uid")
        no_dues_certificate_upload_uid = request.FILES.get("no_dues_certificate_upload_uid")
        consent_letter_building_upload_uid = request.FILES.get("consent_letter_building_upload_uid")

        # 3 . nursing Tamil Nadu Nurses and Midwives Council
        tnnmc_gov_no = request.POST.get("tnnmc_gov_no")
        tnnmc_gov_date = request.POST.get("tnnmc_gov_date")
        tnnmc_gov_upload_uid = request.FILES.get("consent_letter_building_upload_uid")

        # 4 .Copy of the List of Recognized Colleges in the Tamil Nadu
        recognized_colleges_list_tn_gov_no = request.POST.get("recognized_colleges_list_tn_gov_no")
        recognized_colleges_list_tn_gov_date = request.POST.get("recognized_colleges_list_tn_gov_date")
        recognized_colleges_list_tn_upload_uid = request.FILES.get("recognized_colleges_list_tn_upload_uid")

        # 5. In case of Degree Nursing students, whether Indian Nursing Council
        recognized_colleges_list_inc_gov_no = request.POST.get("recognized_colleges_list_tn_gov_no")
        recognized_colleges_list_inc_gov_date = request.POST.get("recognized_colleges_list_tn_gov_date")
        recognized_colleges_list_inc_upload_uid = request.FILES.get("recognized_colleges_list_tn_upload_uid")

        payload = {
            "data": {
                "institution_psk_id": institution_psk_id,
                "year_of_establishment": year_of_establishment,
                "course_type_psk_id": course_type_psk_id,
                "accademic_year": academic_year,
                "document_id": document_id,
                "document_date": document_date,
                "gov_order_number": gov_order_number,
                "gov_order_date": gov_order_date,
                "permitted_in_phc_gov_no": permitted_in_phc_gov_no,
                # "permitted_in_phc_gov_date": permitted_in_phc_gov_date,
                "affiliation_mgr_university_gov_no": affiliation_mgr_university_gov_no,
                "affiliation_mgr_university_gov_date": affiliation_mgr_university_gov_date,
                "letter_from_medical_counsil_gov_no": letter_from_medical_counsil_gov_no,
                "letter_from_medical_counsil_gov_date": letter_from_medical_counsil_gov_date,
                "letter_from_hfw_department_gov_no": letter_from_hfw_department_gov_no,
                "letter_from_hfw_department_gov_date": letter_from_hfw_department_gov_date,
                "previous_tieup_gov_no": previous_tieup_gov_no,
                # "previous_tieup_gov_date": previous_tieup_gov_date,

                "application_status": "DRAFT",
                "created_by": saved_username,
            }
        }

        if permitted_in_phc_gov_date:
            payload["data"]["permitted_in_phc_gov_date"] = permitted_in_phc_gov_date

        if previous_tieup_gov_date:
            payload["data"]["previous_tieup_gov_date"] = previous_tieup_gov_date

        # Send POST request to API to save application data
        dc1url = f"{API_STUDIO_URL}postapi/create/{ApplicationTableName}"

        headers = {'Content-Type': 'application/json'}
        response = req.post(dc1url, headers=headers, data=json.dumps(payload))

        if response.status_code == 200:
            # If successful, handle file uploads
            res_data = response.json()
            rec_parent_id = res_data['psk_id']

            MAX_FILE_SIZE = 2 * 1024 * 1024  # 2MB

            file_fields = [
                ('gov_order_upload_uid', gov_order_upload_uid),
                ('permitted_in_phc_upload_uid', permitted_in_phc_upload_uid),
                ('affiliation_mgr_university_upload_uid', affiliation_mgr_university_upload_uid),
                ('pay_fees_by_upload_uid', pay_fees_by_upload_uid),
                ('letter_from_medical_counsil_upload_uid', letter_from_medical_counsil_upload_uid),
                ('letter_from_hfw_department_upload_uid', letter_from_hfw_department_upload_uid),
                ('pervious_tieup_upload_uid', pervious_tieup_upload_uid),
                ('no_dues_certificate_upload_uid', no_dues_certificate_upload_uid),
                ('consent_letter_building_upload_uid', consent_letter_building_upload_uid),

                # nursing
                ('tnnmc_gov_upload_uid', tnnmc_gov_upload_uid),



            ]

            # 2Mb condition

            for field_name, upload_file in file_fields:
                if upload_file and upload_file.size > MAX_FILE_SIZE:
                    messages.info(request, "Oops! Your file is too large (max 2MB). Please choose a smaller PDF "
                                           "and try again.")
                    return redirect('mbbspplication_update', rec_parent_id)

            for field_name, upload_file in file_fields:

                url = f"{API_STUDIO_URL}crudapp/upload/media/{ApplicationTableName}_media"
                payload = {'parent_psk_id': rec_parent_id}

                files = {
                    'media': (field_name, upload_file, 'image/png')
                }

                headers = {}  # Include any necessary headers

                response = req.request("POST", url, headers=headers, data=payload, files=files)

                if response.status_code == 200:
                    print(f"Successfully uploaded {field_name}")
                else:
                    print("fail")
                    print(response.text)
                    # delete_failure_case_files(rec_parent_id)
                    # messages.error(request, message="Api Not Working")
                    # return redirect('mbbspplication')

            messages.success(request, message="Successfully registered. Enter the next details.")
            return redirect('nursing_student', rec_parent_id)

    context = {"obj": institution_obj, "course_data": course_data, "company": company, "current_date": current_date}
    return render(request, "proforma/nursing/nursingapplication.html", context)


def nursing_student_data_get(request, rec_parent_id, tableName):
    url = f"https://api.apistudio.app/getapi/{tableName}"

    payload = json.dumps({
        "queries": [
            {
                "field": "transaction_id",
                "value": rec_parent_id,
                "operation": "equal"
            }
        ],
        "search_type": "all"
    })
    headers = {
        'Content-Type': 'application/json'
    }

    response = req.request("GET", url, headers=headers, data=payload)

    if response.status_code == 200:
        res_data = response.json()
        return res_data


def nursing_student(request, rec_parent_id):
    print(rec_parent_id)

    nursing_student_data = nursing_student_data_get(request, rec_parent_id, Proforma_Nursing_Student)

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
        dc1url = f"https://api.apistudio.app/postapi/create/{Proforma_Nursing_Student}"
        headers = {'Content-Type': 'application/json'}

        # Sending POST request
        response = req.post(dc1url, headers=headers, data=json.dumps(payload))

        print(response.text)

        if response.status_code == 200:
            # Displaying success message and redirecting
            messages.success(request, message='Data Added successfully!')
            return redirect('nursing_student', rec_parent_id=rec_parent_id)

    context = {"nursing_student_data": nursing_student_data, "rec_parent_id": rec_parent_id}
    return render(request, "proforma/nursing/nursing_student.html", context)


def nursing_phc_form(request, rec_parent_id):
    nursing_phc_data = nursing_student_data_get(request, rec_parent_id, Proforma_Nursing_Phc)
    print("nursing_phc_form", rec_parent_id)

    if request.method == 'POST':
        academic_year = request.POST.get('academic_year')
        academic_no_of_student = request.POST.get('academic_no_of_student')
        facility_type = request.POST.get('facility_type')
        name_of_phc = request.POST.get('name_of_phc')

        payload = {
            "data": {
                "transaction_id": rec_parent_id,
                "academic_no_of_student": academic_no_of_student,
                "facility_type": facility_type,
                "academic_year": academic_year,
                "name_of_phc": name_of_phc,

            }
        }

        # API endpoint URL
        dc1url = f"https://api.apistudio.app/postapi/create/{Proforma_Nursing_Phc}"
        headers = {'Content-Type': 'application/json'}

        # Sending POST request
        response = req.post(dc1url, headers=headers, data=json.dumps(payload))

        print(response.text)

        if response.status_code == 200:
            # Displaying success message and redirecting
            messages.success(request, message='Data Added successfully!')
            return redirect('nursing_phc_form', rec_parent_id=rec_parent_id)

    context = {"nursing_phc_data": nursing_phc_data, "rec_parent_id": rec_parent_id}

    return render(request, "proforma/nursing/nursing_phc_form.html", context)


def nursing_check_list(request, rec_parent_id):
    return render(request, 'proforma/nursing/nursing_check_list.html')
