@echo off
echo ================================================
echo Setting up Git for Trucksoft Telematics Project
echo ================================================
echo.

echo Step 1: Initialize Git repository
git init
if %errorlevel% neq 0 (
    echo ERROR: Git not found. Please install Git first from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo.
echo Step 2: Configure Git user (IMPORTANT: Replace with YOUR details)
echo Current directory: %CD%
echo.
set /p username="Enter your full name: "
set /p email="Enter your email address: "

git config user.name "%username%"
git config user.email "%email%"

echo.
echo Step 3: Create initial .gitignore and README if not exists
if not exist .gitignore (
    echo Creating .gitignore...
    echo # Auto-generated files > .gitignore
    echo *.log >> .gitignore
    echo *.tmp >> .gitignore
    echo Thumbs.db >> .gitignore
    echo .DS_Store >> .gitignore
)

echo Step 4: Add all files to Git
git add .

echo Step 5: Create initial commit
git commit -m "Initial commit: Trucksoft Telematics Inventory System with Device Sync"

echo.
echo Step 6: Add remote repository
echo IMPORTANT: First create a repository on GitHub called 'trucksoft-telematics-inventory'
echo Then enter your GitHub username below:
set /p github_username="Enter your GitHub username: "

git remote add origin https://github.com/%github_username%/trucksoft-telematics-inventory.git

echo Step 7: Set main branch and push to GitHub
git branch -M main
echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ SUCCESS: Repository setup complete!
    echo.
    echo Your project is now on GitHub at:
    echo https://github.com/%github_username%/trucksoft-telematics-inventory
    echo.
    echo Next steps:
    echo 1. Go to your GitHub repository
    echo 2. Enable GitHub Pages in Settings
    echo 3. Use deploy-update.bat for future updates
) else (
    echo.
    echo ❌ ERROR: Failed to push to GitHub
    echo Please check:
    echo 1. Repository exists on GitHub
    echo 2. Username is correct
    echo 3. You have access rights
)

echo.
pause