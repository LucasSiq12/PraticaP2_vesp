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