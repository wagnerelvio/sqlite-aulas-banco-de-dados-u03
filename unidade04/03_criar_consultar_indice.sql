-- Exemplo 03 - INDEX: organizacao auxiliar para pesquisas
-- Requer a execucao do exemplo 01.
CREATE INDEX IF NOT EXISTS idx_preco ON passeios(preco);

PRAGMA index_list('passeios');

-- Verifica o plano de consulta; com apenas 3 linhas o uso do indice nao e garantido.
EXPLAIN QUERY PLAN
SELECT * FROM passeios WHERE preco >= 150;

SELECT * FROM passeios WHERE preco >= 150;
