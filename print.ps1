$defaultBasePath = "c:\temp\"
params(
    $basePath = $defaultBasePath),
    $interval = 10

New-Item -ItemType Directory -Force -Path $basePath
New-Item -ItemType Directory -Force -Path ($basePath + 'archived')

$progPath = (Get-ChildItem -Filter *64c.exe -Recurse -Path 'C:\Program Files\gs')[-1].FullName
$allPrinters = Get-Printer

foreach($printer in $allPrinters)
{
    $path = $basePath + 'printing\' + $printer.Name
    New-Item -ItemType Directory -Force -Path $path
}

do
{
    foreach($file in  Get-ChildItem -File -Path c:\temp\printing -Recurse)
    {
        $device = $file.DirectoryName.Split('\')[-1]
        $command =  "& '"+$progPath+"' -dNOPAUSE -sDEVICE=mswinpr2 -sOutputFile='%printer%" + $device + "' '"+$file.FullName+"' -c exit"
        Invoke-Expression $command
        $logLine = "Printed " + $file.Name + " to " + $device
        Move-Item $file.FullName -Force -Destination c:\temp\archived
    }
    sleep -Seconds $interval
}
while(1)