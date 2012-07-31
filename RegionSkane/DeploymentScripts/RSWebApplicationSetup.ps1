$applicationPoolID= "SharePoint_RegionSkane_WebApp"
$poolAccount = "BoolDevLocal\Administrator"
$poolPassword = ConvertTo-SecureString -AsPlainText -Force -String "bool-2011"
$webAppName= "RegionSkane Document Portal"
$databaseServer= "dev";
$databaseName = "RS_Contentdb_Root";
$port = 12121 ;
$webApplicationRootUrl = "http://dev"
$webAppHostHeader= "RegionSkaneDokumentPortal"

Write-Host -f Green "******* RegionSkåne Web Application Setup *****************"
[void][System.Reflection.Assembly]::LoadWithPartialName(“Microsoft.SharePoint”)
$farm = [microsoft.sharepoint.administration.spfarm]::local

Write-Host "********Check if Web Application exists:*******************"
$sp = Get-SPWebApplication | Where {$_.DisplayName -eq $webAppName} 
if($sp -eq $null) 
{
        Write-Host -f Green "********Web application: "$webAppName" did not exist********"
} 
else 
{ 
        Write-Host -f Yellow "********Web application: "$webAppName" already exists! Deleting the existing web application:********"
	    Remove-SPWebApplication -Identity $webApplicationRootUrl":"$port  -DeleteIISSite -RemoveContentDatabase
		Write-Host -f Yellow "******** Existing web application was removed successfully!********"
}
iisreset

Write-Host "********Creating new web application: "$webAppName"********"
New-SPWebApplication -Name $webAppName -Port $port -URL $webApplicationRootUrl -ApplicationPool $applicationPoolID -ApplicationPoolAccount (Get-SPManagedAccount $poolAccount) -DatabaseName $databaseName -DatabaseServer $databaseServer

Write-Host -f Green "********New web application was created successfully!********"

iex ".\RSMMDServiceConfig.ps1"