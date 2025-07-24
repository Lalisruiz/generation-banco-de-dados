-- Remove o banco de dados existente (se necessário)
 -- DROP DATABASE IF EXISTS db_curso_da_minha_vida;

-- 1. Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

-- 2. Criação da tabela tb_categorias com 2 atributos além da PK
CREATE TABLE IF NOT EXISTS tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    nivel_dificuldade VARCHAR(20) NOT NULL,
    area_conhecimento VARCHAR(50) NOT NULL
);

-- 3. Criação da tabela tb_cursos com 4 atributos além da PK
CREATE TABLE IF NOT EXISTS tb_cursos (
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    instrutor VARCHAR(50) NOT NULL,
    carga_horaria INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

-- 4. Inserção de 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (nome_categoria, nivel_dificuldade, area_conhecimento) VALUES 
('Programação', 'Intermediário', 'Tecnologia'),
('Front-end', 'Iniciante', 'Desenvolvimento Web'),
('Back-end', 'Avançado', 'Desenvolvimento Web'),
('Data Science', 'Avançado', 'Ciência de Dados'),
('Design UX/UI', 'Intermediário', 'Design Digital');

-- 5. Inserção de 8 registros na tabela tb_cursos
INSERT INTO tb_cursos (nome, instrutor, carga_horaria, preco, descricao, id_categoria) VALUES
('JavaScript Básico', 'Ana Silva', 40, 450.00, 'Curso introdutório de JavaScript', 1),
('React Avançado', 'Carlos Oliveira', 60, 850.00, 'Domine React com Hooks e Context API', 2),
('Node.js Essencial', 'Mariana Costa', 50, 750.00, 'Back-end com Node.js e Express', 3),
('Python para Análise de Dados', 'Fernando Santos', 80, 1200.00, 'Pandas, NumPy e visualização de dados', 4),
('Design de Interfaces', 'Patrícia Nunes', 45, 950.00, 'Princípios de UI/UIX moderno', 5),
('JavaScript Avançado', 'Ricardo Alves', 70, 1100.00, 'ES6+, Async/Await e Design Patterns', 1),
('HTML/CSS Moderno', 'Juliana Pereira', 30, 650.00, 'Flexbox, Grid e responsividade', 2),
('Banco de Dados com SQL', 'Lucas Martins', 55, 900.00, 'SQL completo do básico ao avançado', 3);

-- 6. SELECT para cursos com valor maior que R$ 500,00
SELECT * FROM tb_cursos WHERE preco > 500.00;

-- 7. SELECT para cursos com valor entre R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

-- 8. SELECT para cursos com a letra 'J' no nome
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

-- 9. INNER JOIN entre tb_cursos e tb_categorias
SELECT 
    c.nome AS curso,
    c.instrutor,
    c.preco,
    cat.nome_categoria AS categoria,
    cat.nivel_dificuldade
FROM tb_cursos c 
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria;

-- 10. INNER JOIN para cursos de Programação
SELECT 
    c.nome AS curso,
    c.carga_horaria AS horas,
    c.preco,
    cat.nivel_dificuldade
FROM tb_cursos c 
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria
WHERE cat.nome_categoria = 'Programação';

-- EXTRA: Relatório completo de cursos por categoria
SELECT '=== RELATÓRIO POR CATEGORIA ===' AS info;
SELECT 
    cat.nome_categoria AS categoria,
    COUNT(c.id_curso) AS quantidade_cursos,
    CONCAT('R$ ', FORMAT(MIN(c.preco), 2)) AS menor_preco,
    CONCAT('R$ ', FORMAT(AVG(c.preco), 2)) AS preco_medio,
    CONCAT('R$ ', FORMAT(MAX(c.preco), 2)) AS maior_preco
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria
GROUP BY cat.nome_categoria
ORDER BY preco_medio DESC;

