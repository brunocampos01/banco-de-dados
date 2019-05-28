/*
STEPS:
1. Colocar a execução da procedure EXEC [dbo].[stpAlerta_Queries_Demoradas] no JOB de Traces.
2. Testar o alerta de lock sozinho
3. Executar os outros testes
*/

/*******************************************************************************************************************************
--	Create test database - Must is exclude in final test
*******************************************************************************************************************************/
USE [master]

IF EXISTS(SELECT NULL
          FROM sys.databases
          WHERE NAME = 'brunocampos01')
    DROP DATABASE [brunocampos01]

CREATE DATABASE [brunocampos01]
ALTER DATABASE [brunocampos01] SET RECOVERY SIMPLE

GO

/*******************************************************************************************************************************
--	Blocked Process
*******************************************************************************************************************************/
USE [brunocampos01]

-- Create table of test
CREATE TABLE [dbo].[test_lock]
(
    [cod] INT
)

INSERT INTO [dbo].[test_lock] ([cod])
VALUES (6)

-- Execute in other connection
BEGIN TRAN
    UPDATE [dbo].[test_lock]
    SET [cod] = [cod]

    -- COMMIT

-- Executar em outra conexao (Conexao 2) - Ira ficar bloqueada!
    BEGIN TRAN
        UPDATE [dbo].[test_lock]
        SET [cod] = [cod]

        -- COMMIT

-- Para conferir os Processos Bloqueados
        EXEC [dbo].[sp_WhoIsActive]

        -- ALERTA
-- Ap�s 2 minutos de Lock, executar a procedure abaixo para enviar o ALERTA
        EXEC [Traces].[dbo].[stpAlerta_Processo_Bloqueado]

        -- CLEAR
-- Executar o COMMIT nas Conexoes 1 e 2. Por fim, executar a procedure abaixo para enviar o CLEAR
        EXEC [Traces].[dbo].[stpAlerta_Processo_Bloqueado]

-- Exclui a tabela de Teste
        DROP TABLE [dbo].[test_lock]

GO

/*******************************************************************************************************************************
--	Full Log File
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 1
WHERE Nm_Alerta = 'Arquivo de Log Full'

EXEC [dbo].[stpAlerta_Arquivo_Log_Full]

-- CLEAR
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 85
WHERE Nm_Alerta = 'Arquivo de Log Full'

EXEC [dbo].[stpAlerta_Arquivo_Log_Full]

GO

/*******************************************************************************************************************************
--	Disc Space
*******************************************************************************************************************************/
USE [Traces]

-- ALERTA
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 1
WHERE Nm_Alerta = 'Espaco Disco'

EXEC [dbo].[stpAlerta_Espaco_Disco]

-- CLEAR
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 85
WHERE Nm_Alerta = 'Espaco Disco'

EXEC [dbo].[stpAlerta_Espaco_Disco]

GO

/*******************************************************************************************************************************
-- CPU
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 1
WHERE Nm_Alerta = 'Consumo CPU'

EXEC [dbo].[stpAlerta_Consumo_CPU]

-- CLEAR
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 85
WHERE Nm_Alerta = 'Consumo CPU'

EXEC [dbo].[stpAlerta_Consumo_CPU]

GO

/*******************************************************************************************************************************
--	MaxSize File SQL
*******************************************************************************************************************************/
USE [master]

-- ALERT
ALTER DATABASE [brunocampos01]
    MODIFY FILE ( NAME = N'brunocampos01', SIZE = 7144 KB, MAXSIZE = 10240 KB , FILEGROWTH = 10120 KB )

EXEC [Traces].[dbo].[stpAlerta_MaxSize_Arquivo_SQL]

-- CLEAR
ALTER DATABASE [brunocampos01]
    MODIFY FILE ( NAME = N'brunocampos01', FILEGROWTH = 216 KB )

EXEC [Traces].[dbo].[stpAlerta_MaxSize_Arquivo_SQL]

