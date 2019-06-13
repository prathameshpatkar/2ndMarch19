$xls= New-Object -ComObject excel.application
$xls.Visible=$true
$xls.DisplayAlerts=$false
$openxls=$xls.Workbooks.Open("C:\Users\ppatkar\Desktop\Prathamesh\Hardware Audit\TEST\Hardware Audit- April 2019")
$sheets=$openxls.Worksheets.Item(1)
$editxlrow2=$sheets.Cells.item(2,2)
$editxlrow2.EntireRow.delete()
$editxlrow2=$sheets.Cells.item(2,2)
$editxlrow2.EntireRow.delete()
#$editxlrow3=$editxlrow2.cells.item(2,2)
#$editxlrow3=$editxlrow2.Cells.item(2,2)
#$editxlrow3.EntireRow.delete()


#$editxlrow3.EntireRow.delete()
#$xlrows.Cells
#$editxlrow3= $xlrows.Cells.Item(1,3)
#$editxlrow3.EntireRow.Delete()
$openxls.Close($true)
$xls.Quit()

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
$xls.Quit()

