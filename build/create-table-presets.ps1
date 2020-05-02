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
$tableScripts = (Get-ChildItem -Path $presetsDir -Include ("*.PRESETS.sql") -Recurse).FullName;
Write-Host $tableScripts;
foreach ($tableScript in $tableScripts) {
    $command = New-Object MySql.Data.MySqlClient.MySqlCommand;
    $conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connectionString);

    $sql = [io.file]::ReadAllText($tableScript);
    $command.CommandText = $sql;
    $command.Connection = $conn;
    $command.Connection.Open();
    try {
        Write-Host "Executing query $sql";
        $command.executeNonQuery();
    }
    catch {
        Write-Error ("Error occured while ExecuteNonQuery");
    }
    finally {
        $connection.Close();
        Write-Host "Closing Connection";
    }
}