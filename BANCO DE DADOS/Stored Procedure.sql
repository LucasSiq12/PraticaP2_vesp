CREATE OR ALTER PROCEDURE restaurante.spCliente
	@idCliente char(5)
AS
BEGIN
	if exists (select id_Cliente from restaurante.Cadastro_Cliente where id_Cliente = @idCliente)
	begin
		delete from restaurante.Cadastro_Cliente WHERE id_Cliente = @idCliente
	end
	else
	begin
		raiserror ('Cliente não encontrado',1,1)
	end
END

DROP PROCEDURE restaurante.spCliente