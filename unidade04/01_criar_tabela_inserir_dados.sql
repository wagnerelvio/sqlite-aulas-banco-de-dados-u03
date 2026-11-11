-- Exemplo 01 - Criacao da tabela e insercao de registros
-- Execute primeiro. Para repetir todo o laboratorio, execute 00_reiniciar_laboratorio.sql.
CREATE TABLE IF NOT EXISTS passeios (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL NOT NULL
);

INSERT OR IGNORE INTO passeios (id, nome, preco) VALUES
(1, 'Passeio Histórico', 120.00),
(2, 'Passeio Ecológico', 180.00),
(3, 'Passeio Cultural', 250.00);

SELECT * FROM passeios ORDER BY id;
