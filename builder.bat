@echo off
echo ===================================================
echo 1. Downloading the latest patch bundle...
echo ===================================================
curl -L -o patches.rvp https://api.revanced.app/v5/patches.rvp

echo.
echo ===================================================
echo 2. Building modified Instagram APK...
echo ===================================================
java -jar cli.jar patch --purge -p patches.rvp -b --exclusive -e "Hide explore feed" -e "Disable Reels scrolling" -e "Hide navigation buttons" -e "Limit feed to followed profiles" -o instagram-patched.apk instagram.apk

echo.
echo ===================================================
echo 3. Cleaning up temporary files...
echo ===================================================
if exist patches.rvp del /f /q patches.rvp
if exist instagram-patched-temporary-files rmdir /s /q instagram-patched-temporary-files

echo.
echo ===================================================
echo Build completed! instagram-patched.apk is ready.
echo ===================================================
pause