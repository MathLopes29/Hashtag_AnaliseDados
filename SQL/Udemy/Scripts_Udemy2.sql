/* EXERCÍCIO */
CREATE DATABASE FB;
GO

USE FB;
GO


/* TABELA ALUNO */
CREATE TABLE ALUNO(
 IDAluno INT PRIMARY KEY IDENTITY,
 Nome VARCHAR(50) NOT NULL,
 Sexo CHAR(1) NOT NULL,
 Nascimento DATE NOT NULL,
 Email VARCHAR(30) UNIQUE 
);
GO

DROP TABLE ALUNO;
GO

/* CONSTRAINT */
ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN ('M','F'));
GO

/* TABELA ENDEREÇO */
CREATE TABLE ENDERECO(
 ID_Ender INT PRIMARY KEY IDENTITY (100,10),
 Bairro VARCHAR(50),
 UF CHAR(2) NOT NULL

 CHECK(UF IN('SP', 'MG', 'RJ')),
 ID_Aluno INT UNIQUE
); 
GO

DROP TABLE ENDERECO;
GO

/* TABELA TELEFONE */
CREATE TABLE TELEFONE(
 IDTELEFONE INT PRIMARY KEY IDENTITY,
 Tipo CHAR(3) NOT NULL,
 Numero VARCHAR(10) NOT NULL,
 ID_ALUNO INT,
 CHECK(Tipo IN ('RES','COM','CEL'))
);
GO

/* CRIANDO FK */
ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY (ID_Aluno) REFERENCES ALUNO(IDAluno);
GO

ALTER TABLE TELEFONE ADD CONSTRAINT FK_TELEFONE_ALUNO
FOREIGN KEY(ID_ALUNO) REFERENCES ALUNO(IDAluno);
GO

/* COMANDOS DE DESCRIÇÃO */
/* PROCEDURES - JÁ CRIADAS E ARMAZENADAS NO SISTEMA */

SP_COLUMNS ALUNO; /* - STORAGE PROCEDURE - DESC */
GO

SP_COLUMNS ENDERECO;
GO

SP_COLUMNS TELEFONE;
GO

SP_HELP ALUNO;
GO

/* INSERTS */
INSERT INTO ALUNO  VALUES 
('THIAGO','M','2002/11/30','thi1236@gmail.com'),
('ANA','F','2005/03/10','anna7896@outlook.com'),
('MARCOS','M','1999/07/01','mark9874@yahoo.com');
GO

INSERT INTO ALUNO VALUES ('BEATRIZ','M','1982/11/25','beat7504@yahoo.com');

INSERT INTO ENDERECO  VALUES 
('Jd. Iracema','MG','1'),
('Jd. Paulista','SP','2'),
('Jd. Maraca','RJ','3');
GO

INSERT INTO ENDERECO VALUES ('Jd. Jandira','SP','4');

INSERT INTO TELEFONE  VALUES 
('CEL','15947830',1),
('RES','26904331',2),
('COM','47221690',3);
GO

/* DML */
SELECT * FROM ALUNO;
GO

SELECT * FROM ENDERECO;
GO

SELECT * FROM TELEFONE;
GO

SELECT ENDERECO.ID_Ender, ALUNO.Nome, ALUNO.Sexo, ENDERECO.Bairro, ENDERECO.UF FROM ALUNO INNER JOIN ENDERECO ON ID_Aluno = IDALUNO;
GO

SELECT Nome, Tipo, Numero, Bairro, UF FROM ALUNO INNER JOIN TELEFONE ON ALUNO.IDALUNO = TELEFONE.ID_Aluno INNER JOIN ENDERECO ON ENDERECO.ID_Aluno = ALUNO.IDALUNO;
GO

SELECT Nome, Tipo, Numero, Bairro, UF FROM ALUNO LEFT JOIN TELEFONE ON ALUNO.IDALUNO = TELEFONE.ID_Aluno LEFT JOIN ENDERECO ON ENDERECO.ID_Aluno = ALUNO.IDALUNO;
GO

