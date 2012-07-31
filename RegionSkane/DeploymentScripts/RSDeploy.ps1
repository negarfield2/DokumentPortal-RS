$portalUrl = "http://dev:12121"
$portalTitle = "Document Portal"
$administratorAccount = "BoolDevLocal\Administrator"

iisreset
$rootTemplate = Get-SPWebTemplate "RS.DocumentPortal#0"
iisreset

Write-Host "Creating Site: "$portalTitle
$homeSiteCollection = New-SPSite -Url $portalUrl -OwnerAlias $administratorAccount -Name $portalTitle -Template $rootTemplate -Language 1053 -ErrorAction Stop
Write-Host "Site "$portalTitle" successfully created!"
Write-Host "************************************************************"

iisreset

