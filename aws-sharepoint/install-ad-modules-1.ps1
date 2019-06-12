[CmdletBinding()]
param()

"Setting Execution Policy to Remote Signed"
Set-ExecutionPolicy RemoteSigned -Force

"Setting up Powershell Gallery to Install DSC Modules"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

"Installing the needed Powershell DSC modules for this Quick Start"
Install-Module NetworkingDsc
Install-Module -Name "xActiveDirectory"
Install-Module ComputerManagementDsc
Install-Module -Name "xDnsServer"
Install-Module -Name "ActiveDirectoryCSDsc"


