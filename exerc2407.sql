-- Aula 24.07
-- Consultas

CREATE DATABASE loja_db;
SHOW DATABASES;
USE loja_db;

-- Tabelas: vendedor, endereço, categoria, produto
-- vendedor-endereço (1:N), categoria-produto (1:N), vendedor-produto (1:N)

CREATE TABLE vendedor(
	idVendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    sobrenome VARCHAR(120) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    dataNascimento DATE
);

CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    fkVendedor INT NOT NULL,
    FOREIGN KEY (fkVendedor)
	REFERENCES vendedor (idVendedor)
);

CREATE TABLE categoria(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE produto(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    descricao TEXT NOT NULL,
    percentualDesconto DECIMAL(4, 2) DEFAULT(0.0), -- 0.00 até 99,99
    validadeDesconto DATE,
    estoque INT NOT NULL,
    fkVendedor INT NOT NULL,
    FOREIGN KEY(fkVendedor) REFERENCES vendedor(idVendedor),
    fkCategoria INT NOT NULL,
    FOREIGN KEY(fkCategoria) REFERENCES categoria(idCategoria)
);

INSERT INTO vendedor (nome, sobrenome, email, dataNascimento)
VALUES 
    ('João', 'Silva', 'joao.silva@gmail.com', '1990-01-01'),
    ('Maria', 'Santos', 'maria.santos@hotmail.com', '1991-02-02'),
    ('Pedro', 'Ferreira', 'pedro.ferreira@yahoo.com', '1992-03-03'),
    ('Ana', 'Gomes', 'ana.gomes@outlook.com', '1993-04-04'),
    ('Lucas', 'Rodrigues', 'lucas.rodrigues@domain.com', '1994-05-05'),
    ('Laura', 'Almeida', 'laura.almeida@gmail.com', NULL),
    ('Carlos', 'Mendes', 'carlos.mendes@outlook.com', '1996-07-07'),
    ('Mariana', 'Fernandes', 'mariana.fernandes@yahoo.com', '1997-08-08'),
    ('Rafael', 'Pereira', 'rafael.pereira@domain.com', '1998-09-09'),
    ('Juliana', 'Lima', 'juliana.lima@gmail.com', NULL);
    
INSERT INTO endereco (uf, cidade, rua, cep, numero, fkVendedor)
VALUES 
    ('SP', 'São Paulo', 'Avenida Paulista', '01310100', '1000', 1),
    ('RJ', 'Rio de Janeiro', 'Rua Copacabana', '22020001', '500', 2),
    ('MG', 'Belo Horizonte', 'Avenida Afonso Pena', '30130001', '200', 3),
    ('RS', 'Porto Alegre', 'Rua da Praia', '90010001', '300', 4),
    ('BA', 'Salvador', 'Avenida Oceânica', '40140130', '400', 5),
    ('SC', 'Florianópolis', 'Rua das Flores', '88010000', '100', 6),
    ('CE', 'Fortaleza', 'Avenida Beira Mar', '60170001', '200', 7),
    ('PR', 'Curitiba', 'Rua das Araucárias', '80010001', '300', 8),
    ('PE', 'Recife', 'Avenida Boa Viagem', '51011000', '400', 9),
    ('DF', 'Brasília', 'Rua das Palmeiras', '70070001', '500', 10);
    
INSERT INTO categoria (nome)
VALUES 
    ('Eletrônicos'),
    ('Roupas'),
    ('Alimentos'),
    ('Acessórios'),
    ('Móveis'),
    ('Beleza'),
    ('Livros'),
    ('Esportes'),
    ('Jogos'),
    ('Brinquedos');
    
INSERT INTO produto (nome, preco, descricao, percentualDesconto, validadeDesconto, estoque, fkVendedor, fkCategoria)
VALUES 
    ('Celular', 1500.00, 'Smartphone avançado', 0.0, NULL, 100, 1, 1),
    ('Camiseta', 29.99, 'Camiseta estampada', 0.2, '2023-07-13', 200, 2, 2),
    ('Arroz', 5.99, 'Arroz integral, pacote de 1kg', 0.1, '2023-07-12', 150, 3, 3),
    ('Colar', 49.99, 'Colar de pérolas', 0.3, '2023-07-08', 50, 4, 4),
    ('Sofá', 999.99, 'Sofá reclinável de couro', 0.4, '2023-07-11', 300, 5, 5),
    ('Perfume', 79.99, 'Perfume masculino', 0.1, '2023-07-09', 250, 6, 6),
    ('Livro', 19.99, 'Livro de fantasia', 0.2, '2023-07-07', 75, 7, 7),
    ('Bola', 9.99, 'Bola de basquete', 0.0, NULL, 125, 8, 8),
    ('PlayStation', 1999.99, 'Console de videogame', 0.4, '2023-07-06', 175, 9, 9),
    ('Quebra-Cabeça', 14.99, 'Quebra-Cabeça 1000 peças', 0.5, '2023-07-05', 225, 10, 10),
    ('Headphone', 99.99, 'Fone de ouvido sem fio', 0.3, '2023-07-15', 100, 1, 1),
    ('Vestido', 49.99, 'Vestido de festa longo', 0.2, '2023-07-15', 150, 2, 2),
    ('Chocolate', 4.99, 'Chocolate ao leite, barra de 100g', 0.1, '2023-07-15', 200, 3, 3),
    ('Relógio', 89.99, 'Relógio de pulso masculino', 0.0, NULL, 50, 4, 4),
    ('Cama', 799.99, 'Cama de casal com colchão', 0.4, '2023-07-15', 300, 5, 5),
    ('Maquiagem', 59.99, 'Kit de maquiagem profissional', 0.1, '2023-07-15', 250, 6, 6),
    ('Romance', 14.99, 'Livro de romance', 0.2, '2023-07-15', 75, 7, 7),
    ('Bicicleta', 149.99, 'Bicicleta urbana', 0.3, '2023-07-15', 125, 8, 8),
    ('Xbox', 1799.99, 'Console de videogame', 0.4, '2023-07-15', 175, 9, 9),
    ('Lego', 24.99, 'Kit de montar Lego', 0.5, '2023-07-15', 225, 10, 10);
    
SELECT * FROM vendedor;
SELECT * FROM endereco;
SELECT * FROM categoria;
SELECT * FROM produto;

-- Projeção = definir o que vai ser exibido
SELECT 1 + 1; -- calcular a expressão e o resultado será exibido
SELECT CURDATE(); -- exibe a data do dia
SELECT 50/3 AS resultado1, 10/3 AS resultado2;
SELECT * FROM vendedor; -- exibe todas as colunas da tabela vendedor
SELECT nome FROM vendedor; -- exibe apenas a coluna 'nome'
SELECT nome, email FROM vendedor; -- exibe 'nome' e 'email'
SELECT CONCAT(nome, " ", sobrenome) AS nomeCompleto FROM vendedor;
SELECT nome, dataNascimento AS aniversario FROM vendedor;
-- AS => apelido para as colunas na hora de exibir

-- Seleção = buscar porções dos dados

SELECT * -- exibir todas as colunas
FROM vendedor -- da tabela vendedor
WHERE idVendedor = 5; -- onde o idVendedor é 5

SELECT *
FROM vendedor
WHERE idVendedor != 5;

SELECT nome, sobrenome AS sobrenomeVendedor, dataNascimento AS aniversario
FROM vendedor
WHERE idVendedor = 3;

SELECT nome, preco
FROM produto
WHERE preco < 100;

SELECT *
FROM produto
WHERE preco >= 500;

SELECT *
FROM produto
WHERE estoque <= 50;

-- =, !=, >, <, >= e <=

SELECT *
FROM produto
WHERE nome = "colar"; -- Seleciona as linhas em que o nome é igual a 'Colar'

SELECT *
FROM produto
WHERE validadeDesconto IS NULL; -- Seleciona os produtos que a validadeDesconto é nula

SELECT *
FROM vendedor
WHERE dataNascimento IS NOT NULL; -- Seleciona os produtos que dataNascimento possui valor

SELECT *
FROM produto
WHERE preco >= 100 AND preco <= 1000;

SELECT *
FROM produto
WHERE estoque <= 500 AND percentualDesconto > 0.20;

SELECT *
FROM endereco
WHERE uf = "CE" OR uf = "SP" OR uf = "MG" OR uf = "BA";

SELECT *
FROM produto
WHERE estoque <= 50 OR percentualDesconto > 0.20;

-- BETWEEN
SELECT *
FROM produto
WHERE preco BETWEEN 100 AND 1000; -- Seleciona os produtos com preço de 100 até 1000

SELECT *
FROM produto
WHERE estoque BETWEEN 10 AND 50;

SELECT *
FROM vendedor
WHERE dataNascimento BETWEEN "1995-01-01" AND "2000-01-01";

SELECT *
FROM vendedor
WHERE dataNascimento < "1995-01-01";

-- IN = ajudar no uso do OR
SELECT *
FROM endereco
WHERE uf IN("CE", "SP", "MG", "BA");

SELECT *
FROM endereco
WHERE uf NOT IN("CE", "SP", "MG", "BA");

-- LIKE
SELECT *
FROM vendedor
WHERE sobrenome = "Sil"; -- comparação exata

SELECT *
FROM vendedor
WHERE sobrenome LIKE "sil%";

-- % indica o restante do texto

SELECT *
FROM vendedor
WHERE nome LIKE "j%"; -- nome começa com J

SELECT *
FROM vendedor
WHERE nome LIKE "%ana"; -- o nome termina com 'ana'

SELECT *
FROM produto
WHERE descricao LIKE "%masculino%"; -- "masculino" em qualquer lugar da descrição

SELECT *
FROM vendedor
WHERE nome LIKE "l%a"; -- começa com "l" e termina com "a"

-- Ordernação
SELECT *
FROM produto
ORDER BY preco; -- ASC = crescente

SELECT *
FROM produto
ORDER BY preco DESC; -- Ordem descrescente

SELECT nome, preco
FROM produto
WHERE estoque BETWEEN 50 AND 200
ORDER BY nome DESC; -- DESC (Z-A)

UPDATE vendedor
SET nome = "Maria"
WHERE idVendedor = 8;

SELECT idVendedor, nome, sobrenome, dataNascimento
FROM vendedor
WHERE dataNascimento > "1998-01-01"
ORDER BY nome, sobrenome; -- Se o nome for igual, utiliza sobrenome para ordenar

SELECT *
FROM vendedor
LIMIT 3; -- pagina 1

SELECT *
FROM vendedor
LIMIT 3 OFFSET 3; -- pagina 2

SELECT *
FROM vendedor
LIMIT 3 OFFSET 6; -- pagina 3

SELECT *
FROM vendedor
LIMIT 3 OFFSET 9; -- pagina 4

-- FROM > WHERE > ORDER BY > LIMIT
SELECT nome, preco, percentualDesconto * 100 AS porcentagem
FROM produto
WHERE percentualDesconto >= 0.5
ORDER BY preco DESC
LIMIT 5;

-- Filtrar os produtos com preço maior que 500:
SELECT * FROM produto
WHERE preco > 500;

-- Filtrar os produtos com preço entre 500 e 1000:
SELECT *
FROM produto
WHERE preco BETWEEN 500 AND 1000;

-- Filtrar os produtos do vendedor com ID = 7:
SELECT *
FROM produto
WHERE fkVendedor = 7;

-- Filtrar os vendedores com email (hotmail ou yahoo):
SELECT *
FROM vendedor
WHERE email LIKE '%@hotmail.com' OR email LIKE '%@yahoo.com';

-- Filtrar os produtos do vendedor com ID = 1 e calcular o preço final do produto com desconto:
SELECT nome, preco, preco * (1 - percentualDesconto) AS precoFinal
FROM produto
WHERE fkVendedor = 1;

-- Filtrar os produtos das categorias Roupas(2), Alimentos(3) e Acessórios(4):
SELECT *
FROM produto
WHERE fkCategoria IN (2, 3, 4);

-- Listar o id dos vendedores do CE:
SELECT idVendedor
FROM endereco
WHERE uf = 'CE';

-- Listar os vendedores que nasceram após 2000:
SELECT *
FROM vendedor
WHERE YEAR(dataNascimento) > 2000;

-- Listar os vendedores que nasceram no mês atual:
SELECT *
FROM vendedor
WHERE MONTH(dataNascimento) = MONTH(CURDATE());

-- Filtre os produtos cujo estoque está entre 200 e 800. 
-- Ordene por preco decrescente, e limite a 5 registros:
SELECT *
FROM produto
WHERE estoque BETWEEN 200 AND 800
ORDER BY preco DESC
LIMIT 5;

-- Exiba nome, sobrenome e data de nascimento dos vendedores 
-- (renomear para aniversario), apenas os que nasceram entre 1993 e 1995, 
-- ordene por nome (ordem crescente) e limite a 20:
SELECT nome, sobrenome, dataNascimento AS aniversario
FROM vendedor
WHERE YEAR(dataNascimento) BETWEEN 1993 AND 1995
ORDER BY nome
LIMIT 20;

-- Exiba nome, preco, lucro total (preco * estoque) da tabela produto. 
-- Apenas os produtos com categoria 1, 2, 3 e com preço menor que 100. 
-- Ordene por nome crescente. Limite a 100:
SELECT nome, preco, preco * estoque AS lucroTotal
FROM produto
WHERE fkCategoria IN (1, 2, 3) AND preco < 100
ORDER BY nome
LIMIT 100;

-- Liste os produtos que possuem percentualDesconto maior que 0. 
-- Exiba as colunas nome, e uma chamada 'precoFinal' com o preco descontado. 
-- Ordene pelo maior percentual de desconto:
SELECT nome, preco, preco * (1 - percentualDesconto) AS precoFinal
FROM produto
WHERE percentualDesconto > 0
ORDER BY percentualDesconto DESC;

-- Liste os produtos que a data de validade do desconto já expirou. 
-- Ordene por data crescente:
SELECT *
FROM produto
WHERE validadeDesconto < CURDATE()
ORDER BY validadeDesconto ASC;









