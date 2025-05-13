from django.urls import path
from . views import *

urlpatterns = [
    path('api_jobs/api_jobs_list/', api_jobs_list, name="api_jobs_list"),
    # path('api_jobs/create_job/', create_job, name="create_job"),
    path('api_jobs/create_job/<str:app_id>/<str:coreapi>/<str:app_name>/', create_job, name="create_job"),
    path('api_jobs/update_job/<int:psk_id>/', update_job, name="update_job"),
    path('api_jobs/delete_job/<int:psk_id>/', delete_job, name="delete_job"),
    path('api_jobs/start_job/<int:psk_id>/', start_job, name="start_job"),
    path('api_jobs/stop_job/<int:psk_id>/', stop_job, name="stop_job"),
    path('api_jobs/get_jobs_api_uids/', get_jobs_api_uids, name="get_jobs_api_uids"),
    path('api_jobs/select_core_job/<str:app_id>/<str:app_name>/', select_core_job, name="select_core_job"),
]