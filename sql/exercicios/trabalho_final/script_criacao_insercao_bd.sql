CREATE TABLE TiposVeiculos(
	codTipo		smallint 			UNIQUE, 	
	descricao	varchar(30) 		NOT NULL,	
	CONSTRAINT 	PK_TiposVeiculos 	PRIMARY KEY	(codTipo)
);

CREATE TABLE Habilitacoes(
	codH		smallint 		UNIQUE,		
	tipo		varchar(300) 	NOT NULL,
	idade_min 	NUMERIC(2,0)	NOT NULL,
	descricao	varchar(500) 	NOT NULL,
	CONSTRAINT 	PK_Habilitacoes	PRIMARY KEY 	(codH)
);

CREATE TABLE Veiculos(
	matricula	smallint 		UNIQUE,
	nome		varchar(300)	NOT NULL,
	modelo		varchar(300)	NOT NULL,
	comprimento	NUMERIC(5,2) 	NOT NULL,	
	potMotor	NUMERIC(5,1)	NOT NULL,
	vlDiaria	NUMERIC(7,2)	NOT NULL,	
	codTipo 	SMALLint		NOT NULL,
	CONSTRAINT PK_Veiculos		PRIMARY KEY 	(matricula),
	CONSTRAINT FK_Veiculos 		FOREIGN KEY		(codTipo) 	REFERENCES 	TiposVeiculos
);

CREATE TABLE Funcionarios(
	codF		smallint		UNIQUE,
	nome		varchar(300)	NOT NULL,
	telefone	numeric(11,0),	
	endereco	varchar(40)		NOT NULL,
	idade		NUMERIC(2,0)	NOT NULL,
	salario		NUMERIC(7,2)	NOT NULL,
	CONSTRAINT 	PK_Funcionarios	PRIMARY KEY 	(codF)
);

CREATE TABLE VeiculosHabilitacoes(
	codTipo		smallint,
	codH		smallint,
	CONSTRAINT PK_VeiculosHabilitacoes 	PRIMARY KEY (codTipo,codH),
	CONSTRAINT FK_VH_tiposVeiculos		FOREIGN KEY (codTipo) REFERENCES TiposVeiculos(codTipo),
	CONSTRAINT FK_VH_habilitacoes 		FOREIGN KEY (codH) REFERENCES Habilitacoes(codH)
);

CREATE TABLE Clientes(
	CPF				numeric(11,0)	UNIQUE,  
	nome			varchar(300) 	NOT NULL,
	endereco		varchar(300) 	NOT NULL,
	estado_civil	varchar(20),
	num_filhos		smallint,
	data_nasc		date 			NOT NULL,	
	telefone		numeric(11,0) 	NOT NULL,	
	codH			smallint		NOT NULL,	
	CONSTRAINT 		PK_Clientes		PRIMARY KEY (CPF),
	CONSTRAINT 		FK_Clientes 	FOREIGN KEY (codH) REFERENCES Habilitacoes
);

CREATE TABLE Locacoes(
	codLoc		smallint				UNIQUE,
	valor		numeric(9,2)			NOT NULL,		
	inicio		date					NOT NULL,
	fim			date					CHECK(fim > inicio),   		
	obs			varchar(30),
	matricula	smallint				NOT NULL,
	codF		smallint				NOT NULL,
	CPF			numeric(11)				NOT NULL ,
	CONSTRAINT 	PK_Locacoes				PRIMARY KEY	(codLoc),
	CONSTRAINT 	FK_Locacoes_matricula	FOREIGN KEY (matricula) REFERENCES Veiculos,
	CONSTRAINT 	FK_Locacoes_codf		FOREIGN KEY (codF) REFERENCES Funcionarios,
	CONSTRAINT 	FK_Locacoes_cpf			FOREIGN KEY (CPF) REFERENCES Clientes
);


INSERT INTO TiposVeiculos (codTipo, descricao) VALUES (1,'Jet-ski');
INSERT INTO TiposVeiculos (codTipo, descricao) VALUES (2,'Lancha');
INSERT INTO TiposVeiculos (codTipo, descricao) VALUES (3,'Veleiro');
INSERT INTO TiposVeiculos (codTipo, descricao) VALUES (4,'Barco');
INSERT INTO TiposVeiculos (codTipo, descricao) VALUES (5,'Escuna');

INSERT INTO Habilitacoes (codH, tipo, idade_min, descricao) VALUES (1, 'Motonauta', 18, 'Novato');
INSERT INTO Habilitacoes (codH, tipo, idade_min, descricao) VALUES (2, 'Veleiro',18, 'Conduzir embarcações nos limites da navegação interior');
INSERT INTO Habilitacoes (codH, tipo, idade_min, descricao) VALUES (3, 'Mestre-amador',18,'Conduzir embarcações entre portos nacionais e estrangeiros nos limites da navegação costeira');
INSERT INTO Habilitacoes (codH, tipo, idade_min, descricao) VALUES (4, 'Capitao-amador',18,'Conduzir embarcações entre portos nacionais e estrangeiros, sem limite de afastamento da costa');

INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) VALUES (101, 'Jet Bacana', 'Jet Seadoo Gti 130', 3.36, 160, 550.00, 1);
INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) VALUES (102, 'Iemanja 1', 'Focker 255', 9, 400, 2500, 2);
INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) VALUES (103, 'Felicity','OFF SHORE 56', 12, 520, 3800, 2);
INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) VALUES (104, 'Canary', 'Cimitarra 340', 14, 500, 2600 , 2);
INSERT INTO Veiculos (matricula, nome, modelo, comprimento, potMotor, vlDiaria, codTipo) VALUES (105, 'Velador', 'Velamar 38', 12.52, 40, 1000.00, 3);

INSERT INTO Funcionarios (codF, nome, telefone, endereco, idade, salario) VALUES (1, 'Lucas', '99998888',  'Rua Vilarejo', 24, 780);
INSERT INTO Funcionarios (codF, nome, telefone, endereco, idade, salario) VALUES (2,'Joao', '01212341234', 'Rua das Ortencias', 20, 800.00);
INSERT INTO Funcionarios (codF, nome, telefone, endereco, idade, salario) VALUES (3,'Pedro', '01212341235', 'Rua do Barao', 20, 800.00);
INSERT INTO Funcionarios (codF, nome, telefone, endereco, idade, salario) VALUES (4,'Nilmar', '01212341236', 'Rua do Sapo', 20, 810.00);
INSERT INTO Funcionarios (codF, nome, telefone, endereco, idade, salario) VALUES (5,'Jean', '01212341237', 'Rua das Ruas', 21, 800.00);
INSERT INTO Funcionarios (codF, nome, telefone, endereco, idade, salario) VALUES (6,'Lucas', '01212341238', 'Rua das Acacias', 25, 890.00);

INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (1,1);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (1,2);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (2,2);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (3,2);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (4,2);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (1,3);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (2,3);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (3,3);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (4,3);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (1,4);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (2,4);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (3,4);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (4,4);
INSERT INTO VeiculosHabilitacoes (codTipo, codH) VALUES (5,4);

INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000001, 'Marcio', 'Rua da Lagoa', 'Casado', 1,to_date('12-12-1988', 'DD-MM-YYYY'), 01231234567, 1);
INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000002, 'Marcelo', 'Rua Costeira', 'Casado', 0, to_date('18-06-1978', 'DD-MM-YYYY'), 01231234568, 4);
INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000003, 'Carlos', 'Rua Amarela', 'Solteiro', 0, to_date('28-08-1993', 'DD-MM-YYYY'), 01231234569, 3);
INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000004, 'Pedro', 'Rua Verde', 'Casado', 0, to_date('16-05-1976', 'DD-MM-YYYY'), 01231234571, 3);
INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000005, 'Lucas', 'Rua das Alamedas', 'Casado', 0, to_date('14-06-1980', 'DD-MM-YYYY'), 01231234572, 2);
INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000006, 'Thomas', 'Rua das Ruas', 'Viuvo', 5, to_date('18-06-1965', 'DD-MM-YYYY'), 01231234573, 4);
INSERT INTO Clientes (CPF, nome, endereco, estado_civil, num_filhos, data_nasc, telefone, codH) VALUES (10000000007, 'Jose', 'Avenida Quinta', 'Solteiro', 0, to_date('30-05-1987', 'DD-MM-YYYY'), 01231234574, 2);

INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (1, 600.00, to_date('01-01-2017', 'DD-MM-YYYY'), to_date('03-01-2017', 'DD-MM-YYYY'), 'nada', 101, 1, 10000000001);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (2, 550.00, to_date('01-01-2017', 'DD-MM-YYYY'), to_date('02-01-2017', 'DD-MM-YYYY'), 'nada', 102, 5, 10000000007);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (3, 12500.00, to_date('02-01-2017', 'DD-MM-YYYY'), to_date('07-01-2017', 'DD-MM-YYYY'), null, 103, 3, 10000000003);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (4, 300.00, to_date('05-01-2017', 'DD-MM-YYYY'), to_date('06-01-2017', 'DD-MM-YYYY'), null, 101, 5, 10000000003);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (5, 1100.00, to_date('06-01-2017', 'DD-MM-YYYY'), to_date('07-01-2017', 'DD-MM-YYYY'), null, 101, 3, 10000000007);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (6, 9000.00, to_date('08-01-2017', 'DD-MM-YYYY'), to_date('10-01-2017', 'DD-MM-YYYY'), null, 101, 1, 10000000005);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (7, 15000.00,  to_date('14-01-2017', 'DD-MM-YYYY'),  to_date('16-01-2017', 'DD-MM-YYYY'), null, 101, 2, 10000000004);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (8, 1000.00,  to_date('17-01-2017', 'DD-MM-YYYY'),  to_date('19-01-2017', 'DD-MM-YYYY'), null, 101, 6, 10000000006);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (9, 15000.00,  to_date('17-01-2017', 'DD-MM-YYYY'),  to_date('20-01-2017', 'DD-MM-YYYY'), null, 104, 2, 10000000004);
INSERT INTO Locacoes (codLoc, valor, inicio, fim, obs, matricula, codf, CPF) VALUES (10, 5000.00,  to_date('19-01-2017', 'DD-MM-YYYY'),  to_date('21-01-2017', 'DD-MM-YYYY'), null, 101, 2, 10000000002);
