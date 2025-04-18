
/*
    ORGANIZAR FISICAMENTE E LOGICAMENTE DADOS DE UM BD
    1 - CRIAR O BANCO COM OS ARQUIVOS PARA O SETOR DE MKT E VENDAS
    2 - CRIAR UM ARQUIVO GERAL
    3 - DEIXAR O MDF APENAS COM DICIONARIO DE DADOS - ARQ.NDF
    4 - CRIAR 2 GRUPOS DE ARQ'S (PRIMARY - MDF)
*/

CREATE DATABASE EMPRESA;
GO

USE EMPRESA;
GO

CREATE TABLE OPERACAO(
    ID int primary key identity,
    Valor int not null,
    Deb_Conta char(1) unique
);
GO

/* BULK INSERT */
BULK INSERT OPERACAO 
FROM 'D:\Matheus\Cursos\[BACKUP] Domine as Linguagens SQL e T-SQL\Arquivos SQL Server\CONTAS.txt'
WITH (
	FIRSTROW = 2,
	DATAFILETYPE = 'CHAR',
	FIELDTERMINATOR = '\t',
	ROWTERMINATOR = '\n'
)
GO

SELECT * FROM OPERACAO;
GO

SELECT COUNT(IDConta) FROM OPERACAO WHERE Deb_Conta = 'D'
GO

SELECT IDConta, Valor, Deb_Conta, 
	CHARINDEX('D',Deb_Conta) AS DEBITO, 
	CHARINDEX('C',Deb_Conta)AS CREDITO,
	CHARINDEX('C',Deb_Conta)*2-1 as MULTIPLICADOR /* C -> 1*2-1 -> 1  ..... D-> 0*2-1 -> -1*/
	
	FROM OPERACAO 
GO

SELECT SUM(Valor * (CHARINDEX('C',Deb_Conta)*2-1)) AS SALDO FROM OPERACAO GROUP BY IDConta;
GO