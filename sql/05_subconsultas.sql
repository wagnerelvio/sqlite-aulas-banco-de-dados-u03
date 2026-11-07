-- SUBCONSULTAS

-- D1: produtos com preco superior a media geral
SELECT descricao, preco
FROM produtos
WHERE preco > (SELECT AVG(preco) FROM produtos)
ORDER BY preco DESC;

-- D2: clientes que fizeram pelo menos um pedido (IN)
SELECT nome
FROM clientes
WHERE id_cliente IN (SELECT id_cliente FROM pedidos)
ORDER BY nome;

-- D3: clientes sem pedidos (NOT EXISTS, subconsulta correlacionada)
SELECT c.nome
FROM clientes AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM pedidos AS p
    WHERE p.id_cliente = c.id_cliente
);

-- D4: clientes com mais de um pedido
SELECT c.nome, COUNT(p.id_pedido) AS quantidade_pedidos
FROM clientes AS c
JOIN pedidos AS p ON p.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(p.id_pedido) > 1;

