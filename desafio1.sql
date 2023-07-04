CREATE DATABASE Ecommerce;

USE Ecommerce;

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(
	idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45),
    Endereço VARCHAR(45),
	CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
    );
DESC Cliente;

DROP TABLE IF EXISTS Produto;
CREATE TABLE Produto(
	idProduto INT auto_increment PRIMARY KEY,
    Categoria VARCHAR(45),
    Descrição VARCHAR(45),
	Valor FLOAT
);
DESC Produto;

DROP TABLE IF EXISTS Pagamento;
CREATE TABLE Pagamento(
	idPagamento INT auto_increment PRIMARY KEY,
    PagamentoCliente INT,
    Cartão VARCHAR(45),
    Bandeira VARCHAR(45),
    Número VARCHAR(45),
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (PagamentoCliente) REFERENCES Cliente(idCliente)
);
DESC Pagamento;

DROP TABLE IF EXISTS Entrega;
CREATE TABLE Entrega(
	idEntrega INT auto_increment PRIMARY KEY,
    StatusEntrega BOOL,
    CodigoRastreio VARCHAR(45),
    DataEntrega DATE
);
DESC Entrega;

DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido(
	idPedido INT auto_increment PRIMARY KEY,
    StatusPedido BOOL DEFAULT FALSE,
    Frete FLOAT,
    Descrição VARCHAR(45),
    CONSTRAINT fk_entrega FOREIGN KEY (idPedido) REFERENCES Entrega(idEntrega)
);
DESC Pedido;

DROP TABLE IF EXISTS Estoque;
CREATE TABLE Estoque(
	idEstoque INT auto_increment PRIMARY KEY,
    Local VARCHAR(45)
);
DESC Estoque;

DROP TABLE IF EXISTS EstoqueProduto;
CREATE TABLE EstoqueProduto(
	idProduto INT PRIMARY KEY,
    idEstoqueProduto INT,
    Quantidade FLOAT,
    CONSTRAINT fk_estoque FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_produto_estoque FOREIGN KEY (idEstoqueProduto) REFERENCES Estoque(idEstoque)
);
DESC EstoqueProduto;

DROP TABLE IF EXISTS Fornecedor;
CREATE TABLE Fornecedor(
	idFornecedor INT auto_increment PRIMARY KEY,
    RazãoSocial VARCHAR(45),
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);
DESC Fornecedor;

DROP TABLE IF EXISTS Terceiro;
CREATE TABLE Terceiro(
	idTerceiro INT auto_increment PRIMARY KEY,
	RazãoSocial VARCHAR(45),
    Localização VARCHAR(45),
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);
DESC Terceiro;

DROP TABLE IF EXISTS PedidoProduto;
CREATE TABLE PedidoProduto(
	idPedido INT,
    idProduto INT,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedido FOREIGN KEY (idPedido) REFERENCES Terceiro(idTerceiro),
    CONSTRAINT fk_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
DESC PedidoProduto;

DROP TABLE IF EXISTS PedidoFornecedor;
CREATE TABLE PedidoFornecedor(
	idCompraFornecedor INT,
    idFornecedorPedido INT,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedido_forncedor FOREIGN KEY (idCompraFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_fornecedor_pedido FOREIGN KEY (idFornecedorPedido) REFERENCES Pedido(idPedido)
);
DESC PedidoFornecedor;

DROP TABLE IF EXISTS EstoqueFornecedor;
CREATE TABLE EstoqueFornecedor(
	idEstoqueFornecedor INT,
    idProdutoFornecedor INT,
    CONSTRAINT fk_estoque_fornecedor FOREIGN KEY (idEstoqueFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_produtos_fornecedor FOREIGN KEY (idProdutoFornecedor) REFERENCES Produto(idProduto)
);
DESC EstoqueFornecedor;


DROP TABLE IF EXISTS EstoqueTerceiro;
CREATE TABLE EstoqueTerceiro(
	idProdutosEstoque INT,
    idPOFornecedor INT,
    CONSTRAINT fk_produtos_estoque FOREIGN KEY (idProdutosEstoque) REFERENCES Produto(idProduto),
    CONSTRAINT fk_po_fornecedor FOREIGN KEY (idPOFornecedor) REFERENCES Terceiro(idTerceiro)
);
DESC EstoqueTerceiro;