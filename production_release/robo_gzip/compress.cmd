@echo off
if not "%1"=="" (echo.%1&%~dps0static-compress -c zopfli -j 8 -e .gz %11>nul&%~dps0static-compress -c brotli -j 8 -e .br -q 0 %11>nul&exit /b 0)
if exist "__last_run__" (set /p lastdate=<__last_run__)
if "%lastdate%"=="" (
set "lastdate="
) else (
set "lastdate=/d +%lastdate%"
)
echo. Compressing all changed files...
echo.
cd ..
forfiles.exe /s %lastdate% /m "*.css" /c "cmd.exe /c if @isdir==FALSE (\"%~0\" @file)"
forfiles.exe /s %lastdate% /m "*.js" /c "cmd.exe /c if @isdir==FALSE (\"%~0\" @file)"
forfiles.exe /s %lastdate% /m "*.json" /c "cmd.exe /c if @isdir==FALSE (\"%~0\" @file)"
forfiles.exe /s %lastdate% /m "*.html" /c "cmd.exe /c if @isdir==FALSE (\"%~0\" @file)"
forfiles.exe /s %lastdate% /m "*.xhtml" /c "cmd.exe /c if @isdir==FALSE (\"%~0\" @file)"
forfiles.exe /s %lastdate% /m "*.xml" /c "cmd.exe /c if @isdir==FALSE (\"%~0\" @file)"
::static-compress.exe -c brotli -j 8 -e ".br" "**/*.{css,js,json,html]"
cd robo_gzip
echo.%date:~4%>__last_run__
pause
