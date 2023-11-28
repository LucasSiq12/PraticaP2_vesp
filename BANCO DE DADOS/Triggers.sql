create TRIGGER trBebidasAlcool
ON restaurante.BebidasAlcool
for INSERT, UPDATE AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
	@id_BebidasAlcool int,
	@Preco_BebidasAlcool float,
	@Descricao varchar,
	@id_Ingrediente int,
	@Data_NascClienteBebi datetime

	select @id_BebidasAlcool = id_BebidasAlcool, @Preco_BebidasAlcool = Preco_BebidasAlcool, @Descricao = Descricao,
		   @id_Ingrediente = id_Ingrediente, @Data_NascClienteBebi = Data_NascClienteBebi

	FROM Inserted
	print 'Cadastro recém-inserido:'
	print 'ID da Bebida '+cast(@id_BebidasAlcool as char)
	print 'Preço da bebida '+cast(@Preco_BebidasAlcool as float)
	print 'Descrição da bebida '+cast(@Descricao as varchar)
	print 'ID do Ingrediente '+cast(@id_Ingrediente as char)
	print 'Data de Nascimento '+cast(@Data_NascClienteBebi as datetime)
	


	if datediff(year, @Data_NascClienteBebi, getdate()) <= 18	
	BEGIN

			RAISERROR('Proíbido beber bebidas alcoólicas',1,1);
	END
END;

CREATE TRIGGER trMesa
ON restaurante.Mesa
for INSERT, UPDATE AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
	@id_Mesa int,
	@Quant_Pessoas varchar


	select @id_Mesa = id_Mesa, @Quant_Pessoas = Quant_Pessoas

	FROM Inserted
	print 'Mesa Escolhida:'
	print 'ID da Mesa '+cast(@id_Mesa as char)
	print 'Quantidade de pessoas '+cast(@Quant_pessoas as varchar)
	

	if @Quant_Pessoas > 6
	BEGIN
			RAISERROR('Capacidade maxima atingida, juntar outra mesa',1,1);
	END
END;
 
CREATE TRIGGER trReserva
ON restaurante.Reserva
for INSERT, UPDATE AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
	@id_Reserva int,
	@Data_Reserva datetime,
	@Hora_Inicio time,
	@Hora_Fim time,
	@Preco_Reserva float,
	@id_Mesa int,
	@id_Cliente int,
	@NovaMesa int

	select @id_Reserva = id_Reserva, @Data_Reserva = Data_Reserva, @Hora_Inicio = Hora_Inicio,
		   @Hora_Fim = Hora_Fim, @Preco_Reserva = Preco_Reserva, @id_Mesa = id_Mesa, @id_Mesa = id_Mesa, @NovaMesa = NovaMesa

	FROM Inserted
	print 'Inserir Reserva:'
	print 'ID da Reserva '+cast(@id_Reserva as char)
	print 'Nova Reserva de Mesa '+cast(@NovaMesa as char)
	print 'Data da Reserva '+cast(@Data_Reserva as datetime)
	print 'Hora inicial da Reserva '+cast(@Hora_Inicio as datetime)
	print 'Horario final da Reserva '+cast(@Hora_Fim as datetime)
	print 'Preco da Reserva '+cast(@Preco_Reserva as float)
	print 'ID da Mesa '+cast(@id_Mesa as char)
	print 'ID do Cliente '+cast(@id_Cliente as char)

	if datediff(year, @NovaMesa, getdate()) <= @id_Mesa
	BEGIN
			RAISERROR('Mesa Reservada, reserve outra mesa',1,1);
	END

END;

CREATE TRIGGER trIngrediente
ON restaurante.Ingrediente
for INSERT, UPDATE AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
	@id_Ingrediente int,
	@Preco_Ingrediente float,
	@Data_Fabricacao datetime,
	@Data_Vencimento datetime,
	@Descricao varchar,
	@id_Fornecedor int,
	@dataIngrediente datetime

	select @id_Ingrediente = id_Ingrediente, @Preco_Ingrediente = Preco_Ingrediente, @Data_Fabricacao = Data_Fabricacao,
		   @Data_Vencimento = Data_Vencimento, @Descricao = Descricao, @id_Fornecedor = id_Fornecedor, @dataIngrediente = dataIngrediente

	FROM Inserted
	print 'Ingrediente:'
	print 'ID do Ingrediente '+cast(@id_Ingrediente as char)
	print 'Preço do Ingrediente '+cast(@Preco_Ingrediente as float)
	print 'Data do Ingrediente '+cast(@dataIngrediente as datetime)
	print 'Data de fabricação '+cast(@Data_Fabricacao as datetime)
	print 'Data de vencimento '+cast(@Data_Vencimento as datetime)
	print 'Descrição '+cast(@Descricao as float)
	print 'ID do Fornecedor '+cast(@id_Fornecedor as char)

	if datediff(year, @dataIngrediente, getdate()) <= @Data_Vencimento
	BEGIN
			RAISERROR('Ingrediente não proprio para uso',1,1);
	END
END;