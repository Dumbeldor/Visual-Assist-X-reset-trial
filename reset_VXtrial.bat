@echo off
set tempfile="%temp%\1489AFE4.TMP"
set regkey=HKEY_CURRENT_USER\SOFTWARE\Licenses
set has_error=0

tasklist | find /I "devenv.exe" > NUL
if %errorlevel% == 0 (
	echo Close Visual Studio and try again.
	exit /B 1
)

echo.

echo Resetting Visual Assist X trial
echo Deleting registry key %regkey% ...
reg delete %regkey% /f
if %errorlevel% == 1 (
	echo Registry key was not deleted.
	set has_error=1
)
echo.

echo Deleting temp file %tempfile% ...
del %tempfile%>NUL

echo.

if %has_error% == 0 (
	echo Done. You can use Visual Assist X now.
) else (
	echo Done. But dunno if worked well.
)

exit /B %has_error%
