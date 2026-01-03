function List_Processes
{
    Get-Process
}

List_Processes | Out-File -FilePath D:\Documents\PowerShell\processes123.txt