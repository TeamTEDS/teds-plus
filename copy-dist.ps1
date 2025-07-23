Get-ChildItem -Path . -Recurse -Filter *.mrpack | Copy-Item -Destination .\dist -Recurse

$Destination = ".\release"
Get-ChildItem ".\dist" | ForEach-Object {
    $Tail = ($_.BaseName -split '-')[-1]
    $Folder = $Tail.split('+')[0]
    $Filter = "*{0}" -f $Folder
    $DestDir = Get-ChildItem $Destination -Filter $Filter -Directory | Select-Object -ExpandProperty FullName -First 1
    if ($DestDir) {
        Copy-Item $_.FullName $DestDir -Force
    } else {
        "No Directory was found that matched the Filter {0} in Directory {1}" -f $Filter, $Destination | Write-Host
    }
}