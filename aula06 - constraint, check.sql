--Para	as	seguintes	tabelas,	crie	as	seguintes	restrições	de	checagem:
--1. “Ambulatorios”:	andar	>=	0,	capacidade	>=	1
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

--Para	as	tabelas	“Medicos”,	“Pacientes”	e	“Funcionarios”,	crie	restrições	de	unicidade	para	o	campo	“CPF”	(senão	existirem)
ALTER TABLE medicos
ADD CONSTRAINT cpf_unico UNIQUE (cpf)