$Files = Get-ChildItem -path ".\Class"

foreach ($f in $Files) {
    . ".\Class\$($f.Name)"
}
