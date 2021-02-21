function Execute-SqlScript {
    param (
        [string]$ConnectionString,
        [string]$SqlScriptPath
    )

    $command = New-Object MySql.Data.MySqlClient.MySqlCommand;
    $conn = New-Object MySql.Data.MySqlClient.MySqlConnection($ConnectionString);

    $sql = [io.file]::ReadAllText($SqlScriptPath);
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
        $command.Connection.Close();
        Write-Host "Closing Connection";
    }
}