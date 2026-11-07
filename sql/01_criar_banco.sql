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


-- Tabelas auxiliares para os exemplos de UNION
CREATE TABLE clientes_2025 (nome TEXT, cidade TEXT);
CREATE TABLE clientes_2026 (nome TEXT, cidade TEXT);
INSERT INTO clientes_2025 VALUES ('Ana', 'Sao Luis'), ('Bruno', 'Imperatriz');
INSERT INTO clientes_2026 VALUES ('Ana', 'Sao Luis'), ('Carla', 'Sao Luis');

