#!/bin/bash

# Clone the repo
git clone https://$GITLAB_TOKEN@gitlab.cerema.fr/datafoncier/acces-df/acces_df_api.git

# Install modules in venv
cd acces_df_api
pip install -r requirements.txt

# Creating env file
DOMAIN=$(echo "$VSCODE_PROXY_URI" | awk -F/ '{print $3}')
SECONDARY_LINK="${DOMAIN%.*}-user.${DOMAIN#*.}"

KEY=$(tr -dc "a-zA-Z0-9" < /dev/urandom | fold -w 32 | head -1)

cat > acces_df_api/.env << EOF
SECRET_KEY=$KEY
DJANGO_ALLOWED_HOSTS=$DJANGO_ALLOWED_HOSTS
PRODUCTION=$PRODUCTION
STATIC_URL=/static/
SQL_ENGINE=$SQL_ENGINE
SQL_HOST=$SQL_HOST
SQL_DATABASE=$SQL_DATABASE
SQL_PORT=$SQL_PORT
SQL_USER=$SQL_USER
SQL_PASSWORD=$SQL_PASSWORD
EOF
