
function RetractSolution([string]$Identity)
{
    Write-Host "Uninstalling $Identity"    
    
    $solution = Get-SPSolution | where { $_.Name -match $Identity }
    if($solution.ContainsWebApplicationResource)
    {                  
        Uninstall-SPSolution -identity $Identity  -allwebapplications -Confirm:$false       
    }
    else
    {       
        Uninstall-SPSolution -identity $Identity -Confirm:$false          
    }

	Write-Host "Waiting for the job to finish"
	Start-Sleep -Seconds 60
	   

    Write-Host "Removing solution:" $Identity
    Remove-SPSolution -Identity $Identity -Confirm:$false

	Start-Sleep -Seconds 30

    Write-Host -f Green $Identity" removed successfully!"
}

 Write-Host -f Green "Cleaning RegionSkåne packages from the farm:"

iisreset

RetractSolution("RS.DocumentPortal.wsp")
iisreset

