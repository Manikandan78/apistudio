from http.client import HTTPException
from sqlalchemy.dialects.postgresql import psycopg2
import schemas, models
from database import engine, SessionLocal
from sqlalchemy.orm import Session
import json
import psycopg2
from fastapi import FastAPI
from sqlalchemy import MetaData
import hashlib
from fastapi import HTTPException, Depends
from sqlalchemy import create_engine, inspect
from sqlalchemy.schema import CreateSchema
from urllib.parse import quote_plus
from sqlalchemy import create_engine, text
import mysql.connector

app = FastAPI(docs_url='/db_schema_api', openapi_url='/db_schema_api/openapi.json', title="DB Schema Api")

models.Base.metadata.create_all(engine)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()



@app.post('/db_schema_api/db-engine', tags=['Database'])
def create(request: schemas.EngineSchema, db: Session = Depends(get_db)):
    hashed_password = hashlib.md5(request.db_password.encode()).hexdigest()

    engine_value = request.db_engine

    if engine_value == 'postgresql':

        new_db = models.Engine(
            db_engine=request.db_engine,
            db_user=request.db_user,
            db_password=hashed_password,  # Fix here
            db_host=request.db_host,
            db_port=request.db_port,
            db_name=request.db_name,
            db_connection=request.db_connection,
        )
        db.add(new_db)
        db.commit()
        db.refresh(new_db)
        return new_db

    else:
        new_db = models.Engine(
            db_engine=request.db_engine,
            db_user=request.db_user,
            db_password=request.db_password,
            db_host=request.db_host,
            db_port=request.db_port,
            db_name=request.db_name,
            db_connection=request.db_connection,
        )
        db.add(new_db)
        db.commit()
        db.refresh(new_db)
        return new_db



@app.get('/db_schema_api/db-engine', tags=['Database'])
def all_db(db: Session = Depends(get_db)):
    data = db.query(models.Engine).all()
    return data