SELECT ALUNO.Nome, 
	ISNULL(TELEFONE.Tipo, 'SEM')AS "TIPO",
	ISNULL(TELEFONE.Numero, 'SEM NUMERO')AS "TELEFONE",
	ENDERECO.Bairro,
	ENDERECO.UF
FROM ALUNO LEFT JOIN TELEFONE ON ALUNO.IDALUNO = TELEFONE.ID_Aluno LEFT JOIN ENDERECO ON ENDERECO.ID_Aluno = ALUNO.IDALUNO;
GO

/* PEGAR DATA */
SELECT GETDATE()
GO

/* TRABALHANDO COM DATAS - DATE */
/* DATEDIFF ();  ... DIFERENÇA DE DATA*/

SELECT NOME, GETDATE() AS HORA FROM ALUNO;
GO

SELECT NOME, DATEDIFF (YEAR, NASCIMENTO, GETDATE()) AS IDADE FROM ALUNO;
GO

SELECT NOME, (DATEDIFF (DAY, NASCIMENTO, GETDATE())/365) AS IDADE FROM ALUNO;
GO

/* DATENAME(); ... BUSCA O ANO, MES, SEMANA, ETC */
SELECT NOME, (DATENAME (YEAR, NASCIMENTO)) AS ANO_NASCIMENTO FROM ALUNO;
GO

SELECT NOME, (DATENAME (MONTH, NASCIMENTO)) AS MES_NASCIMENTO FROM ALUNO;
GO

SELECT NOME, (DATENAME (WEEKDAY, NASCIMENTO)) AS DIA_NASCIMENTO FROM ALUNO;
GO

SELECT NOME, (DATENAME (WEEK, NASCIMENTO)) AS SEMANA_NASCIMENTO FROM ALUNO;
GO

/* DATEPART(); ... RETORNA UM VALOR INTEIRO APENAS */

SELECT NOME, DATEPART(MONTH, NASCIMENTO) FROM ALUNO;
GO

SELECT NOME, DATEPART(WEEK, NASCIMENTO) FROM ALUNO;
GO

/* DATEADD () ... RETORNA UMA DATA SOMADA COM A OUTRA */
SELECT DATEADD(DAY, 365, GETDATE()) AS SOMA;
GO

SELECT DATEADD(DAY, 365, NASCIMENTO) AS MAIS_1_ANO_NASC FROM ALUNO;
GO

SELECT DATEADD(YEAR,10,GETDATE()) AS DEZ_ANOS;
GO

/* EXEMPLO */
SELECT NOME, 
	DATEPART(YEAR, NASCIMENTO) AS ANO, 
	DATENAME(DAY, NASCIMENTO) AS DIA, 
	DATEDIFF (YEAR, NASCIMENTO, GETDATE()) AS IDADE,
	DATEADD (DAY, 365, GETDATE()) AS PROX_ANO
	
	FROM ALUNO;
GO

/* CONVERSÃO DE DADOS ... NUM -> STRING*/

SELECT 1+1;
GO

SELECT 'MAT'+'HEUS'
GO

SELECT CAST('1' AS INT) + CAST('1' AS INT);
GO

SELECT CAST('1º' AS VARCHAR) + CAST(' SEMESTRE' AS VARCHAR);
GO

/* CONVERSÃO E CONTATENAÇÃO */
SELECT NOME, NASCIMENTO FROM ALUNO
GO

SELECT NOME, 
	CAST(DAY(NASCIMENTO) AS VARCHAR)+ '/' + 
	CAST(MONTH(NASCIMENTO) AS VARCHAR)+ '/' +
	CAST(YEAR(NASCIMENTO) AS VARCHAR) AS NASCIMENTO
	
	FROM ALUNO;
GO

/* CHARINDEX - RETORNA UM INTEIRO - SERVE PARA A BUSCA DE CHARS OU VARCHAR INTEIROS */
SELECT NOME, CHARINDEX('A', NOME) AS INDICE FROM ALUNO;
GO

SELECT NOME, CHARINDEX('A', NOME, 2) AS INDICE FROM ALUNO;
GO