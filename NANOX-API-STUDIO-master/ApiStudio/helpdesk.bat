@echo off

REM Set the path to your virtual environment
set VENV_PATH=D:\Apistudio\Helpdesk\venv

REM Activate the virtual environment
call %VENV_PATH%\Scripts\activate.bat

cd /d D:\Apistudio\Helpdesk


REM Run the Python service command
python manage.py runserver 127.0.0.1:5036