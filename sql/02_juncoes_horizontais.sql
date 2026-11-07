-- JUNCOES HORIZONTAIS: INNER JOIN, LEFT JOIN e multiplas tabelas
-- JOIN combina colunas de tabelas relacionadas.
-- A1: clientes e respectivos pedidos (somente correspondencias)
SELECT c.nome, p.id_pedido, p.data_pedido
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
ORDER BY p.id_pedido;

-- A2: todos os clientes, inclusive os que ainda nao fizeram pedidos
SELECT c.nome, p.id_pedido
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente
ORDER BY c.nome, p.id_pedido;

-- A3: clientes, pedidos, itens e produtos
SELECT c.nome, pe.id_pedido, pr.descricao, ip.quantidade,
       ROUND(ip.quantidade * pr.preco, 2) AS subtotal
FROM clientes AS c
JOIN pedidos AS pe ON pe.id_cliente = c.id_cliente
JOIN itens_pedido AS ip ON ip.id_pedido = pe.id_pedido
JOIN produtos AS pr ON pr.id_produto = ip.id_produto
ORDER BY pe.id_pedido;

