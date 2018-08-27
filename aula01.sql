/*﻿EXERCÍCIOS
● Crie um BD com nome Clinica

● Crie as seguintes tabelas neste BD, considerando que os atributos
sublinhados são chaves primárias e os em itálico são chaves estrangeiras:
– Ambulatorios: nroa (int), andar (numeric(3)) (não nulo), capacidade (smallint)
– Medicos: codm (int), nome (varchar(40)) (não nulo), idade (smallint) (não nulo),
especialidade (char(20)), CPF (numeric(11)) (único), cidade (varchar(30)), nroa (int)
– Pacientes: codp (int), nome (varchar(40)) (não nulo), idade (smallint) (não nulo),
cidade (char(30)), CPF (numeric(11)) (único), doenca (varchar(40)) (não nulo)
– Funcionarios: codf (int), nome (varchar(40)) (não nulo), idade (smallint), CPF
(numeric(11)) (único), cidade (varchar(30)), salario (numeric(10)), cargo (varchar(20))
– Consultas: codm (int), codp (int), data (date), hora (time)

● Crie a coluna nroa (int) na tabela Funcionarios

● Crie os seguintes índices:
– Medicos: CPF (único), nroa
– Pacientes: doenca

● Remover o índice doenca em Pacientes

● Remover as colunas cargo e nroa da tabela de Funcionarios */


-- SQL: aula 01 
-- CREATE, ADD COLUMN, DROP COLUMN, DROP INDEX, ALTER, INDEX, 
CREATE TABLE ambulatorios(
	nroa INT PRIMARY KEY,
	andar NUMERIC (3) NOT NULL,
	capacidade SMALLINT
);
SELECT * FROM ambulatorios;

DROP TABLE medicos;
CREATE TABLE medicos(
	codm INTEGER PRIMARY KEY,
	nome VARCHAR (40) NOT NULL,
	idade SMALLINT NOT NULL,
	especialidade CHAR (20),
	cpf NUMERIC (11) UNIQUE,
	cidade VARCHAR (30),
	nroa INT,
	FOREIGN KEY (nroa) REFERENCES ambulatorios (nroa) -- se usar foreign key tem que ter a coluna nas 2 tabelas !
	--CONSTRAINT fk_ambulatorio_nroa FOREIGN KEY (nroa) REFERENCES ambulatorios
);
SELECT * FROM medicos;

CREATE TABLE pacientes(
	codp INT PRIMARY KEY,
	nome VARCHAR (40) NOT NULL,
	idade SMALLINT NOT NULL,
	cidade CHAR (30),
	cpf NUMERIC (11) UNIQUE,
	doenca VARCHAR (40) NOT NULL
);
SELECT * FROM pacientes;

CREATE TABLE funcionarios(
	codf INT PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	idade SMALLINT,
	cpf NUMERIC (11) UNIQUE,
	cidade VARCHAR (30),
	salario NUMERIC (10),
	cargo VARCHAR (20)
);
SELECT * FROM funcionarios;

CREATE TABLE consultas(
	codm INT,
	codp INT,
	FOREIGN KEY (codm) REFERENCES medicos (codm),
	FOREIGN KEY (codp) REFERENCES pacientes (codp),
	data DATE,
	hora TIME
);
SELECT * FROM consultas;

ALTER TABLE funcionarios
	ADD COLUMN nroa INT;

CREATE UNIQUE INDEX cpf ON medicos(cpf);
CREATE UNIQUE INDEX nroa ON medicos (nroa);
CREATE UNIQUE INDEX doenca ON pacientes (doenca);

ALTER TABLE pacientes
	DROP INDEX doenca;

ALTER TABLE funcionarios
	DROP COLUMN cargo,
	DROP COLUMN nroa;
