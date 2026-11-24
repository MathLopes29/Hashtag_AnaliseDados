-- Comparativo SQL Server (T-SQL) x BigQuery (GoogleSQL)
-- BASE DE EXEMPLO
WITH dados AS (
    SELECT
        DATE '2026-11-12' AS data_venda,
        DATETIME '2026-11-12 14:30:45' AS data_hora,
        TIMESTAMP '2026-11-12 17:30:45+00' AS timestamp_venda,
        DATE '2025-06-01' AS data_admissao,
        DATE '2026-11-30' AS data_referencia
)

-- FUNÇÕES DE DATA E HORÁRIO
SELECT

    -- 1. CURRENT_DATE
    -- SQL Server: CAST(GETDATE() AS DATE)
    -- BigQuery: CURRENT_DATE()
    CURRENT_DATE('America/Sao_Paulo') AS data_atual,

    -- 2. CURRENT_DATETIME
    -- SQL Server: GETDATE() (aproximação)
    -- BigQuery: CURRENT_DATETIME()
    CURRENT_DATETIME('America/Sao_Paulo') AS data_hora_atual,

    -- 3. CURRENT_TIMESTAMP
    -- SQL Server: GETUTCDATE() (aproximação)
    -- BigQuery: CURRENT_TIMESTAMP()
    CURRENT_TIMESTAMP() AS timestamp_atual_utc,

    -- 4. EXTRACT YEAR
    -- SQL Server: YEAR(data_venda)
    -- BigQuery: EXTRACT(YEAR FROM data_venda)
    EXTRACT(YEAR FROM data_venda) AS ano,

    -- 5. EXTRACT MONTH
    -- SQL Server: MONTH(data_venda)
    -- BigQuery: EXTRACT(MONTH FROM data_venda)
    EXTRACT(MONTH FROM data_venda) AS mes,

    -- 6. EXTRACT DAY
    -- SQL Server: DAY(data_venda)
    -- BigQuery: EXTRACT(DAY FROM data_venda)
    EXTRACT(DAY FROM data_venda) AS dia,

    -- 7. EXTRACT DAYOFWEEK
    -- SQL Server: DATEPART(WEEKDAY, data_venda)
    -- BigQuery: EXTRACT(DAYOFWEEK FROM data_venda)
    -- BigQuery: domingo = 1 e sábado = 7
    EXTRACT(DAYOFWEEK FROM data_venda) AS dia_semana,

    -- 8. EXTRACT HOUR
    -- SQL Server: DATEPART(HOUR, data_hora)
    -- BigQuery: EXTRACT(HOUR FROM data_hora)
    EXTRACT(HOUR FROM data_hora) AS hora,

    -- 9. EXTRACT MINUTE
    -- SQL Server: DATEPART(MINUTE, data_hora)
    -- BigQuery: EXTRACT(MINUTE FROM data_hora)
    EXTRACT(MINUTE FROM data_hora) AS minuto,

    -- 10. EXTRACT SECOND
    -- SQL Server: DATEPART(SECOND, data_hora)
    -- BigQuery: EXTRACT(SECOND FROM data_hora)
    EXTRACT(SECOND FROM data_hora) AS segundo,

    -- 11. DATE_ADD DAY
    -- SQL Server: DATEADD(DAY, 7, data_venda)
    -- BigQuery: DATE_ADD(data_venda, INTERVAL 7 DAY)
    DATE_ADD(data_venda, INTERVAL 7 DAY) AS adicionar_7_dias,

    -- 12. DATE_ADD MONTH
    -- SQL Server: DATEADD(MONTH, 2, data_venda)
    -- BigQuery: DATE_ADD(data_venda, INTERVAL 2 MONTH)
    DATE_ADD(data_venda, INTERVAL 2 MONTH) AS adicionar_2_meses,

    -- 13. DATE_ADD YEAR
    -- SQL Server: DATEADD(YEAR, 1, data_venda)
    -- BigQuery: DATE_ADD(data_venda, INTERVAL 1 YEAR)
    DATE_ADD(data_venda, INTERVAL 1 YEAR) AS adicionar_1_ano,

    -- 14. DATE_SUB
    -- SQL Server: DATEADD(DAY, -10, data_venda)
    -- BigQuery: DATE_SUB(data_venda, INTERVAL 10 DAY)
    DATE_SUB(data_venda, INTERVAL 10 DAY) AS subtrair_10_dias,

    -- 15. DATE_DIFF DAY
    -- SQL Server: DATEDIFF(DAY, data_admissao, data_referencia)
    -- BigQuery: DATE_DIFF(data_referencia, data_admissao, DAY)
    DATE_DIFF(data_referencia, data_admissao, DAY) AS diferenca_dias,

    -- 16. DATE_DIFF MONTH
    -- SQL Server: DATEDIFF(MONTH, data_admissao, data_referencia)
    -- BigQuery: DATE_DIFF(data_referencia, data_admissao, MONTH)
    DATE_DIFF(data_referencia, data_admissao, MONTH) AS diferenca_meses,

    -- 17. DATE_DIFF YEAR
    -- SQL Server: DATEDIFF(YEAR, data_admissao, data_referencia)
    -- BigQuery: DATE_DIFF(data_referencia, data_admissao, YEAR)
    DATE_DIFF(data_referencia, data_admissao, YEAR) AS diferenca_anos,

    -- 18. LAST_DAY
    -- SQL Server: EOMONTH(data_venda)
    -- BigQuery: LAST_DAY(data_venda)
    LAST_DAY(data_venda) AS ultimo_dia_mes,

    -- 19. DATE
    -- SQL Server: DATEFROMPARTS(2026, 11, 12)
    -- BigQuery: DATE(2026, 11, 12)
    DATE(2026, 11, 12) AS criar_data,

    -- 20. CAST
    -- SQL Server: CAST(data_hora AS DATE)
    -- BigQuery: CAST(data_hora AS DATE)
    CAST(data_hora AS DATE) AS converter_para_date,

    -- 21. FORMAT_DATE
    -- SQL Server: FORMAT(data_venda, 'yyyy-MM')
    -- BigQuery: FORMAT_DATE('%Y-%m', data_venda)
    FORMAT_DATE('%Y-%m', data_venda) AS formatar_ano_mes,

    -- 22. FORMAT_DATETIME
    -- SQL Server: FORMAT(data_hora, 'dd/MM/yyyy HH:mm:ss')
    -- BigQuery: FORMAT_DATETIME('%d/%m/%Y %H:%M:%S', data_hora)
    FORMAT_DATETIME(
        '%d/%m/%Y %H:%M:%S',
        data_hora
    ) AS formatar_data_hora,

    -- 23. FORMAT_TIMESTAMP
    -- Formatar TIMESTAMP em um fuso específico
    FORMAT_TIMESTAMP(
        '%d/%m/%Y %H:%M:%S',
        timestamp_venda,
        'America/Sao_Paulo'
    ) AS formatar_timestamp,

    -- 24. DATE_TRUNC
    -- SQL Server: DATEADD(MONTH, DATEDIFF(MONTH, 0, data_venda), 0)
    -- BigQuery: DATE_TRUNC(data_venda, MONTH)
    DATE_TRUNC(data_venda, MONTH) AS primeiro_dia_mes,

    -- 25. DATE_TRUNC YEAR
    -- BigQuery: DATE_TRUNC(data_venda, YEAR)
    DATE_TRUNC(data_venda, YEAR) AS primeiro_dia_ano,

    -- 26. DATE_TRUNC WEEK
    -- BigQuery: DATE_TRUNC(data_venda, WEEK)
    DATE_TRUNC(data_venda, WEEK) AS primeiro_dia_semana,

    -- 27. PARSE_DATE
    -- SQL Server: CONVERT(DATE, '12/11/2026', 103)
    -- BigQuery: PARSE_DATE('%d/%m/%Y', '12/11/2026')
    PARSE_DATE('%d/%m/%Y', '12/11/2026') AS converter_texto_data,

    -- 28. PARSE_DATETIME
    -- Converter texto para DATETIME
    PARSE_DATETIME(
        '%d/%m/%Y %H:%M:%S',
        '12/11/2026 14:30:45'
    ) AS converter_texto_datetime,

    -- 29. DATE_FROM_UNIX_DATE
    -- Converter quantidade de dias desde 1970-01-01
    DATE_FROM_UNIX_DATE(20769) AS converter_unix_date,

    -- 30. UNIX_DATE
    -- Converter DATE em quantidade de dias desde 1970-01-01
    UNIX_DATE(data_venda) AS dias_desde_1970,

    -- 31. GENERATE_DATE_ARRAY
    -- Gerar sequência de datas
    GENERATE_DATE_ARRAY(
        DATE '2026-11-01',
        DATE '2026-11-07',
        INTERVAL 1 DAY
    ) AS gerar_datas,

    -- 32. DATE_SUB MONTH
    -- Retornar data de 1 mês atrás
    DATE_SUB(data_venda, INTERVAL 1 MONTH) AS mes_anterior,

    -- 33. EXTRACT QUARTER
    -- SQL Server: DATEPART(QUARTER, data_venda)
    -- BigQuery: EXTRACT(QUARTER FROM data_venda)
    EXTRACT(QUARTER FROM data_venda) AS trimestre,

    -- 34. EXTRACT WEEK
    -- SQL Server: DATEPART(WEEK, data_venda)
    -- BigQuery: EXTRACT(WEEK FROM data_venda)
    EXTRACT(WEEK FROM data_venda) AS semana_ano,

    -- 35. EXTRACT ISOWEEK
    -- SQL Server: DATEPART(ISO_WEEK, data_venda)
    -- BigQuery: EXTRACT(ISOWEEK FROM data_venda)
    EXTRACT(ISOWEEK FROM data_venda) AS semana_iso,

    -- 36. EXTRACT ISOYEAR
    -- BigQuery: EXTRACT(ISOYEAR FROM data_venda)
    EXTRACT(ISOYEAR FROM data_venda) AS ano_iso,

    -- 37. TIME
    -- SQL Server: CAST(data_hora AS TIME)
    -- BigQuery: TIME(data_hora)
    TIME(data_hora) AS extrair_horario,

    -- 38. DATETIME
    -- Criar DATETIME a partir de componentes
    DATETIME(2026, 11, 12, 14, 30, 45) AS criar_datetime,

    -- 39. TIMESTAMP_SECONDS
    -- Converter Unix timestamp em TIMESTAMP
    TIMESTAMP_SECONDS(1794504645) AS converter_timestamp,

    -- 40. TIMESTAMP_ADD
    -- Adicionar intervalo a um TIMESTAMP
    TIMESTAMP_ADD(
        timestamp_venda,
        INTERVAL 3 HOUR
    ) AS adicionar_3_horas,

    -- 41. TIMESTAMP_SUB
    -- Subtrair intervalo de um TIMESTAMP
    TIMESTAMP_SUB(
        timestamp_venda,
        INTERVAL 30 MINUTE
    ) AS subtrair_30_minutos,

    -- 42. TIMESTAMP_DIFF
    -- Diferença entre TIMESTAMPs
    TIMESTAMP_DIFF(
        CURRENT_TIMESTAMP(),
        timestamp_venda,
        HOUR
    ) AS diferenca_horas,

    -- 43. TIMESTAMP_TRUNC
    -- Truncar TIMESTAMP para o início do mês
    TIMESTAMP_TRUNC(
        timestamp_venda,
        MONTH,
        'America/Sao_Paulo'
    ) AS inicio_mes_timestamp,

    -- 44. TIMESTAMP
    -- Converter DATETIME para TIMESTAMP usando fuso horário
    TIMESTAMP(
        data_hora,
        'America/Sao_Paulo'
    ) AS converter_para_timestamp

