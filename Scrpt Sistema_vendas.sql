CREATE TABLE Vendas (
  idVendas INTEGER   NOT NULL ,
  produto_id INTEGER    ,
  operador_id INTEGER    ,
  cliente_id INTEGER    ,
  quantidade INTEGER    ,
  preco_unitario DECIMAL(10,2)    ,
  data_venda DATETIME      ,
PRIMARY KEY(idVendas));

COMMENT ON COLUMN Vendas.cliente_id IS 'Pessoa Física';



CREATE TABLE Compras (
  idCompras INTEGER   NOT NULL ,
  produto_id INTEGER    ,
  operador_id INTEGER    ,
  fornecedor_id INTEGER    ,
  quantidade INTEGER    ,
  preco_unitario DECIMAL(10,2)    ,
  data_compra DATETIME      ,
PRIMARY KEY(idCompras));

COMMENT ON COLUMN Compras.fornecedor_id IS 'Pessoa Jurídica';



CREATE TABLE Usuarios (
  idUsuarios INTEGER   NOT NULL ,
  Compras_idCompras INTEGER   NOT NULL ,
  Vendas_idVendas INTEGER   NOT NULL ,
  nome VARCHAR(100)    ,
  email VARCHAR(100)    ,
  senha VARCHAR(100)      ,
PRIMARY KEY(idUsuarios, Compras_idCompras, Vendas_idVendas)    ,
  FOREIGN KEY(Compras_idCompras)
    REFERENCES Compras(idCompras),
  FOREIGN KEY(Vendas_idVendas)
    REFERENCES Vendas(idVendas));


CREATE INDEX Usuarios_FKIndex1 ON Usuarios (Compras_idCompras);
CREATE INDEX Usuarios_FKIndex2 ON Usuarios (Vendas_idVendas);


CREATE INDEX IFK_Rel_01 ON Usuarios (Compras_idCompras);
CREATE INDEX IFK_Rel_04 ON Usuarios (Vendas_idVendas);


CREATE TABLE Pessoas (
  idPessoas INTEGER   NOT NULL ,
  Compras_idCompras INTEGER   NOT NULL ,
  Vendas_idVendas INTEGER   NOT NULL ,
  nome VARCHAR(100)    ,
  tipo VARCHAR(10)    ,
  cpf VARCHAR(14)    ,
  cnpj VARCHAR(18)    ,
  endereco VARCHAR(150)    ,
  telefone VARCHAR(20)    ,
  email VARCHAR(100)      ,
PRIMARY KEY(idPessoas, Compras_idCompras, Vendas_idVendas)    ,
  FOREIGN KEY(Compras_idCompras)
    REFERENCES Compras(idCompras),
  FOREIGN KEY(Vendas_idVendas)
    REFERENCES Vendas(idVendas));


CREATE INDEX Pessoas_FKIndex1 ON Pessoas (Compras_idCompras);
CREATE INDEX Pessoas_FKIndex2 ON Pessoas (Vendas_idVendas);

COMMENT ON COLUMN Pessoas.tipo IS 'F para Pessoa Física, J para Pessoa Jurídica';

CREATE INDEX IFK_Pessoa Jurídica ON Pessoas (Compras_idCompras);
CREATE INDEX IFK_Pessoa Física ON Pessoas (Vendas_idVendas);


CREATE TABLE Produtos (
  idProdutos INTEGER   NOT NULL ,
  Compras_idCompras INTEGER   NOT NULL ,
  Vendas_idVendas INTEGER   NOT NULL ,
  nome VARCHAR(100)    ,
  quantidade INTEGER    ,
  preco_venda DECIMAL(10,2)      ,
PRIMARY KEY(idProdutos, Compras_idCompras, Vendas_idVendas)    ,
  FOREIGN KEY(Compras_idCompras)
    REFERENCES Compras(idCompras),
  FOREIGN KEY(Vendas_idVendas)
    REFERENCES Vendas(idVendas));


CREATE INDEX Produtos_FKIndex1 ON Produtos (Compras_idCompras);
CREATE INDEX Produtos_FKIndex2 ON Produtos (Vendas_idVendas);


CREATE INDEX IFK_Rel_02 ON Produtos (Compras_idCompras);
CREATE INDEX IFK_Rel_05 ON Produtos (Vendas_idVendas);



