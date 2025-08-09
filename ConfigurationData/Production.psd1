@{
    AllNodes = @(
        @{
            NodeName = 'localhost'
            PSDscAllowDomainUser = $true
        }
    );

    NonNodeData = @{
        DomainName = "yourdomain.local"
        UserBaseOU = "OU=Employees,DC=yourdomain,DC=local"
        Users = @(
            @{
                UserName    = "jdoe"
                FirstName   = "Jane"
                LastName    = "Doe"
                Department  = "Marketing"
                JobTitle    = "Marketing Specialist"
                Password    = "P@ssw0rd123!"
                Groups      = @("Marketing Users", "All Staff")
            },
            @{
                UserName    = "bsmith"
                FirstName   = "Bob"
                LastName    = "Smith"
                Department  = "Engineering"
                JobTitle    = "Software Engineer"
                Password    = "P@ssw0rd456!"
                Groups      = @("Engineering Users", "VPN Access", "All Staff")
            }
        )
    }
}
