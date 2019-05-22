function getasservice

{
$var=$_

$allservices= Get-WmiObject win32_service

foreach($service in $allservices)
{
$myvalue=$service.path
$myarray=$myvalue.split("\")
$nameofprocess=$myarray
if ($var.processname -eq $nameofprocess)

{

$alldata=[PSCustomobject]@{processname=$var.processname;Relevantserice="YES"}
}
else
{
Write-Host "Relevant service for process hasn't been found"
}

$alldata | Out-File -FilePath "C:\Users\ppatkar\Desktop\new.csv" -Append
}
    

}

Get-Process | getasservice