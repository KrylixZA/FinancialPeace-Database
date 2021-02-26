FROM mariadb:latest
ARG ROOT_PASSWORD

ENV MYSQL_DATABASE Freedom
ENV MYSQL_ROOT_PASSWORD=${ROOT_PASSWORD}

WORKDIR /docker-entrypoint-initdb.d
COPY /src/Freedom/Freedom.CreateSchema.sql ./01.sql
COPY /src/Freedom/Security/Users/sa.sql ./02.sql
COPY /src/Freedom/Security/Users/FinancialPeace.sql ./03.sql
COPY /src/Freedom/Tables/tb_Budget.sql ./04.sql
COPY /src/Freedom/Tables/tb_Currency.sql ./05.sql
COPY /src/Freedom/Tables/tb_ExpenseCategory.sql ./06.sql
COPY /src/Freedom/Tables/tb_User.sql ./07.sql
COPY /src/Freedom/Tables/tb_SavingsAccount.sql ./08.sql
COPY /src/Freedom/Tables/tb_DebtAccount.sql ./09.sql
COPY /src/Freedom/Tables/tb_Expense.sql ./10.sql
COPY /src/Freedom/Tables/tb_ExpenseCategoryUserMapping.sql ./11.sql
COPY /src/Freedom/Tables/Presets/ .
COPY /src/Freedom/Stored_Procedures .
WORKDIR /