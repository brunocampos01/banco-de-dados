-- Buscar os dados dos ambulatórios que possuem capacidade superior à 30
SELECT capacidade
FROM ambulatorios
WHERE capacidade > 30;


-- ---------------------------------------------------------------------------
-- Buscar os dados dos médicos com menos de 40 anos ou com especialidade traumatologia
SELECT 
  idade,
  especialidade
FROM medicos
WHERE 
  idade < 40
  OR 
  especialidade = 'traumatologia';


-- ---------------------------------------------------------------------------
-- Buscar os códigos dos médicos e os códigos dos pacientes, 
-- para todas as consultas marcadas 
-- no período da tarde (a partir das 13h) após o dia 15/10/2016
SELECT 
  cod_m,
  cod_p
FROM consultas
WHERE 
  hora >= '1300'
  AND 
  data > '2016-10-15';


-- ---------------------------------------------------------------------------
-- Buscar o nome e a idade dos pacientes que não residem em Florianópolis
SELECT 
  nome,
  idade
FROM pacientes
WHERE cidade != 'florianopolis';


-- ---------------------------------------------------------------------------
-- Buscar o nome e a idade (em meses) dos pacientes
SELECT 
  nome,
  idade*12 
FROM pacientes;


-- ---------------------------------------------------------------------------
-- Qual o menor e o maior salário dos funcionários da Florianópolis?
SELECT 
  MIN(salario),
  MAX(salario)
FROM funcionarios
WHERE cidade = 'florianopolis';


-- ---------------------------------------------------------------------------
-- Qual o horário da última consulta marcada para o dia 13/10/2016?
SELECT hora
FROM consultas
WHERE data = '2016-10-13';


-- ---------------------------------------------------------------------------
-- Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?
SELECT 
  AVG(idade),
  COUNT(DISTINCT nroa)
FROM medicos;


-- ---------------------------------------------------------------------------
-- Buscar o código, o nome e o salário líquido dos funcionários. 
-- O salário líquido é obtido
-- pela diferença entre o salário cadastrado menos 20% deste mesmo salário
SELECT 
  cod_f,
  nome,
  (salario - salario*0.2) AS salario_liq
FROM funcionarios;
