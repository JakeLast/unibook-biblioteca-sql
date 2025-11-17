-- Criação do banco de dados (MySQL)
CREATE DATABASE IF NOT EXISTS unibook;
USE unibook;

-- Apagar tabelas caso já existam (ordem respeitando FKs)
DROP TABLE IF EXISTS MULTA;
DROP TABLE IF EXISTS RESERVA;
DROP TABLE IF EXISTS EMPRESTIMO;
DROP TABLE IF EXISTS EXEMPLAR;
DROP TABLE IF EXISTS OBRA;
DROP TABLE IF EXISTS CATEGORIA;
DROP TABLE IF EXISTS USUARIO;

-- Tabela de usuários
CREATE TABLE USUARIO (
    id_usuario INT NOT NULL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL,   -- aluno, professor, funcionario
    email VARCHAR(100),
    data_cadastro DATE NOT NULL
);

-- Tabela de categorias de obra
CREATE TABLE CATEGORIA (
    id_categoria INT NOT NULL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    descricao VARCHAR(255)
);

-- Tabela de obras (livros, materiais)
CREATE TABLE OBRA (
    id_obra INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120),
    ano INT,
    editora VARCHAR(80),
    isbn VARCHAR(20),
    id_categoria INT NOT NULL,
    CONSTRAINT fk_obra_categoria
        FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- Tabela de exemplares físicos
CREATE TABLE EXEMPLAR (
    id_exemplar INT NOT NULL PRIMARY KEY,
    codigo_barras VARCHAR(30) NOT NULL UNIQUE,
    localizacao VARCHAR(60) NOT NULL,
    estado_conservacao VARCHAR(30),
    id_obra INT NOT NULL,
    CONSTRAINT fk_exemplar_obra
        FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra)
);

-- Tabela de empréstimos
CREATE TABLE EMPRESTIMO (
    id_emprestimo INT NOT NULL PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    id_usuario INT NOT NULL,
    id_exemplar INT NOT NULL,
    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    CONSTRAINT fk_emprestimo_exemplar
        FOREIGN KEY (id_exemplar) REFERENCES EXEMPLAR(id_exemplar)
);

-- Tabela de multas
CREATE TABLE MULTA (
    id_multa INT NOT NULL PRIMARY KEY,
    dias_atraso INT NOT NULL,
    valor_total DECIMAL(8,2) NOT NULL,
    pago BOOLEAN NOT NULL DEFAULT FALSE,
    id_emprestimo INT NOT NULL,
    CONSTRAINT fk_multa_emprestimo
        FOREIGN KEY (id_emprestimo) REFERENCES EMPRESTIMO(id_emprestimo),
    CONSTRAINT uq_multa_emprestimo UNIQUE (id_emprestimo)
);

-- Tabela de reservas
CREATE TABLE RESERVA (
    id_reserva INT NOT NULL PRIMARY KEY,
    data_reserva DATE NOT NULL,
    data_limite DATE,
    status_reserva VARCHAR(20) NOT NULL,   -- ativa, atendida, cancelada
    id_usuario INT NOT NULL,
    id_obra INT NOT NULL,
    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    CONSTRAINT fk_reserva_obra
        FOREIGN KEY (id_obra) REFERENCES OBRA(id_obra)
);
