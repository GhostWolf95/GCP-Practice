PROJECT_ID=$(gcloud config list --format 'value(core.project)')
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
REGION=us_central1
REPOSITORIO=ultimo
SERVICE_NAME=cloudsoluciones
IMAGEN_NAME=cloudsoluciones:v1

gcloud run deploy $SERVICE_NAME --image $REGION-docker.pkg.dev/$PROJECT_ID/$REPOSITORIO/$IMAGEN_NAME --region=$REGION --no-allow-unauthenticated