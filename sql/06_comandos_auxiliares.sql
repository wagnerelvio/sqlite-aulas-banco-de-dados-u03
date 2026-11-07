-- COMANDOS AUXILIARES

-- Listar as tabelas do banco
SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY name;
-- Estrutura de uma tabela
PRAGMA table_info(clientes);
-- Numero de registros
SELECT COUNT(*) AS total FROM pedidos;
