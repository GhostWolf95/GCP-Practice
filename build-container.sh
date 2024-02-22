PROJECT_ID=$(gcloud config list --format 'value(core.project)')
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
REGION=us_central1
REPOSITORIO=ultimo
SERVICE_NAME=cloudsoluciones

gcloud builds submit --region=$REGION --tag $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORIO/$SERVICE_NAME:v1 --project $PROJECT_ID