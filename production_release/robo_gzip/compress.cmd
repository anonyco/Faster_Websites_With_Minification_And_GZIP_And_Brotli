@echo off
if exist "__last_run__" (set /p lastdate=<__last_run__)
if "%lastdate%"=="" (
set "lastdate="
) else (
set "lastdate=/d +%lastdate%"
)
echo. Compressing all changed files...
echo.
cd ..
forfiles.exe /s %lastdate% /m "*.css" /c "cmd /c if @isdir==FALSE (echo.@file&%~dps0static-compress -c zopfli -j 8 -e .gz @file1>nul&%~dps0static-compress -c brotli -j 8 -e .br -q 0 @file1>nul)"
forfiles.exe /s %lastdate% /m "*.js" /c "cmd /c if @isdir==FALSE (echo.@file&%~dps0static-compress -c zopfli -j 8 -e .gz @file1>nul&%~dps0static-compress -c brotli -j 8 -e .br -q 0 @file1>nul)"
forfiles.exe /s %lastdate% /m "*.json" /c "cmd /c if @isdir==FALSE (echo.@file&%~dps0static-compress -c zopfli -j 8 -e .gz @file1>nul&%~dps0static-compress -c brotli -j 8 -e .br -q 0 @file1>nul)"
forfiles.exe /s %lastdate% /m "*.html" /c "cmd /c if @isdir==FALSE (echo.@file&%~dps0static-compress -c zopfli -j 8 -e .gz @file1>nul&%~dps0static-compress -c brotli -j 8 -e .br -q 0 @file1>nul)"
forfiles.exe /s %lastdate% /m "*.xml" /c "cmd /c if @isdir==FALSE (echo.@file&%~dps0static-compress -c zopfli -j 8 -e .gz @file1>nul&%~dps0static-compress -c brotli -j 8 -e .br -q 0 @file1>nul)"
::static-compress.exe -c brotli -j 8 -e ".br" "**/*.{css,js,json,html]"
cd robo_gzip
echo.%date:~4%>__last_run__
pause
