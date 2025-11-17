# UniBook – Banco de Dados de Biblioteca Universitária

Este repositório faz parte das Experiências Práticas da disciplina de **Modelagem de Banco de Dados**  
do curso de Análise e Desenvolvimento de Sistemas.

O mini-mundo é um sistema de **biblioteca universitária** chamado **UniBook**, que controla:

- Usuários (alunos, professores e funcionários)
- Obras (livros e materiais)
- Exemplares físicos
- Empréstimos e devoluções
- Reservas de obras
- Multas por atraso

---

## Estrutura do repositório

```text
sql/
 ├─ 01_create_tables.sql       # Criação do banco unibook e das tabelas
 ├─ 02_insert_dados.sql       # Inserts para povoar as tabelas principais
 ├─ 03_select_consultas.sql   # Consultas SELECT com JOIN, WHERE, ORDER BY, LIMIT
 └─ 04_update_delete.sql      # Comandos de UPDATE e DELETE com condições
