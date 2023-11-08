-- CREATE SCHEMA restaurante
CREATE TABLE restaurante.Cadastro_Cliente
(
	id_Cliente char (5) not null,
	Nome_Cliente varchar (55) not null,
	CPF_Cliente char (11) not null,
	Data_NascCliente date not null,
	Telefone varchar (11) not null,
	Email varchar (55) not null,
	senha_Cliente varchar (10) not null,
	PRIMARY KEY (id_Cliente)
)

CREATE TABLE restaurante.Mesa
(
	id_Mesa char (2) not null,
	Quant_Pessoas varchar (6) not null,
	PRIMARY KEY (id_Mesa)
)

CREATE TABLE restaurante.Reserva
(
	id_Reserva char (3) not null,
	Data_Reserva date not null,
	Hora_Inicio time not null,
	Hora_Fim time not null,
	Preco_Reserva float (4) not null,
	id_Mesa char (2) not null,
	id_Cliente char (5) not null,
	PRIMARY KEY (id_Reserva),
	FOREIGN KEY (id_Mesa) REFERENCES restaurante.Mesa (id_Mesa),
	FOREIGN KEY (id_Cliente) REFERENCES restaurante.Cadastro_Cliente (id_Cliente)
)

CREATE TABLE restaurante.Pedido
(
	id_Pedido char (3) not null,
	id_Mesa char (2) not null,
	id_Cliente char (5) not null,
	PRIMARY KEY (id_Pedido),
	FOREIGN KEY (id_Mesa) REFERENCES restaurante.Mesa (id_Mesa),
	FOREIGN KEY (id_Cliente) REFERENCES restaurante.Cadastro_Cliente (id_Cliente),

)

CREATE TABLE restaurante.Prato
(
	id_Prato char (5) not null,
	id_Ingrediente char (5) not null,
	Preco_Prato float (5) not null,
	Nome_Prato varchar (20) not null,
	id_Pedido char (3) not null,
	id_Reserva char (3) not null,
	PRIMARY KEY (id_Prato),
	FOREIGN KEY (id_Ingrediente) REFERENCES restaurante.Ingrediente (id_Ingrediente),
	FOREIGN KEY (id_Pedido) REFERENCES restaurante.Pedido (id_Pedido),
	FOREIGN KEY (id_Reserva) REFERENCES restaurante.Reserva (id_Reserva),

)

CREATE TABLE restaurante.Ingrediente
(
	id_Ingrediente char (5) not null,
	Preco_Ingrediente float (6) not null,
	Data_Fabricacao date not null,
	Data_Vencimento date not null,
	Descricao varchar (150) not null,
	id_Fornecedor char (5) not null,
	PRIMARY KEY (id_Ingrediente),
	FOREIGN KEY (id_Fornecedor) REFERENCES restaurante.Fornecedor (id_Fornecedor),

)

CREATE TABLE restaurante.Fornecedor
(
	id_Fornecedor char (5) not null,
	Tel_Fornecedor varchar (11) not null,
	email_Fornecedor varchar (50) not null,
	Nome_Empresa varchar (50) not null,
	email_Empresa varchar (50) not null,
	Tel_Empresa varchar (11) not null,
	id_Ingrediente char (5) not null,
	PRIMARY KEY (id_Fornecedor),
)


CREATE TABLE restaurante.Funcionario
(
	id_Funcionario char (5) not null,
	Nome_Funcionario varchar (55) not null,
	Data_NascFunci date not null,
	Data_Contratacao date not null,
	CPF_Funcionario char (11) not null,
	Tel_Funcionario varchar (11) not null,
	email_Funcionario varchar (50) not null,
	senha_Funcionario varchar (10) not null,
	id_Pedido char (3) not null,
	PRIMARY KEY (id_Funcionario),
	FOREIGN KEY (id_Pedido) REFERENCES restaurante.Pedido (id_Pedido),
)

CREATE TABLE restaurante.Nota
(
	id_Nota char (5) not null,
	Total_Nota float (6) not null,
	id_Cliente char (5) not null,
	id_Mesa char (2) not null,
	id_Reserva char (3) not null,
	id_Prato char (5) not null,
	PRIMARY KEY (id_Nota),
	FOREIGN KEY (id_Cliente) REFERENCES restaurante.Cadastro_Cliente (id_Cliente),
	FOREIGN KEY (id_Mesa) REFERENCES restaurante.Mesa (id_Mesa),
	FOREIGN KEY (id_Reserva) REFERENCES restaurante.Reserva (id_Reserva),
	FOREIGN KEY (id_Prato) REFERENCES restaurante.Prato (id_Prato)
)