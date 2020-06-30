$ipodMountPoint = "D:"
$targetFolderName = "${ipodMountPoint}\iPod_Control\Music"
$musicList = [string[]](Get-Content .\top-2019.m3u | Select-Object -Skip 3)

foreach ($itemToCopy in $musicList)
{
    $itemNumber = $musicList.IndexOf($itemToCopy) + 1
    $arrayLength = $musicList.Length
    Write-Host "Copying [$itemNumber of $arrayLength] - ${itemToCopy}"
    Copy-Item -Path $itemToCopy -Destination $targetFolderName 
}

python .\create-ipod-database.py $ipodMountPoint