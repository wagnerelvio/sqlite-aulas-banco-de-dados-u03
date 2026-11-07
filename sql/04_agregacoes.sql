-- FUNCOES DE AGREGACAO

-- C1: numero de clientes
SELECT COUNT(*) AS total_clientes FROM clientes;

-- C2: quantidade de produtos por categoria
SELECT categoria, COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY categoria
ORDER BY categoria;

-- C3: preco medio, minimo e maximo de cada categoria
SELECT categoria,
       ROUND(AVG(preco), 2) AS preco_medio,
       MIN(preco) AS menor_preco,
       MAX(preco) AS maior_preco
FROM produtos
GROUP BY categoria;

-- C4: total vendido por pedido
SELECT ip.id_pedido,
       ROUND(SUM(ip.quantidade * pr.preco), 2) AS valor_total
FROM itens_pedido AS ip
JOIN produtos AS pr ON pr.id_produto = ip.id_produto
GROUP BY ip.id_pedido
ORDER BY ip.id_pedido;

-- C5: pedidos com valor total superior a R$ 100
SELECT ip.id_pedido,
       ROUND(SUM(ip.quantidade * pr.preco), 2) AS valor_total
FROM itens_pedido AS ip
JOIN produtos AS pr ON pr.id_produto = ip.id_produto
GROUP BY ip.id_pedido
HAVING SUM(ip.quantidade * pr.preco) > 100;

