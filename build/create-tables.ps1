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

# Create SQL connection string
$connectionString = "server=$MySqlHost;port=3306;uid=$AdminUser;pwd=$AdminPassword;database=$MySqlDb";
Add-Type -Path "$WorkingDir\MySql.Data.dll";
Add-Type -Path "$WorkingDir\Renci.SshNet.dll";

# Execute the scripts
$sqlScripts = @();
$sqlScripts +=  Join-Path $tablesDir "tb_Budget.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_Currency.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_ExpenseCategory.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_SavingsAccount.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_User.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_DebtAccount.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_Expense.sql"
# $sqlScripts +=  Join-Path $tablesDir "tb_ExpenseCategoryUserMapping.sql"
Write-Host $sqlScripts;
Import-Module .\mysql-helper.ps1
foreach ($sqlScript in $sqlScripts) {
    Execute-SqlScript -ConnectionString $connectionString -SqlScriptPath $sqlScript;
}