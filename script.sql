CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    preco DECIMAL(10, 2),
    categoria VARCHAR(30)
)

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    produtos_id INTEGER REFERENCES produtos(id),
    quantidade INTEGER,
    data_venda DATE
)

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    email VARCHAR(50)
)

--
INSERT INTO produtos(nome, preco, categoria)
VALUES ('TV', 5000, 'Eletronicos')

INSERT INTO produtos(nome, preco, categoria)
VALUES ('Air max', 800, 'Tênis')

INSERT INTO produtos(nome, preco, categoria)
VALUES ('Playstation 5', 3000, 'Games')
--

INSERT INTO clientes(nome, email) 
VALUES ('Luffy', 'luffyreidospiratas@onepiece.com')

INSERT INTO clientes(nome, email) 
VALUES ('Gon', 'GonHunter@hunter.com')

INSERT INTO clientes(nome, email) 
VALUES ('Gojou', 'GojouOmaisForte@jjk.com')
--

INSERT INTO vendas(cliente_id, produtos_id, quantidade, data_venda)
VALUES (1, 1, 1, '1999-07-05');


INSERT INTO vendas(cliente_id, produtos_id, quantidade, data_venda)
VALUES (2,2,5, '2023-12-02')

INSERT INTO vendas(cliente_id, produtos_id, quantidade, data_venda)
VALUES (3,3,2, '2024-01-05')

--
-- contagem dos categorias -- 
SELECT categoria, COUNT(*) as contagem
FROM produtos
WHERE categoria IS NOT NULL
GROUP BY categoria 
ORDER BY contagem ASC;

-- 
-- Contagem de produtos 
SELECT produtos.nome as produto, SUM(vendas.quantidade) as quantidade_vendida
FROM vendas
JOIN produtos ON vendas.produtos_id = produtos.id
GROUP BY produtos.nome
ORDER BY quantidade_vendida DESC;
--
-- exibe tudo 
SELECT clientes.nome, produtos.nome, vendas.quantidade
from vendas
JOIN clientes on vendas.cliente_id = clientes.id
JOIN produtos on vendas.produtos_id = produtos.id





