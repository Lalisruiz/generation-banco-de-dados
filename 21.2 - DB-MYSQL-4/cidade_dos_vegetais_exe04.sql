-- 1. Criação do banco de dados vegano
CREATE DATABASE IF NOT EXISTS cidade_dos_vegetais;
USE cidade_dos_vegetais;

-- 2. Criação da tabela tb_categorias 
CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(100)
);

-- 3. Criação da tabela tb_produtos 
CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    quantidade INT,
    data_validade DATE,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- 4. Inserção de categorias veganas (5 registros)
INSERT INTO tb_categorias (nome_categoria, descricao) VALUES 
('Frutas', 'Produtos frutíferos frescos'),
('Verduras', 'Folhas e vegetais verdes'),
('Legumes', 'Vegetais diversos'),
('Grãos e Cereais', 'Grãos integrais e cereais'),
('Castanhas e Sementes', 'Oleaginosas e sementes');

-- 5. Inserção de produtos veganos (8 registros)
INSERT INTO tb_produtos (nome, preco, quantidade, data_validade, id_categoria) VALUES
('Maçã Orgânica', 7.99, 100, '2023-12-31', 1),
('Alface Crespa', 3.50, 50, '2023-11-20', 2),
('Cenoura Baby', 6.20, 80, '2023-12-15', 3),
('Quinoa Real', 15.90, 30, '2024-01-30', 4),
('Castanha-do-Pará', 42.50, 25, '2024-03-10', 5),
('Banana Prata', 4.80, 120, '2023-11-30', 1),
('Brócolis Ninja', 9.90, 35, '2023-11-22', 3),
('Amêndoas', 59.90, 40, '2024-02-18', 5);

-- TESTE 1: Visualização completa dos produtos
SELECT * FROM tb_produtos;

-- 6. SELECT para produtos veganos com valor > R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- 7. SELECT para produtos veganos entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

-- 8. SELECT para produtos veganos com 'C' no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- 9. INNER JOIN para todos produtos veganos com suas categorias
SELECT p.*, c.nome_categoria, c.descricao 
FROM tb_produtos p INNER JOIN tb_categorias c 
ON p.id_categoria = c.id_categoria;

-- 10. INNER JOIN para produtos da categoria Frutas
SELECT p.*, c.nome_categoria, c.descricao 
FROM tb_produtos p INNER JOIN tb_categorias c 
ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Frutas';
