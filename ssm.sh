#!/bin/bash
set -e

echo "Fetching frontend parameters from AWS SSM..."

# Clear or create the .env file
: > .env

PARAMETERS=(
  "VITE_CLIENT_ID"
  "VITE_AUTH_DOMAIN"
  "VITE_REDIRECT_URI"
)

for param in "${PARAMETERS[@]}"; do
  key=$(basename "$param")
  value=$(aws ssm get-parameter --name "$param" --with-decryption --query "Parameter.Value" --output text)
  echo "${key}=${value}" >> .env
done

echo ".env created:"
cat .env
