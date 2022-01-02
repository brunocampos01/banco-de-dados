/* 
EXERCICIOS
-- SQL: aula 02 
-- INSERT INTO

Pode ser feito de 2 formas:
- Sem informar os atributos 
- Informando os atributos

*/

--ambulatorios
INSERT INTO ambulatorios(nroa, andar, capacidade)
VALUES (1, 1, 30);

INSERT INTO ambulatorios(nroa, andar, capacidade)
VALUES (2, 1, 50);

INSERT INTO ambulatorios(nroa, andar, capacidade)
VALUES (3, 2, 40);

INSERT INTO ambulatorios(nroa, andar, capacidade)
VALUES (4, 2, 25);

INSERT INTO ambulatorios(nroa, andar, capacidade)
VALUES (5, 2, 55);

SELECT * FROM ambulatorios;


--medicos
INSERT INTO medicos(cod_m, nome, idade, especialidade, cpf,	cidade, nroa)
VALUES (1, 'joao', 40, 'ortoperia', '10000100000', 'florianopolis', 1);

INSERT INTO medicos(cod_m, nome, idade, especialidade, cpf,	cidade, nroa)
VALUES (2, 'maria', 42, 'traumatologia', '10000100001', 'blumenau', 2);

INSERT INTO medicos(cod_m, nome, idade, especialidade, cpf,	cidade, nroa)
VALUES (3, 'pedro', 51, 'pediatria', '10000100002', 'sao jose', 3);

INSERT INTO medicos(cod_m, nome, idade, especialidade, cpf,	cidade, nroa)
VALUES (4, 'carlos', 28, 'ortopedia', '10000100003', 'joinville', 4);

INSERT INTO medicos(cod_m, nome, idade, especialidade, cpf,	cidade, nroa)
VALUES (5, 'marcia', 33, 'neurologia', '10000100004', 'biguacu', 5);

SELECT * FROM medicos;


-- pacientes
INSERT INTO pacientes(cod_p, nome, idade,	cidade,	cpf, doenca)
VALUES (1, 'ana', 20, 'florianopolis', '12345678910', 'gripe');

INSERT INTO pacientes(cod_p, nome, idade,	cidade,	cpf, doenca)
VALUES (2, 'paulo', 24, 'palhoca', '12345678911', 'fratura');

INSERT INTO pacientes(cod_p, nome, idade,	cidade,	cpf, doenca)
VALUES (3, 'lucia', 30, 'biguacu', '12345678912', 'tendinite');

INSERT INTO pacientes(cod_p, nome, idade,	cidade,	cpf, doenca)
VALUES (4, 'carlos', 28, 'joinville', '12345678913', 'sarampo');

SELECT * FROM pacientes;


--funcionarios
INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
VALUES (1, 'rita', 32, 'sao jose', 1200, '12345678920');

INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
VALUES (2, 'maria', 55, 'palhoca', 1220, '12345678921');

INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
VALUES (3, 'caio', 45, 'florianopolis', 1100, '12345678922');

INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
VALUES (4, 'carlos', 44, 'florianopolis', 1200, '12345678923');

INSERT INTO funcionarios (cod_f, nome, idade, cidade, salario, cpf)
VALUES (5, 'paula', 33, 'florianopolis', 2500, '12345678924');

SELECT * FROM funcionarios;


--consultas
-- Sem informar os atributos 
-- NOTE: DATE format: yyyy-mm-dd
INSERT INTO consultas
VALUES (1, 1, 1, '2016-10-12', '1400');

INSERT INTO consultas
VALUES (2, 1, 4, '2016-10-13', '1000');

INSERT INTO consultas
VALUES (3, 2, 1, '2016-10-13', '0900');

INSERT INTO consultas
VALUES (4, 2, 2, '2016-10-14', '1400');

INSERT INTO consultas
VALUES (5, 2, 4, '2016-10-14', '1700');

INSERT INTO consultas
VALUES (6, 3, 1, '2016-10-19', '1800');

INSERT INTO consultas
VALUES (7, 3, 3, '2016-10-12', '1000');

INSERT INTO consultas
VALUES (8, 3, 4, '2016-10-19', '1300');

INSERT INTO consultas
VALUES (9, 4, 4, '2016-10-22', '1930');

SELECT * FROM consultas;
