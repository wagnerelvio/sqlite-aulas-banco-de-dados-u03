# Exemplos de SQL no SQLiteOnline

Exercícios introdutórios baseados nos temas da Unidade 4 de *Programação em Banco de Dados*: visões e índices, controle transacional e procedimentos e funções.

**Editor:** https://sqliteonline.com/ (selecione o mecanismo **SQLite**, não MySQL).

## Arquivos e ordem

1. `01_criar_tabela_inserir_dados.sql`: cria `passeios` e insere três registros fictícios.
2. `02_criar_consultar_view.sql`: cria e consulta uma visão.
3. `03_criar_consultar_indice.sql`: cria um índice e observa o plano da consulta.
4. `04_controle_transacional.sql`: demonstra BEGIN, ROLLBACK, SAVEPOINT e COMMIT.
5. `05_classificar_preco_case.sql`: usa CASE e expressões para reproduzir lógica de função.
6. `00_reiniciar_laboratorio.sql`: **opcional**, apaga os objetos criados neste laboratório para recomeçar.

Para fazer tudo de uma vez, execute `TODOS_OS_EXEMPLOS.sql` em uma base SQLite nova. O arquivo consolidado cria a tabela e executa os exemplos em sequência.

## Como executar

1. Abra https://sqliteonline.com/.
2. Escolha **SQLite** no seletor de banco, caso necessário.
3. Abra um arquivo `.sql`, copie o conteúdo e cole no editor.
4. Execute as instruções na ordem indicada.
5. Observe os resultados na área inferior do site.

## Diferenças para MySQL

SQLite aceita `CREATE VIEW`, `CREATE INDEX`, `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK` e `SAVEPOINT`. Contudo, **não permite criar procedimentos armazenados (`CREATE PROCEDURE`) nem funções armazenadas (`CREATE FUNCTION`) somente com SQL**. O arquivo 05 mostra uma alternativa didática para expressões e regras de classificação com `CASE`, sem ser uma função armazenada.

Alguns ambientes online podem executar trechos isoladamente ou controlar transações de forma particular. Em caso de transação aberta, execute `ROLLBACK;` antes de recomeçar.

## Resultados iniciais

| id | nome | preco |
|---|---|---|
| 1 | Passeio Histórico | 120.00 |
| 2 | Passeio Ecológico | 180.00 |
| 3 | Passeio Cultural | 250.00 |

**Nota:** os dados são fictícios e criados somente para fins didáticos.
