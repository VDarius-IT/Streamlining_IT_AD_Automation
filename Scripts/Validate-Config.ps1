Param(
    [string]$ConfigData = "ConfigurationData/Production.psd1"
)

if (-Not (Test-Path $ConfigData)) {
    Write-Error "Config data not found: $ConfigData"
    exit 2
}

try {
    # Load the PSD1 which should return a hashtable with AllNodes and NonNodeData
    $cfg = . $ConfigData

    $errors = @()
    $warnings = @()

    if (-not $cfg.NonNodeData) {
        $errors += "NonNodeData section is missing."
    } else {
        if (-not $cfg.NonNodeData.DomainName) {
            $errors += "NonNodeData.DomainName is missing."
        }
        if (-not $cfg.NonNodeData.UserBaseOU) {
            $errors += "NonNodeData.UserBaseOU is missing."
        }

        if (-not $cfg.NonNodeData.Users) {
            $warnings += "No users defined in NonNodeData.Users"
        } elseif (-not ($cfg.NonNodeData.Users -is [System.Array])) {
            $errors += "NonNodeData.Users must be an array."
        } else {
            foreach ($u in $cfg.NonNodeData.Users) {
                if (-not $u.UserName) {
                    $errors += "A user entry is missing UserName."
                    continue
                }
                if (-not $u.FirstName) {
                    $warnings += "User $($u.UserName) is missing FirstName."
                }
                if (-not $u.LastName) {
                    $warnings += "User $($u.UserName) is missing LastName."
                }
                if (-not $u.Password) {
                    $warnings += "User $($u.UserName) is missing Password."
                } else {
                    try {
                        if ($u.Password.Length -lt 8) {
                            $warnings += "User $($u.UserName) has a short password (<8 chars)."
                        }
                    } catch {
                        $warnings += "Unable to evaluate password length for user $($u.UserName)."
                    }
                }
                if (-not $u.Groups) {
                    $warnings += "User $($u.UserName) has no Groups defined."
                } elseif (-not ($u.Groups -is [System.Array])) {
                    $warnings += "Groups for user $($u.UserName) should be an array."
                }
            }
        }
    }

    foreach ($w in $warnings) { Write-Warning $w }
    foreach ($e in $errors) { Write-Error $e }

    if ($errors.Count -gt 0) {
        Write-Error "Config validation failed with $($errors.Count) error(s)."
        exit 1
    }

    Write-Host "Config validation passed."
    exit 0

} catch {
    Write-Error "Failed to load config: $_"
    exit 3
}
