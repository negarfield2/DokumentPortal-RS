$applicationPoolID= "SharePoint_RegionSkane_WebApp"
$poolAccount = "BoolDevLocal\Administrator"
$poolPassword = ConvertTo-SecureString -AsPlainText -Force -String "bool-2011"
$webAppName= "RegionSkane Document Portal"
$databaseServer= "dev";
$databaseName = "RS_Contentdb_Root";
$port = 12121 ;
$webApplicationRootUrl = "http://dev"
$webAppHostHeader= "RegionSkaneDokumentPortal"


$applicationPoolName = "RegionSkane_Managed_Metadata_AppPool"
$mmdServiceName = "RegionSkane Managed Metadata Service"
$mmdDatabaseName = "RegionSkane_MMD_Service"


iisreset

Write-Host -f Magenta "****Starting Managed Metadata Web service****"
$MetadataServiceInstance = (Get-SPServiceInstance |Where{$_.TypeName -eq "Managed Metadata Web Service"})
if($MetadataserviceInstance.Status -eq "Disabled"){  $MetadataserviceInstance | Start-SPServiceInstance  }

while(-not ($MetadataServiceInstance.Status -eq "Online"))
{ 
    write-host -ForegroundColor Yellow "Waiting for Metadata service to provision"; sleep 5;
}

Write-Host -f Magenta "***********************************************************"
Write-Host -f Cyan "*******Creating RegionSkåne Managed MetaData Service Application*******"
iisreset

$MetadataServiceInstance = Get-SPMetadataServiceApplication $mmdServiceName   
if($MetadataServiceInstance -eq $null) 
{
        Write-Host -f Green "********MMD Service: "$mmdServiceName" did not exist********"
} 
else 
{ 
        Write-Host -f Yellow "********MMD Service: "$mmdServiceName" already exists! Deleting the existing MMD Service:********"
		Remove-SPServiceApplication $MetadataServiceInstance -RemoveData
		iisreset
}

$ApplicationPool = Get-SPServiceApplicationPool $applicationPoolName
if($ApplicationPool -eq $null)
{
$ManagedAccount = Get-SPManagedAccount $poolAccount
$ApplicationPool = New-SPServiceApplicationPool $applicationPoolName -account $ManagedAccount
}

iisreset

Write-Host -f Green "*****************************************************"

#Note: A Later change in the order the scripts run in --> -HubUri $webApplicationRootUrl":"$Port must be added to the service application after the main site has been created!
$MetaDataServiceApp = New-SPMetadataServiceApplication -Name $mmdServiceName -ApplicationPool $ApplicationPool -DatabaseName $mmdDatabaseName -DatabaseServer $databaseServer 

$RSMetaDataProxyName= "RegionSkane Metadata Service Application Proxy"
$MetaDataServiceAppProxy = New-SPMetadataServiceApplicationProxy -Name $RSMetaDataProxyName -ServiceApplication $MetaDataServiceApp -DefaultProxyGroup

iisreset
Write-Host -f Green "******MMD service was created successfully!******"
Write-Host -f Cyan "******Binding MMD service to Region Skåne web application******"

#Create RS Service Proxy Group
$RSProxyGroup= "Region Skane Service Proxy Group"
$existingRSProxyGroup= Get-SPServiceApplicationProxyGroup $RSProxyGroup 
if($existingRSProxyGroup -eq $null)
{
# Do nothing!
}
else
{
Remove-SPServiceApplicationProxyGroup $RSProxyGroup
}

New-SPServiceApplicationProxyGroup –Name $RSProxyGroup

$MetaDataServiceApp = Get-SPMetadataServiceApplication $mmdServiceName
Add-SPServiceApplicationProxyGroupMember -Identity $RSProxyGroup –Member $MetaDataServiceApp

$MetaDataServiceAppProxy= Get-SPMetadataServiceApplicationProxy $RSMetaDataProxyName
Add-SPServiceApplicationProxyGroupMember -Identity $RSProxyGroup –Member $MetaDataServiceAppProxy

$web = Get-SPWebApplication $webApplicationRootUrl":"$port
Set-SPWebApplication $web -ServiceApplicationProxyGroup $RSProxyGroup 

iisreset

Write-Host -f Cyan "******RegionSkåne Managed MetaData Service Application was created, set up and configured successfully*******"

