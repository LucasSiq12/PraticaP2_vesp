CREATE PROCEDURE restaurante.sp_cliente
	@Nome_Cliente varchar (55),
	@CPF_Cliente char (11),
	@Data_NascCliente date,
	@Telefone varchar (11),
	@Email varchar (55),
	@Senha_Cliente varchar (10)
AS
BEGIN
	INSERT INTO Clientes (NOME, CPF, DATANASC, TELEFONE, EMAIL, SENHA)
	VALUES (@Nome_Cliente, @CPF_Cliente, @Data_NascCliente, @Telefone, @Email, @Senha_Cliente)
END;

CREATE PROCEDURE AtualizarCliente
	@novoNomeCliente varchar (55),
	@novoCPFcliente char (11),
	@novoDataNascCliente date,
	@novoTelefone varchar (11),
	@novoEmail varchar (55),
	@novoSenhaCliente varchar (10)
AS
BEGIN
	UPDATE Clientes
	SET NOME = @novoNomeCliente, CPF = @novoCPFcliente,
		DATANASC = @novoDataNascCliente, TELEFONE = @novoTelefone, EMAIL = @novoEmail,
		SENHA = @novoSenhaCliente
	WHERE ID = @id_cliente