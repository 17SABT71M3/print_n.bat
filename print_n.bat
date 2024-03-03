@echo off
set handle=%~1
set number=%~2
set file=%3
if exist %file%      goto checkhandle
echo:Check: Invalid File!
goto :eof
:checkhandle
if "%handle%" NEQ "" goto continue
goto :eof
:continue
setlocal enabledelayedexpansion
set string=%handle%
set first=!string:~0,1!
if "!first!" NEQ "/" goto printhelpmenu
set string=!string:~1!
set /a choice=0
for /l %%i in (1,1,10) do set tempstrChar=!string:~%%i,1!&if "!tempstrChar!" NEQ "" if "!tempstrChar!" NEQ "n" set /a choice=1
if %choice%==1 goto printhelpmenu
endlocal disabledelayedexpansion
goto checkstringnumber
:printhelpmenu
echo:Syntax-
echo:"%~nx0" /n [n where n is the number of line to print] ["path/to/file"]
echo:
goto :eof
:checkstringnumber
echo:%number%|findstr /r "^[0-9]*$" >NUL&&echo.>NUL || goto printhelpmenu
if %number% LSS 0 Echo:Number must be greater than 0&goto :eof
if %number% GTR 0 findstr /r /n "^.*$" %file% | findstr /r "^%number%:"
