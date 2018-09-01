/*Tipos de contraints:
CHECAGEM
 - (check) permitem a especificação de valores válidos para campos
 - Restrições de checagem avaliam expressões booleanas

OBRIGATORIEDADE
 -(NOT NULL) definem que os campos a elas relacionados devem receber valores diferentes de NULL

UNICIDADE
 - definem que os valores presentes em um campo ou em um conjunto de campos
não podem aparecer em mais de um registro ao mesmo tempo
EX)
    CREATE TABLE pessoa (
    id_pessoa integer NOT NULL,
    nome varchar (100),
    cpf numeric,
    idade integer,
    CONSTRAINT cpf_unico UNIQUE (cpf),
    CONSTRAINT idade_maior CHECK (idade >= 18)
    );

CHAVE PRIMARIA
 - definem que os valores presentes em um campo ou em um conjunto de campos
não podem aparecer em mais de um registro ao mesmo tempo
EX)
    CREATE TABLE pessoa (
    id_pessoa integer,
    CONSTRAINT pk_pessoa PRIMARY KEY (id_pessoa)
    );

CHAVE ESTRANGEIRA
 - estabelece-se a chamada integridade referencial
EX)
    CREATE TABLE filho (
    id_filho integer,
    id_pessoa integer,
    CONSTRAINT fk_pessoa_filho FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa)
    );
*/

﻿/*Para	as	seguintes	tabelas,	crie	as	seguintes	restrições	de	checagem:
--1. “Ambulatorios”:	andar	>=	0,	capacidade	>=	1*/
ALTER TABLE ambulatorios
ADD CONSTRAINT andar_nao_negativo CHECK (andar >= 0 AND capacidade>= 1)

--“Medicos”:	idade	>=	0
ALTER TABLE medicos
ADD CONSTRAINT medicos_com_idade CHECK (idade>=0)

--“Pacientes”:	idade	>=	0
ALTER TABLE pacientes
ADD CONSTRAINT pacientes_com_idade CHECK (idade>=0)

--“Funcionarios”:	idade	>=	0,	salario >=	0
ALTER TABLE funcionarios
ADD CONSTRAINT funcionarios_com_salrios_e_idade CHECK (idade>=0 AND salario>=0)

--Para	as	tabelas	“Medicos”,	“Pacientes”	e	“Funcionarios”,	crie restrições	de unicidade	para	o	campo	“CPF”	(senão	existirem)
ALTER TABLE medicos
ADD CONSTRAINT cpf_unico UNIQUE (cpf)
