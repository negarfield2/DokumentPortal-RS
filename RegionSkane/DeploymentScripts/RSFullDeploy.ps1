
Write-Host "*******Cleaning RegionSkåne PAckages from the farm *****************"
iex ".\CleanFarm.ps1"



Write-Host "*******Deploying RegionSkåne PAckages on the farm *****************"
iex ".\Deploy.ps1"



Write-Host "*******Setting up RegionSkåne Document Portal Site*****************"
iex ".\RSDeploy.ps1"


Write-Host "*******RegionSkåne Full Deploy is Done!*****************"
