from django.contrib import messages
from django.shortcuts import render, redirect
from captcha.image import ImageCaptcha
import os
import uuid
from django.conf import settings
import hashlib
import string
import random
import json
import requests as req
from django.http import JsonResponse, HttpResponse

from . import institution
from .applicant_user_master import *
from .institution import *
from .mbbs_proforma import ApplicationTableName, get_file_psk_id


def application_navigation(request):
    return redirect('proforma_view')


def faqs(request):
    context = {"menu": "faqs"}
    return render(request, "help_faqs/faqs.html", context)


def help(request):
    context = {"menu": "helppage"}
    return render(request, "help_faqs/index.html", context)


def downloadapplication(request):
    saved_username = request.COOKIES.get('saved_username', None)
    applicant_data = get_applicant_user_data(request, username=saved_username)
    institution_id = applicant_data.get('institution_name')
    application_status_download = application_status_download_load(institution_id)

    filtered_applications = [
        app for app in application_status_download
        if app.get('application_status') in ('DOWNLOAD', 'SUBMITTED')
    ]

    context = {"menu": "download", "application_status_download": filtered_applications}
    return render(request, "applicant_menus/downloadpdf.html", context)


def uploaddocument(request):
    saved_username = request.COOKIES.get('saved_username', None)
    applicant_data = get_applicant_user_data(request, username=saved_username)
    institution_id = applicant_data.get('institution_name')
    application_status_upload_lists = application_status_upload_load(institution_id)

    filtered_applications = [
        app for app in application_status_upload_lists
        if app.get('application_status') in ('DOWNLOAD', 'UPLOAD')
    ]

    context = {"menu": "upload", "application_status_upload_lists": filtered_applications}
    return render(request, "applicant_menus/uploaddocument.html", context)


def upload_pdf_save(request, psk_id):
    print("upload_pdf_save")
    if request.method == "POST":
        upload_pdf_file = request.FILES.get('upload_pdf_file')

        if not upload_pdf_file:
            messages.error(request, "No file selected")
            return redirect('uploaddocument')

        field = "application_upload_uid"

        url = f"{API_STUDIO_URL}crudapp/upload/media/{ApplicationTableName}_media"
        payload = {'parent_psk_id': str(psk_id)}

        files = {
            'media': (field, upload_pdf_file, upload_pdf_file.content_type)
        }

        headers = {}  # Include necessary headers like authentication tokens if required

        response = requests.post(url, headers=headers, data=payload, files=files)

        print(response.text)

        if response.status_code == 200:
            institution.work_flow_table_insert(request, psk_id, status="UPLOAD")
            institution.application_status_update(psk_id, "UPLOAD")

            messages.success(request, "Successfully Uploaded")
            return redirect('uploaddocument')
        else:
            messages.error(request, "Failed to upload document")
            return redirect('uploaddocument')


def statusapplication(request):
    return render(request, "applicant_menus/statusapplication.html")


def proforma_view(request):
    context = {"menu": "application"}
    return render(request, 'proforma/proforma.html', context)


def institution_profile(request):
    saved_username = request.COOKIES.get('saved_username', None)
    applicant_data = get_applicant_user_data(request, username=saved_username)
    institution_id = applicant_data.get('institution_name')
    institution_obj = institution_id_data_get(int(institution_id))

    institution_distirict_psk_id = institution_obj['institution_distirict_psk_id']
    institution_hud_psk_id = institution_obj['institution_hud_psk_id']
    institution_block_psk_id = institution_obj['institution_block_psk_id']
    contact_details_data = institution_obj['contact_details_text']
    convert_json = json.loads(contact_details_data)
    contact_data = convert_json['contact_details']

    district = district_id_data_get(institution_distirict_psk_id)
    hud = hud_id_data_get(institution_hud_psk_id)
    block = block_id_data_get(institution_block_psk_id)

    context = {"menu": "institution_profile", "obj": institution_obj, "district": district,
               "hud": hud,
               "block_obj": block,
               "contact_data": contact_data,
               }
    return render(request, "institution/institution_profile.html", context)
