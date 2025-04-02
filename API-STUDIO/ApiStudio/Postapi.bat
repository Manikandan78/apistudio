@ECHO OFF
@setlocal enableextensions
@cd /d "%~dp0"

@echo off

REM Set the path to your virtual environment
set VENV_PATH=C:\B2E\NANOX-API-STUDIO-master\PostApi\venv

REM Activate the virtual environment
call %VENV_PATH%\Scripts\activate.bat

cd /d C:\B2E\NANOX-API-STUDIO-master\PostApi

REM Run the Python service command
uvicorn main:app --reload --host 127.0.0.1 --port 8002
