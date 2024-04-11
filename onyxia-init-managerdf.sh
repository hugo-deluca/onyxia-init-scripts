#!/bin/bash

# Install redis
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
sudo apt-get install redis


# Clone the repo
git clone https://$1@github.com/aherman59/managerdf.git


# Install modules in venv
cd managerdf
pip install -r requirements.


# Run API Livraisons server
# uvicorn api.main:app --reload