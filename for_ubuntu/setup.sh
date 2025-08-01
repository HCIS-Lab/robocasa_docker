#!/bin/bash

if ! docker info > /dev/null 2>&1; then
    echo "[ERROR] Docker has not been started yet, please start Docker Desktop manually first."
    exit 1
fi

set -e

cd workspace
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robosuite.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robocasa.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robomimic.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-mimicgen.git
mv robocasa_project-robosuite robosuite
mv robocasa_project-robocasa robocasa
mv robocasa_project-robomimic robomimic
mv robocasa_project-mimicgen mimicgen

cd ..
docker build -t robo-env:latest .
echo "[SUCCESS] Docker image built successfully."