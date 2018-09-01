--Tarefa 1 :
-- CLASSE PESSOAS
CREATE CLASS pessoas (
    cpf INTEGER NOT NULL,
    nome VARCHAR(20) NOT NULL,
    dn DATE,
    CONSTRAINT cpfUnico UNIQUE(cpf));

CREATE METHOD idade()
    RETURNS INTEGER
    FOR pessoas
    BEGIN
        RETURN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM dn);
    END;

-- CLASSE LEITOS
CREATE CLASS leitos (
    numero INTEGER NOT NULL,
    andar INTEGER NOT NULL,
    CONSTRAINT numeroUnico UNIQUE(numero));

-- CLASSE PACIENTES
CREATE CLASS pacientes UNDER pessoas (
    endereco STRING,
    telefone LIST(INTEGER),
    responsavel REFERENCES(medicos) CARDINALITY(1,1) INVERSE
     medicos.responsavel,
    leito REFERENCES(leitos) CARDINALITY(1,1) );

-- CLASSE MEDICOS
CREATE CLASS medicos UNDER pessoas(
    crm INTEGER NOT NULL,
    salario REAL,
    atuacao VARCHAR(20),
    formacao LIST(STRING),
    responsavel REFERENCES SET(pacientes) INVERSE pacientes.responsavel,
    CONSTRAINT crmUnico UNIQUE(crm));


-- CLASSE PACIENTES_CONVENIADOS
CREATE CLASS pacientes_conveniados UNDER pacientes (
    convenio STRING,
    numero_inscricao INTEGER );


-- Tarefa 2:
-- Popular tabela medicos:
INSERT INTO medicos (cpf,nome,dn,crm,salario,atuacao,formacao)
VALUES (1,'Joao',DATE '1960-11-11',1,7000.00,'ortopedia', LIST(STRING)
('ortopedia','traumatologia'));

INSERT INTO medicos (cpf,nome,dn,crm,salario,atuacao,formacao)
VALUES (2,'Maria',DATE '1967-05-07',2,6000.00,'ortopedia', LIST(STRING)
('pediatria','ortopedia','cardiologia'));

INSERT INTO medicos (cpf,nome,dn,crm,salario,atuacao,formacao)
VALUES (3,'Carlos',DATE '1970-10-28',3,4590.35,'traumatologia', LIST(STRING)
('traumatologia','cardiologia'));

-- Popular tabela leitos;
INSERT INTO leitos (numero,andar) VALUES (101,1);
INSERT INTO leitos (numero,andar) VALUES (102,1);
INSERT INTO leitos (numero,andar) VALUES (103,1);
INSERT INTO leitos (numero,andar) VALUES (201,2);
INSERT INTO leitos (numero,andar) VALUES (202,2);

-- Popular tabela pacientes;
-- Ana
SELECT REF(m) FROM medicos m
WHERE m.CPF = 1
INTO medico1;

SELECT REF(l) FROM leitos l
WHERE l.numero = 101
INTO leito101;

INSERT INTO pacientes
(cpf,nome,dn,endereco,telefone,responsavel,leito)
VALUES (4,'Ana',DATE '1989-10-19','rua A,23',LIST(INTEGER)
(32341234,99874321),medico1,leito101);

-- Lucia
SELECT REF(m) FROM medicos m
WHERE m.CPF = 2
INTO medico2;

SELECT REF(l) FROM leitos l
WHERE l.numero = 102
INTO leito102;

INSERT INTO pacientes
(cpf,nome,dn,endereco,telefone,responsavel,leito)
VALUES (5,'Lucia',DATE '1990-02-16','rua C, 205',LIST(INTEGER)
(32341357, 33317531, 99851111),medico2,leito102);

-- Jose
SELECT REF(m) FROM medicos m
WHERE m.CPF = 3
INTO medico3;

SELECT REF(l) FROM leitos l
WHERE l.numero = 201
INTO leito201;

INSERT INTO pacientes
(cpf,nome,dn,endereco,telefone,responsavel,leito)
VALUES (6,'Jose',DATE '1991-04-02','rua D, 301',LIST(INTEGER)
(33456776),medico3,leito201);

-- Popular tabela pacientes_conveniados;
-- Denise
SELECT REF(m) FROM medicos m
WHERE m.CPF = 2
INTO medico2;

SELECT REF(l) FROM leitos l
WHERE l.numero = 103
INTO leito103;

INSERT INTO pacientes_conveniados
(cpf,nome,dn,endereco,telefone,responsavel,leito, convenio, numero_inscricao)
VALUES (7,'Denise',DATE '1992-07-07','rua E, 227',LIST(INTEGER)
(32342221),medico2,leito103,'UNIMED;', 14359);

--Flavio
SELECT REF(m) FROM medicos m
WHERE m.CPF = 1
INTO medico1;

SELECT REF(l) FROM leitos l
WHERE l.numero = 202
INTO leito202;

INSERT INTO pacientes_conveniados
(cpf,nome,dn,endereco,telefone,responsavel,leito, convenio, numero_inscricao)
VALUES (8,'Flavio',DATE '1969-09-06','rua F, 118',LIST(INTEGER)
(32341133, 99923311),medico1,leito202,'Saude Bradesco', 762908);


--tarefa 3
-- a) CPF e nome dos médicos cuja atuação é ortopedia;
SELECT cpf, nome 
FROM medicos
WHERE atuacao = 'ortopedia';

-- b) CPF e nome dos pacientes que estão internados em leitos do primeiro andar;
SELECT p.nome, p.cpf
FROM pacientes p
WHERE p.leito.andar = 1;

-- c) CRM e nome dos médicos cuja especialidade que atua é a primeira especialidade
-- que ele tem formação na sua lista de formações;
SELECT crm, nome
FROM medicos
WHERE  atuacao = ELEMENT (formacao, 1);

-- d) nome e telefone dos pacientes que não são pacientes conveniados;
SELECT nome, telefone
FROM ONLY pacientes;

-- e) CPF e nome das pessoas com mais de 30 anos;
SELECT p.cpf, p.nome, p.idade()
FROM pessoas p 
WHERE p.idade() > 30;

-- f) CPF e nome das pessoas que são médicos ou pacientes com convênio. Informar o
-- nome da classe a que ele pertence na resposta da consulta.
SELECT nome, cpf, p.Class_Name AS classe_pertencente
FROM pessoas p 
WHERE (p IS OF (medicos, pacientes_conveniados));
