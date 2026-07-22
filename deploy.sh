#!/usr/bin/env bash
# Builds and deploys the backend to Cloud Run.
# Requires: gcloud CLI authenticated, project set, Artifact Registry enabled.
set -euo pipefail

PROJECT_ID="${GCP_PROJECT_ID:-smartkiosk-ai}"
REGION="${GCP_REGION:-africa-south1}"   # Johannesburg is the closest GCP region to East Africa as of writing
SERVICE_NAME="smartkiosk-backend"

echo "Building image..."
gcloud builds submit --tag "gcr.io/${PROJECT_ID}/${SERVICE_NAME}" .

echo "Deploying to Cloud Run..."
gcloud run deploy "${SERVICE_NAME}" \
  --image "gcr.io/${PROJECT_ID}/${SERVICE_NAME}" \
  --project "${PROJECT_ID}" \
  --region "${REGION}" \
  --platform managed \
  --allow-unauthenticated \
  --set-env-vars "GCP_PROJECT_ID=${PROJECT_ID}" \
  --min-instances 0 \
  --max-instances 5

echo "Done. Point your Africa's Talking USSD/Voice callback URLs at the Cloud Run URL printed above."
