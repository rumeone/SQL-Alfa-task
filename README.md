## Задание

_Необходимо вывести все покупки клиента (сумма, дата, наименование) в
обратном хронологическом порядке, пока его кредит больше нуля. 
В последнюю строку необходимо вывести остаток кредита._
 
**Тестовые данные:**
``DECLARE @Table1 table (Id_Client int, Value money) -- клиенты
-- Id_Client – идентификатор клиента, Value – размер кредита

INSERT INTO @Table1 (Id_Client, Value)
SELECT 1, 24
UNION SELECT 2, 13
UNION SELECT 3, 2
UNION SELECT 4, 5

DECLARE @Table2 table (Id_Client int, DocDate datetime, Amount money, Caption varchar(6)) -- покупки
-- Id_Client – идентификатор клиента, Amount – сумма покупки,
-- DocDate – дата покупки, Caption - наименование покупки

INSERT INTO @Table2 (Id_Client, Amount, DocDate, Caption)
SELECT 1, 5, '20051024', 'qh'
UNION SELECT 1, 9, '20051019', 'wj'
UNION SELECT 1, 3, '20051022', 'ek'
UNION SELECT 1, 8, '20051004', 'rl'
UNION SELECT 1, 6, '20051018', 'tz'
UNION SELECT 1, 5, '20050929', 'yx'
UNION SELECT 2, 11, '20051023', 'uc'
UNION SELECT 2, 6, '20051021', 'iv'
UNION SELECT 2, 45, '20051018', 'ob'
UNION SELECT 3, 4, '20051030', 'pn'
UNION SELECT 3, 2, '20051028', 'am'
UNION SELECT 4, 4, '20051021', 'sq'
UNION SELECT 4, 6, '20051023', 'dw'
UNION SELECT 4, 8, '20051023', 'fe'
UNION SELECT 4, 9, '20051023', 'gr'``

**Результат:**
``1 2005-10-24 00:00:00 5.00   qh
1 2005-10-22 00:00:00 3.00   ek
1 2005-10-19 00:00:00 9.00   wj
1 2005-10-18 00:00:00 6.00   tz
1 2005-10-04 00:00:00 1.00   rl
2 2005-10-23 00:00:00 11.00 uc
2 2005-10-21 00:00:00 2.00   iv
3 2005-10-30 00:00:00 2.00   pn
4 2005-10-23 00:00:00 5.00   gr``
