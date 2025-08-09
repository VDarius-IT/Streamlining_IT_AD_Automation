Describe "AD_UserLifecycle Configuration" {
    It "DSC configuration script exists" {
        Test-Path -Path "DSC_Configurations/AD_UserLifecycle.ps1" | Should -BeTrue
    }

    It "Configuration data exists" {
        Test-Path -Path "ConfigurationData/Production.psd1" | Should -BeTrue
    }
}
