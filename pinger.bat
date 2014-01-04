:: Get ISO date time from Windows Command Prompt.
:: http://stackoverflow.com/a/203116
@echo off
:: WMIC OS GET LocalDateTime
:: WMIC Path Win32_LocalTime Get Day,Hour,Minute,Month,Second,Year /Format:table
for /F "usebackq tokens=1,2 delims==" %%i in (`WMIC OS GET LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
:set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2% %ldt:~8,2%:%ldt:~10,2%:%ldt:~12,6%
set ldt=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%_%ldt:~8,2%-%ldt:~10,2%-%ldt:~12,6%

for /f "tokens=1,2 delims=." %%a in ("%ldt%") do set datetime=%%a&set milliseconds=%%b
echo.DateTime: %datetime%
echo.Milliseconds: %milliseconds%

set outputFile=%CD%\logs\pinger_%datetime%_%milliseconds%.log
echo %outputFile%

:DOS - String Manipulation
:http://www.dostips.com/DtTipsStringManipulation.php#Snippets.SplitString

:pause
:exit

echo ------------------------------------------------------------------------ >> %outputFile% 2>&1
echo.
echo Local date is [%ldt%]. >> %outputFile% 2>&1
echo.
:NextGenTel
ping -n 2 www.nextgentel.no >> %outputFile% 2>&1
:Gateway
ping -n 2 80.203.47.1 >> %outputFile% 2>&1
:DNS Servers
ping -n 2 217.13.7.140 >> %outputFile% 2>&1
ping -n 2 217.13.4.24 >> %outputFile% 2>&1
echo ------------------------------------------------------------------------ >> %outputFile% 2>&1

grab_adsl_rates.vbs