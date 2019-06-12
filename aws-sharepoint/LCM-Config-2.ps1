# This block sets the LCM configuration to what we need for QS
[DSCLocalConfigurationManager()]
    
# Sets LCM Configuration to MOF generated in previous command
Set-DscLocalConfigurationManager -Path 'C:\AWSQuickstart\LCMConfig' 
