$IsBunInstalled = Get-Command bun.exe -ErrorAction SilentlyContinue
$IsNodeInstalled = Get-Command node.exe -ErrorAction SilentlyContinue

if ($IsBunInstalled) {
    Write-Host "Building with Bun"
    & bun.exe ./packer/packer.js
    exit 1
}

if ($IsNodeInstalled) {
    Write-Host "Building with Node"
    & node.exe ./packer/packer.js
    exit 1
}

Write-Error "Unable to find Bun or Node - Please install one to build the project"
exit 0