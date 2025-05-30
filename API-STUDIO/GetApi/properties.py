from fastapi import FastAPI, HTTPException, Depends
import models
import json
from database import Base
# from sqlalchemy import update

cashed_model = {}


def get_model(api_name, db):
    api_details = db.query(models.ApiMeta).filter_by(api_name=api_name).first()
    if not api_details:
        raise HTTPException(status_code=404, detail="Api not found")
    if api_details.api_method not in ["get", "CRUD"]:
        raise HTTPException(status_code=405, detail="Method not allowed")
    api_property = json.loads(api_details.api_property)
    if not api_property['allowed_methods']['get_api']:
        raise HTTPException(status_code=403, detail="Restricted Api")
    api_data = json.loads(api_details.table_details)
    if len(api_data) > 1:
        raise HTTPException(status_code=403, detail="Can not retreive data from 2 tables")
    table_name = next(iter(api_data))
    if table_name:
        try:
            table = cashed_model[table_name]
        except KeyError:
            table_data = db.query(models.Table).filter_by(table_name=table_name).first()
            table = models.create_model(table_data)
            cashed_model[table_name] = table
        return table
    raise HTTPException(status_code=403, detail="No Table is found in the api")
