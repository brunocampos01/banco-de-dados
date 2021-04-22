/* */
﻿--ambulatorios
INSERT INTO ambulatorios
VALUES (1, 1, 30);

INSERT INTO ambulatorios
VALUES (2, 1, 50);

INSERT INTO ambulatorios
VALUES (3, 2, 40);

INSERT INTO ambulatorios
VALUES (4, 2, 25);

INSERT INTO ambulatorios
VALUES (5, 2, 55);

SELECT * FROM ambulatorios;

--medicos
INSERT INTO medicos
VALUES (1, 'joao', 40, 'ortoperia', 10000100000, 'florianopolis', 1);

INSERT INTO medicos
VALUES (2, 'maria', 42, 'traumatologia',10000100001, 'blumenau', 2) ;

INSERT INTO medicos
VALUES (3, 'pedro', 51, 'pediatria', 10000100002, 'sao jose', 2);

INSERT INTO medicos
VALUES (4, 'carlos', 28, 'ortopedia', 10000100003, 'joinville');

INSERT INTO medicos
VALUES (5, 'marcia', 33, 'neurologia', 10000100004, 'biguacu', 3);

SELECT * FROM medicos;

-- pacientes
INSERT INTO pacientes
VALUES (1, 'ana', 20, 'florianopolis', 12345678910, 'gripe');

INSERT INTO pacientes
VALUES (2, 'paulo', 24, 'palhoca', 12345678911, 'fratura');

INSERT INTO pacientes
VALUES (3, 'lucia', 30, 'biguacu', 12345678912, 'tendinite');

INSERT INTO pacientes
VALUES (4, 'carlos', 28, 'joinville', 12345678913, 'sarampo');

SELECT * FROM pacientes;

--funcionarios
INSERT INTO funcionarios (codf, nome, idade, cidade, salario, cpf)
VALUES (1, 'rita', 32, 'sao jose', 1200, 12345678920);

INSERT INTO funcionarios (codf, nome, idade, cidade, salario, cpf)
VALUES (2, 'maria', 55, 'palhoca', 1220, 12345678921);

INSERT INTO funcionarios (codf, nome, idade, cidade, salario, cpf)
VALUES (3, 'caio', 45, 'florianopolis', 1100, 12345678922);

INSERT INTO funcionarios (codf, nome, idade, cidade, salario, cpf)
VALUES (4, 'carlos', 44, 'florianopolis', 1200, 12345678923);

INSERT INTO funcionarios (codf, nome, idade, cidade, salario, cpf)
VALUES (5, 'paula', 33, 'florianopolis', 2500, 12345678924);

SELECT * FROM funcionarios;

--consultas
INSERT INTO consultas
VALUES (1, 1, '12/10/2016', '1400');

INSERT INTO consultas
VALUES (1, 4, '13/10/2016', '1000');

INSERT INTO consultas
VALUES (2, 1, '13/10/2016', '0900');

INSERT INTO consultas
VALUES (2, 2, '14/10/2016', '1400');

INSERT INTO consultas
VALUES (2, 4, '14/10/2016', '1700');

INSERT INTO consultas
VALUES (3, 1, '19/10/2016', '1800');

INSERT INTO consultas
VALUES (3, 3, '12/10/2016', '1000');

INSERT INTO consultas
VALUES (3, 4, '19/10/2016', '1300');

INSERT INTO consultas
VALUES (4, 4, '22/10/2016', '1930');

SELECT * FROM consultas;
