-- Nome e CPF dos médicos que também são pacientes do hospital
SELECT 
  medicos.nome,
  medicos.cpf
FROM medicos
WHERE cpf IN (
                SELECT cpf 
                FROM pacientes
                );

-- ---------------------------------------------------------------------------
-- Número e andar dos ambulatórios onde nenhum médico dá atendimento
SELECT 
  ambulatorios.nroa,
  ambulatorios.andar
FROM ambulatorios
WHERE ambulatorios.nroa NOT IN (
                                SELECT medicos.nroa
                                FROM medicos
                                WHERE nroa > 0
                                );


-- ---------------------------------------------------------------------------
-- Números e andares de todos os ambulatórios, exceto o de menor capacidade
SELECT 
  ambulatorios.nroa,
  ambulatorios.andar
FROM ambulatorios
WHERE 
  ambulatorios.capacidade != ANY(
                                  SELECT MIN(ambulatorios.capacidade) 
                                  FROM ambulatorios
                                 );

-- ---------------------------------------------------------------------------
-- nome e CPF dos pacientes com consultas marcadas para horários anteriores 
-- a todos os horários de consultas marcadas para o dia 14/10/2016
SELECT 
  pacientes.nome, 
  pacientes.cpf
FROM pacientes
WHERE pacientes.cod_p = ANY(
                            SELECT consultas.cod_p 
                            FROM consultas 
                            WHERE data='2016-10-14'
                            );

-- ---------------------------------------------------------------------------
-- EXISTS (boolean)
-- Buscar o nome e o CPF dos médicos que também são pacientes do hospital
SELECT 
  medicos.nome,
  medicos.cpf
FROM medicos
WHERE EXISTS(
              SELECT * 
              FROM pacientes 
              WHERE pacientes.cpf = medicos.cpf
            );

-- ---------------------------------------------------------------------------
-- Buscar o nome e o CPF dos médicos que têm consultas
-- marcadas com qualquer um paciente. Use `EXISTS`

-- parte 01: Buscar o nome e o CPF dos médicos que têm consultas marcadas
SELECT
  medicos.nome,
  medicos.cpf
FROM 
  medicos JOIN consultas ON medicos.cod_m=consultas.cod_m;

-- parte 02: todos os pacientes com consultas marcadas
SELECT DISTINCT
  pacientes.cod_p
FROM
  pacientes JOIN consultas ON pacientes.cod_p=consultas.cod_p

-- parte 03: tudo
SELECT DISTINCT 
  medicos.nome,
  medicos.cpf
FROM 
  medicos JOIN consultas ON medicos.cod_m=consultas.cod_m
WHERE EXISTS(
              SELECT DISTINCT
                pacientes.cod_p
              FROM 
                pacientes JOIN consultas ON pacientes.cod_p=consultas.cod_p
            );


-- ---------------------------------------------------------------------------
-- Buscar o nome e a cidade dos pacientes que têm consultas marcadas com ortopedistas

-- parte 01: buscar o nome e a cidade dos pacientes que têm consultas marcadas
SELECT DISTINCT
  pacientes.nome,
  pacientes.cidade
FROM 
  pacientes JOIN consultas ON pacientes.cod_p=consultas.cod_p;

-- parte 02: medico ortopedista
SELECT medicos.cod_m 
FROM medicos 
WHERE especialidade = 'ortopedia';

-- parte 03: tudo
SELECT DISTINCT
  pacientes.nome,
  pacientes.cidade
FROM 
  pacientes JOIN consultas ON pacientes.cod_p=consultas.cod_p
WHERE consultas.cod_m = (
                          SELECT medicos.cod_m 
                          FROM medicos 
                          WHERE especialidade='ortopedia'
                        );


-- ---------------------------------------------------------------------------
-- Buscar o nome e o CPF dos médicos que atendem no mesmo ambulatório do médico Pedro
SELECT 
  medicos.nome,
  medicos.cpf
FROM 
  medicos JOIN ambulatorios ON medicos.nroa=ambulatorios.nroa
WHERE 
  medicos.nroa = (
                  SELECT medicos.nroa 
                  FROM medicos 
                  WHERE medicos.nome = 'pedro'
                  );


-- ---------------------------------------------------------------------------
-- ORDER BY ou GROUP BY
-- Os dados de todos os funcionários ordenados 
-- pelo salário (decrescente) e pela idade (crescente). 
SELECT *
FROM funcionarios
ORDER BY salario DESC , idade ASC;


-- ---------------------------------------------------------------------------
-- O nome dos médicos e o número e andar do ambulatório onde eles atendem,
-- ordenado pelo número do ambulatório
SELECT 
  medicos.nome,
  ambulatorios.andar,
  medicos.nroa
FROM 
  medicos JOIN ambulatorios ON medicos.nroa=ambulatorios.nroa
ORDER BY ambulatorios.nroa;


-- ---------------------------------------------------------------------------
-- Datas e o total de consultas em cada data, para horários após às 12 horas
SELECT 
  data,
  count(data)
FROM consultas
WHERE consultas.hora > '1200'
GROUP BY data;

-- ---------------------------------------------------------------------------
-- Retorne andares dos ambulatórios 
-- e a capacidade total por andar, ordenado pela capacidade (desc)
SELECT
  andar,
  SUM(capacidade) as capacidade_total
FROM ambulatorios
GROUP BY andar
ORDER BY andar ASC;


-- ---------------------------------------------------------------------------
-- Andares dos ambulatórios cuja média de capacidade no andar seja >= 40
SELECT 
  andar,
  AVG(capacidade)
FROM ambulatorios
WHERE capacidade >= 40
GROUP BY andar;


-- ---------------------------------------------------------------------------
-- Excluir os pacientes que não possuem consultas marcadas
DELETE FROM pacientes
WHERE cod_p NOT IN (
                      SELECT cod_p
                      FROM consultas
                   );


-- ---------------------------------------------------------------------------
-- O médico Pedro passa a residir na mesma cidade do paciente Paulo.
-- parte 01: O médico Pedro reside na mesma cidade do paciente Paulo
SELECT 
  pacientes.cidade 
FROM pacientes 
WHERE 
  pacientes.nome='paulo';

-- parte 01: O médico Pedro reside na mesma cidade do paciente Paulo
SELECT 
  medicos.cidade 
FROM medicos 
WHERE 
  medicos.nome='pedro';

-- parte 02: tudo
UPDATE medicos SET cidade = (
                              SELECT pacientes.cidade 
                              FROM pacientes 
                              WHERE pacientes.nome = 'paulo'
                            )
WHERE medicos.nome = 'pedro'
