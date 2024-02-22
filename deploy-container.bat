for /f %%i in ('gcloud config list --format "value(core.project)"') do set PROJECT_ID=%%i
echo %PROJECT_ID%

for /f %%i in ('gcloud projects describe %PROJECT_ID% --format "value(projectNumber)"') do set PROJECT_NUMBER=%%i
echo %PROJECT_NUMBER%
set REGION=us-central1
set REPOSITORIO=ultimo
set SERVICE_NAME=cloudsoluciones
set IMAGEN_NAME=cloudsoluciones:v1

gcloud run deploy %SERVICE_NAME% --image %REGION%-docker.pkg.dev/%PROJECT_ID%/%REPOSITORIO%/%IMAGEN_NAME% --region=%REGION% --allow-unauthenticated