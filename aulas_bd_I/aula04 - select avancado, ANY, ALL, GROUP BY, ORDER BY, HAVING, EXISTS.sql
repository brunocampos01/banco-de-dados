--– Nome e CPF dos médicos que também são pacientes do hospital
SELECT medicos.nome, medicos.cpf
FROM medicos
WHERE codm IN (SELECT cpf FROM pacientes);

--Número e andar dos ambulatórios onde nenhum médico dá atendimento
SELECT ambulatorios.nroa, andar
FROM ambulatorios
WHERE ambulatorios.nroa NOT IN (SELECT medicos.nroa FROM medicos WHERE nroa>0);

--Números e andares de todos os ambulatórios, exceto o de menor capacidade
SELECT ambulatorios.nroa, ambulatorios.andar
FROM ambulatorios
WHERE ambulatorios.capacidade != ANY (SELECT MIN(ambulatorios.capacidade) FROM ambulatorios);

--nome e CPF dos pacientes com consultas marcadas para horários anteriores a todos os horários de consultas marcadas para o dia 14/10/2016
SELECT pacientes.nome, pacientes.cpf
FROM pacientes
WHERE pacientes.codp = ANY (SELECT consultas.codp FROM consultas WHERE data='14/10/2016');

--EXISTS (boolean)
--Buscar o nome e o CPF dos médicos que também são pacientes do hospital
SELECT medicos.nome, medicos.cpf
FROM medicos
WHERE EXISTS (SELECT * FROM pacientes WHERE pacientes.cpf=medicos.cpf);

--– Buscar o nome e o CPF dos médicos que têm consultas marcadas com todos os pacientes 
SELECT medicos.nome, medicos.cpf
FROM medicos JOIN consultas ON medicos.codm=consultas.codm
WHERE EXISTS (SELECT pacientes.codp FROM pacientes);

--FROM
--Buscar o nome e a cidade dos pacientes que têm consultas marcadas com ortopedistas
SELECT pacientes.nome, pacientes.cidade
FROM pacientes JOIN consultas ON pacientes.codp=consultas.codp
WHERE consultas.codm=(SELECT medicos.codm FROM medicos WHERE especialidade='ortopedia')

--– Buscar o nome e o CPF dos médicos que atendem no mesmo ambulatório da médico Pedro
SELECT medicos.nome, medicos.cpf
FROM medicos JOIN ambulatorios ON medicos.nroa=ambulatorios.nroa
WHERE  medicos.nroa=(SELECT medicos.nroa FROM medicos WHERE medicos.nome='pedro');

--ORDER BY ou GROUP BY ( não repete valores iguais)
--Os dados de todos os funcionários ordenados pelo salário (decrescente) e pela idade (crescente). 
SELECT *
FROM funcionarios
ORDER BY salario DESC , idade ASC;

--O nome dos médicos e o número e andar do ambulatório onde eles atendem, ordenado pelo número do ambulatório
SELECT medicos.nome, ambulatorios.andar, medicos.nroa
FROM medicos JOIN ambulatorios ON medicos.nroa=ambulatorios.nroa
ORDER BY ambulatorios.nroa;

--Datas e o total de consultas em cada data, para horários após às 12 horas
SELECT data, count(data)
FROM consultas
WHERE consultas.hora>'1200'
GROUP BY data;

--Andares dos ambulatórios e a capacidade total por andar
SELECT ambulatorios.andar, ambulatorios.capacidade
FROM ambulatorios
ORDER BY ambulatorios.andar, ambulatorios.capacidade;

--– Andares dos ambulatórios cuja média de capacidade no andar seja >= 40
SELECT andar, AVG(capacidade)
FROM ambulatorios
WHERE capacidade>=40
GROUP BY andar;

--Excluir os pacientes que não possuem consultas marcadas
DELETE FROM pacientes
WHERE codp NOT IN (SELECT codp FROM consultas);

-- – O médico Pedro passa a residir na mesma cidade do paciente Paulo e sua idade passa a ser o dobro da idade da paciente Ana. Realizar essa alteração.
UPDATE medicos
SET cidade=(SELECT pacientes.cidade FROM pacientes WHERE pacientes.nome='paulo')
WHERE medicos.nome='pedro'

SELECT*FROM medicos