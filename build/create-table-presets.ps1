Import-Module .\mysql-helper.ps1

param (
    $AdminUser = "sa",
    $AdminPassword = "1qaz2wsx",
    $MySqlHost = "localhost",
    $MySqlDb = "Freedom",
    $WorkingDir = $PSScriptRoot
)

# Declare directories
$freedomDir = Join-Path $WorkingDir "Freedom";
$tablesDir = Join-Path $freedomDir "Tables";
$presetsDir = Join-Path $tablesDir "Tables";

# Create SQL connection string
$connectionString = "server=$MySqlHost;port=3306;uid=$AdminUser;pwd=$AdminPassword;database=$MySqlDb";
Add-Type -Path "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\MySQL.Data.dll";
Add-Type -Path "$(Split-Path -Parent $MyInvocation.MyCommand.Path)\Renci.SshNet.dll";

# Get and execute table create scripts
$sqlScripts = @();
$sqlScripts = (Get-ChildItem -Path $presetsDir -Include ("*.PRESETS.sql") -Recurse).FullName;
Write-Host $sqlScripts;
foreach ($sqlScript in $sqlScripts) {
    Execute-SqlScript -ConnectionString $connectionString -SqlScriptPath $sqlScript;
}