for /f %%i in ('gcloud config list --format "value(core.project)"') do set PROJECT_ID=%%i
echo %PROJECT_ID%

for /f %%i in ('gcloud projects describe %PROJECT_ID% --format "value(projectNumber)"') do set PROJECT_NUMBER=%%i
echo %PROJECT_NUMBER%

set REGION=us-central1
set REPOSITORIO=ultimo
set SERVICE_NAME=cloudsoluciones

@REM echo %PROJECT_ID%
@REM echo %PROJECT_NUMBER%
@REM echo %REGION%
@REM echo %REPOSITORIO%
@REM echo %SERVICE_NAME%

gcloud builds submit --region=%REGION% --tag %REGION%-docker.pkg.dev/%PROJECT_ID%/%REPOSITORIO%/%SERVICE_NAME%:v1 --project %PROJECT_ID%