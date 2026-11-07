# Aulas práticas de SQL com SQLite

Repositório didático para trabalhar **junções horizontais e verticais**, **funções de agregação** e **subconsultas** utilizando uma base de dados de clientes, produtos e pedidos.

## Como executar no SQLite Online

1. Acesse **https://sqliteonline.com/** e selecione o mecanismo **SQLite**.
2. Abra `sql/01_criar_banco.sql`, copie os comandos e execute para criar e preencher o banco.
3. Execute os arquivos de `02` a `06` separadamente, na mesma sessão e na ordem desejada.
4. Observe os resultados, altere os filtros e compare os resultados de `INNER JOIN` e `LEFT JOIN`, bem como `UNION` e `UNION ALL`.

**Alternativa:** execute diretamente `sql/00_roteiro_completo.sql`, que contém a criação do banco e todas as consultas, incluindo a criação das tabelas anuais antes dos exemplos de `UNION`. Não execute `00` e `01` como se fossem etapas distintas obrigatórias: ambos recriam a base.

## Estrutura dos arquivos

```text
sqlite-aulas-banco-de-dados/
├── README.md
├── .gitignore
├── sql/
│   ├── 00_roteiro_completo.sql
│   ├── 01_criar_banco.sql
│   ├── 02_juncoes_horizontais.sql
│   ├── 03_juncoes_verticais.sql
│   ├── 04_agregacoes.sql
│   ├── 05_subconsultas.sql
│   └── 06_comandos_auxiliares.sql
└── docs/
    ├── apostila_sqlite.tex
    └── apostila_sqlite.pdf
```

## Conteúdo por arquivo

| Arquivo | O que demonstra |
| --- | --- |
| `00_roteiro_completo.sql` | Preparação da base e todas as consultas em um script |
| `01_criar_banco.sql` | `CREATE TABLE`, chaves, `INSERT` e dados de exemplo |
| `02_juncoes_horizontais.sql` | `INNER JOIN`, `LEFT JOIN`, junção de quatro tabelas |
| `03_juncoes_verticais.sql` | `UNION` e `UNION ALL` |
| `04_agregacoes.sql` | `COUNT`, `AVG`, `MIN`, `MAX`, `SUM`, `GROUP BY`, `HAVING` |
| `05_subconsultas.sql` | Subconsulta com `AVG`, `IN` e `NOT EXISTS` e consulta com `HAVING` |
| `06_comandos_auxiliares.sql` | Listar tabelas, estrutura e quantidade de registros |
| `docs/` | Material de apoio em LaTeX e PDF |

## Atividades sugeridas

1. Descubra qual cliente não fez pedidos com `LEFT JOIN` e compare com `NOT EXISTS`.
2. Compare as quantidades de linhas produzidas por `UNION` e `UNION ALL`.
3. Calcule o valor de cada pedido e filtre os valores maiores que R$ 100.
4. Identifique os produtos cujo preço supera a média geral.
5. Modifique o banco adicionando um cliente sem pedido e um produto novo; repita as consultas.

## Executar no computador (opcional)

Com `sqlite3` instalado, no terminal, dentro da raiz do projeto:

```bash
sqlite3 aula.db < sql/01_criar_banco.sql
sqlite3 aula.db < sql/02_juncoes_horizontais.sql
sqlite3 aula.db < sql/03_juncoes_verticais.sql
sqlite3 aula.db < sql/04_agregacoes.sql
sqlite3 aula.db < sql/05_subconsultas.sql
sqlite3 aula.db < sql/06_comandos_auxiliares.sql
```

A tabela `sqlite_master` e o comando `PRAGMA table_info` permitem inspecionar a base sem precisar de extensões.

## Publicar no GitHub

1. Crie um repositório vazio no GitHub (por exemplo: `sqlite-aulas-banco-de-dados`).
2. Extraia o ZIP e abra a pasta no terminal.
3. Execute os comandos abaixo, substituindo `SEU_USUARIO` pelo seu login do GitHub:

```bash
git init
git add .
git commit -m "Adiciona exemplos didaticos de SQLite"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/sqlite-aulas-banco-de-dados.git
git push -u origin main
```

Se o repositório remoto já tiver arquivos, como um README criado pelo GitHub, sincronize os históricos antes de enviar os arquivos ou crie o remoto vazio para usar essa sequência diretamente.

> Requisitos: SQLite 3 ou acesso ao SQLite Online. Os exemplos não dependem do MySQL.
