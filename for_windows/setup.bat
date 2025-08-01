@echo off

docker info >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker has not been started yet, please start Docker Desktop manually first.
    pause
    exit /b 1
)

cd workspace || exit /b

git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robosuite.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robocasa.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-robomimic.git
git clone --depth 1 https://github.com/HCIS-Lab/robocasa_project-mimicgen.git

rename robocasa_project-robosuite robosuite
rename robocasa_project-robocasa robocasa
rename robocasa_project-robomimic robomimic
rename robocasa_project-mimicgen mimicgen

cd .. 
docker build -t robo-env:latest .
echo [SUCCESS] Docker image built successfully.
pause