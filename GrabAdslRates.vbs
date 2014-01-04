On Error Resume Next
Dim WshShell
set WshShell=CreateObject("WScript.Shell")
WshShell.run "cmd.exe"
WScript.Sleep 50

REM DateInfo = DateInfo & Now & VbCrLf
REM DateInfo = DateInfo & Date & VbCrLf
REM DateInfo = DateInfo & Time & VbCrLf
REM Wscript.Echo DateInfo

' The first parameter determines how the difference will be
' measured in i.e. "S" for seconds.
UnixTime = DateDiff("S", "1/1/1970", Now)
' WScript.Echo UnixTime

' Append epoch time to log file.
TelnetCommand = "telnet 10.0.0.1 23 -f logs\telnet_" & UnixTime & ".log{ENTER}"
' WScript.Echo TelnetCommand

'Send commands to the window as needed - IP and customized commands.
'Step 1 - Telnet to remote IP'
WshShell.SendKeys TelnetCommand
WScript.sleep 1000
WshShell.SendKeys ("admin{ENTER}")
WScript.sleep 500
WshShell.SendKeys ("VebBfB1963")
WshShell.SendKeys ("{Enter}")
WScript.sleep 500
'WshShell.SendKeys ("{Enter}")
'WScript.Sleep 500
'Step 2 - Issue Commands with pauses'
WshShell.SendKeys ("{Enter}")
WScript.Sleep 100
WshShell.SendKeys ("sntp date{Enter}")
WScript.Sleep 200
WshShell.SendKeys ("adsl info{Enter}")
WScript.Sleep 2000
'Step 3 - Exit Command Window
WshShell.SendKeys ("logout{Enter}")
WScript.Sleep 100
'WshShell.SendKeys "^]" 'Microsoft Telnet Client. Escape Character is 'CTRL+]'.
'VBScript - SendKeys Method
'http://social.technet.microsoft.com/wiki/contents/articles/5169.vbscript-sendkeys-method.aspx
'WshShell.SendKeys ("quit") 'Quit Microsoft Telnet Client.
WshShell.SendKeys ("{Enter}")
WScript.Sleep 100
WshShell.SendKeys ("exit{Enter}") 'Quit Command Prompt.

WScript.Quit