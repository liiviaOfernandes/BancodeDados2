CREATE DATABASE loja_virtual;

USE loja_virtual;

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  telefone VARCHAR(20),
  data_cadastro DATE NOT NULL
);

-- Cliente 1: Ana Silva (data de hoje)
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES ('Ana Silva', 'ana.silva@email.com', '99999-8888', CURDATE());

-- Cliente 2: Bruno Costa (data de ontem)
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES ('Bruno Costa', 'bruno.costa@email.com', '77777-6666', CURDATE() - INTERVAL 1 DAY);

-- Cliente 3: Seu cadastro
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES ('Seu Nome', 'seu.email@email.com', '12345-6789', CURDATE());

SELECT * FROM clientes;

UPDATE clientes
SET telefone = '55555-4444'
WHERE nome = 'Ana Silva';

SELECT nome
FROM clientes
WHERE data_cadastro = CURDATE();


-- Inserir o cliente de teste
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES ('Cliente Teste', 'cliente.teste@email.com', '11111-2222', CURDATE());

-- Verificar se o cliente foi inserido
SELECT * FROM clientes;

-- Excluir o cliente de teste
DELETE FROM clientes
WHERE nome = 'Cliente Teste';

-- Confirmar que o cliente foi removido
SELECT * FROM clientes
WHERE nome = 'Cliente Teste';