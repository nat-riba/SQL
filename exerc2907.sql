CREATE DATABASE livraria_db;
USE livraria_db;
CREATE TABLE autor (
    idAutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

INSERT INTO autor (nome, nacionalidade) VALUES 
('J.K. Rowling', 'Britânica'),
('George R.R. Martin', 'Americano'),
('J.R.R. Tolkien', 'Britânico');

CREATE TABLE editora (
    idEditora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150)
);

INSERT INTO editora (nome, endereco) VALUES 
('Editora Exemplo 1', 'Rua das Flores, 123'),
('Editora Exemplo 2', 'Avenida Central, 456'),
('Editora Exemplo 3', 'Praça da Liberdade, 789');

CREATE TABLE livro (
    idLivro INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    anoPublicacao INT,
    genero VARCHAR(50),
    idEditora INT,
    FOREIGN KEY (idEditora) REFERENCES editora(idEditora)
);

INSERT INTO livro (ISBN, titulo, anoPublicacao, genero, idEditora) VALUES 
('978-0545010', 'Harry Potter e a Pedra Filosofal', 1997, 'Fantasia', 1),
('978-0553103', 'As Crônicas de Gelo e Fogo', 1996, 'Fantasia', 2),
('978-0261102', 'O Senhor dos Anéis', 1954, 'Fantasia', 3),
('978-0385504', 'O Código Da Vinci', 2003, 'Mistério', 1),
('978-0062315', 'A Guerra dos Tronos', 1996, 'Fantasia', 2);

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15)
);

INSERT INTO cliente (nome, email, telefone) VALUES 
('Ana Silva', 'ana.silva@example.com', '123456789'),
('Carlos Oliveira', 'carlos.oliveira@example.com', '987654321'),
('Maria Souza', 'maria.souza@example.com', '456123789'),
('João Santos', 'joao.santos@example.com', '321654987');

CREATE TABLE compras (
    idCompra INT AUTO_INCREMENT PRIMARY KEY,
    dataCompra DATE,
    idCliente INT,
    idLivro INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (idLivro) REFERENCES livro(idLivro)
);

INSERT INTO compras (dataCompra, idCliente, idLivro) VALUES 
('2024-07-10', 1, 1),
('2024-07-12', 2, 2),
('2024-07-15', 3, 3),
('2024-07-17', 4, 4),
('2024-07-20', 1, 5),
('2024-07-22', 2, 1);

CREATE TABLE autor_livro (
    idAutor INT,
    idLivro INT,
    PRIMARY KEY (idAutor, idLivro),
    FOREIGN KEY (idAutor) REFERENCES autor(idAutor),
    FOREIGN KEY (idLivro) REFERENCES livro(idLivro)
);

UPDATE editora
SET endereco = 'Nova Rua das Flores, 321'
WHERE idEditora = 1;

DELETE FROM livro
WHERE idLivro = 5;

SELECT * FROM livro
WHERE idEditora = 2;

SELECT l.*
FROM livro l
JOIN autor_livro al ON l.idLivro = al.idLivro
WHERE al.idAutor = 1;

SELECT c.*
FROM cliente c
JOIN compras comp ON c.idCliente = comp.idCliente
WHERE comp.idLivro = 1;

SELECT * FROM compras
WHERE dataCompra = '2024-07-10';

SELECT c.nome AS cliente, l.titulo AS livro
FROM cliente c
JOIN compras comp ON c.idCliente = comp.idCliente
JOIN livro l ON comp.idLivro = l.idLivro;

SELECT * FROM livro
ORDER BY titulo ASC;

SELECT comp.idCompra, c.nome AS cliente, l.titulo AS livro, comp.dataCompra
FROM compras comp
JOIN cliente c ON comp.idCliente = c.idCliente
JOIN livro l ON comp.idLivro = l.idLivro;

ALTER TABLE livro
ADD preco DECIMAL(10, 2);

UPDATE livro
SET preco = 29.90
WHERE idLivro = 1;

UPDATE livro
SET preco = 39.90
WHERE idLivro = 2;

UPDATE livro
SET preco = 49.90
WHERE idLivro = 3;

UPDATE livro
SET preco = 19.90
WHERE idLivro = 4;



