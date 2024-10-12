DECLARE @TableName NVARCHAR(128);
SET @TableName = '@{item().name}';

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @TableName)
BEGIN
    EXEC('CREATE TABLE ' + @TableName + ' (
        Type CHAR(1),
        Customer_Name VARCHAR(255) NOT NULL,
        Customer_Id VARCHAR(18) PRIMARY KEY NOT NULL,
        Open_Date DATE NOT NULL,
        Last_Consulted_Date DATE,
        Vaccination_Id CHAR(5),
        Dr_Name CHAR(255),
        State CHAR(5),
        Country CHAR(5),
        DOB DATE,
        Is_Active CHAR(1),
        age INT,
        days_since_last_consulted INT,
    )');
END;
