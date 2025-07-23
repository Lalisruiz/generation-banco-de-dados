-- Criação do banco de dados
DROP DATABASE IF EXISTS db_rh_empresa;
CREATE DATABASE db_rh_empresa;

-- Selecionando o banco de dados
USE db_rh_empresa;

-- Criação da tabela colaboradores
CREATE TABLE tb_colaboradores (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    departamento VARCHAR(100),
    salario DECIMAL(10,2),
    data_admissao DATE
);

-- Inserção de no mínimo 5 colaboradores
INSERT INTO tb_colaboradores (nome, cargo, departamento, salario, data_admissao) VALUES
("Ana Silva", "Analista de RH", "Recursos Humanos", 3200.00, "2021-03-15"),
("João Santos", "Assistente Administrativo", "Administrativo", 1800.00, "2022-07-01"),
("Carlos Souza", "Desenvolvedor", "TI", 4500.00, "2020-11-20"),
("Marina Oliveira", "Estagiária", "Financeiro", 1300.00, "2023-02-10"),
("Fernanda Costa", "Gerente de Projetos", "TI", 5500.00, "2019-05-05");

-- SELECT com salário maior que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- SELECT com salário menor que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- Atualização de um registro (ex: alteração de salário de Funcionários)
UPDATE tb_colaboradores
SET salario = 2100.00
WHERE id = 2; 

SELECT * FROM tb_colaboradores;

UPDATE tb_colaboradores
SET salario = 10000.00
WHERE id = 5;
 
UPDATE tb_colaboradores
SET salario = 2600.00
WHERE id = 2; 

-- Atualização de um registro (ex: alteração de cargo de Funcionários)
UPDATE tb_colaboradores
SET cargo = "Analista de RH Júnior"
WHERE id = 1; 

UPDATE tb_colaboradores
SET cargo = "Desenvolvedor Front End Júnior"
WHERE id = 3; 

-- Inserção de mais 2 colaboradores
INSERT INTO tb_colaboradores (nome, cargo, departamento, salario, data_admissao)
VALUES
("Mauri Geoya", "Desenvolvedor Full Stack Pleno", "TI", 6000.00, "2024-01-10"),
("Luis Jesus", "Desenvolvedor Full Stack Sênior", "TI", 8000.00, "2023-09-05");

SELECT * FROM tb_colaboradores;

-- Demissão e Admissão de colaboradores
DELETE FROM tb_colaboradores
WHERE id = 5;

INSERT INTO tb_colaboradores (nome, cargo, departamento, salario, data_admissao)
VALUES ("Larissa Ruiz", "Gerente de Projetos", "TI", 10000.00, "2025-07-23");






