SELECT * FROM Mecanico;

SELECT Nome, Especialidade FROM Mecanico;

SELECT * FROM Veiculo;

SELECT Placa FROM Veiculo;

SELECT * FROM Clientes;

SELECT idClientes FROM Clientes;

SELECT * FROM PessoaFisica;

SELECT Nome, CPF FROM PessoaFisica;

SELECT * FROM OdServico;

SELECT DataEmissao, ValorTotal FROM OdServico;

SELECT Mecanico.Nome, Revisao.Descricao
FROM EqpMecanicos
INNER JOIN Mecanico ON EqpMecanicos.idEqpMecanicos = Mecanico.idMecanico
INNER JOIN Veiculo ON EqpMecanicos.idEqpMecanicos = Veiculo.idVeiculo
INNER JOIN Revisao ON Veiculo.idRevisao = Revisao.idRevisao;

SELECT Veiculo.*, Clientes.idClientes
FROM Veiculo
LEFT JOIN Clientes ON Veiculo.idVeiculo = Clientes.idVeiculo;

SELECT Clientes.*, Veiculo.idVeiculo
FROM Clientes
RIGHT JOIN Veiculo ON Clientes.idVeiculo = Veiculo.idVeiculo;
