Configuration AD_UserLifecycle {
    param (
        [Parameter(Mandatory)]
        [PSCredential] $DomainAdminCred,
        [Parameter(Mandatory)]
        [Hashtable] $ConfigData
    )

    Import-DscResource -ModuleName xActiveDirectory -ModuleVersion 2.16.0

    Node localhost {
        # Example: ensure OU exists
        xADOrganizationalUnit Employees {
            Ensure = 'Present'
            DistinguishedName = $ConfigData.NonNodeData.UserBaseOU
        }

        # Example: create users from config
        foreach ($u in $ConfigData.NonNodeData.Users) {
            xADUser ($u.UserName) {
                Ensure = 'Present'
                UserName = $u.UserName
                DisplayName = ($u.FirstName + ' ' + $u.LastName)
                Password = (ConvertTo-SecureString $u.Password -AsPlainText -Force)
                Path = $ConfigData.NonNodeData.UserBaseOU
                PasswordNeverExpires = $false
                Enabled = $true
                DependsOn = "[xADOrganizationalUnit]Employees"
            }
        }
    }
}
