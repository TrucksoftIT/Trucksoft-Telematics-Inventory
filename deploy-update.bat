@echo off
echo ================================================
echo   Trucksoft Telematics - Deploy Update Script
echo ================================================
echo.

echo Checking Git status...
git status --porcelain
if %errorlevel% neq 0 (
    echo ERROR: Not a Git repository. Run setup-git.bat first.
    pause
    exit /b 1
)

echo.
echo Files ready for commit:
git status --short

echo.
echo Step 1: Adding all changes to Git
git add .

echo.
set /p message="Enter commit message (or press Enter for default): "
if "%message%"=="" set message="Update: %date% %time%"

echo Step 2: Committing changes
git commit -m "%message%"

if %errorlevel% equ 0 (
    echo.
    echo Step 3: Pushing to GitHub (this triggers auto-deployment)
    git push origin main
    
    if %errorlevel% equ 0 (
        echo.
        echo ✅ SUCCESS: Changes pushed to GitHub!
        echo ⏳ Auto-deployment in progress...
        echo.
        echo Your changes will be live at:
        git remote get-url origin
        echo Replace 'github.com' with 'yourusername.github.io' in the URL above
        echo.
        echo 🔍 Check deployment status:
        echo https://github.com/yourusername/trucksoft-telematics-inventory/actions
    ) else (
        echo ❌ ERROR: Failed to push to GitHub
        echo Please check your internet connection and GitHub access
    )
) else (
    echo No changes to commit.
)

echo.
echo Deployment script completed.
pause