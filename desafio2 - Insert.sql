INSERT INTO Mecanico (Nome, Endereco, Especialidade) VALUES
    ('John Doe', '123 Main St', 'Engine Repair'),
    ('Jane Smith', '456 Oak Ave', 'Brake Service'),
    ('Michael Johnson', '789 Elm Rd', 'Electrical Systems');

INSERT INTO EqpMecanicos () VALUES (), (), ();

INSERT INTO Revisao (Descricao) VALUES
    ('Oil Change'),
    ('Tire Rotation'),
    ('Air Filter Replacement');

INSERT INTO Conserto (Descricao) VALUES
    ('Brake Pad Replacement'),
    ('Suspension Repair'),
    ('Exhaust System Maintenance');

INSERT INTO Veiculo (idRevisao, Placa) VALUES
    (1, 'ABC123'),
    (2, 'DEF456'),
    (3, 'GHI789');

INSERT INTO Clientes (idVeiculo) VALUES
    (1),
    (2),
    (3);

INSERT INTO PessoaFisica (Nome, CPF, Endereco, Contato) VALUES
    ('John Smith', '12345678901', '321 Elm St', '9876543210'),
    ('Jane Doe', '98765432109', '654 Oak Ave', '0123456789');

INSERT INTO PessoaJuridica (RazaoSocial, CNPJ, Endereco, Contato) VALUES
    ('ABC Company', '12345678901234', '789 Main St', '5678901234'),
    ('XYZ Corporation', '98765432109876', '456 Oak Ave', '4321098765');

INSERT INTO OdServico (DataEmissao, ValorServico, ValorPeca, ValorTotal, Status, DataConclusao) VALUES
    ('2023-07-01', 100.0, 50.0, 150.0, 'AGUARDANDO', NULL),
    ('2023-07-02', 200.0, 75.0, 275.0, 'EM ANDAMENTO', NULL),
    ('2023-07-03', 150.0, 60.0, 210.0, 'CONCLUIDO', '2023-07-03');

INSERT INTO ReferenciaPrecos () VALUES (), (), ();

INSERT INTO Autorizacao (Autorizado) VALUES
    (TRUE),
    (FALSE),
    (TRUE);

INSERT INTO Pecas (Descricao, Valor) VALUES
    ('Oil Filter', 10.0),
    ('Brake Pads', 50.0),
    ('Air Filter', 20.0);

INSERT INTO OsPecas () VALUES (), (), ();

INSERT INTO Servicos (Descricao, Valor) VALUES
    ('Engine Tune-Up', 100.0),
    ('Wheel Alignment', 75.0),
    ('Electrical Diagnostics', 150.0);

INSERT INTO OdServico2 () VALUES (), (), ();
