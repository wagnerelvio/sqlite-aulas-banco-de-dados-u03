# Guia prático de comandos SQL com SQLite

Material de apoio para aulas práticas de **Banco de Dados**, utilizando o [SQLiteOnline](https://sqliteonline.com/). Os exemplos usam um inventário de dispositivos eletrônicos e IoT.

## Objetivos

Aprender a listar tabelas e registros, consultar a estrutura de uma tabela, filtrar e ordenar resultados, contar registros e calcular média, soma, maior e menor valor. Também serão usados agrupamentos, subconsultas e filtros de grupos.

## 1. Preparação do ambiente

1. Acesse [https://sqliteonline.com/](https://sqliteonline.com/).
2. Selecione **SQLite** como banco de dados.
3. Execute o código de criação da tabela e, depois, o de inserção dos registros.
4. Execute cada consulta apresentada nas seções seguintes.

> **Atenção:** execute a inserção apenas uma vez. Se desejar recomeçar a atividade, exclua a tabela com `DROP TABLE IF EXISTS produtos;` e recrie-a.

### Criar a tabela `produtos`

```sql
CREATE TABLE IF NOT EXISTS produtos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    categoria TEXT,
    preco REAL,
    quantidade INTEGER
);
```

### Inserir dados de exemplo

```sql
INSERT INTO produtos (id, nome, categoria, preco, quantidade)
VALUES
    (1, 'Arduino Uno', 'Placas', 85.00, 10),
    (2, 'ESP32', 'Placas', 45.00, 20),
    (3, 'DHT11', 'Sensores', 15.00, 30),
    (4, 'ESP8266', 'Placas', 35.00, 15),
    (5, 'Sensor PIR', 'Sensores', 18.00, 25);
```

| id | nome | categoria | preco | quantidade |
|---:|---|---|---:|---:|
| 1 | Arduino Uno | Placas | 85.00 | 10 |
| 2 | ESP32 | Placas | 45.00 | 20 |
| 3 | DHT11 | Sensores | 15.00 | 30 |
| 4 | ESP8266 | Placas | 35.00 | 15 |
| 5 | Sensor PIR | Sensores | 18.00 | 25 |

## 2. Listar tabelas e consultar sua estrutura

```sql
-- Listar tabelas do banco
SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

-- Mostrar os campos e tipos da tabela
PRAGMA table_info(produtos);

-- Mostrar o comando usado na criacao da tabela
SELECT sql
FROM sqlite_master
WHERE type = 'table' AND name = 'produtos';
```

## 3. Consultar registros com SELECT

```sql
-- Todas as colunas e linhas
SELECT * FROM produtos;

-- Somente os nomes
SELECT nome FROM produtos;

-- Nome e preco
SELECT nome, preco FROM produtos;

-- Categorias sem repeticoes
SELECT DISTINCT categoria FROM produtos;
```

## 4. Funções de agregação

| Função | Uso | Exemplo |
|---|---|---|
| `COUNT(*)` | Conta todas as linhas | `SELECT COUNT(*) FROM produtos;` |
| `AVG(preco)` | Calcula o preço médio | `SELECT AVG(preco) FROM produtos;` |
| `MAX(preco)` | Encontra o maior preço | `SELECT MAX(preco) FROM produtos;` |
| `MIN(preco)` | Encontra o menor preço | `SELECT MIN(preco) FROM produtos;` |
| `SUM(quantidade)` | Soma unidades em estoque | `SELECT SUM(quantidade) FROM produtos;` |

```sql
-- Quantidade de registros
SELECT COUNT(*) AS total_produtos FROM produtos;

-- Media de preco com duas casas decimais
SELECT ROUND(AVG(preco), 2) AS media_precos FROM produtos;

-- Maior preco
SELECT MAX(preco) AS maior_preco FROM produtos;

-- Menor preco
SELECT MIN(preco) AS menor_preco FROM produtos;

-- Soma das quantidades
SELECT SUM(quantidade) AS estoque_total FROM produtos;

-- Todas as estatisticas em uma consulta
SELECT
    COUNT(*) AS total_produtos,
    ROUND(AVG(preco), 2) AS media_precos,
    MAX(preco) AS maior_preco,
    MIN(preco) AS menor_preco,
    SUM(quantidade) AS estoque_total
FROM produtos;
```

**Resultado esperado para os dados fornecidos:**

| total_produtos | media_precos | maior_preco | menor_preco | estoque_total |
|---:|---:|---:|---:|---:|
| 5 | 39.60 | 85.00 | 15.00 | 100 |

> `COUNT(*)` conta linhas, enquanto `COUNT(coluna)` conta apenas valores não nulos nessa coluna. `AVG()`, `SUM()`, `MIN()` e `MAX()` desconsideram valores `NULL`.

## 5. Filtrar registros com WHERE

```sql
-- Preco maior que 30
SELECT * FROM produtos WHERE preco > 30;

-- Preco entre 20 e 60 (limites incluidos)
SELECT * FROM produtos WHERE preco BETWEEN 20 AND 60;

-- Apenas sensores
SELECT * FROM produtos WHERE categoria = 'Sensores';

-- Nomes que contem 'Sensor'
SELECT * FROM produtos WHERE nome LIKE '%Sensor%';

-- Placas que custam menos de 50
SELECT * FROM produtos
WHERE categoria = 'Placas' AND preco < 50;
```

## 6. Ordenar e limitar resultados

```sql
-- Menor para maior preco
SELECT * FROM produtos ORDER BY preco ASC;

-- Maior para menor preco
SELECT * FROM produtos ORDER BY preco DESC;

-- Tres produtos mais caros
SELECT * FROM produtos ORDER BY preco DESC LIMIT 3;

-- Tres primeiras linhas por ID
SELECT * FROM produtos ORDER BY id LIMIT 3;
```

## 7. Agrupar resultados com GROUP BY e HAVING

```sql
-- Quantidade de registros por categoria
SELECT categoria, COUNT(*) AS total
FROM produtos
GROUP BY categoria;

-- Preco medio por categoria
SELECT categoria, ROUND(AVG(preco), 2) AS media_preco
FROM produtos
GROUP BY categoria;

-- Total de unidades por categoria
SELECT categoria, SUM(quantidade) AS total_unidades
FROM produtos
GROUP BY categoria;

-- Categorias com tres ou mais produtos cadastrados
SELECT categoria, COUNT(*) AS total
FROM produtos
GROUP BY categoria
HAVING COUNT(*) >= 3;
```

`WHERE` filtra linhas **antes** do agrupamento; `HAVING` filtra os grupos **depois** do agrupamento.

## 8. Encontrar o registro do maior ou menor preço

```sql
-- Produto(s) com o maior preco
SELECT * FROM produtos
WHERE preco = (SELECT MAX(preco) FROM produtos);

-- Produto(s) com o menor preco
SELECT * FROM produtos
WHERE preco = (SELECT MIN(preco) FROM produtos);
```

Estas consultas retornam todos os produtos empatados no maior ou menor preço, se houver empate.

## 9. Referência rápida

| Comando | Finalidade |
|---|---|
| `SELECT` | Selecionar dados |
| `FROM` | Indicar a tabela consultada |
| `WHERE` | Filtrar linhas |
| `COUNT()` | Contar registros/valores |
| `AVG()` | Calcular média |
| `MAX()` | Identificar maior valor |
| `MIN()` | Identificar menor valor |
| `SUM()` | Somar valores |
| `ROUND()` | Arredondar números |
| `ORDER BY` | Ordenar resultados |
| `ASC` / `DESC` | Ordem crescente / decrescente |
| `GROUP BY` | Agrupar registros |
| `HAVING` | Filtrar grupos |
| `DISTINCT` | Eliminar repetições |
| `LIMIT` | Limitar linhas retornadas |
| `BETWEEN` | Selecionar intervalo inclusivo |
| `LIKE` | Pesquisar padrões de texto |

## 10. Atividade prática

Utilizando o banco de exemplo, escreva consultas SQL para:

1. Listar todos os produtos cadastrados.
2. Mostrar somente nome e preço de cada produto.
3. Contar a quantidade de produtos cadastrados.
4. Calcular a média dos preços.
5. Identificar o maior preço.
6. Identificar o menor preço.
7. Somar as unidades disponíveis em estoque.
8. Listar produtos com preço superior a R$ 30,00.
9. Ordenar os produtos do mais caro ao mais barato.
10. Contar quantos produtos existem em cada categoria.
11. Calcular a média de preço por categoria.
12. Mostrar os três produtos mais caros.
13. Identificar os dados do produto mais barato.
14. Listar categorias que contenham pelo menos três produtos.
15. Mostrar somente os produtos cujos nomes contenham `Sensor`.

## Observações

- Os comandos foram preparados para o **SQLite**, inclusive `PRAGMA table_info` e a consulta a `sqlite_master`.
- Nos comandos SQL, valores decimais são escritos com **ponto**, por exemplo `39.60`.
- O nome da coluna foi definido como `preco`, sem acento, para facilitar a digitação.
- Para um projeto real com valores monetários, pode ser preferível armazenar preços em centavos inteiros, evitando problemas de arredondamento de ponto flutuante.

---

**Material didático:** introdução a consultas SQL em banco de dados SQLite, com exemplos de dispositivos IoT.
