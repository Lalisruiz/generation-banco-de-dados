-- 1. Criação do banco de dados para registro escolar
CREATE DATABASE IF NOT EXISTS db_registro_escolar;
USE db_registro_escolar;

-- 2. Criação da tabela estudantes com 5 atributos relevantes
CREATE TABLE IF NOT EXISTS tb_estudantes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    turma VARCHAR(10) NOT NULL,
    nota DECIMAL(3,1) NOT NULL,
    responsavel VARCHAR(100)
) COMMENT 'Tabela de registro de estudantes';

-- 3. Inserção de 8 registros na tabela
INSERT INTO tb_estudantes (nome, idade, turma, nota, responsavel) VALUES
('Maria Silva', 15, '9ºA', 8.5, 'Ana Silva'),
('João Santos', 14, '8ºB', 6.8, 'Carlos Santos'),
('Ana Oliveira', 16, '1ºEM', 9.2, 'Paula Oliveira'),
('Pedro Costa', 13, '7ºA', 5.5, 'Marta Costa'),
('Luiza Fernandes', 17, '2ºEM', 7.8, 'Roberto Fernandes'),
('Marcos Rocha', 15, '9ºB', 4.9, 'Sandra Rocha'),
('Carla Lima', 14, '8ºA', 8.1, 'José Lima'),
('Fernando Alves', 16, '1ºEM', 6.5, 'Patrícia Alves');

-- 4. SELECT para estudantes com nota maior que 7.0
SELECT * FROM tb_estudantes WHERE nota > 7.0 ORDER BY nota DESC;

-- 5. SELECT para estudantes com nota menor que 7.0
SELECT * FROM tb_estudantes WHERE nota < 7.0 ORDER BY nota ASC;

-- 6. Atualização de um registro (aumentando a nota de João Santos)
UPDATE tb_estudantes SET nota = 7.1 WHERE id = 2;

-- Verificação da atualização
SELECT * FROM tb_estudantes WHERE id = 2;

-- Visualização completa da tabela ordenada por ID (chamada)
SELECT * FROM tb_estudantes ORDER BY id;