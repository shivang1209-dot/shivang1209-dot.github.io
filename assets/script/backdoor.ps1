$exportfile = "D:\Documents:\PowerShell"
$this = Get-childitem 'HKCU:\SOFTWARE\Microsoft\Terminal Server Client\Servers'
$this | Foreach-object {Get-ItemProperty $_.PsPath} | select-object PSChildName | export-csv -path -NoTypeInformation