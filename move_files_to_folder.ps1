$reloadFolder = "C:\MyPath\"



gci $reloadFolder -File |  foreach {

#checkif date folder exists
#if not create

$folder = $reloadFolder + $_.LastWriteTime.Date.TOString("ddMMyyyy") + "\"

if (!(Test-Path -Path $folder)){

md $folder

Write-Output "Folder $folder created"
}


    $srcItem =  $_.FullName 
    Write-Output $srcItem 
    $destItem = $folder + $_.Name
    Write-Output $destItem 
#move file to folder

move-item -Path $srcItem  -Destination $destItem

 


 }