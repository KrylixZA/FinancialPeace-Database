param (
    $AdminUser = "sa",
    $AdminPassword = "1qaz2wsx",
    $MySqlHost = "localhost"
)

# Setup directories
$workingDir = $PSScriptRoot;

# Create tables
.\create-tables.ps1 -AdminUser $AdminUser -AdminPassword $AdminPassword -MySqlHost $MySqlHost -WorkingDir $workingDir;

# Run table presets
.\create-table-presets.ps1 -AdminUser $AdminUser -AdminPass $AdminPassword -MySqlHost $MySqlHost -WorkingDir $workingDir;

# Create stored procedures
.\create-stored-procedures.ps1 -AdminUser $AdminUser -AdminPass $AdminPassword -MySqlHost $MySqlHost -WorkingDir $workingDir;