CREATE PROCEDURE InserirCliente

    @idCliente char(5),
    @NomeCliente varchar (55),
    @CPFcliente char (11),
    @DataCliente date,
    @Telefone varchar (11),
    @Email varchar (55),
    @senhaCliente varchar (10)
AS
BEGIN
    INSERT INTO Cadastro_Cliente (id_Cliente, Nome_Cliente, CPF_Cliente, Data_NascCliente, Telefone, Email, senha_Cliente)
    VALUES (@idCliente, @NomeCliente, @CPFcliente, @DataCliente, @Telefone, @Email, @senhaCliente);
end;

create procedure InserirMesa
    @IdMesa char (2),
    @QuantiMesa varchar (6),
    @StatusMesa varchar (20)
as
begin
    insert into Mesa (id_Mesa, Quant_Pessoas, StatusMesa)
    values (@IdMesa, @QuantiMesa, @StatusMesa);
END;

create procedure InserirReserva
    @idReserva char (5),
    @dataReserva date,
    @horaInicio time,
    @horaFim time,
    @precoReserva float (4),
    @idMesa char (2),
    @idCliente char (5)
as
begin
    insert into Reserva (id_Reserva, Data_Reserva, Hora_Inicio, Hora_Fim, Preco_Reserva, id_Mesa, id_Reserva)
    values (@idReserva, @dataReserva, @horaInicio, @horaFim, @precoReserva, @idMesa, @idCliente);
end;

create procedure InserirPedido
    @idPedido char (5),
    @idMesa char (2),
    @idCliente char(5)
as
begin
    insert into Pedido (id_Pedido, id_Mesa, id_Cliente)
    values (@idPedido, @idMesa, @idCliente);
end;

create procedure InserirPrato
    @idPrato char (5),
    @idIngrediente char (5),
    @precoPrato float (5),
    @NomePrato varchar (20),
    @idPedido char (5),
    @idReserva char (3)
as
begin
    insert into Prato (id_Prato, id_Ingrediente, Preco_Prato, Nome_Prato, id_Pedido, id_Reserva)
    values (@idPrato, @idIngrediente, @precoPrato, @NomePrato, @idPedido, @idReserva);
end;

create procedure InserirIngrediente
    @idIngrediente char (5),
    @precoIngredinete float (6),
    @dataFabricacao date,
    @dataVencimento date,
    @descricao varchar (150),
    @idFornecedor char (5)
as
begin
 insert into Ingrediente (id_Ingrediente, Preco_Ingrediente, Data_Fabricacao, Data_Vencimento, Descricao, id_Fornecedor)
 values (@idIngrediente, @precoIngredinete, @dataFabricacao, @dataVencimento, @descricao, @idFornecedor);

end;

create procedure InserirFornecedor
    @idFornecedor char (5),
    @telFornecedor varchar(11),
    @emailFornecedor varchar(50),
    @nomeEmpresa varchar (50),
    @emailEmpresa varchar(50),
    @telEmpresa varchar(11),
    @idIngrediente char(5)
as
begin
    insert into Fornecedor (id_Fornecedor, Tel_Fornecedor, email_Fornecedor, Nome_Empresa, email_Empresa, Tel_Empresa, id_Ingrediente)
    values (@idFornecedor, @telFornecedor, @emailFornecedor, @nomeEmpresa, @emailEmpresa, @telEmpresa, @idIngrediente);
end;

create procedure InserirFuncionario
    @idFuncionario char (5),
    @nomeFuncionario varchar (55),
    @dataFuncionario date,
    @dataContrato date,
    @cpfFuncionario char (11),
    @telFuncionario varchar (11),
    @emailFuncionario varchar (50),
    @senhaFuncionario varchar (10),
    @idPedido char (3)
as
begin
 insert into Funcionario (id_Funcionario, Nome_Funcionario, Data_NascFunci, Data_Contratacao, CPF_Funcionario, Tel_Funcionario, email_Funcionario, senha_Funcionario, id_Pedido)
 values (@idFuncionario, @nomeFuncionario, @dataFuncionario, @dataContrato, @cpfFuncionario, @telFuncionario, @emailFuncionario, @senhaFuncionario, @idPedido);
end;

create procedure Nota
    @idNota char (5),
    @totalNota float (6),
    @idCliente char (5),
    @idMesa char (2),
    @idReserva char (3),
    @idPrato char (5)
as
begin
    insert into Nota (id_Nota, Total_Nota, id_Cliente, id_Mesa, id_Reserva, id_Prato)
    values (@idNota, @totalNota, @idCliente, @idMesa, @idReserva, @idPrato);
end;