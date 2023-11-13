create TRIGGER trCliente
ON restaurante.Cadastro_Cliente
for INSERT, UPDATE AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
	@id_Cliente int,
	@Nome_Cliente char,
	@CPF_Cliente char,
	@Data_NascCliente datetime,
	@Telefone varchar,
	@Email varchar,
	@senha_Cliente char

	select @id_Cliente = id_Cliente, @Nome_Cliente = Nome_Cliente, @CPF_Cliente = CPF_Cliente,
		   @Data_NascCliente = Data_NascCliente, @Telefone = Telefone, @Email = Email, @senha_Cliente = senha_Cliente

	FROM Inserted
	print 'Cadastro recém-inserido:'
	print 'ID do Cliente '+cast(@id_Cliente as char)
	print 'Nome do Cliente '+cast(@Nome_Cliente as varchar)
	print 'CPF do Cliente '+cast(@CPF_Cliente as char)
	print 'Data de Nascimento do Cliente '+cast(@Data_NascCliente as datetime)
	print 'Telefone do Cliente '+cast(@Telefone as varchar)
	print 'Email do Cliente '+cast(@Email as char)
	print 'Senha do Cliente '+cast(@senha_Cliente as char)

	if datediff(year, @Data_NascCliente, getdate()) <= 10
	BEGIN
			print'Crinça paga meia'
			RAISERROR('Criança paga meia',1,1);
	END
	else
			print'Paga normal'

	if @Data_NascCliente >= 18
	BEGIN
			print'Permitido beber bebidas alcólicas'
			RAISERROR('Permitido beber bebidas alcólicas',1,1);
	END
	else
			print'Proibido beber bebidas alcólicas'
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
			print'Capacidade maxima atingida, juntar outra mesa'
			RAISERROR('Capacidade maxima atingida, juntar outra mesa',1,1);
	END
	else
			print'Quantidade aceitavel'
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
			print'Mesa Reservada, reserve outra mesa'
			RAISERROR('Mesa Reservada, reserve outra mesa',1,1);
	END
	else
			print'Mesa Disponível'

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
			print'Ingrediente não proprio para uso'
	END
	else
			print'Ingrediente propio para uso'


END;