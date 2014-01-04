#Get-Date
#http://technet.microsoft.com/en-us/library/hh849887.aspx

Write-Host "The value of the `$pshome variable is $pshome."
$unixDateTime = Get-Date -UFormat %s
$unixDateTime = $unixDateTime.replace('.','_') 

$outputFile = Join-Path ($PWD) logs/pinger_$unixDateTime.log
Write-Host $outputFile
Write-Output $unixDateTime | Out-File -Append $outputFile 2>&1
Write-Host  "------------------------------------------------------------------------" | Tee-Object $outputFile 2>&1
Write-Host "Local date (`$unixDateTime) is [$unixDateTime]." | Tee-Object $outputFile 2>&1
Write-Host  "------------------------------------------------------------------------" | Tee-Object $outputFile 2>&1
#NextGenTel
ping -n 2 www.nextgentel.no | Tee-Object $outputFile 2>&1
#Gateway
ping -n 2 80.203.47.1  | Tee-Object $outputFile 2>&1
#DNS Servers
ping -n 2 217.13.7.140  | Tee-Object $outputFile 2>&1
ping -n 2 217.13.4.24  | Tee-Object $outputFile 2>&1
Write-Host  "------------------------------------------------------------------------" | Tee-Object $outputFile 2>&1

#Telnet Automation with PowerShell made simple… | Max Trinidad – The PowerShell Front
#http://www.maxtblog.com/2012/06/telnet-automation-with-powershell-made-simple/

.\grab_adsl_rates.vbs