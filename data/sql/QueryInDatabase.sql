SELECT  COLUMN_NAME AS 'ColumnName' ,TABLE_NAME AS  'TableName'
FROM        INFORMATION_SCHEMA.COLUMNS
WHERE       COLUMN_NAME LIKE '%InstrPermId%'
ORDER BY    TableName
            ,ColumnName;