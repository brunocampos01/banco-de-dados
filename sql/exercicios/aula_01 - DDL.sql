/*
EXERCICIOS
-- SQL: aula 01
-- CREATE, ADD COLUMN, DROP COLUMN, DROP INDEX, ALTER, INDEX
*/
-- Crie um BD com nome clinica
CREATE DATABASE clinica;

/* ---------------------------------------------------------------------------
2. Crie as seguintes tabelas neste BD,

- Considere que os atributos em negrito são chaves primárias (PK)
e os em itálico são chaves estrangeiras (FK)
- O campo cpf não será utilizado em cálculos
*/
/*
- **ambulatorios**
  - **nroa (int)**
  - andar (numeric(3)) (não nulo)
  - capacidade (smallint)
*/
CREATE TABLE ambulatorios
  (
     nroa       INT PRIMARY KEY,
     andar      NUMERIC(3) NOT NULL,
     capacidade SMALLINT
  );

SELECT *
FROM   ambulatorios;

/*OBS: a forma recomendada de se criar PK, FK, NOT NULL, CHECK, UNIQUE eh com contraint (aula 06)*/
/*
- **medicos**
  - **cod_m (int)**
  - nome (varchar(40)) (não nulo)
  - idade (smallint) (não nulo)
  - especialidade (char(20))
  - CPF (varchar(11)) (único)
  - cidade (varchar(30))
  - _nroa (int)_
*/
CREATE TABLE medicos
  (
     cod_m         INTEGER PRIMARY KEY,
     nome          VARCHAR(40) NOT NULL,
     idade         SMALLINT NOT NULL,
     especialidade CHAR(20),
     cpf           VARCHAR(11) UNIQUE,
     cidade        VARCHAR(30),
     nroa          INT,
     FOREIGN KEY (nroa) REFERENCES ambulatorios (nroa)
  -- se usar foreign key tem que ter a coluna nas 2 tabelas!
  );

SELECT *
FROM   medicos;

/*
**NOTE: aula 02**
Para evitar referências à tabelas ainda não criadas
pode ser criada todas as tabelas sem chaves estrangeiras (FK)
e depois inserir a `CONSTRAINT` de FK com `ALTER TABLE`:

```sql
ALTER TABLE nomeTabela
  ADD CONSTRAINT nome
    FOREIGN KEY (nomeColunaChaveEstrangeira)
  REFERENCES tabela (nomeColunaChavePrimaria);
```
*/
/*
- **pacientes**
  - **cod_p (int)**
  - nome (varchar(40)) (não nulo)
  - idade (smallint) (não nulo)
  - cidade (char(30))
  - CPF (varchar(11)) (único)
  - doenca (varchar(40)) (não nulo)
*/
CREATE TABLE pacientes
  (
     cod_p  INT PRIMARY KEY,
     nome   VARCHAR(40) NOT NULL,
     idade  SMALLINT NOT NULL,
     cidade CHAR(30),
     cpf    VARCHAR(11) UNIQUE,
     doenca VARCHAR(40) NOT NULL
  );

SELECT *
FROM   pacientes;

/*
- **funcionarios**
  - **cod_f (int)**
  - nome (varchar(40)) (não nulo)
  - idade (smallint)
  - CPF (varchar(11)) (único)
  - cidade (varchar(30))
  - salario (numeric(10))
  - cargo (varchar(20))
*/
CREATE TABLE funcionarios
  (
     cod_f   INT PRIMARY KEY,
     nome    VARCHAR(40) NOT NULL,
     idade   SMALLINT,
     cpf     VARCHAR(11) UNIQUE,
     cidade  VARCHAR(30),
     salario NUMERIC(10),
     cargo   VARCHAR(20)
  );

SELECT *
FROM   funcionarios;

/*
- **consultas**
  - *cod_c (int)*
  - *cod_m (int)*
  - *cod_p (int)*
  - data (date) (não nulo)
  - hora (time) (não nulo)
*/
CREATE TABLE consultas
  (
     cod_c INT PRIMARY KEY,
     cod_m INT,
     cod_p INT,
     data  DATE NOT NULL,
     hora  TIME NOT NULL,
     FOREIGN KEY (cod_m) REFERENCES medicos (cod_m),
     FOREIGN KEY (cod_p) REFERENCES pacientes (cod_p)
  );

SELECT *
FROM   consultas;

/* ---------------------------------------------------------------------------
## **3. Crie os seguintes índices**
- Medicos: nroa
- Pacientes: doenca
*/
CREATE UNIQUE INDEX nroa ON medicos(nroa);

CREATE UNIQUE INDEX doenca ON pacientes(doenca);

/* ---------------------------------------------------------------------------
## **4. Remova o índice doenca em Pacientes**
*/
ALTER TABLE pacientes
  DROP INDEX doenca;

/* ---------------------------------------------------------------------------
## **5. Remova a coluna `cargo` da tabela de `funcionarios`**
*/
ALTER TABLE funcionarios
  DROP COLUMN cargo,
  DROP COLUMN nroa; 
