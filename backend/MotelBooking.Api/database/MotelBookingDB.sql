-- Criar o banco de dados
CREATE DATABASE MotelBookingDB;
GO

-- Usar o banco de dados
USE MotelBookingDB;
GO

-- Criar tabela de Usuários
CREATE TABLE Usuarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    SenhaHash NVARCHAR(255) NOT NULL,
    DataCriacao DATETIME DEFAULT GETDATE()
);
GO

-- Criar tabela de Motéis
CREATE TABLE Moteis (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(255) NOT NULL,
    Cidade NVARCHAR(100) NOT NULL,
    Estado NVARCHAR(50) NOT NULL
);
GO

-- Criar tabela de Tipos de Suítes
CREATE TABLE TiposSuíte (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Descricao NVARCHAR(255),
    PrecoPorNoite DECIMAL(10,2) NOT NULL
);
GO

-- Criar tabela de Suítes
CREATE TABLE Suites (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    MotelId INT NOT NULL,
    TipoSuíteId INT NOT NULL,
    Numero NVARCHAR(20) NOT NULL,
    FOREIGN KEY (MotelId) REFERENCES Moteis(Id) ON DELETE CASCADE,
    FOREIGN KEY (TipoSuíteId) REFERENCES TiposSuíte(Id) ON DELETE CASCADE
);
GO

-- Criar tabela de Clientes
CREATE TABLE Clientes (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    CPF NVARCHAR(14) UNIQUE NOT NULL,
    Telefone NVARCHAR(20) NOT NULL
);
GO

-- Criar tabela de Reservas
CREATE TABLE Reservas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ClienteId INT NOT NULL,
    SuiteId INT NOT NULL,
    DataCheckin DATETIME NOT NULL,
    DataCheckout DATETIME NOT NULL,
    ValorTotal DECIMAL(10,2) NOT NULL,
    DataReserva DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id) ON DELETE CASCADE,
    FOREIGN KEY (SuiteId) REFERENCES Suites(Id) ON DELETE CASCADE
);
GO

-- Criar índice para otimizar consultas de faturamento
CREATE INDEX IDX_Reservas_DataCheckin ON Reservas (DataCheckin);
GO

-- Criar índice para otimizar busca por data na listagem de reservas
CREATE INDEX IDX_Reservas_DataCheckout ON Reservas (DataCheckout);
GO

-- Criar usuário de exemplo (senha fictícia "123456" criptografada)
INSERT INTO Usuarios (Nome, Email, SenhaHash) 
VALUES ('Admin', 'admin@email.com', 'hashed_password_aqui');
GO

-- Criar dados fictícios para testes (Opcional)
INSERT INTO Moteis (Nome, Endereco, Cidade, Estado) VALUES 
('Motel Lua Azul', 'Av. das Estrelas, 123', 'São Paulo', 'SP'),
('Motel Encanto', 'Rua dos Sonhos, 456', 'Rio de Janeiro', 'RJ');
GO

INSERT INTO TiposSuíte (Nome, Descricao, PrecoPorNoite) VALUES 
('Suíte Standard', 'Quarto simples, confortável', 150.00),
('Suíte Luxo', 'Quarto luxuoso com hidromassagem', 300.00);
GO

INSERT INTO Suites (MotelId, TipoSuíteId, Numero) VALUES 
(1, 1, '101A'), (1, 2, '102B'), 
(2, 1, '201A'), (2, 2, '202B');
GO

INSERT INTO Clientes (Nome, CPF, Telefone) VALUES 
('João Silva', '123.456.789-00', '(11) 99999-1111'),
('Maria Oliveira', '987.654.321-00', '(21) 98888-2222');
GO

INSERT INTO Reservas (ClienteId, SuiteId, DataCheckin, DataCheckout, ValorTotal) VALUES 
(1, 1, '2024-02-01 14:00', '2024-02-02 12:00', 150.00),
(2, 2, '2024-02-05 18:00', '2024-02-06 12:00', 300.00);
GO
