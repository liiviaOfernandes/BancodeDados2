CREATE DATABASE notas;
USE notas;

CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

-- Inserir alunos
INSERT INTO alunos (nome) VALUES ('Lucas'), ('Ana');

-- Inserir notas
INSERT INTO notas (id_aluno, nota) VALUES
(1, 7.5), (1, 8.0), (1, 9.0),   -- Lucas
(2, 6.5), (2, 7.0);             -- Ana

DELIMITER $$
CREATE PROCEDURE obter_media_aluno(IN aluno_id INT)
BEGIN
    SELECT 
        a.nome,                   -- Nome do aluno
        AVG(n.nota) AS media      -- Média das notas
    FROM 
        alunos a
    JOIN 
        notas n ON a.id = n.id_aluno  -- Junta aluno com suas notas
    WHERE 
        a.id = aluno_id               -- Filtra pelo aluno desejado
    GROUP BY 
        a.nome;                       -- Agrupa para calcular a média
END $$
DELIMITER ;

CALL obter_media_aluno(1);  -- Retorna nome e média de Lucas
CALL obter_media_aluno(2);  -- Retorna nome e média de Ana


-- verificando se foi criado 
SHOW PROCEDURE STATUS WHERE Db = 'notas';

DROP PROCEDURE IF EXISTS obter_media_aluno;

