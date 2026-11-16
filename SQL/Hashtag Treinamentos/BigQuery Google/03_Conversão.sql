-- ============================================================
-- 12. RESUMO DE EQUIVALENCIAS
-- ============================================================



-- SQL SERVER                 BIGQUERY
-- CAST()                     CAST()
-- CONVERT()                  CAST() / PARSE_DATE() / PARSE_TIMESTAMP()
-- TRY_CAST()                 SAFE_CAST()
-- ISNULL()                   IFNULL()
-- COALESCE()                 COALESCE()
-- NULLIF()                   NULLIF()
-- ISNUMERIC()                REGEXP_CONTAINS() + SAFE_CAST()
-- SQL_VARIANT_PROPERTY()     INFORMATION_SCHEMA (sem equivalente direto)



-- Tipos comuns:
-- SQL Server       BigQuery
-- INT              INT64
-- BIGINT           INT64
-- VARCHAR          STRING
-- NVARCHAR         STRING
-- DECIMAL          NUMERIC ou BIGNUMERIC
-- FLOAT            FLOAT64
-- BIT              BOOL
-- DATE             DATE
-- DATETIME         DATETIME
-- DATETIME2        DATETIME
-- DATETIMEOFFSET   TIMESTAMP (avaliar semantica de fuso)
-- ============================================================


-- Base de Exemplo
WITH dados AS (
  SELECT '123' AS valor_texto, '45.90' AS valor_decimal,
         '2026-11-12' AS data_texto, 'abc' AS valor_invalido,
         '123.45' AS numero_texto, '1.234,56' AS numero_br
  UNION ALL
  SELECT '456', '99.99', '2026-01-05', '12X', '0', 'R$ 250,00'
  UNION ALL
  SELECT '', '', 'data_invalida', ' ', '-75.8', NULL
)
SELECT *
FROM dados;


-- ============================================================
-- 2. CAST()
-- SQL Server: CAST(valor AS INT)
-- BigQuery:   CAST(valor AS INT64)
-- Conversao de um tipo para outro.
-- ============================================================

SELECT
  valor_texto,
  CAST(valor_texto AS INT64) AS valor_convertido_int,
  valor_decimal,
  CAST(valor_decimal AS NUMERIC) AS valor_convertido_numeric
FROM UNNEST(['123', '456', '789']) AS valor_texto
CROSS JOIN UNNEST(['45.90', '99.99', '120.50']) AS valor_decimal;


-- ============================================================
-- 3. CONVERT() -> CAST()
-- No SQL Server, CONVERT tambem pode receber estilo de formatacao.
-- No BigQuery, use CAST para conversoes diretas e PARSE_* para
-- interpretar textos em formatos especificos.
-- ============================================================

SELECT
  CAST('2026-11-12' AS DATE) AS data_iso,
  PARSE_DATE('%d/%m/%Y', '12/11/2026') AS data_br,
  CAST('1234.56' AS NUMERIC) AS valor_decimal;


-- ============================================================
-- 4. TRY_CAST() -> SAFE_CAST()
-- Se a conversao falhar, SAFE_CAST retorna NULL em vez de erro.
-- ============================================================

WITH dados AS (
  SELECT '123' AS valor UNION ALL
  SELECT '45.7' UNION ALL
  SELECT 'ABC' UNION ALL
  SELECT '' UNION ALL
  SELECT NULL
)
SELECT
  valor,
  SAFE_CAST(valor AS INT64) AS conversao_int64,
  SAFE_CAST(valor AS NUMERIC) AS conversao_numeric,
  SAFE_CAST(valor AS DATE) AS conversao_date
FROM dados;


-- ============================================================
-- 5. ISNULL() -> IFNULL()
-- Substitui um valor NULL por outro valor.
-- ============================================================

WITH dados AS (
  SELECT 'Matheus' AS nome UNION ALL
  SELECT NULL UNION ALL
  SELECT 'Ana'
)
SELECT
  nome,
  IFNULL(nome, 'Nome nao informado') AS nome_tratado
FROM dados;


-- ============================================================
-- 6. COALESCE()
-- Retorna o primeiro argumento que nao seja NULL.
-- ============================================================

WITH dados AS (
  SELECT
    CAST(NULL AS STRING) AS telefone,
    CAST(NULL AS STRING) AS celular,
    '11999999999' AS contato_alternativo
  UNION ALL
  SELECT
    '1133334444', NULL, '11988887777'
)
SELECT
  telefone,
  celular,
  contato_alternativo,
  COALESCE(telefone, celular, contato_alternativo, 'Sem contato')
    AS contato_final
FROM dados;


-- ============================================================
-- 7. NULLIF()
-- Retorna NULL quando os dois argumentos sao iguais.
-- Muito util para evitar divisao por zero.
-- ============================================================

