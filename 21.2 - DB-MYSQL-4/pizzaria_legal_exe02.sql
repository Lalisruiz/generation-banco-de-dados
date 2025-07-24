-- 1. Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

-- 2. Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_pizza VARCHAR(50) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    descricao VARCHAR(100)
);

-- 3. Criação da tabela tb_pizzas
CREATE TABLE IF NOT EXISTS tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ingredientes TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    borda_recheada BOOLEAN DEFAULT FALSE,
    tempo_preparo INT NOT NULL, -- em minutos
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- 4. Inserção de dados na tabela tb_categorias (5 registros atualizados)
INSERT INTO tb_categorias (tipo_pizza, tamanho, descricao) VALUES 
('Clássica Vegana', 'Grande', 'Versões veganas de sabores conhecidos'),
('Doce Vegana', 'Média', 'Pizzas doces 100% vegetais'),
('Especial da Casa', 'Grande', 'Combinações criativas da pizzaria'),
('Premium Vegana', 'Grande', 'Ingredientes gourmet e importados'),
('Integral Vegana', 'Média', 'Massa integral e ingredientes saudáveis');

-- 5. Inserção de dados na tabela tb_pizzas (8 registros veganos atualizados)
INSERT INTO tb_pizzas (nome, ingredientes, preco, borda_recheada, tempo_preparo, id_categoria) VALUES
('Margherita Vegana', 'Queijo de castanha, tomate, manjericão fresco', 42.00, FALSE, 20, 1), -- Pizza mais barata
('Calabresa Vegana', 'Queijo vegano, calabresa vegetal, cebola, azeitonas', 59.90, TRUE, 30, 1),
('4 Queijos Veganos', 'Queijo de caju, queijo de amêndoa, queijo de batata-doce, parmesão vegano', 79.90, TRUE, 35, 4),
('PopVegan Morango', 'Chocolate vegano, morangos frescos, leite condensado de coco', 49.90, FALSE, 20, 2),
('Baiana Vegana', 'Proteína de soja temperada, queijo vegano, pimentão, cebola roxa', 69.90, TRUE, 40, 1),
('Rúcula com Tomate Seco Vegana', 'Queijo de castanha, rúcula orgânica, tomate seco, nozes', 55.00, FALSE, 30, 3),
('Cogumelos Especiais Vegana', 'Shimeji, shiitake, champignon, queijo vegano, alecrim', 75.50, TRUE, 35, 4),
('Frango Vegano', 'Proteína de ervilha, catupiry vegano, milho, azeitonas', 65.90, TRUE, 40, 1);

-- 6. SELECT para pizzas com valor maior que R$ 45,00
SELECT '=== PIZZAS ACIMA DE R$45 (exceto Margherita Vegana) ===' AS info;
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- 7. SELECT para pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT '=== PIZZAS ENTRE R$50 E R$100 ===' AS info;
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- 8. SELECT para pizzas com a letra 'M' no nome
SELECT '=== PIZZAS COM LETRA M (Margherita e Morango) ===' AS info;
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

-- 9. INNER JOIN entre tb_pizzas e tb_categorias
SELECT '=== TODAS PIZZAS COM SUAS CATEGORIAS ===' AS info;
SELECT p.nome, p.ingredientes, p.preco, c.tipo_pizza, c.tamanho
FROM tb_pizzas p INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

-- 10. INNER JOIN para pizzas doces
SELECT '=== PIZZAS DOCES VEGANAS ===' AS info;
SELECT p.nome, p.ingredientes, p.preco, c.tamanho
FROM tb_pizzas p INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.tipo_pizza = 'Doce Vegana';

-- EXTRA: Consulta adicional: Pizzas Premium Veganas
SELECT '=== PIZZAS PREMIUM VEGANAS ===' AS info;
SELECT nome, preco, ingredientes 
FROM tb_pizzas 
WHERE id_categoria = (SELECT id_categoria FROM tb_categorias WHERE tipo_pizza = 'Premium Vegana');