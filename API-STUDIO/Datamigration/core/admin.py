from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(MigrationList)
admin.site.register(Table)
admin.site.register(Field)
admin.site.register(ApiMeta)
admin.site.register(DBImport)
