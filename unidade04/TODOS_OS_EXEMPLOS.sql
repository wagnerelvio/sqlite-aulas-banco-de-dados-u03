-- Script unico: execute em um banco SQLite novo.
-- Se ja executou os exemplos antes, nao rode este arquivo novamente sem reiniciar.

-- Exemplo 01 - Criacao da tabela e insercao de registros
-- Execute primeiro. Para repetir todo o laboratorio, execute 00_reiniciar_laboratorio.sql.
CREATE TABLE IF NOT EXISTS passeios (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL NOT NULL
);

INSERT OR IGNORE INTO passeios (id, nome, preco) VALUES
(1, 'Passeio Histórico', 120.00),
(2, 'Passeio Ecológico', 180.00),
(3, 'Passeio Cultural', 250.00);

SELECT * FROM passeios ORDER BY id;


-- Exemplo 02 - VIEW: uma consulta reutilizavel
-- Requer a execucao do exemplo 01.
CREATE VIEW IF NOT EXISTS vw_passeios AS
SELECT nome, preco
FROM passeios
WHERE preco >= 150;

SELECT * FROM vw_passeios ORDER BY preco;
-- Resultado esperado: Passeio Ecológico e Passeio Cultural.


-- Exemplo 03 - INDEX: organizacao auxiliar para pesquisas
-- Requer a execucao do exemplo 01.
CREATE INDEX IF NOT EXISTS idx_preco ON passeios(preco);

PRAGMA index_list('passeios');

-- Verifica o plano de consulta; com apenas 3 linhas o uso do indice nao e garantido.
EXPLAIN QUERY PLAN
SELECT * FROM passeios WHERE preco >= 150;

SELECT * FROM passeios WHERE preco >= 150;


-- Exemplo 04 - Transacao com ROLLBACK
-- Requer a execucao do exemplo 01.
-- Se ocorrer erro e a transacao permanecer aberta, execute ROLLBACK;
SELECT id, nome, preco FROM passeios WHERE id = 1;

BEGIN TRANSACTION;
UPDATE passeios SET preco = 200 WHERE id = 1;
SELECT id, nome, preco FROM passeios WHERE id = 1;
ROLLBACK;

-- O valor volta a 120.00 na base original.
SELECT id, nome, preco FROM passeios WHERE id = 1;

-- Segundo teste: SAVEPOINT e ROLLBACK TO, sem alteracao permanente.
BEGIN TRANSACTION;
SAVEPOINT antes_da_alteracao;
UPDATE passeios SET preco = 300 WHERE id = 2;
SELECT id, nome, preco FROM passeios WHERE id = 2;
ROLLBACK TO antes_da_alteracao;
RELEASE antes_da_alteracao;
COMMIT;
SELECT id, nome, preco FROM passeios WHERE id = 2;


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
