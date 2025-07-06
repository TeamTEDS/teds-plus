#Get folder children in path, Alias for dir
foreach ($path in (Get-ChildItem -Path . -Directory)) {
    $path.FullName
    #Change context to path, Alias for cd (Change Directory)
    Set-Location -Path $path.FullName
    packwiz mr export
}
Set-Location .\..