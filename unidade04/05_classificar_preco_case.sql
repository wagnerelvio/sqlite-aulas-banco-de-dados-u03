-- Exemplo 05 - Simulacao da logica de uma funcao usando CASE
-- SQLite nao aceita CREATE FUNCTION armazenada apenas por instrucoes SQL.
-- Requer a execucao do exemplo 01.
SELECT
    nome,
    preco,
    CASE
        WHEN preco <= 150 THEN 'Econômico'
        WHEN preco <= 250 THEN 'Intermediário'
        ELSE 'Premium'
    END AS classificacao
FROM passeios
ORDER BY id;

-- Exemplo adicional: calculo de desconto de 10% usando expressao.
SELECT nome, preco,
       ROUND(preco * 0.90, 2) AS preco_com_desconto
FROM passeios
ORDER BY id;
