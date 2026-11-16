-- 1. Funções de data e horário
-- Essas são muito utilizadas em análises de negócio, relatórios e indicadores.
SQL Server (T-SQL) & BigQuery (GoogleSQL)	Finalidade
GETDATE() & CURRENT_DATETIME() -- Data e hora atuais sem fuso
GETUTCDATE() & CURRENT_TIMESTAMP() --  Momento atual em UTC
SYSDATETIME() & CURRENT_DATETIME() -- Data e hora atuais
YEAR(data) & EXTRACT(YEAR FROM data) -- Extrair ano
MONTH(data) & EXTRACT(MONTH FROM data) -- Extrair mês
DAY(data) & EXTRACT(DAY FROM data) -- Extrair dia
DATEADD(DAY, 7, data) & DATE_ADD(data, INTERVAL 7 DAY) -- Adicionar dias
DATEADD(MONTH, 2, data) & DATE_ADD(data, INTERVAL 2 MONTH) -- Adicionar meses
DATEDIFF(DAY, d1, d2) & DATE_DIFF(d2, d1, DAY) -- Diferença entre datas
EOMONTH(data) & LAST_DAY(data) -- Último dia do mês
DATEFROMPARTS(2026, 11, 12) & DATE(2026, 11, 12) -- Criar uma data
CAST(data AS DATE) & DATE(data) ou CAST(data AS DATE) -- Converter para DATE
FORMAT(data, 'yyyy-MM') & FORMAT_DATE('%Y-%m', data) -- Formatar data
