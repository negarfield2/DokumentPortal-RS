
Write-Host "*******Cleaning RegionSk�ne PAckages from the farm *****************"
iex ".\CleanFarm.ps1"



Write-Host "*******Deploying RegionSk�ne PAckages on the farm *****************"
iex ".\Deploy.ps1"



Write-Host "*******Setting up RegionSk�ne Document Portal Site*****************"
iex ".\RSDeploy.ps1"


Write-Host "*******RegionSk�ne Full Deploy is Done!*****************"
