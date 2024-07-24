CREATE DATABASE ecommerce_db;

USE ecommerce_db;

CREATE TABLE produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE venda (
    idVenda INT AUTO_INCREMENT PRIMARY KEY,
    fkProduto INT,
    quantidade INT NOT NULL,
    dataVenda DATE NOT NULL,
    FOREIGN KEY (fkProduto) REFERENCES produto(idProduto)
);

INSERT INTO produto (nome, descricao, preco, estoque) VALUES
("Camiseta", "Camiseta de algodão", 29.99, 50),
("Calça Jeans", "Calça jeans masculina", 79.90, 30),
("Tênis Esportivo", "Tênis para corrida", 129.99, 20);

INSERT INTO venda (fkProduto, quantidade, dataVenda) VALUES
(1, 10, "2024-07-22"),
(2, 5, "2024-07-23"),
(3, 2, "2024-07-24"),
(1, 3, "2024-07-24");

SELECT * FROM produto;
SELECT * FROM venda;

CREATE DATABASE pedidos_db;
USE pedidos_db;

CREATE TABLE usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    fkUsuario INT,
    dataPedido DATE NOT NULL,
    valorTotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
);

INSERT INTO usuario (nome, email, endereco, telefone) VALUES
("João Silva", "joao@example.com", "Rua A, 123", "(11) 9999-8888"),
("Maria Santos", "maria@example.com", "Av. B, 456", "(22) 9876-5432"),
("Pedro Oliveira", "pedro@example.com", "Travessa C, 789", "(33) 4567-1234");

INSERT INTO pedido (fkUsuario, dataPedido, valorTotal) VALUES
(1, "2024-07-22", 150.75),
(2, "2024-07-23", 89.99),
(3, "2024-07-24", 250.50),
(1, "2024-07-24", 75.00);

SELECT * FROM usuario;
SELECT * FROM pedido;

USE empresa_db;

CREATE TABLE departamento(
	idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL 
);

CREATE TABLE colaborador(
	idColaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL, 
    salario DECIMAL(10, 2) NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT

CREATE TABLE dependente (
    idDependente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    idade INT NOT NULL,
    fkColaborador INT NOT NULL,
    FOREIGN KEY(fkColaborador) REFERENCES colaborador(idColaborador)
);



