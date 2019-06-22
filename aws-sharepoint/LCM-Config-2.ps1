# This block sets the LCM configuration to what we need for QS
[DSCLocalConfigurationManager()]

"Setting Execution Policy to Remote Signed"
Set-ExecutionPolicy RemoteSigned -Force

# ~dk The command below fails, unless i do this first:
# https://social.technet.microsoft.com/Forums/scriptcenter/en-US/d172080c-ea6e-4ea1-becb-5a41df8e743b/dsc-configuration-file-execution-error?forum=ITCG
winrm quickconfig -quiet

# Sets LCM Configuration to MOF generated in previous command
Set-DscLocalConfigurationManager -Path 'C:\AWSQuickstart\LCMConfig' -Force
