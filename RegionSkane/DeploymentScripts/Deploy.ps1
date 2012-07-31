function DeploySolution([string]$Identity)
{
    
    Write-Host "Adding solution:" $Identity
    $currentLocation = Get-Location
	Add-SPSolution -LiteralPath $currentLocation"\"$Identity

	Start-Sleep -Seconds 20
    Write-Host -f Green $Identity" successfully added to the farm!"
	  

    $solution = Get-SPSolution | where { $_.Name -match $Identity }
    if($solution.ContainsWebApplicationResource)
    {        
        Write-Host "Installing $Identity for all the webapplications:"    
        Install-SPSolution -Identity $Identity -AllWebApplications -GACDeployment
    }
    else
    {            
        Write-Host "Deploying $Identity Globally:"    
        Install-SPSolution -Identity $Identity -GACDeployment
    }
    
    Start-Sleep -Seconds 60

	Write-Host -f Green $Identity" deployment completed successfully!"
}


Write-Host -f Green "Adding and deploying RegionSkåne packages on the farm:"
iisreset

DeploySolution("RS.DocumentPortal.wsp")
iisreset

