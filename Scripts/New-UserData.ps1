Param(
    [string]$UserName,
    [string]$FirstName,
    [string]$LastName,
    [string]$Department,
    [string]$JobTitle
)

$entry = @{
    UserName = $UserName
    FirstName = $FirstName
    LastName = $LastName
    Department = $Department
    JobTitle = $JobTitle
    Password = "ChangeMe123!" # Replace with integration to secrets/vault
    Groups = @()
}

$cfgFile = "ConfigurationData/Production.psd1"
# This is a convenience helper that prints the block to add to the Production.psd1
$entry | ConvertTo-Json -Depth 5
