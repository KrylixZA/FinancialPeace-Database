#!/bin/sh

echo ${MYSQL_ROOT_PASSWORD}

mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Security/Users/sa.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Security/Users/FinancialPeace.sql

mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_Budget.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_Currency.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_ExpenseCategory.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_User.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_SavingsAccount.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_DebtAccount.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_Expense.sql
mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < /src/Freedom/Tables/tb_ExpenseCategoryUserMapping.sql

for file in /src/Freedom/Stored_Procedures/*
do
    mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < $file;
done

for file in /src/Freedom/Tables/Presets/*
do
    mysql -u root -p${MYSQL_ROOT_PASSWORD} Freedom < $file;
done