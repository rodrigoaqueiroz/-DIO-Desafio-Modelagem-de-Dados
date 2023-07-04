CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

DROP TABLE IF EXISTS OsPecas;
DROP TABLE IF EXISTS Autorizacao;
DROP TABLE IF EXISTS ReferenciaPrecos;
DROP TABLE IF EXISTS OdServico;
DROP TABLE IF EXISTS PessoaFisica;
DROP TABLE IF EXISTS PessoaJuridica;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Veiculo;
DROP TABLE IF EXISTS EqpMecanicos;
DROP TABLE IF EXISTS Mecanico;
DROP TABLE IF EXISTS Conserto;
DROP TABLE IF EXISTS Revisao;
DROP TABLE IF EXISTS Servicos;
DROP TABLE IF EXISTS Pecas;

CREATE TABLE Mecanico(
    idMecanico INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45) NOT NULL,
    Especialidade VARCHAR(45) NOT NULL
);
DESC Mecanico;

CREATE TABLE EqpMecanicos(
    idEqpMecanicos INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_Mecanico_EqpMecanicos FOREIGN KEY (idEqpMecanicos) REFERENCES Mecanico(idMecanico)
);
DESC EqpMecanicos;

CREATE TABLE Revisao(
    idRevisao INT auto_increment PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL
);
DESC Revisao;

CREATE TABLE Conserto(
    idConserto INT auto_increment PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL
);
DESC Conserto;

CREATE TABLE Veiculo (
    idVeiculo INT auto_increment PRIMARY KEY,
    idRevisao INT,
    Placa CHAR(7) NOT NULL,
    CONSTRAINT placa_idVeiculo UNIQUE (idVeiculo, Placa),
    CONSTRAINT fk_eqp_mecanicos_veiculo FOREIGN KEY (idVeiculo) REFERENCES EqpMecanicos(idEqpMecanicos),
    CONSTRAINT fk_conserto_veiculo FOREIGN KEY (idVeiculo) REFERENCES Conserto(idConserto),
    CONSTRAINT fk_revisao_veiculo FOREIGN KEY (idRevisao) REFERENCES Revisao(idRevisao)
);
DESC Veiculo;

CREATE TABLE Clientes(
    idClientes INT auto_increment PRIMARY KEY,
    idVeiculo INT,
    CONSTRAINT fk_veiculo_clientes FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);
DESC Clientes;

-- PESSOA FISICA
CREATE TABLE PessoaFisica(
    idPessoaFisica INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(45),
    Contato CHAR(11)
);
ALTER TABLE PessoaFisica ADD CONSTRAINT unique_cpf_PessoaFisica UNIQUE (CPF);

ALTER TABLE PessoaFisica ADD CONSTRAINT fk_idClientes_pf FOREIGN KEY (idPessoaFisica) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_cliente_pf_PessoaFisica FOREIGN KEY (idPessoaFisica) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_veiculo_pf_PessoaFisica FOREIGN KEY (idPessoaFisica) REFERENCES Veiculo(idVeiculo);

DESC PessoaFisica;

CREATE TABLE PessoaJuridica(
    idPessoaJuridica INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Endereco VARCHAR(45),
    Contato CHAR(11),
    CONSTRAINT unique_cnpj_PessoaJuridica UNIQUE (CNPJ)
);
ALTER TABLE PessoaJuridica ADD CONSTRAINT fk_clientes_pj_PessoaJuridica FOREIGN KEY (idPessoaJuridica) REFERENCES Clientes(idClientes),
ADD CONSTRAINT fk_veiculo_pj_PessoaJuridica FOREIGN KEY (idPessoaJuridica) REFERENCES Veiculo(idVeiculo);

DESC PessoaJuridica;

CREATE TABLE OdServico(
    idOdServico INT auto_increment PRIMARY KEY,
    DataEmissao DATE,
    ValorServico FLOAT NOT NULL,
    ValorPeca FLOAT NOT NULL,
    ValorTotal FLOAT NOT NULL,
    Status ENUM('AGUARDANDO', 'EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO'),
    DataConclusao DATE,
    CONSTRAINT fk_eqp_mecanicos_OdServico FOREIGN KEY (idOdServico) REFERENCES EqpMecanicos(idEqpMecanicos),
    CONSTRAINT fk_cliente_OdServico FOREIGN KEY (idOdServico) REFERENCES Clientes(idClientes),
    CONSTRAINT fk_veiculo_OdServico FOREIGN KEY (idOdServico) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_conserto_OdServico FOREIGN KEY (idOdServico) REFERENCES Conserto(idConserto),
    CONSTRAINT fk_revisao_OdServico FOREIGN KEY (idOdServico) REFERENCES Revisao(idRevisao)
);
DESC OdServico;

CREATE TABLE ReferenciaPrecos(
    idReferenciaPrecos INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_referencia_precos_ReferenciaPrecos FOREIGN KEY (idReferenciaPrecos) REFERENCES OdServico(idOdServico)
);
DESC ReferenciaPrecos;

CREATE TABLE Autorizacao(
    idAutorizacao INT auto_increment PRIMARY KEY,
    Autorizado BOOL DEFAULT FALSE,
    CONSTRAINT fk_autorizacao_cliente_Autorizacao FOREIGN KEY (idAutorizacao) REFERENCES Clientes(idClientes),
    CONSTRAINT fk_autorizacao_veiculo_Autorizacao FOREIGN KEY (idAutorizacao) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_autorizacao_odservico_Autorizacao FOREIGN KEY (idAutorizacao) REFERENCES OdServico(idOdServico)
);
DESC Autorizacao;

CREATE TABLE Pecas(
    idPecas INT auto_increment PRIMARY KEY,
    Descricao VARCHAR(45),
    Valor FLOAT NOT NULL
);
DESC Pecas;

CREATE TABLE OsPecas(
    idOsPecas INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_pecas_OsPecas FOREIGN KEY (idOsPecas) REFERENCES Pecas(idPecas),
    CONSTRAINT fk_os_pecas_OsPecas FOREIGN KEY (idOsPecas) REFERENCES OdServico(idOdServico)
);
DESC OsPecas;

CREATE TABLE Servicos(
    idServicos INT auto_increment PRIMARY KEY,
    Descricao VARCHAR(45),
    Valor FLOAT NOT NULL
);
DESC Servicos;

CREATE TABLE OdServico2(
    idOdServico INT auto_increment PRIMARY KEY,
    CONSTRAINT fk_servicos_OdServico2 FOREIGN KEY (idOdServico) REFERENCES Servicos(idServicos),
    CONSTRAINT fk_os_servicos_OdServico2 FOREIGN KEY (idOdServico) REFERENCES OdServico(idOdServico)
);
DESC OdServico2;
