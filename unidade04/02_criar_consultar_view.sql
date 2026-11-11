-- Exemplo 02 - VIEW: uma consulta reutilizavel
-- Requer a execucao do exemplo 01.
CREATE VIEW IF NOT EXISTS vw_passeios AS
SELECT nome, preco
FROM passeios
WHERE preco >= 150;

SELECT * FROM vw_passeios ORDER BY preco;
-- Resultado esperado: Passeio Ecológico e Passeio Cultural.
