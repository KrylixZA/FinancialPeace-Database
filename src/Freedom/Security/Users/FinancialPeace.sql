CREATE USER IF NOT EXISTS 'FinancialPeace'@'%' IDENTIFIED BY '1qaz2wsx';

GRANT DELETE ON Freedom.* TO 'FinancialPeace'@'%';
GRANT INSERT ON Freedom.* TO 'FinancialPeace'@'%';
GRANT SELECT ON Freedom.* TO 'FinancialPeace'@'%';
GRANT UPDATE ON Freedom.* TO 'FinancialPeace'@'%';

FLUSH PRIVILEGES;