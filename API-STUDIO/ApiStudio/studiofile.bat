@echo off
setlocal enabledelayedexpansion

:: Define the source directories
set "source_directories=\
D:\Apistudio\ApiStudio \
D:\Apistudio\AuthentiDation \
D:\Apistudio\CmsPage \
D:\Apistudio\CoreApi \
D:\Apistudio\CrudApp \
D:\Apistudio\DBSDhemaApi \
D:\Apistudio\DeleteApi \
D:\Apistudio\GetApi \
D:\Apistudio\PostApi \
D:\Apistudio\Sqlviews \
D:\Apistudio\UpdateApi \
D:\Apistudio\Datamigration \"

:: Define the backup destination directory
set "backup_destination=D:\B2E\SOURCECODE"

:: Define the current date and time
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set "datetime=%%I"
set "current_date=%datetime:~6,4%-%datetime:~4,2%-%datetime:~2,2%_%datetime:~8,2%-%datetime:~10,2%"

:: Create a backup folder with current date
set "backup_folder=%backup_destination%\%current_date%"
mkdir "%backup_folder%"

:: Loop through each source directory and copy files to the backup folder
for %%d in (%source_directories%) do (
    echo Copying files from %%d to %backup_folder%
    for /d /r "%%d" %%f in (*) do (
        if /i not "%%~nxf"=="venv" (
            xcopy "%%f" "%backup_folder%\%%~nxd" /E /I /H /R /Y
        )
    )
)

echo Backup completed successfully.

