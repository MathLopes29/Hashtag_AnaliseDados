-- BASE DE EXEMPLO
WITH dados AS (
    SELECT
        '  Matheus Lopes  ' AS nome,
        'matheus.lopes@empresa.com' AS email,
        'Analista de Dados' AS cargo,
        '12345-678' AS cep,
        'São Paulo' AS cidade,
        'ABCabc123' AS codigo,
        'SQL Server e BigQuery' AS descricao
)

-- 2. FUNÇÕES DE TEXTO
SELECT

    -- 1. LENGTH
    -- SQL Server: LEN(nome)
    -- BigQuery: LENGTH(nome)
    LENGTH(nome) AS comprimento_texto,

    -- 2. UPPER
    -- SQL Server: UPPER(nome)
    -- BigQuery: UPPER(nome)
    UPPER(nome) AS texto_maiusculo,

    -- 3. LOWER
    -- SQL Server: LOWER(nome)
    -- BigQuery: LOWER(nome)
    LOWER(nome) AS texto_minusculo,

    -- 4. LTRIM
    -- SQL Server: LTRIM(nome)
    -- BigQuery: LTRIM(nome)
    LTRIM(nome) AS remover_espacos_esquerda,

    -- 5. RTRIM
    -- SQL Server: RTRIM(nome)
    -- BigQuery: RTRIM(nome)
    RTRIM(nome) AS remover_espacos_direita,

    -- 6. TRIM
    -- SQL Server: TRIM(nome)
    -- BigQuery: TRIM(nome)
    TRIM(nome) AS remover_espacos,

    -- 7. SUBSTRING / SUBSTR
    -- SQL Server: SUBSTRING(nome, 1, 7)
    -- BigQuery: SUBSTR(nome, 1, 7)
    SUBSTR(nome, 1, 7) AS extrair_texto,

    -- 8. LEFT
    -- SQL Server: LEFT(nome, 7)
    -- BigQuery: LEFT(nome, 7)
    LEFT(TRIM(nome), 7) AS primeiros_caracteres,

    -- 9. RIGHT
    -- SQL Server: RIGHT(email, 12)
    -- BigQuery: RIGHT(email, 12)
    RIGHT(email, 12) AS ultimos_caracteres,

    -- 10. CHARINDEX / STRPOS
    -- SQL Server: CHARINDEX('@', email)
    -- BigQuery: STRPOS(email, '@')
    STRPOS(email, '@') AS posicao_caractere,

    -- 11. REPLACE
    -- SQL Server: REPLACE(cep, '-', '')
    -- BigQuery: REPLACE(cep, '-', '')
    REPLACE(cep, '-', '') AS cep_sem_hifen,

    -- 12. CONCAT
    -- SQL Server: CONCAT(nome, ' - ', cargo)
    -- BigQuery: CONCAT(nome, ' - ', cargo)
    CONCAT(TRIM(nome), ' - ', cargo) AS concatenacao,

    -- 13. STRING_AGG
    -- SQL Server: STRING_AGG()
    -- BigQuery: STRING_AGG()
    -- Exemplo demonstrativo em subconsulta
    ( SELECT STRING_AGG(valor, ', ')
     FROM UNNEST(['SQL', 'Python', 'BigQuery']) AS valor
    ) AS agrupar_textos,

    -- 14. REVERSE
    -- SQL Server: REVERSE(codigo)
    -- BigQuery: REVERSE(codigo)
    REVERSE(codigo) AS texto_invertido,

    -- 15. REPLICATE / REPEAT
    -- SQL Server: REPLICATE('*', 5)
    -- BigQuery: REPEAT('*', 5)
    REPEAT('*', 5) AS repetir_caractere,

    -- 16. PATINDEX / REGEXP_CONTAINS
    -- SQL Server: PATINDEX('%[0-9]%', codigo)
    -- BigQuery: REGEXP_CONTAINS(codigo, r'[0-9]')
    REGEXP_CONTAINS(codigo, r'[0-9]') AS possui_numeros,

    -- 17. REGEXP_INSTR
    -- Localiza a posição de um padrão
    REGEXP_INSTR(codigo, r'[0-9]') AS posicao_primeiro_numero,

    -- 18. STUFF / REGEXP_REPLACE
    -- Exemplo: remover todos os números
    REGEXP_REPLACE(codigo, r'[0-9]', '') AS remover_numeros,

    -- 19. ASCII
    -- SQL Server: ASCII('A')
    -- BigQuery: ASCII('A')
    ASCII('A') AS codigo_ascii,

    -- 20. CHAR / CHR
    -- SQL Server: CHAR(65)
    -- BigQuery: CHR(65)
    CHR(65) AS caractere_codigo,

    -- 21. UNICODE / TO_CODE_POINTS
    -- BigQuery retorna um ARRAY de códigos Unicode
    TO_CODE_POINTS('ABC') AS codigos_unicode,

    -- 22. FORMAT
    -- Formatação de valores
    FORMAT('Cliente: %s | Código: %s', nome, codigo)
        AS texto_formatado,

    -- 23. TRANSLATE
    -- Substitui caracteres individualmente
    TRANSLATE(codigo, 'ABC', 'XYZ')
        AS caracteres_traduzidos,

    -- 24. SOUNDEX
    -- Comparação fonética
    SOUNDEX('Matheus') AS codigo_fonetico,

    -- 25. REGEXP_EXTRACT
    -- Extrair domínio do e-mail
    REGEXP_EXTRACT(email, r'@(.+)$')
        AS dominio_email,

    -- 26. REGEXP_REPLACE
    -- Padronizar espaços consecutivos
    REGEXP_REPLACE(nome, r'\s+', ' ')
        AS padronizar_espacos,

    -- 27. REGEXP_CONTAINS
    -- Validar formato básico de e-mail
    REGEXP_CONTAINS(
        email,
        r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ) AS email_valido

FROM dados;




--------------------------------------------------------------------------------------------------------------------------------------------------
/*
    Resultado esperado:
    nome	nome_padronizado
    matheus	MATHEUS
    JOAO	JOAO
    maria	MARIA
*/

SELECT
    nome,
    UPPER(TRIM(nome)) AS nome_padronizado
FROM UNNEST([
    '  matheus  ',
    ' JOAO ',
    ' maria '
]) AS nome;



-- Extração de informações de e-mail
SELECT
    email,
    SPLIT(email, '@')[SAFE_OFFSET(0)] AS usuario,
    SPLIT(email, '@')[SAFE_OFFSET(1)] AS dominio
FROM UNNEST([
    'matheus@gmail.com',
    'joao@empresa.com',
    'maria@hotmail.com'
]) AS email;


-- Remover caracteres especiais de documentos
SELECT
    documento,
    REGEXP_REPLACE(documento, r'[^0-9]', '') AS documento_limpo
FROM UNNEST([
    '123.456.789-00',
    '12.345.678/0001-99',
    '123-456-789'
]) AS documento;



-- Identificar registros duplicados por e-mail
WITH clientes AS (
    SELECT 'Matheus@empresa.com' AS email
    UNION ALL
    SELECT 'matheus@empresa.com'
    UNION ALL
    SELECT 'joao@empresa.com'
)

SELECT
    LOWER(TRIM(email)) AS email_padronizado,
    COUNT(*) AS quantidade
FROM clientes
GROUP BY email_padronizado
HAVING COUNT(*) > 1;