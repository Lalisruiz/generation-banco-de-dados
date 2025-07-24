-- 1. Criação do banco de dados para e-commerce
CREATE DATABASE IF NOT EXISTS db_moda_fitness_feminina;
USE db_moda_fitness_feminina;

-- 2. Criação da tabela de produtos com 5 atributos relevantes e verificar a criação no Select
CREATE TABLE IF NOT EXISTS tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL COMMENT 'Nome do produto',
    categoria VARCHAR(50) NOT NULL COMMENT 'Categoria do produto',
    tamanho CHAR(2) NOT NULL COMMENT 'Tamanho (PP, P, M, G, GG)',
    preco DECIMAL(10,2) NOT NULL COMMENT 'Preço do produto',
    estoque INT NOT NULL DEFAULT 0 COMMENT 'Quantidade em estoque'
);

SELECT * FROM tb_produtos;

-- 3. Inserção de 8 registros na tabela de produtos
INSERT INTO tb_produtos (nome, categoria, tamanho, preco, estoque) VALUES
('Top Esportivo de Alça Fina', 'Tops', 'P', 89.90, 50),
('Legging de Alta Compressão', 'Leggings', 'M', 349.90, 30),
('Conjunto de Treino Premium', 'Conjuntos', 'G', 599.90, 15),
('Shorts de Compressão', 'Shorts', 'GG', 199.90, 40),
('Top Esportivo com Suporte', 'Tops', 'M', 129.90, 35),
('Calça Legging Transpirável', 'Leggings', 'P', 289.90, 25),
('Jaqueta Corta-Vento', 'Casacos', 'G', 459.90, 20),
('Conjunto de Yoga', 'Conjuntos', 'M', 399.90, 18);

-- 4. SELECT para produtos com valor maior que 500
SELECT * FROM tb_produtos WHERE preco > 500.00;

-- 5. SELECT para produtos com valor menor que 500
SELECT * FROM tb_produtos WHERE preco < 500.00;

-- 6. Atualização de um registro (aumento de preço no Top Esportivo com Suporte)
UPDATE tb_produtos SET preco = 149.90 WHERE id = 5;

-- Verificação da atualização
SELECT * FROM tb_produtos WHERE id = 5;

-- Extra: Aumentar o estoque (aumento do estoque Top Esportivo com Suporte)
UPDATE tb_produtos 
SET estoque = estoque + 20  
WHERE id = 5;  

-- Verificação da atualização
SELECT id, nome, estoque 
FROM tb_produtos 
WHERE id = 5;

-- Verificação da tabela completa
SELECT * FROM tb_produtos;