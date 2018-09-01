-- O paciente Paulo mudou-se para Ilhota
UPDATE pacientes SET cidade='ilhota' WHERE nome='paulo'
SELECT * FROM pacientes;

-- A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Novembro de 2016
UPDATE consultas SET hora='1200', data='04/11/2016' WHERE codm=1 AND codp=4;
SELECT * FROM consultas WHERE codm=1;

-- A consulta do médico Pedro (codm = 3) com o paciente Carlos (codp = 4) passou para uma hora e meia depois
UPDATE consultas SET hora='1430' WHERE codm=3 AND codp=4;
SELECT * FROM consultas WHERE codm=3;

-- O funcionário Carlos (codf = 4) deixou a clínica
DELETE FROM funcionarios WHERE codf=4;
SELECT * FROM funcionarios;

-- Os pacientes com câncer ou idade inferior a 24 anos deixaram a clínica
DELETE FROM consultas WHERE codp=1; --primeiro tem que tirar a dependencia nesta tabela para depois deletar na tablea pacientes
DELETE FROM pacientes WHERE doenca='cancer' OR idade<24;
SELECT* FROM pacientes;