FROM dados;



---------------------------------------------------------------------------------------------------------------------------------------------

-- Funções de data e horário
SELECT
    data_admissao,
    CURRENT_DATE('America/Sao_Paulo') AS hoje,

    DATE_DIFF(
        CURRENT_DATE('America/Sao_Paulo'),
        data_admissao,
        YEAR
    ) AS anos_de_empresa

FROM UNNEST([
    DATE '2020-05-10',
    DATE '2022-08-15',
    DATE '2025-06-01'
]) AS data_admissao;



-- Criar calendário de datas
WITH calendario AS (
    SELECT data
    FROM UNNEST(
        GENERATE_DATE_ARRAY(
            DATE '2026-01-01',
            DATE '2026-12-31',
            INTERVAL 1 DAY
        )
    ) AS data
)

SELECT
    data,
    EXTRACT(YEAR FROM data) AS ano,
    EXTRACT(MONTH FROM data) AS mes,
    FORMAT_DATE('%B', data) AS nome_mes,
    EXTRACT(QUARTER FROM data) AS trimestre,
    EXTRACT(DAYOFWEEK FROM data) AS dia_semana,
    LAST_DAY(data) AS ultimo_dia_mes,
    DATE_TRUNC(data, MONTH) AS inicio_mes
FROM calendario
ORDER BY data;


-- Comparar faturamento mensal com mês anterior
WITH vendas AS (
    SELECT DATE '2026-01-10' AS data_venda, 10000 AS valor
    UNION ALL
    SELECT DATE '2026-02-10', 15000
    UNION ALL
    SELECT DATE '2026-03-10', 18000
    UNION ALL
    SELECT DATE '2026-04-10', 12000
),

faturamento AS (
    SELECT
        DATE_TRUNC(data_venda, MONTH) AS mes,
        SUM(valor) AS faturamento
    FROM vendas
    GROUP BY mes
)

SELECT
    mes,
    faturamento,

    LAG(faturamento) OVER (
        ORDER BY mes
    ) AS faturamento_mes_anterior,

    ROUND(
        SAFE_DIVIDE(
            faturamento - LAG(faturamento) OVER (ORDER BY mes),
            LAG(faturamento) OVER (ORDER BY mes)
        ) * 100,
        2
    ) AS variacao_percentual


FROM faturamento
ORDER BY mes;