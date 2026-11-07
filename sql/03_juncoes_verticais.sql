-- JUNCOES VERTICAIS: UNION e UNION ALL
-- B1: UNION elimina linhas duplicadas
SELECT nome, cidade FROM clientes_2025
UNION
SELECT nome, cidade FROM clientes_2026;

-- B2: UNION ALL preserva duplicatas
SELECT nome, cidade FROM clientes_2025
UNION ALL
SELECT nome, cidade FROM clientes_2026;

