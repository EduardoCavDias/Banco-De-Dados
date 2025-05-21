CREATE TABLE Clientes (
    ID INTEGER PRIMARY KEY,
    nomeCliente TEXT,
    emailCliente TEXT
);

CREATE TABLE Compras (
    CompraID INTEGER PRIMARY KEY,
    ClienteID INTEGER,
    NomeLivro TEXT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (nomeCliente, emailCliente) VALUES 
('Alice Santos', 'alice@email.com'),
('Bruno Lima', 'bruno@email.com'),
('Carla Souza', 'carla@email.com');

-- Inserindo dados na tabela Compras
INSERT INTO Compras (ClienteID, NomeLivro) VALUES 
(1, 'O Senhor dos Anéis'),
(2, '1984'),
(3, 'Dom Quixote'),
(1, 'Harry Potter'),
(2, 'O Pequeno Príncipe');

SELECT * FROM Clientes;

SELECT Clientes.nomeCliente, Compras.NomeLivro
FROM Compras
INNER JOIN Clientes ON Compras.ClienteID = Clientes.ID;
