Set-Location "$PSScriptRoot\.."

$vault = Split-Path "." -Leaf

Set-Location "..\"

$vaultcopy = "$vault-Copy"

If (Test-Path $vaultcopy) { Remove-Item -Path $vaultcopy -Recurse -Force }

# make a copy of the vault
Copy-Item $vault $vaultcopy -Force -Recurse

Set-Location $vaultcopy

# change README's
Get-ChildItem -Recurse -File -Filter "_README.md" | % { Rename-Item -Force -Path $_.PSPath -NewName $_.Name.replace("_README", "README") }

Set-Location "..\"

$vaultexport = "$vault-Export"

If (Test-Path $vaultexport) { Remove-Item -Path $vaultexport -Recurse -Force }

New-Item -ItemType Directory $vaultexport

Copy-Item -Path "$vault\.git" -Destination $vaultexport -Force -Recurse
Set-Location $vaultexport
git checkout main
Set-Location "..\"

wsl

obsidian-export Kaas-New-Copy KaaS-Export

exit

Set-Location KaaS-Export
tree
git status
