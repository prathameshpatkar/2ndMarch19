Function Get-FileName1($initial)
{
Write-Host "Please select csv file extracted from AD"

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initial
    $OpenFileDialog.filter = "CSV (*.csv)| *.csv"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}
$a=Get-FileName1 -initial $initial
$inputdata =$a
$inputcsv1=import-csv $a

<#$xls= New-Object -ComObject excel.application
$xls.Visible=$true
$xls.DisplayAlerts=$false
$openxls=$xls.Workbooks.Open($inputcsv1)
$sheets=$openxls.Worksheets.Item(1)
$editxlrow2=$sheets.Cells.item(2,2)
$editxlrow2.EntireRow.delete()
$editxlrow2=$sheets.Cells.item(2,2)
$editxlrow2.EntireRow.delete()#>

#$editxlrow3=$editxlrow2.cells.item(2,2)
#$editxlrow3=$editxlrow2.Cells.item(2,2)
#$editxlrow3.EntireRow.delete()
#$editxlrow3.EntireRow.delete()
#$xlrows.Cells
#$editxlrow3= $xlrows.Cells.Item(1,3)
#$editxlrow3.EntireRow.Delete()
#$openxls.Close($true)
<#$xls.Quit()
$xls= New-Object -ComObject excel.application
$xls.Visible=$true
$xls.DisplayAlerts=$false
$openxls=$xls.Workbooks.Open("C:\Users\ppatkar\Desktop\Prathamesh\Hardware Audit\TEST\Hardware Audit- April 2019")
$sheets=$openxls.Worksheets.Item(1)
$getmonth=Read-host "Please enter the month number till which you would like to check the machines"
#$getmonthnumber=get-date -Format MM
$objrange= $sheets.UsedRange
#$objrange.Sort($objrange1,2,$null,$null,1,$null,1,1)
$objrange1=$sheets.Range("D1:D100")
if ($objrange1.Value.Equals($getmonth))
{
}
else
{
$date= get-date -Format MM
$datenew=get-date -UFormat %m
$datenew
$myarray=$objrange1 | select text | get-date -UFormat %m
$myarray | 
#$savemonth=(get-date).AddMonths($date-7)
#$savemonth1= $savemonth.Month
#$savemonth2=$savemonth1.ToString().PadLeft(2,'0')
#$sheets.Range("D1:D100")
#$savemonth1
#$savemonth2
while($savemonth2 -ne $date )
{
$objrange1=$sheets.Rows("D3:D100")
$objrange1.Delete()
$myarray=$objrange1 | select text
$v=$myarray[4].Text
$v
}
}
#$rm=$objrange1.Cells.Find('30/04/2019')
#Get-Help get-date -Online
#get-date -Month 12 -Format MM
#[void]$rm.Cells.Item(1,1).EntireRow.Delete()
$openxls.Save()
$openxls.Close($true)
$xls.Quit()#>

<#Function Get-FileName($initialDirectory)
{
Write-Host "Please select csv file extracted from AD"
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "CSV (*.csv)| *.csv"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}
Get-FileName
$inputdata =Read-Host "$(Get-FileName)"
$inputcsv1=import-csv "$($inputdata)"#>

Function Get-FileNamenew($initialDirectory)
{
Write-Host "Please select csv file extracted from Asset Register"

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "CSV (*.csv)| *.csv"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}
$b=Get-FileNamenew -initialDirectory $initialDirectory
$inputdata1 =$b
$inputcsv2=import-csv $b


[int]$machines=Read-Host "Please enter the number of days for which you want to retain the machines"


 Write-host "The Final file will be saved to your Desktop as Hardware Audit.csv" -ForegroundColor DarkRed

foreach($comp in $inputcsv1)
{
foreach($asset in $inputcsv2)
   {
    if($asset.'BH Reference / Name' -eq $comp.Name)

    {
    
    $comparedate = (get-date).AddDays(-$($machines)) 
    $date=$comparedate | Get-Date -Format "dd/MM/yyyy hh:mm:ss"

   $date1=[datetime]::ParseExact($date.Trim(),"dd/MM/yyyy hh:mm:ss",[CultureInfo]::InvariantCulture)
   
    $csvdate=get-date $comp.Modified -Format "dd/MM/yyyy hh:mm:ss"

    $csvdate1=[datetime]::ParseExact($csvdate.Trim(),"dd/MM/yyyy hh:mm:ss",[CultureInfo]::InvariantCulture)

   if($csvdate1 -lt $date1)
    
      {
        #$comp | Export-Csv [System.Environment+SpecialFolder]::Getfolderpath('Desktop')'+\Hardware Audit1.csv' -Force -Append

        #$comp | Export-Csv -Path "$([environment]::Getfolderpath('Desktop'))\Hardware Audit1.csv" -Force -Append -NoTypeInformation

        $myobject =[pscustomobject]@{Name=$comp.Name;Status=$asset.Status;Assigned=$asset.'User/Group Name';Type=$comp.Type;Description=$comp.Description;Modified=$comp.Modified;ITSO="";ActionofITSO="";ActionofOwner=""}

        $Draftcsv =$myobject | Export-Csv -Path "$([environment]::Getfolderpath('Desktop'))\Hardware Audit2.csv" -Force -Append -NoTypeInformation

        Copy-Item -Path "$([environment]::Getfolderpath('Desktop'))\Hardware Audit2.csv" -Destination "$([environment]::Getfolderpath('Desktop'))\Hardware Audit.csv" -Force
        
       
      } 

  else{}
    }

    else {}
  }
 
}