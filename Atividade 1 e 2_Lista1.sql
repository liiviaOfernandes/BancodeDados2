CREATE DATABASE loja1;
USE loja1;

-- Tabela de Clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabela de Categorias
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Tabela de Estoque
CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

-- Tabela de Alunos
CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

-- Tabela de Notas
CREATE TABLE notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

-- Clientes 
INSERT INTO clientes (nome) VALUES ('Maria'), ('João');

-- Pedidos
INSERT INTO pedidos (id_cliente, data, valor_total) VALUES
(1, '2025-07-01', 150.00),
(1, '2025-07-02', 200.00),
(2, '2025-07-03', 300.00);

-- Categorias
INSERT INTO categorias (nome) VALUES ('Eletrônicos'), ('Roupas');

-- Produtos
INSERT INTO produtos (nome, id_categoria) VALUES
('Notebook', 1),
('Camiseta', 2);

-- Estoque
INSERT INTO estoque (id_produto, quantidade) VALUES
(1, 10),
(2, 50);

-- Alunos
INSERT INTO alunos (nome) VALUES ('Lucas'), ('Ana');

-- Notas
INSERT INTO notas (id_aluno, nota) VALUES
(1, 7.5), (1, 8.0), (1, 9.0),
(2, 6.5), (2, 7.0);

-- Atividade 1 
DELIMITER $$
CREATE PROCEDURE obter_pedidos_cliente(IN cliente_id INT)
BEGIN
    SELECT 
        p.id AS numero_pedido,
        p.data,
        p.valor_total
    FROM 
        pedidos p
    WHERE 
        p.id_cliente = cliente_id;
END $$
DELIMITER ;

-- Atividade 2
DELIMITER $$
CREATE PROCEDURE obter_estoque_categoria(IN nome_categoria VARCHAR(100))
BEGIN
    SELECT 
        p.nome AS nome_produto,
        e.quantidade
    FROM 
        produtos p
    JOIN 
        categorias c ON p.id_categoria = c.id
    JOIN 
        estoque e ON p.id = e.id_produto
    WHERE 
        c.nome = nome_categoria;
END $$
DELIMITER ;


CALL obter_pedidos_cliente(2);
CALL obter_estoque_categoria('Eletrônicos');