GO

/*******************************************************************************************************************************
--	File size MDF Tempdb
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 0
WHERE Nm_Alerta = 'Tempdb Utilizacao Arquivo MDF'

EXEC [dbo].[stpAlerta_Tempdb_Utilizacao_Arquivo_MDF]

-- CLEAR
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 70
WHERE Nm_Alerta = 'Tempdb Utilizacao Arquivo MDF'

EXEC [dbo].[stpAlerta_Tempdb_Utilizacao_Arquivo_MDF]

GO

/*******************************************************************************************************************************
--	Connection SQL Server
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 2
WHERE Nm_Alerta = 'Conexão SQL Server'

EXEC [dbo].[stpAlerta_Conexao_SQLServer]

-- CLEAR
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 2000
WHERE Nm_Alerta = 'Conexão SQL Server'

EXEC [dbo].[stpAlerta_Conexao_SQLServer]

GO

/*******************************************************************************************************************************
--	Status Database
*******************************************************************************************************************************/
USE [master]

-- ALERT
ALTER DATABASE [brunocampos01] SET OFFLINE
EXEC [Traces].[dbo].[stpAlerta_Erro_Banco_Dados]

-- CLEAR
ALTER DATABASE [brunocampos01] SET ONLINE
EXEC [Traces].[dbo].[stpAlerta_Erro_Banco_Dados]

GO

/*******************************************************************************************************************************
--	Queries Delayed
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 1
WHERE Nm_Alerta = 'Queries Delayed'

EXEC [dbo].[stpAlerta_Queries_Demoradas]

-- Volta para o valor Default
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 100
WHERE Nm_Alerta = 'Queries Delayed'

GO

/*******************************************************************************************************************************
--	Jobs Fails
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 48
WHERE Nm_Alerta = 'Job Falha'

EXEC [dbo].[stpAlerta_Job_Falha]

-- Volta para o valor Default
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 24
WHERE Nm_Alerta = 'Job Falha'

GO

/*******************************************************************************************************************************
--	SQL Server Restart
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 500000
WHERE Nm_Alerta = 'SQL Server Reiniciado'

EXEC [dbo].[stpAlerta_SQL_Server_Reiniciado]

-- Volta para o valor Default
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 20
WHERE Nm_Alerta = 'SQL Server Reiniciado'

GO

/*******************************************************************************************************************************
--	Database Created
*******************************************************************************************************************************/
USE [Traces]

-- ALERT
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 48
WHERE Nm_Alerta = 'Database Created'

EXEC [dbo].[stpAlerta_Database_Criada]

-- Volta para o valor Default
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 24
WHERE Nm_Alerta = 'Database Created'

GO

/*******************************************************************************************************************************
--	Database without Backup
*******************************************************************************************************************************/
USE [Traces]

-- ALERTA
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 0
WHERE Nm_Alerta = 'Database without Backup'

EXEC [dbo].[stpAlerta_Database_Sem_Backup]

-- Volta para o valor Default
UPDATE [dbo].[Alerta_Parametro]
SET [Vl_Parametro] = 24
WHERE Nm_Alerta = 'Database without Backup'

GO

/*******************************************************************************************************************************
--	Processes
*******************************************************************************************************************************/
USE [Traces]

EXEC [dbo].[stpEnvia_Email_Processes_Execucao]

GO

/*******************************************************************************************************************************
--	Severity Alerts
*******************************************************************************************************************************/
RAISERROR ('Test Severity Alerts', 21, 1) WITH LOG

GO

/*******************************************************************************************************************************
--	Checks the Alerts Test Result
*******************************************************************************************************************************/
USE [Traces]

SELECT *
FROM [dbo].[Alerta_Parametro]
ORDER BY [Id_Alerta_Parametro]

SELECT *
FROM [dbo].[Alerta]
ORDER BY [Dt_Alerta] DESC

DROP DATABASE [brunocampos01]
