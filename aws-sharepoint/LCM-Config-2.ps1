# This block sets the LCM configuration to what we need for QS
[DSCLocalConfigurationManager()]

"Setting Execution Policy to Remote Signed"
Set-ExecutionPolicy RemoteSigned -Force

# Sets LCM Configuration to MOF generated in previous command
Set-DscLocalConfigurationManager -Path 'C:\AWSQuickstart\LCMConfig' -Force
