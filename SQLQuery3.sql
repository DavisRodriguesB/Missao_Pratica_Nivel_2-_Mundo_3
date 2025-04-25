-- Criar o banco de dados
CREATE DATABASE sistema_vendas;
GO

-- Usar o banco criado
USE sistema_vendas;
GO

-- Tabela de usuários (operadores)
CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);
GO

-- Tabela de pessoas (física ou jurídica)
CREATE TABLE pessoas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(10) CHECK (tipo IN ('FISICA', 'JURIDICA')) NOT NULL,
    cpf VARCHAR(14),  -- usado se for FISICA
    cnpj VARCHAR(18), -- usado se for JURIDICA
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(100)
);
GO

-- Tabela de produtos
CREATE TABLE produtos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL
);
GO

-- Tabela de compras
CREATE TABLE compras (
    id INT IDENTITY(1,1) PRIMARY KEY,
    produto_id INT NOT NULL,
    operador_id INT NOT NULL,
    fornecedor_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    data_compra DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    FOREIGN KEY (operador_id) REFERENCES usuarios(id),
    FOREIGN KEY (fornecedor_id) REFERENCES pessoas(id)
    -- Validação se é pessoa jurídica: feita na aplicação
);
GO

-- Tabela de vendas
CREATE TABLE vendas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    produto_id INT NOT NULL,
    operador_id INT NOT NULL,
    cliente_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    data_venda DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    FOREIGN KEY (operador_id) REFERENCES usuarios(id),
    FOREIGN KEY (cliente_id) REFERENCES pessoas(id)
    -- Validação se é pessoa física: feita na aplicação
);
GO
