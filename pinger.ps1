#How Can I Expand the Width of the Windows PowerShell Console? - Hey, Scripting Guy! Blog - Site Home - TechNet Blogs
#http://blogs.technet.com/b/heyscriptingguy/archive/2006/12/04/how-can-i-expand-the-width-of-the-windows-powershell-console.aspx

$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(175,20000)
$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(160,60)

#Get-Date
#http://technet.microsoft.com/en-us/library/hh849887.aspx

Write-Host "The value of the `$pshome variable is $pshome."
$unixDateTime = Get-Date -UFormat %s
$unixDateTime = $unixDateTime.replace('.','_') 

$outputFile = Join-Path ($PWD) logs/pinger_$unixDateTime.log
Write-Host The `$outFile has $outputFile file path.
#Write-Output $unixDateTime | Out-File $outputFile 2>&1
Write-Output "------------------------------------------------------------------------" | Tee-Object -Append $outputFile 2>&1
Write-Output "Local date (`$unixDateTime) is [$unixDateTime]." | Tee-Object -Append $outputFile 2>&1
Write-Output "------------------------------------------------------------------------" | Tee-Object -Append $outputFile 2>&1
#NextGenTel
Test-Connection -Count 2 -Verbose www.nextgentel.no | Tee-Object -Append -FilePath $outputFile 2>&1
ping -n 2 www.nextgentel.no | Tee-Object -Append -FilePath $outputFile 2>&1
Write-Output "------------------------------------------------------------------------" | Tee-Object -Append $outputFile 2>&1
#Gateway
Test-Connection -Count 2 -Verbose 80.203.47.1 | Tee-Object -Append -FilePath $outputFile 2>&1
ping -n 2 80.203.47.1 | Tee-Object -Append -FilePath $outputFile 2>&1
Write-Output "------------------------------------------------------------------------" | Tee-Object -Append $outputFile 2>&1
#DNS Servers
Test-Connection -Count 2 -Verbose 217.13.7.140 | Tee-Object -Append -FilePath $outputFile 2>&1
Test-Connection -Count 2 -Verbose 217.13.4.24 | Tee-Object -Append -FilePath $outputFile 2>&1
ping -n 2 217.13.7.140 | Tee-Object -Append -FilePath $outputFile 2>&1
ping -n 2 217.13.4.24 | Tee-Object -Append -FilePath $outputFile 2>&1
Write-Output "------------------------------------------------------------------------" | Tee-Object -Append -FilePath $outputFile 2>&1

#Telnet Automation with PowerShell made simple… | Max Trinidad – The PowerShell Front
#http://www.maxtblog.com/2012/06/telnet-automation-with-powershell-made-simple/

.\grab_adsl_rates.vbs