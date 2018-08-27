--– O paciente Paulo mudou-se para Ilhota
UPDATE pacientes SET cidade='ilhota' WHERE nome='paulo'
SELECT * FROM pacientes;

--A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Novembro de 2016
UPDATE consultas SET hora='1200', data='04/11/2016' WHERE codm=1 AND codp=4;
SELECT * FROM consultas WHERE codm=1;

--– A consulta do médico Pedro (codm = 3) com o paciente Carlos (codp = 4) passou para uma hora e meia depois
UPDATE consultas SET hora='1430' WHERE codm=3 AND codp=4;
SELECT * FROM consultas WHERE codm=3;

--– O funcionário Carlos (codf = 4) deixou a clínica
DELETE FROM funcionarios WHERE codf=4;
SELECT * FROM funcionarios;

--– Os pacientes com câncer ou idade inferior a 24 anos deixaram a clínica
DELETE FROM consultas WHERE codp=1; --primeiro tem que tirar a dependencia nesta tabela para depois deletar na tablea pacientes
DELETE FROM pacientes WHERE doenca='cancer' OR idade<24;
SELECT* FROM pacientes;


--Buscar os dados dos ambulatórios que possuem capacidade superior à 30
SELECT capacidade
FROM ambulatorios
WHERE capacidade>30;

--Buscar os dados dos médicos com menos de 40 anos ou com especialidade traumatologia
SELECT idade, especialidade
FROM medicos
WHERE idade<40 OR especialidade='traumatologia';

--Buscar os códigos dos médicos e os códigos dos pacientes, para todas as consultas marcadas 
--no período da tarde (a partir das 13h) após o dia 15/10/2016
SELECT codm, codp
FROM consultas
WHERE hora>='1300' AND data>'15/10/2016';

--Buscar o nome e a idade dos pacientes que não residem em Florianópolis
SELECT nome, idade
FROM pacientes
WHERE cidade!='florianopolis';

--Buscar o nome e a idade (em meses) dos pacientes
SELECT nome, (idade*12) 
FROM pacientes;

-- Qual o menor e o maior salário dos funcionários da Florianópolis?
SELECT MIN(salario), MAX(salario)
FROM funcionarios
WHERE cidade='florianopolis';

--Qual o horário da última consulta marcada para o dia 13/10/2016?
SELECT MAX(hora)
FROM consultas
WHERE data='13/10/2016';

--Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?
SELECT AVG(idade), COUNT(DISTINCT nroa)
FROM medicos;

--Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido
--pela diferença entre o salário cadastrado menos 20% deste mesmo salário
SELECT codf, nome, ((salario)-salario*0.2)
FROM funcionarios;