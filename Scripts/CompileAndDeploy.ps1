Param(
    [string]$ConfigScript = "DSC_Configurations/AD_UserLifecycle.ps1",
    [string]$ConfigData = "ConfigurationData/Production.psd1",
    [string]$OutputPath = ".\MOF_Output"
)

Write-Host "Compiling DSC configuration..."

. $ConfigScript
$cd = . $ConfigData
$creds = Get-Credential -Message "Enter Domain Admin credentials for compilation (will not be stored)"

AD_UserLifecycle -ConfigurationData $ConfigData -DomainAdminCred $creds -OutputPath $OutputPath

Write-Host "Applying configuration..."
Start-DscConfiguration -Path $OutputPath -Wait -Verbose -Force
