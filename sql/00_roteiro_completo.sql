-- ROTEIRO PRATICO SQLITE
-- Temas: juncoes horizontais e verticais, agregacoes e subconsultas
-- Execute todo o script no https://sqliteonline.com/ ou por blocos.

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS clientes_2025;
DROP TABLE IF EXISTS clientes_2026;

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cidade TEXT NOT NULL
);

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    descricao TEXT NOT NULL,
    categoria TEXT NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    data_pedido TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO clientes VALUES
(1, 'Ana', 'Sao Luis'),
(2, 'Bruno', 'Imperatriz'),
(3, 'Carla', 'Sao Luis'),
(4, 'Diego', 'Caxias'),
(5, 'Elisa', 'Bacabal');

INSERT INTO produtos VALUES
(1, 'Sensor DHT11', 'Sensores', 25.00),
(2, 'ESP32', 'Placas', 65.00),
(3, 'Arduino Uno', 'Placas', 90.00),
(4, 'Sensor PIR', 'Sensores', 30.00),
(5, 'Modulo Rele', 'Modulos', 18.00);

INSERT INTO pedidos VALUES
(101, 1, '2026-10-01'),
(102, 2, '2026-10-02'),
(103, 1, '2026-10-05'),
(104, 3, '2026-10-07'),
(105, 4, '2026-10-08');

INSERT INTO itens_pedido VALUES
(101, 1, 2),
(101, 2, 1),
(102, 3, 1),
(103, 4, 3),
(104, 2, 2),
(105, 5, 4);

-- A. JUNCAO HORIZONTAL: JOIN combina colunas de tabelas relacionadas.
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

-- B. JUNCAO VERTICAL: UNION empilha linhas de consultas compativeis.
CREATE TABLE clientes_2025 (nome TEXT, cidade TEXT);
CREATE TABLE clientes_2026 (nome TEXT, cidade TEXT);
INSERT INTO clientes_2025 VALUES ('Ana', 'Sao Luis'), ('Bruno', 'Imperatriz');
INSERT INTO clientes_2026 VALUES ('Ana', 'Sao Luis'), ('Carla', 'Sao Luis');

-- B1: UNION elimina linhas duplicadas
SELECT nome, cidade FROM clientes_2025
UNION
SELECT nome, cidade FROM clientes_2026;

-- B2: UNION ALL preserva duplicatas
SELECT nome, cidade FROM clientes_2025
UNION ALL
SELECT nome, cidade FROM clientes_2026;

-- C. FUNCOES DE AGREGACAO
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

-- D. SUBCONSULTAS
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

-- E. CONSULTAS UTEIS NO SQLITE ONLINE
-- Listar as tabelas do banco
SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY name;
-- Estrutura de uma tabela
PRAGMA table_info(clientes);
-- Numero de registros
SELECT COUNT(*) AS total FROM pedidos;
