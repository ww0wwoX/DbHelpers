GRANT INSERT ON SCHEMA :: tests TO guest;  
USE RPojDb
GO
----------------------------------------------------------------------

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'tests' 
                 AND  TABLE_NAME = 'Topics'))
BEGIN
    PRINT N'[dbo].[Topics]'
END
ELSE

BEGIN
	CREATE TABLE [tests].[Topics](
		[Id] INT PRIMARY KEY IDENTITY(1, 1),
		[Name] NVARCHAR(80) NOT NULL DEFAULT N'',
		[Description] NVARCHAR(240) NOT NULL DEFAULT N'',
		[ParantTopic] INT NULL FOREIGN KEY REFERENCES [dbo].[Topics]([Id])
	)
END


