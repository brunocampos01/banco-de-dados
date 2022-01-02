-- ---------------------------------------------------------------------------
-- O paciente Paulo mudou-se para Ilhota
SELECT * FROM pacientes;

UPDATE pacientes SET cidade='ilhota' 
WHERE nome='paulo';

SELECT * FROM pacientes;


-- ---------------------------------------------------------------------------
-- A consulta do médico 1 com o paciente 4 passou para às 12:00 horas 
-- do dia 4 de Novembro de 2016
SELECT * FROM consultas WHERE cod_m=1;

UPDATE consultas SET hora='1200', data='2016-11-04' 
WHERE cod_m=1 AND cod_p=4;

SELECT * FROM consultas WHERE cod_m=1;


-- ---------------------------------------------------------------------------
-- A consulta do médico Pedro (codm = 3) com o paciente Carlos (codp = 4) 
-- passou para uma hora e meia depois
SELECT * FROM consultas WHERE cod_m=3;

UPDATE consultas SET hora='1430' 
WHERE cod_m=3 AND cod_p=4;

SELECT * FROM consultas WHERE cod_m=3;


-- ---------------------------------------------------------------------------
-- O funcionário Carlos (codf = 4) deixou a clínica
SELECT * FROM funcionarios;

DELETE FROM funcionarios WHERE cod_f=4;

SELECT * FROM funcionarios;


-- ---------------------------------------------------------------------------
-- Os pacientes com câncer ou idade inferior a 24 anos deixaram a clínica
SELECT* FROM pacientes;

DELETE FROM consultas WHERE cod_p=1; 
DELETE FROM pacientes WHERE doenca='cancer' OR idade<24;

SELECT* FROM pacientes;