WITH vendas AS (
  SELECT 100 AS faturamento, 10 AS quantidade UNION ALL
  SELECT 250 AS faturamento, 0 AS quantidade UNION ALL
  SELECT 90 AS faturamento, 3 AS quantidade
)
SELECT
  faturamento,
  quantidade,
  SAFE_DIVIDE(faturamento, NULLIF(quantidade, 0)) AS ticket_medio
FROM vendas;


-- ============================================================
-- 8. ISNUMERIC() -> REGEXP_CONTAINS() + SAFE_CAST()
-- Nao existe equivalencia perfeita para ISNUMERIC().
-- REGEXP_CONTAINS valida o formato esperado; SAFE_CAST testa
-- se o BigQuery consegue converter para o tipo desejado.
-- Aqui, aceitamos inteiros ou decimais com ponto e sinal opcional.
-- ============================================================

WITH dados AS (
  SELECT '123' AS valor UNION ALL
  SELECT '-45' UNION ALL
  SELECT '12.50' UNION ALL
  SELECT '1,250.00' UNION ALL
  SELECT 'ABC' UNION ALL
  SELECT '' UNION ALL
  SELECT NULL
)
SELECT
  valor,
  REGEXP_CONTAINS(
    valor,
    r'^[+-]?(?:[0-9]+(?:\.[0-9]+)?|\.[0-9]+)$'
  ) AS formato_numerico_valido,
  SAFE_CAST(valor AS NUMERIC) AS valor_convertido
FROM dados;


-- ============================================================
-- 9. TRATAMENTO DE NUMEROS NO PADRAO BRASILEIRO
-- Exemplo: "1.234,56" -> 1234.56
-- Primeiro removemos separador de milhar e trocamos virgula por ponto.
-- A regra deve ser ajustada se a origem utilizar outro padrao.
-- ============================================================

WITH dados AS (
  SELECT '1.234,56' AS valor UNION ALL
  SELECT '250,00' UNION ALL
  SELECT '-75,80' UNION ALL
  SELECT 'R$ 1.999,90' UNION ALL
  SELECT 'valor invalido'
)

SELECT
  valor,
  REPLACE(
    REPLACE(
      REGEXP_REPLACE(valor, r'[^0-9,.-]', ''),
      '.',
      ''
    ),
    ',',
    '.'
  ) AS texto_normalizado,
  SAFE_CAST(
    REPLACE(
      REPLACE(
        REGEXP_REPLACE(valor, r'[^0-9,.-]', ''),
        '.',
        ''
      ),
      ',',
      '.'
    ) AS NUMERIC
  ) AS valor_numeric
FROM dados;


-- ============================================================
-- 10. SQL_VARIANT_PROPERTY() -> SEM EQUIVALENTE DIRETO
-- No BigQuery, consulte INFORMATION_SCHEMA para descobrir
-- tipos e propriedades das colunas de tabelas existentes.
--
-- Substitua PROJECT_ID e DATASET_ID pelos seus identificadores.
-- Este exemplo e uma consulta de referencia: execute separadamente
-- e remova os marcadores < > antes de executar.
-- ============================================================

-- SELECT
--   column_name,
--   data_type,
--   is_nullable
-- FROM `PROJECT_ID.DATASET_ID.INFORMATION_SCHEMA.COLUMNS`
-- WHERE table_name = 'NOME_DA_TABELA'
-- ORDER BY ordinal_position;


-- ============================================================
-- 11. OUTRAS CONVERSOES UTEIS NO BIGQUERY
-- ============================================================

SELECT
  -- Texto para inteiro
  SAFE_CAST('100' AS INT64) AS texto_para_int64,

  -- Texto para decimal
  SAFE_CAST('123.45' AS NUMERIC) AS texto_para_numeric,

  -- Inteiro para texto
  CAST(2026 AS STRING) AS inteiro_para_string,

  -- Data para texto
  FORMAT_DATE('%d/%m/%Y', DATE '2026-11-12') AS date_para_string,

  -- Texto para data em formato brasileiro
  PARSE_DATE('%d/%m/%Y', '12/11/2026') AS string_para_date,

  -- Texto para datetime
  PARSE_DATETIME(
    '%d/%m/%Y %H:%M:%S',
    '12/11/2026 14:30:45'
  ) AS string_para_datetime,

  -- Texto para timestamp
  PARSE_TIMESTAMP(
    '%Y-%m-%d %H:%M:%S%Ez',
    '2026-11-12 17:30:45+00'
  ) AS string_para_timestamp,

  -- Conversao segura para BOOL
  SAFE_CAST('true' AS BOOL) AS texto_para_bool,

  -- Conversao segura para FLOAT64
  SAFE_CAST('12.75' AS FLOAT64) AS texto_para_float64;