#
@app.get('/db_schema_api/db-engine/{id}', tags=['Database'])
def get_id(id, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()
    return data


# ------------------------------------------------
@app.put('/db_schema_api/db-engine/{id}', tags=['Database'])
def update(id, request: schemas.EngineSchema, db: Session = Depends(get_db)):
    # print(request)
    data = db.query(models.Engine).filter(models.Engine.id == id)

    # print(type(data))
    existing_record = data.first()

    if not data.first():
        raise HTTPException(status_code=404, detail="Item not found")

    engine_value = existing_record.db_engine

    if engine_value == 'postgresql' or request.db_engine == 'postgresql':

        if request.db_password:
            hashed_password = hashlib.md5(request.db_password.encode()).hexdigest()
            request.db_password = hashed_password

        data.update(request.dict())
        db.commit()
        return 'Successfully Updated'
    else:
        existing_record.db_password = request.db_password
        data.update(request.dict())
        db.commit()
        return 'Successfully Updated'


# ------------------------------------


@app.get('/db_schema_api/get-schemas/{id}/', tags=['Schemas'])
def get_id(id, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()

    if data.db_engine == 'postgresql':

        db_user = data.db_user
        db_host = data.db_host
        db_name = data.db_name
        db_engine = data.db_engine
        db_password = data.db_password
        db_port = data.db_port

        db_password_encoded = quote_plus(db_password)

        connection_string = f"{db_engine}://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"
        # connection_string = f"mysql+pymysql://root:{db_password_encoded}@{db_host}:3306/{db_name}"
        # print(connection_string)
        engine = create_engine(connection_string)

        inspector = inspect(engine)
        schemas = inspector.get_schema_names()
        schemas = [schema for schema in schemas]
        return schemas

    else:
        db_user = data.db_user
        db_host = data.db_host
        db_name = data.db_name
        db_engine = data.db_engine
        db_password = data.db_password
        db_port = data.db_port

        db_password_encoded = quote_plus(db_password)

        connection_string = f"{db_engine}+mysqlconnector://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"

        engine = create_engine(connection_string)

        metadata = MetaData()

        metadata.reflect(bind=engine)

        # print("Tables in the database:")
        table_list = []
        for table in metadata.tables.values():
            table_list.append(table.name)

        return table_list


@app.get('/db_schema_api/db/{id}/tables/{schema_name}', tags=['Tables'])
def get_id(id, schema_name: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()

    db_user = data.db_user
    db_host = data.db_host
    # id = data.id
    db_name = data.db_name
    db_engine = data.db_engine
    db_password = data.db_password
    db_port = data.db_port

    db_password_encoded = quote_plus(db_password)

    connection_string = f"{db_engine}://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"
    engine = create_engine(connection_string)

    metadata = MetaData()
    metadata.reflect(bind=engine, schema=schema_name)
    table_names = [table_name.split('.')[1] for table_name in metadata.tables.keys()]
    return table_names


@app.post('/db_schema_api/create-schemas/{id}/{schema}', tags=['Schemas'])
def get_id(id, schema: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()
    # print("schema name : ", schema)

    db_user = data.db_user
    db_host = data.db_host
    # id = data.id
    db_name = data.db_name
    db_engine = data.db_engine
    db_password = data.db_password
    db_port = data.db_port

    db_password_encoded = quote_plus(db_password)

    db_url = f"{db_engine}://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"
    engine = create_engine(db_url)

    with engine.connect() as connection:
        if not connection.dialect.has_schema(connection, schema):
            connection.execute(CreateSchema(schema))
            connection.commit()

    return f" created new '{schema}' schema"


# ----------------------------------------------------------------------------------------


@app.post('/db_schema_api/create-database/{db_port}/{db_engine}/{db_user}/{db_password}/{db_host}/{db_name}',
          tags=['Database'])
def create_database(db_engine: str, db_port: str, db_user: str, db_password: str, db_host: str, db_name: str,
                    db: Session = Depends(get_db)):
    # print(db_engine)

    if db_engine == 'postgresql':

        try:
            conn = psycopg2.connect(dbname='template1', user=db_user, password=db_password, host=db_host)
        except Exception as e:
            return {"error": f"Error connecting to template1 database: {str(e)}"}

        try:
            conn.autocommit = True

            with conn.cursor() as cur:
                try:
                    cur.execute(f'CREATE DATABASE {db_name}')
                except Exception as e:
                    return {"error": f"Error creating database {db_name}: {str(e)}"}
        except Exception as e:
            return {"error": f"Error during database creation: {str(e)}"}
        finally:
            if conn:
                conn.close()

            new_db = models.Engine(
                db_engine=db_engine,
                db_user=db_user,
                db_password=db_password,
                db_host=db_host,
                db_port=db_port,
                db_name=db_name,
            )
            db.add(new_db)
            db.commit()
            db.refresh(new_db)
            # return new_db

        return {"message": "Database created successfully."}

    else:

        db_password_encoded = quote_plus(db_password)

        database_url = f'{db_engine}+mysqlconnector://{db_user}:{db_password_encoded}@{db_host}:{db_port}/'

        engine = create_engine(database_url)
        with engine.connect() as connection:
            connection.execute(text(f'CREATE DATABASE IF NOT EXISTS {db_name}'))

            new_db = models.Engine(
                db_engine=db_engine,
                db_user=db_user,
                db_password=db_password,
                db_host=db_host,
                db_port=db_port,
                db_name=db_name,
            )
            db.add(new_db)
            db.commit()
            db.refresh(new_db)

        return "Database created successfully!"


@app.get('/db_schema_api/records/{id}/{schema_name}/{table_name}', tags=['Records'])
def records(id, schema_name: str, table_name: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()

    db_user = data.db_user
    db_host = data.db_host
    # id = data.id
    db_name = data.db_name
    db_engine = data.db_engine
    db_password = data.db_password
    db_port = data.db_port

    db_password_encoded = quote_plus(db_password)

    connection_string = f"{db_engine}://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"
    engine = create_engine(connection_string)

    metadata = MetaData()

    metadata.reflect(bind=engine, schema=schema_name, only=[table_name])

    column_names = metadata.tables[f'{schema_name}.{table_name}'].columns.keys()

    column_list = []

    for i in column_names:
        column_list.append(i)

    # print("column_name ", column_list)

    conn = engine.connect()
    metadata.reflect(bind=engine, schema=schema_name, only=[table_name])

    pdf_files = metadata.tables[schema_name + '.' + table_name]

    query = pdf_files.select()

    result = conn.execute(query)
    # print(result)
    all_values = []

    # for row in result:
    #     # print(row.id)
    #     row_value = {}
    #     for i in column_list:
    #         if hasattr(row, i):
    #             a = getattr(row, i)
    #             row_value[i] = a
    #     all_values.append(row_value)
       

    # conn.close()

    for row in result:
        row_value = {}
        for i in column_names:
            if hasattr(row, i):
                value = getattr(row, i)
                if isinstance(value, bytes):
                    # If the value is binary, attempt to decode it as UTF-8
                    try:
                        value = value.decode('utf-8')
                    except UnicodeDecodeError:
                        # If decoding fails, handle the binary data appropriately
                        value = repr(value)  # Or any other appropriate handling
                row_value[i] = value
        all_values.append(row_value)

    conn.close()



    # print("records : ", all_values)

    response = {
        "column_name": column_list,
        "column_data": all_values
    }

    # print(response)
    return response


@app.get('/db_schema_api/columns/{id}/{schema_name}/{table_name}', tags=['Fields'])
def get_id(id, schema_name: str, table_name: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()

    if data.db_engine == 'postgresql':

        db_user = data.db_user
        db_host = data.db_host
        # id = data.id
        db_name = data.db_name
        db_engine = data.db_engine
        db_password = data.db_password
        db_port = data.db_port

        db_password_encoded = quote_plus(db_password)

        connection_string = f"{db_engine}://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"
        engine = create_engine(connection_string)

        metadata = MetaData()
        metadata.reflect(bind=engine, schema=schema_name, only=[table_name])
        column_names = metadata.tables[f'{schema_name}.{table_name}'].columns.keys()
        # -------------------------------------------------------------------------------------

        table = metadata.tables[f'{schema_name}.{table_name}']
        column_data_types = {}
        for column in table.columns:
            column_name = column.name
            data_type = str(column.type)
            # Remove length and other information by splitting and taking the first part
            data_type = data_type.split("(")[0]
            column_data_types[column_name] = data_type
        # print(column_data_types)

        return column_data_types


# ----------------------------- Sql database ------------------------------------

@app.get('/db_schema_api/mysql_columns/{id}/{table_name}', tags=['Fields'])
def get_id(id, table_name: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()

    db_engine = data.db_engine
    db_user = data.db_user
    db_host = data.db_host
    db_name = data.db_name
    db_port = data.db_port
    db_password = data.db_password

    db_password_encoded = quote_plus(db_password)

    DATABASE_URL = f"{db_engine}+mysqlconnector://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"

    engine = create_engine(DATABASE_URL)

    metadata = MetaData()

    metadata.reflect(bind=engine)

    actor_table = metadata.tables[f'{table_name}']

    column_data_types = {}

    for column in actor_table.columns:
        column_data_types[column.name] = str(column.type)

    return column_data_types


@app.get('/db_schema_api/sql_database/{db_name}', tags=['SQL Database'])
def get_sql(db_name):
    _password = '123456'

    password_encoded = quote_plus(_password)

    DATABASE_URL = f"mysql+mysqlconnector://root:{password_encoded}@localhost/{db_name}"

    engine = create_engine(DATABASE_URL)

    metadata = MetaData()

    metadata.reflect(bind=engine)

    # print("Tables in the database:")
    table_list = []
    for table in metadata.tables.values():
        table_list.append(table.name)

    return table_list


@app.get('/db_schema_api/mysql_records/{id}/{table_name}', tags=['Records'])
def records(id, table_name: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(models.Engine.id == id).first()

    db_user = data.db_user
    db_host = data.db_host
    # id = data.id
    db_name = data.db_name
    db_port = data.db_port
    db_engine = data.db_engine
    db_password = data.db_password

    db_password_encoded = quote_plus(db_password)

    connection_string = f"{db_engine}+mysqlconnector://{db_user}:{db_password_encoded}@{db_host}:{db_port}/{db_name}"

    engine = create_engine(connection_string)

    metadata = MetaData()

    metadata.reflect(bind=engine)

    actor_table = metadata.tables[f'{table_name}']

    column_list = []

    for column in actor_table.columns:
        column_list.append(column.name)

    # print(column_list)

    rows_data = []

    with engine.connect() as connection:
        query = actor_table.select()
        result = connection.execute(query)

        for row in result:
            rows_data.append(row)

    # print(rows_data)

    all_values = []

    for row in rows_data:
        # print(row.id)
        row_value = {}
        for i in column_list:
            if hasattr(row, i):
                a = getattr(row, i)
                row_value[i] = a
        all_values.append(row_value)
        # row_values = list(row)
        # all_values.append(row_values)

    response = {
        "column_name": column_list,
        "column_data": all_values
    }

    # print(response)
    return response


@app.get('/db_schema_api/connection-name/{db_connection}', tags=['connection'])
def all_db(db_connection: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(db_connection == models.Engine.db_connection).first()
    return data


@app.get('/db_schema_api/db-connection/{db_connection}/{table_names}', tags=['connection'])
def all_db(db_connection: str, table_names: str, db: Session = Depends(get_db)):
    data = db.query(models.Engine).filter(db_connection == models.Engine.db_connection).first()
    db_user = data.db_user
    db_password = data.db_password
    db_host = data.db_host
    db_name = data.db_name
    db_port = data.db_port
    db_engine = data.db_engine

    if db_engine == 'mysql':
        # print("--------mysql engine connecting---------")
        DATABASE_URL = f"{db_engine}+mysqlconnector://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
    else:
        # print("--------postgres engine connecting---------")
        DATABASE_URL = f"{db_engine}://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"

    engine = create_engine(DATABASE_URL)
    inspector = inspect(engine)

    result_messages = []

    table_validation_data = [table.strip() for table in table_names.split(',')]

    for tb_name in table_validation_data:
        if inspector.has_table(tb_name):
            result_messages.append({"table": tb_name, "exists": True})
        else:
            result_messages.append({"table": tb_name, "exists": False})

    output_json = json.dumps(result_messages, indent=2)

    return result_messages


@app.post('/db_schema_api/Testing/', tags=['DB Testing'])
def testing_database(request: schemas.DBTestingSchema):
    db_engine = request.db_engine
    db_user = request.db_user
    db_password = request.db_password
    db_host = request.db_host
    db_port = request.db_port
    db_name = request.db_name
  

    if db_engine == 'postgresql':
        try:
            password_encoded = quote_plus(db_password)
            connection_string = f"{db_engine}://{db_user}:{password_encoded}@{db_host}:{db_port}/{db_name}"
            db_engine = create_engine(connection_string)

            # Test the connection by checking if it's connected
            if db_engine.connect():
                return "Test Connection was Successful"

            else:
                return "Failed to connect to the database."

        except Exception as e:
            raise HTTPException(status_code=403, detail="Test Connection Failed")

    else:
       
        password_encoded = quote_plus(db_password)
        connection_string = f"{db_engine}+mysqlconnector://{db_user}:{password_encoded}@{db_host}:{db_port}/{db_name}"

        try:
            connection = mysql.connector.connect(user=db_user, password=password_encoded, host=db_host, database=db_name)
            return "Connected successfully!"
        except mysql.connector.Error as e:
            # return f"Error connecting to MySQL: {e}"
            raise HTTPException(status_code=403, detail=f"Test Connection Failed---{e}")


# @app.post('/db_schema_api/Testing/', tags=['DB Testing'])
# def testing_database(request: schemas.DBTestingSchema):
#     print("function working")
#     print("db_engine:", request.db_engine)
#     print("db_user:", request.db_user)
#     print("db_password:", request.db_password)
#     print("db_host:", request.db_host)
#     print("db_port:", request.db_port)
#     print("db_name:", request.db_name)
#
#     return {"message": "Values printed in the console. Check the server logs."}

# ------------------- API Schema ------------------- 

@app.post('/db_schema_api/api/v1/create_data')
def create(request: schemas.CreateSchemas, db: Session = Depends(get_db)):
    obj = models.ApiSchema(
        api_connection_id=request.api_connection,
        api_schemas=request.api_schemas
    )
    db.add(obj)
    db.commit()
    db.refresh(obj)
    return obj


@app.get('/db_schema_api/api/v1/get_data/{api_connection_id}')
def get(api_connection_id: int, db: Session = Depends(get_db)):
    obj = db.query(models.ApiSchema).filter(models.ApiSchema.api_connection_id == api_connection_id).first()
    if obj:
        return obj
    else:
        raise HTTPException(status_code=404, detail="Not found db")


@app.put('/db_schema_api/api/v1/update_data')
def update(request: schemas.UpdateSchemas, db: Session = Depends(get_db)):
    obj = db.query(models.ApiSchema).filter(models.ApiSchema.api_connection_id == request.api_connection).first()
    obj.api_schemas = request.api_schemas
    db.add(obj)
    db.commit()
    db.refresh(obj)
    return obj


@app.get('/db_schema_api/api/v1/get_schemas_data/{api_connection_id}')
def get(api_connection_id: int, db: Session = Depends(get_db)):
    obj = db.query(models.ApiSchema).filter(models.ApiSchema.api_connection_id == api_connection_id).first()
    if obj:
        response_data = obj.api_schemas
        return response_data
    else:
        raise HTTPException(status_code=404, detail="Not found db")
