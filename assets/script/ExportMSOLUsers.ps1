Connect-MsolService

Get-MsolUser -All | SELECT * | Export-csv -nti D:\Documents\PowerShell\test.csv