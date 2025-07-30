#!/bin/bash

if ! docker info > /dev/null 2>&1; then
    echo "[ERROR] Docker has not been started yet, please start Docker Desktop manually first."
    exit 1
fi

set -e

mkdir workspace
cd workspace
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robosuite.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robocasa.git
mv robocasa_project-robosuite robosuite
mv robocasa_project-robocasa robocasa

git clone --depth 1 https://github.com/NVlabs/mimicgen -b experimental/robocasa
git clone --depth 1 https://github.com/ARISE-Initiative/robomimic -b robocasa
sed -i 's/==/>=/g' robomimic/setup.py

cd ..
docker build -t robo-env:latest .
echo "[SUCCESS] Docker image built successfully."