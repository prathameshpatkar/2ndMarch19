Get-WmiObject win32_operatingsystem -ComputerName MUM-PC09AKTC | Select-Object lastbootuptime

get-help Get-WmiObject -Online

Get-WmiObject -list

Get-WmiObject NTEventlogProviderConfig -ComputerName MUM-PC09AKTC | Select-Object lastbootuptime

Get-WmiObject win32_operatingsystem | Get-Member

Get-WmiObject 

function compstatus
{
param($compn)
Get-WmiObject win32_operatingsystem -ComputerName $compn | Select-Object lastbootuptime

 Get-WmiObject win32_computersystem -ComputerName $compn | Select-Object -Property name
 $env:COMPUTERNAME
 }

compstatus -compn MUM-PC09AKTC

Get-WmiObject win32_computersystem | get-member

 Get-WmiObject win32_computersystem -ComputerName MUM-PC09AKTC  | Select-Object -Property name