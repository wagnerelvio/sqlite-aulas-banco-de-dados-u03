# Aula prática de SQL com SQLiteOnline

**Disciplina:** Programação em Banco de Dados  
**Unidade 4:** Recursos avançados e automação de processos  
**Ambiente de execução:** [SQLiteOnline](https://sqliteonline.com/) usando o mecanismo **SQLite**.

Este repositório reúne exemplos para praticar três assuntos abordados na Unidade 4 do livro *Programação em Banco de Dados*, de Sergio Eduardo Nunes e Ricardo Alexandre Plati Moura (2018): **visões e índices**, **controle transacional** e **procedimentos e funções**.

Os scripts foram **adaptados para SQLite**. Por isso, o último exemplo usa a expressão `CASE` para demonstrar a lógica de classificação, sem criar uma função armazenada.

## 1. Objetivos da aula

Ao concluir as atividades, o aluno deverá conseguir:

- Criar e consultar uma visão com `CREATE VIEW` e `SELECT`.
- Criar e inspecionar índices com `CREATE INDEX`, `PRAGMA` e `EXPLAIN QUERY PLAN`.
- Executar alterações temporárias usando `BEGIN TRANSACTION`, `ROLLBACK`, `COMMIT` e `SAVEPOINT`.
- Aplicar regras de classificação e cálculos com `CASE` e expressões SQL.
- Reconhecer as diferenças entre os recursos de SQLite e MySQL.

## 2. Estrutura dos arquivos

| Arquivo | Conteúdo | Ordem |
|---|---|---|
| [`01_criar_tabela_inserir_dados.sql`](01_criar_tabela_inserir_dados.sql) | Cria a tabela `passeios` e insere três registros fictícios | 1º |
| [`02_criar_consultar_view.sql`](02_criar_consultar_view.sql) | Cria e consulta a visão `vw_passeios` | 2º |
| [`03_criar_consultar_indice.sql`](03_criar_consultar_indice.sql) | Cria o índice `idx_preco` e analisa o plano de consulta | 3º |
| [`04_controle_transacional.sql`](04_controle_transacional.sql) | Demonstra transações, cancelamentos e pontos de retorno | 4º |
| [`05_classificar_preco_case.sql`](05_classificar_preco_case.sql) | Classifica preços e calcula descontos com expressões SQL | 5º |
| [`TODOS_OS_EXEMPLOS.sql`](TODOS_OS_EXEMPLOS.sql) | Reúne os cinco exemplos em um só script | Alternativa à execução individual |
| [`00_reiniciar_laboratorio.sql`](00_reiniciar_laboratorio.sql) | Remove os objetos deste laboratório para começar novamente | Opcional |

**Atenção:** escolha **uma** das duas formas de executar: os arquivos `01` a `05` individualmente **ou** `TODOS_OS_EXEMPLOS.sql`. Não é necessário executar as duas opções.

## 3. Como executar no SQLiteOnline

1. Acesse **https://sqliteonline.com/**.
2. Confira se o mecanismo selecionado é **SQLite**. A plataforma também apresenta outros bancos de dados, mas estes códigos foram preparados para SQLite.
3. Abra o arquivo `01_criar_tabela_inserir_dados.sql` aqui no GitHub, copie seu conteúdo e cole no editor do SQLiteOnline.
4. Execute os comandos e observe o resultado da consulta `SELECT * FROM passeios`.
5. Repita o processo com os arquivos `02`, `03`, `04` e `05`, nessa ordem.

**Execução em uma única etapa:** em um banco SQLite novo e vazio, também é possível copiar o conteúdo de [`TODOS_OS_EXEMPLOS.sql`](TODOS_OS_EXEMPLOS.sql) e executá-lo integralmente.

O SQLiteOnline pode ter opções próprias para executar a instrução selecionada ou o script completo. Para os exemplos de transação, execute o bloco completo até `ROLLBACK` ou `COMMIT`.

## 4. Base de dados do laboratório

Os exemplos utilizam a tabela `passeios`:

| id | nome | preco |
|---:|---|---:|
| 1 | Passeio Histórico | 120.00 |
| 2 | Passeio Ecológico | 180.00 |
| 3 | Passeio Cultural | 250.00 |

A tabela é criada com `id INTEGER PRIMARY KEY`, `nome TEXT NOT NULL` e `preco REAL NOT NULL`.

## 5. Exemplos e resultados esperados

### 5.1 Visões (`VIEW`)

O arquivo `02` cria uma visão que apresenta somente os passeios com preço igual ou superior a 150:

```sql
CREATE VIEW IF NOT EXISTS vw_passeios AS
SELECT nome, preco
FROM passeios
WHERE preco >= 150;

SELECT * FROM vw_passeios;
```

**Resultado esperado:** Passeio Ecológico (180.00) e Passeio Cultural (250.00).

### 5.2 Índices (`INDEX`)

O arquivo `03` cria um índice na coluna `preco`:

```sql
CREATE INDEX IF NOT EXISTS idx_preco
ON passeios(preco);

PRAGMA index_list('passeios');

EXPLAIN QUERY PLAN
SELECT * FROM passeios WHERE preco >= 150;
```

**O que observar:** `PRAGMA index_list` deve listar o índice criado. O plano apresentado por `EXPLAIN QUERY PLAN` pode ou não utilizar esse índice, porque a tabela contém somente três registros.

### 5.3 Controle transacional

O arquivo `04` mostra que uma alteração pode ser desfeita antes de sua confirmação:

```sql
BEGIN TRANSACTION;

UPDATE passeios
SET preco = 200
WHERE id = 1;

SELECT * FROM passeios WHERE id = 1;

ROLLBACK;

SELECT * FROM passeios WHERE id = 1;
```

**Resultado esperado:** durante a transação, o preço do passeio 1 será `200.00`; após o `ROLLBACK`, voltará a `120.00`.

O mesmo arquivo demonstra `SAVEPOINT`, `ROLLBACK TO`, `RELEASE` e `COMMIT`.

### 5.4 Regras de classificação com `CASE`

O arquivo `05` utiliza a expressão `CASE`:

```sql
SELECT
    nome,
    preco,
    CASE
        WHEN preco <= 150 THEN 'Econômico'
        WHEN preco <= 250 THEN 'Intermediário'
        ELSE 'Premium'
    END AS classificacao
FROM passeios;
```

**Resultado esperado:** Passeio Histórico será classificado como **Econômico**; os outros dois, como **Intermediário**. O mesmo arquivo demonstra um desconto de 10% com `ROUND(preco * 0.90, 2)`.

## 6. Diferenças entre SQLite e MySQL

| Recurso | SQLite | MySQL |
|---|---|---|
| Visões (`CREATE VIEW`) | Sim | Sim |
| Índices (`CREATE INDEX`) | Sim | Sim |
| Transações (`BEGIN`, `COMMIT`, `ROLLBACK`) | Sim | Sim, conforme o mecanismo de armazenamento |
| Pontos de retorno (`SAVEPOINT`) | Sim | Sim |
| Procedimentos armazenados (`CREATE PROCEDURE`) | Não | Sim |
| Funções armazenadas criadas com `CREATE FUNCTION` em SQL | Não | Sim |
| Expressões condicionais (`CASE`) | Sim | Sim |

O SQLite possui **funções integradas** e permite que aplicações registrem **funções definidas pelo usuário** por meio de APIs de programação. Isso é diferente de criar uma função armazenada diretamente com `CREATE FUNCTION`, como se faz no MySQL.

## 7. Atividades propostas

1. Modifique a visão para exibir passeios com preço **até 180.00**.
2. Crie um índice na coluna `nome` da tabela `passeios`.
3. Consulte os índices existentes usando `PRAGMA index_list('passeios');`.
4. Inicie uma transação, altere o preço do passeio 3 para `300.00` e desfaça a mudança com `ROLLBACK`.
5. Ajuste o `CASE` para usar as faixas: até 130 (**Baixo**), de 130,01 a 200 (**Médio**) e acima de 200 (**Alto**).
6. Calcule um desconto de **15%** para cada passeio e apresente o preço final.

## 8. Como reiniciar a atividade

Execute [`00_reiniciar_laboratorio.sql`](00_reiniciar_laboratorio.sql) **somente se quiser apagar os objetos criados por estes exemplos** e repetir a aula do início. Em seguida, execute novamente o arquivo `01`.

O script de reinicialização remove a visão, o índice e a tabela `passeios`. **Não execute esse script em uma base que contenha informações que deseja preservar.**

## 9. Referência didática

NUNES, Sergio Eduardo; MOURA, Ricardo Alexandre Plati. *Programação em Banco de Dados*. Londrina: Editora e Distribuidora Educacional S.A., 2018. Unidade 4: **Visões e índices; Controle transacional; Procedimentos e funções**.

> Material de apoio elaborado com exemplos próprios para fins educacionais. Os nomes e valores usados nos registros são fictícios.
