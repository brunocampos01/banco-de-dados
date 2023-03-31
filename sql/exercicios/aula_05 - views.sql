/* Visões (views)
 - Visões podem ser caracterizadas como seleções (SELECTs) nomeadas
 - Visões materializadas podem ser caracterizadas como seleções (SELECTs) nomeadas, que geram um objeto físico responsável por armazenar o resultado da
execução da query relacionada
*/

--Crie	uma	visão	que	projete	todos os dados da tabela ”Médicos”,	apenas para	médicos	que	estejam	vinculados a algum ambulatório
CREATE VIEW medicos_ativos AS 
SELECT *
FROM medicos 
WHERE medicos.nroa IS NOT NULL

SELECT * FROM medicos_ativos

-- Crie	uma	visão	que	relacione	todos	os	dados	das	tabelas	”Ambulatórios”,	
-- Médicos”,	”Pacientes”	e	”Consultas”,	respeitando	as	chaves	primárias/estrangeiras	para os	relacionamentos,	sem	repetir	atributos
CREATE VIEW todos_dados AS 
SELECT UNIQUE (ambulatorios.nroa, 
               ambulatorios.andar, 
               ambulatorios.capacidade, 
               medicos.codm, 
               medicos.nome, 
               medicos.idade, 
               medicos.especialidade, 
               medicos.cpf,
               medicos.cidade,
               consultas.data,
               consultas.hora,
               pacientes.codp,
               pacientes.nome,
               pacientes.doenca,
               pacientes.idade,
               pacientes.cpf,
               pacientes.cidade)
FROM ambulatorios JOIN medicos   ON ambulatorios.nroa=medicos.nroa 
                  JOIN consultas ON medicos.codm=consultas.codm 
                  JOIN pacientes ON consultas.codp=pacientes.codp

-- Crie	uma	visão	que	exiba	o	número	total	de	vagas	oferecidas	em	cada andar	a	partir	dos	dados	dos	ambulatórios
CREATE VIEW ocupacao_ambulatorios AS
SELECT ambulatorios.capacidade, ambulatorios.andar
FROM ambulatorios

SELECT * FROM ocupacao_ambulatorios
