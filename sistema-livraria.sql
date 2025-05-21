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

