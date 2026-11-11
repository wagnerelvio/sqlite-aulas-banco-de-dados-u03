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
