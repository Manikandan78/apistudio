from django.urls import path
from .views import *
from .applicant_user_master import *
from .help_faqs import *
from .nursing_proforma import *
from .anm_institute import *
from .mbbs_proforma import *
from .dgmn_proforma import *
from .mphw_proforma import *
from .institution import *
from .download import *

urlpatterns = [
    # Applicant
    path('application_navigation/', application_navigation, name="application_navigation"),

    path('download_pdf/<int:psk_id>/', download_pdf, name="download_pdf"),
    path('upload_pdf_save/<int:psk_id>/', upload_pdf_save, name="upload_pdf_save"),

    path('institution_profile/', institution_profile, name="institution_profile"),
    path('downloadapplication/', downloadapplication, name="downloadapplication"),
    path('statusapplication/', statusapplication, name="statusapplication"),
    path('uploaddocument/', uploaddocument, name="uploaddocument"),

    path('register/', registerpage, name="registerpage"),
    path('contact_details/', contact_details, name="contact_details"),
    path('', loginpage, name="loginpage"),
    path('applicant_user/', applicant_user, name="applicant_user"),
    path('profile/', profile, name="profile"),
    path('applicant_profile_pic_update/', applicant_profile_pic_update, name="applicant_profile_pic_update"),
    path('resetpassword/', resetpassword, name="resetpassword"),
    path('applicant_verification/<int:id>', applicant_verification, name="applicant_verification"),

    #  Help - Faqs

    path('faqs/', faqs, name="faqs"),
    path('help/', help, name="help"),
    path('document/', document, name="document"),
    path('nursingproforma/', nursingproforma, name="nursingproforma"),
    path('index/', index, name="index"),
    path('terms_conditions/', terms_conditions, name="terms_conditions"),
    path('nursingindex/', nursingindex, name="nursingindex"),
    path('introduction/', introduction, name="introduction"),
    path('whoapply/', whoapply, name="whoapply"),
    path('mandatory/', mandatory, name="mandatory"),
    path('guide/', guide, name="guide"),
    path('contactdetail/', contactdetail, name="contactdetail"),
    path('paymentdetail/', paymentdetail, name="paymentdetail"),

    # Proforma

    path('proforma_view/', proforma_view, name="proforma_view"),
    # nursing
    path('nursingapplication/', nursingapplication, name="nursingapplication"),
    path('nursing_student/<int:rec_parent_id>/', nursing_student, name="nursing_student"),
    path('nursing_phc_form/<int:rec_parent_id>/', nursing_phc_form, name="nursing_phc_form"),
    path('nursing_check_list/<int:rec_parent_id>/', nursing_check_list, name="nursing_check_list"),

    # mbbs
    path('mbbs_application_navigation/', mbbs_application_navigation, name="mbbs_application_navigation"),
    path('mbbspplication/', mbbspplication, name="mbbspplication"),
    path('mbbs_student/<int:rec_parent_id>/', mbbs_student, name="mbbs_student"),
    path('delete_mbbs_student/<int:psk_id>/<int:rec_parent_id>/', delete_mbbs_student, name="delete_mbbs_student"),
    path('delete_mbbs_phc/<int:psk_id>/<int:rec_parent_id>/', delete_mbbs_phc, name="delete_mbbs_phc"),
    path('mbbs_phc_form/<int:rec_parent_id>/', mbbs_phc_form, name="mbbs_phc_form"),
    path('mbbs_check_list/<int:rec_parent_id>/', mbbs_check_list, name="mbbs_check_list"),

    path('mbbspplication_update/<int:psk_id>/', mbbspplication_update, name="mbbspplication_update"),
    path('change_course/<int:psk_id>/', change_course, name="change_course"),

    # dgmn
    path('dgmn_application/', dgmn_application, name="dgmn_application"),
    path('dgmn_student/<int:rec_parent_id>/', dgmn_student, name="dgmn_student"),
    path('dgmn_phc_form/<int:rec_parent_id>/', dgmn_phc_form, name="dgmn_phc_form"),
    path('dgmn_check_list/<int:rec_parent_id>/', dgmn_check_list, name="dgmn_check_list"),

    #anm
    path('anm_application/', anm_application, name="anm_application"),
    path('anm_student/<int:rec_parent_id>/', anm_student, name="anm_student"),
    path('anm_phc_form/<int:rec_parent_id>/', anm_phc_form, name="anm_phc_form"),
    path('anm_check_list/<int:rec_parent_id>/', anm_check_list, name="anm_check_list"),

    path('mphw_application/', mphw_application, name="mphw_application"),
    path('mphw_student/<int:rec_parent_id>/', mphw_student, name="mphw_student"),
    path('mphw_phc_form/<int:rec_parent_id>/', mphw_phc_form, name="mphw_phc_form"),
    path('mphw_check_list/<int:rec_parent_id>/', mphw_check_list, name="mphw_check_list"),

    # institution
    path('create_institution/', create_institution, name="create_institution"),

    path('ajax_institution_data/', ajax_institution_data, name="ajax_institution_data"),
    path('ajax_application_id/', ajax_application_id, name="ajax_application_id"),
    path('ajax_district_relevant_hud/', ajax_district_relevant_hud, name="ajax_district_relevant_hud"),
    path('ajax_block_relevant_hud/', ajax_block_relevant_hud, name="ajax_block_relevant_hud"),
    path('ajax_phc_allocated/', ajax_phc_allocated, name="ajax_phc_allocated"),
    path('ajax_phc_un_allocated/', ajax_phc_un_allocated, name="ajax_phc_un_allocated"),

    path('check_list_make_data/<int:rec_parent_id>/<str:_field_name>/', check_list_make_data, name="check_list_make_data"),



    # path('phd_app_form/<str:_type>/', global_application_function, name="global_application_function"),

]
