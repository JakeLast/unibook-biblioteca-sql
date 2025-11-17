USE unibook;

-- Inserir usuários
INSERT INTO USUARIO (id_usuario, matricula, nome, tipo_usuario, email, data_cadastro) VALUES
(1, '2025001', 'Ana Silva',      'aluno',      'ana.silva@exemplo.com',   '2025-02-10'),
(2, '2025002', 'Bruno Costa',    'aluno',      'bruno.costa@exemplo.com', '2025-02-11'),
(3, 'DOC1001', 'Carla Souza',    'professor',  'carla.souza@exemplo.com', '2025-01-20'),
(4, 'FUN2001', 'Diego Lima',     'funcionario','diego.lima@exemplo.com',  '2025-03-01');

-- Inserir categorias
INSERT INTO CATEGORIA (id_categoria, nome, descricao) VALUES
(1, 'Programação', 'Livros de programação, desenvolvimento de software, algoritmos'),
(2, 'Estatística', 'Livros de estatística, probabilidade e análise de dados'),
(3, 'Literatura',  'Romances, contos e obras literárias em geral');

-- Inserir obras
INSERT INTO OBRA (id_obra, titulo, autor, ano, editora, isbn, id_categoria) VALUES
(1, 'Introdução a Bancos de Dados', 'João Pereira', 2020, 'Editora Tech', '978000000001', 1),
(2, 'Estatística Aplicada',         'Maria Oliveira', 2018, 'Editora Ciência', '978000000002', 2),
(3, 'Algoritmos em C',              'Luiz Santos', 2019, 'Editora Code', '978000000003', 1),
(4, 'Dom Casmurro',                 'Machado de Assis', 1899, 'Editora Clássicos', '978000000004', 3);

-- Inserir exemplares
INSERT INTO EXEMPLAR (id_exemplar, codigo_barras, localizacao, estado_conservacao, id_obra) VALUES
(1, 'EX001', 'A1-01', 'bom',        1),
(2, 'EX002', 'A1-02', 'bom',        1),
(3, 'EX003', 'B1-01', 'bom',        2),
(4, 'EX004', 'C1-01', 'ótimo',      3),
(5, 'EX005', 'D1-01', 'regular',    4);

-- Inserir empréstimos
INSERT INTO EMPRESTIMO (id_emprestimo, data_emprestimo, data_prevista_devolucao, data_devolucao, id_usuario, id_exemplar) VALUES
(1, '2025-11-01', '2025-11-10', '2025-11-09', 1, 1),  -- devolveu em dia
(2, '2025-11-03', '2025-11-12', '2025-11-20', 2, 3),  -- devolução atrasada
(3, '2025-11-05', '2025-11-14', NULL,          3, 2),  -- ainda não devolvido
(4, '2025-11-08', '2025-11-17', '2025-11-19', 1, 5);  -- devolução com pouco atraso

-- Inserir multas (para empréstimos com atraso)
INSERT INTO MULTA (id_multa, dias_atraso, valor_total, pago, id_emprestimo) VALUES
(1, 8, 12.00, FALSE, 2),  -- 8 dias de atraso
(2, 2,  3.00, FALSE, 4);  -- 2 dias de atraso

-- Inserir reservas
INSERT INTO RESERVA (id_reserva, data_reserva, data_limite, status_reserva, id_usuario, id_obra) VALUES
(1, '2025-11-15', '2025-11-20', 'ativa',     2, 1),
(2, '2025-11-10', '2025-11-15', 'atendida',  4, 2),
(3, '2025-11-18', '2025-11-23', 'cancelada', 1, 3);
