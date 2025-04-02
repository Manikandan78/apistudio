@echo off

REM Set the path to your virtual environment
set VENV_PATH=C:\B2E\NANOX-API-STUDIO-master\Authentication\venv

REM Activate the virtual environment
call %VENV_PATH%\Scripts\activate.bat

REM Change directory to the location of main.py
cd /d C:\B2E\NANOX-API-STUDIO-master\Authentication

REM Run the Python service command
uvicorn main:app --reload --host 127.0.0.1 --port 8011
