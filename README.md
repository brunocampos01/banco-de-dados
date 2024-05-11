# Banco de Dados <img src="images/image_bd.png" width="10%" height="10%" align="right" valign="center"/> 

![License](https://img.shields.io/badge/Code%20License-MIT-green.svg)
![learning](https://img.shields.io/badge/SQL-learning-green.svg)
![ufsc](https://img.shields.io/badge/UFSC-Banco%20de%20Dados-green.svg)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fbrunocampos01%2Fbanco-de-dados&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Views&edge_flat=false)](https://hits.seeyoufarm.com)

### **Fundamentos de Banco de Dados**
- [Modelagem](modelagem)
- [Normalização](normalizacao)
- [Álgebra e cálculo relacional](algebra_e_calculo)
- [SQL: aulas](sql/aulas)
- [SQL: exercícios resolvidos](sql/exercicios)
- [SQL: execução dos exercícios resolvidos direto no navegador](https://colab.research.google.com/drive/1_X-KgO7pNk_VU2w52FVcyHsSCjRLnsiE?usp=sharing)
	<details>	
	  <summary>Exemplos</summary>
	  <img src="https://github.com/brunocampos01/brunocampos01/blob/main/images/gif_googlecolab_database.gif" />
	  <br/>
	</details>

 
---

### Banco de Dados II
- [Tuning em banco de dados](bd_II)
- [Seminário sobre a rede Tangle (blockchain 3.0)](bd_II/exercicios/seminario_rede_tangle.pptx)

---

### Banco de Dados III
 - [Banco de dados orientado à objetos: aulas](bd_III/banco_de_dados_SQL/aulas/bd_orientado_a_objetos)
 - [Banco de dados orientado à objetos: exercícios](bd_III/banco_de_dados_SQL/exercicios/exercicios_bdoo)
 - [Bancos de Dados Temporais: aulas](bd_III/banco_de_dados_SQL/aulas/bd_temporais)
 - [Bancos de Dados Temporais: exercícios](bd_III/banco_de_dados_SQL/exercicios/exercicios_bdt)
 - [Bancos de Dados Geográficos: aulas](bd_III//banco_de_dados_SQL/aulas/bd_geograficos)
 - [Bancos de Dados Geográficos: exercícios](bd_III//banco_de_dados_SQL/exercicios/exercicios_bdgeograficos)
 - [Bancos de Dados XML: aulas](bd_III//banco_de_dados_SQL/aulas/bd_xml)
 - [Bancos de Dados XML: exercícios](bd_III//banco_de_dados_SQL/exercicios/exercicios_bd_xml)
 - [Not only (NoSQL)](bd_III//banco_de_dados_noSQL)
 - [New SQL](bd_III//banco_de_dados_newSQL)
 
---

<br/>

# Fundamentos em Databases
### Database
Um banco de dados é uma coleção estruturada de dados que é organizada e armazenada de forma a facilitar a recuperação, manipulação e gestão eficientes. Pense nele como um arquivo digital, onde, em vez de pastas e documentos físicos, você tem tabelas e registros organizados de forma ordenada para acesso fácil.

### Relational Database
Um banco de dados relacional é um tipo de banco de dados que organiza os dados em tabelas (relações) com linhas (registros) e colunas (campos). Essas tabelas estão interconectadas por meio de relacionamentos, permitindo que os dados sejam acessados e combinados de várias maneiras. Imagine uma coleção de planilhas, cada uma representando um aspecto diferente dos seus dados, mas com a capacidade de vincular e combinar informações entre elas de forma contínua.

### RDBMS
Um Sistema de Gerenciamento de Banco de Dados Relacional (RDBMS) é um aplicativo de software projetado para criar, gerenciar e interagir com bancos de dados relacionais. Ele fornece uma estrutura estruturada para armazenar, recuperar e manipular dados dentro do banco de dados. Alguns exemplos populares de RDBMS incluem MySQL, PostgreSQL, Oracle e Microsoft SQL Server.

### SQL
SQL (Structured Query Language) a linguagem de consulta padrão usada para interagir com bancos de dados relacionais é o SQL (Structured Query Language). Ela permite criar, ler, atualizar e excluir dados dentro do banco de dados, além de definir e modificar a própria estrutura do banco de dados. O SQL é como uma linguagem universal que possibilita a comunicação com diferentes plataformas de RDBMS.

### Tipos de SQL
- **DDL** (Linguagem de Definição de Dados), que lida com esquemas e descrições de banco de dados.
- **DML** (Linguagem de Manipulação de Dados), que lida com a manipulação de dados e inclui instruções SQL mais comuns, como SELECT, INSERT, UPDATE, DELETE etc.
- **DCL** (Linguagem de Controle de Dados), que inclui comandos como GRANT, e principalmente relacionado com direitos, permissões e outros controles do sistema de banco de dados.

### Database Design
Database design é o processo de criar uma estrutura eficiente e organizada para armazenar e gerenciar dados em um banco de dados. Isso envolve definir tabelas, colunas, relacionamentos e restrições para garantir a integridade dos dados, minimizar a redundância e otimizar o desempenho. Um design de banco de dados adequado é a base para construir aplicativos robustos e escaláveis.

![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/a49b7100-c1e3-467f-92b5-a4bb322dbcea)

### Termos em Database
- Table: Uma coleção de dados relacionados organizados em linhas e colunas.
- Row: Uma única instância ou entrada em uma tabela (também conhecida como registro ou tupla).
- Column: Uma característica ou propriedade específica dos dados em uma tabela (também conhecida como campo ou atributo).
- Primary Key: Uma coluna ou combinação de colunas que identifica exclusivamente cada linha em uma tabela.
- Foreign Key: Uma coluna ou combinação de colunas que faz referência à chave primária de outra tabela, estabelecendo um relacionamento entre as duas tabelas.
- Join: Uma operação que combina linhas de duas ou mais tabelas com base em uma coluna relacionada.
- Index: Uma estrutura de dados que melhora o desempenho das operações de recuperação de dados,
- View: Uma tabela virtual que é gerada dinamicamente.
- Stored Procedure: um SQL pre-compilado que fica no RDBMS.
- Trigger: um tipo de stored procedure que é automaticamente executada a partir de algum evento na table, por exemplo, `INSERT`, `UPDATE`, `DELETE`.

---

## Chaves em Databases
As keys no DB ajudam a garantir a integridade e estabelecer os relacionamentos entre tables. Alguns exemplos:

### Primary Key
Uma chave primária (PK) é uma coluna ou uma combinação de colunas que identifica exclusivamente cada registro em uma tabela. Garante que cada registro seja único e possa ser facilmente localizado. As chaves primárias geralmente são indexadas para melhorar o desempenho das consultas.
```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
```

### Alternate Key
Uma Alternate Key também conhecida como chave única, é qualquer outra candidate key que poderia ter sido escolhida como a chave primária, mas não foi.
```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE, -- Alternate key
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
```

### Surrogate Key and Natural Key
Uma surrogate key (SK) é uma chave artificial (geralmente um número sequencial ou um GUID) que é usada como primary key em uma tabela. Ela não possui significado inerente ou relação com os dados em si. Por outro lado, uma natural key é uma chave derivada dos próprios dados, como um ID de funcionário ou um código de produto.
```sql
-- Surrogate key
CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1), -- Surrogate key
    customer_name VARCHAR(100),
    order_date DATE
);

-- Natural key
CREATE TABLE products (
    product_code VARCHAR(10) PRIMARY KEY, -- Natural key
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
```

### Foreign Key (Chave Estrangeira)
A foreign key (FK) é uma coluna ou uma combinação de colunas em uma tabela que faz referência à PK de outra tabela. Ele estabelece um vínculo entre as duas tabelas e garante a integridade referencial, assegurando que os dados na tabela filha sejam válidos e consistentes com os dados na tabela pai.
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

### Composite Key (Chave Composta)
A composite key (chave composta) é a combinacao de 2 ou mais colunas usadas como PK ou FK
```sql
-- Composite key
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
```

---

## Relacionamentos
Relacionamentos permitem conectar e combinar dados de diferentes tabelas. Existem três tipos principais de relacionamentos:

![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/716cf408-733f-4b61-b977-061cd7cf55a2)


### One-to-One
No one-to-one relationship, **cada registro em uma tabela está associado exatamente a um registro em outra tabela**. Por exemplo, considere um banco de dados onde cada funcionário tem um e apenas um gerente, e cada gerente gerencia um e apenas um funcionário. Esse tipo de relacionamento é relativamente raro na prática.

![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/2c41a8ac-39f4-460f-be4f-4a1e8d28aa4b)

```sql
-- Option 1: Single table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_first_name VARCHAR(50),
    manager_last_name VARCHAR(50)
);

-- Option 2: Two tables with foreign key
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_id INT UNIQUE,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);
```

### One-to-Many
No one-to-many relationship, **cada registro em uma tabela (o lado "um") pode estar associado a vários registros em outra tabela (o lado "muitos")**. Por exemplo, em um banco de dados de uma escola, um professor pode lecionar várias disciplinas, mas cada disciplina é lecionada por apenas um professor.

![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/76efc3e4-6897-4122-ad6f-6f63e9873fdf)

```sql
-- Parent table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Child table
CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
```

### Many-to-Many
No many-to-many relationship, cada registro em uma tabela pode estar associado a vários registros em outra tabela, e vice-versa. Por exemplo, em um banco de dados de uma universidade, um aluno pode se matricular em várias disciplinas, e cada disciplina pode ter vários alunos matriculados.

![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/6ffc0ebd-7884-4a4b-a366-8d1facff3452)

```sql
-- Table 1
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Table 2
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    description TEXT
);

-- Junction or Intemediary table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

### Cardinalidades
Outro conceito comum em realcionamentos de DB sao as cardinalidades. A cardinalidade define a relação numérica entre duas entidades. Ela especifica o número máximo de instâncias de uma entidade que podem estar associadas a uma única instância de outra entidade. As cardinalidades mais comuns são:
- One-to-One (1:1): Uma instância da Entidade A pode estar associada a, no máximo, uma instância da Entidade B, e vice-versa.
- One-to-Many (1:N): Uma instância da Entidade A pode estar associada a várias instâncias da Entidade B, mas uma instância da Entidade B pode estar associada a apenas uma instância da Entidade A.
- Many-to-Many (M:N)): Múltiplas instâncias da Entidade A podem estar associadas a múltiplas instâncias da Entidade B, e vice-versa.

Em ER diagrama:

![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/08c30191-a92d-4fb0-9931-62c0afd5c85e)

---

## Normalização em Database
A normalização de DB é o processo de organizar dados para reduzir a redundância, e melhorar a integridade dos dados.
Os principais objetivos da normalização de banco de dados são:
- Eliminar dados redundantes
- Garantir integridade dos dados
- Facilitar a manipulação e manutenção de dados

As formas normais mais usadas são:
- Primeira Forma Normal (1NF)
- Segunda Forma Normal (2NF)
- Terceira Forma Normal (3NF)

### Primeira Forma Normal 1NF
Ela afirma que um atributo (coluna) em uma tabela deve ter valores atômicos, ou seja, cada célula na tabela deve conter um único valor. Por exemplo, considere uma tabela com uma coluna chamada "Telefones" que armazena vários números de telefone para um cliente. Isso viola a 1NF porque a coluna contém um conjunto de valores em vez de um único valor. Para normalizar à 1NF, você precisaria separar os números de telefone em colunas individuais ou criar uma tabela separada para os números de telefone.
```sql
-- Violates 1NF
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone_numbers VARCHAR(200) -- Stores multiple phone numbers, violating 1NF
);

-- Conforms to 1NF
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone1 VARCHAR(20),
    phone2 VARCHAR(20),
    phone3 VARCHAR(20)
);
```

### Segunda Forma Normal 2NF
Para estar na 2NF, uma tabela deve estar na 1NF e todos os atributos não primários devem depender completamente da chave primária. Por exemplo, considere uma tabela com uma PK composta de `(student_id, course_id)` e uma coluna `grade`. Se a coluna de `grade` depender apenas do `course_id` e não da combinação de `student_id, course_id`, então a tabela viola a 2NF.
```sql
-- Violates 2NF
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    course_name VARCHAR(100), -- Depends only on course_id, not the entire primary key
    grade CHAR(2), 
    PRIMARY KEY (student_id, course_id)
);

-- Conforms to 2NF
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);
```

### Terceira Forma Normal 3NF
A Terceira Forma Normal (3NF) amplia a 2NF, resolvendo as dependências transitivas. Por exemplo, concidere a tabela com colunas `student_id, student_name, class_id, class_name`. A `student_name` depende de `student_id`, e a `class_name` depende da `class_id`. Contudo, `class_name` tambem depende da coluna `student_id` atraves da `class_id`, o que viola a 3NF.
```sql
-- Violates 3NF
CREATE TABLE student_classes (
    student_id INT,
    student_name VARCHAR(100),
    class_id INT,
    class_name VARCHAR(100),
    PRIMARY KEY (student_id, class_id)
);

-- Conforms to 3NF
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100)
);

CREATE TABLE student_classes (
    student_id INT,
    class_id INT,
    PRIMARY KEY (student_id, class_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);
```

---

## Indices
Os índices são estruturas de dados (b-tree, hashes) que melhoram o desempenho das operações de recuperação de dados em um banco de dados. Eles criam uma representação ordenada dos dados em uma tabela, permitindo buscas e consultas mais rápidas. Existem vários tipos de índices:
- Índice Clustered: Um índice clusterizado reorganiza fisicamente as linhas em uma tabela com base nos valores-chave do índice. Cada tabela pode ter apenas um índice clusterizado.
![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/40c53804-2540-48de-8bae-d901b6cd9b25)

- Índice Nonclustered: Um índice não clusterizado é um objeto separado que contém os valores-chave do índice e ponteiros para as linhas correspondentes na tabela. Uma tabela pode ter vários índices não clusterizados.
![image](https://github.com/brunocampos01/banco-de-dados/assets/12896018/b9dd7e47-5048-45f1-a2b8-5cb1d4c60e76)



- Índice Composite: Um índice composto é um índice que inclui várias colunas na chave do índice. Pode ser clusterizado ou não clusterizado.
```sql
-- Clustered index
CREATE CLUSTERED INDEX idx_customers_name
ON customers (last_name, first_name);

-- Nonclustered index
CREATE NONCLUSTERED INDEX idx_orders_date
ON orders (order_date);

-- Composite index
CREATE INDEX idx_products_category_price
ON products (category_id, price);
```

---

## Transações
Transação em DB é uma coleção de várias operações ex: `SELECT`, `UPDATE`, `DELETE` ou `INSERT` como uma **única unidade de trabalho**. 

<img src="images/transaction.jpeg" width="80%" height="80%" align="center" valign="center"/> 

Podemos definir onde a transação começará e quando terminará. Para iniciar a transação, usamos a sintaxe `BEGIN`. Se as consultas em uma transação foram executadas com sucesso, salvamos as alterações usando a sintaxe `COMMIT`. Se as consultas em uma transação falharem na execução, então reverteremos as alterações antes da execução da transação usando a sintaxe `ROLLBACK`.
  
  
  Ex:
  ```sql
  SELECT BALANCE FROM ACCOUNT WHERE ID = 1
  UPDATE ACCOUNT SET BALANCE = BALANCE - 100 WHERE ID = 1
  UPDATE ACCOUNT SET BALANCE = BALANCE + 100 WHERE ID = 2
  ```
  
  <img src="images/commit.png" width="50%" height="70%" align="center" valign="center"/> 
  
  <img src="images/rollback.png" width="50%" height="70%" align="center" valign="center"/> 
  
  <br/>

### Propriedades das Trasações
Todo banco de dados RELACIONAL deve possuir as propriedades ACID:
- **ATOMICIDADE**: todas as operações de uma transação são realizadas. Isso significa que em caso de sucesso deve ser executada totalmente e em casos de erros ou falhas deve ser abortada por completo.
- **CONSISTENCIA**: leva o DB de um estado consistente para outro estado consistente.
- **INDEPENDENCIA**: o processamento de transações não deve interferir em outras transações.
- **DURABILIDADE**: resultados de operações confirmadas não devem interferir em outras transações.
  
### Controle de transações
Controle de transações serve para garantir as caracteristicas fundamentais de uma transação (ACID).

#### Protocolo 2phase commit
- Preparação: um dos participantes é eleito coordenador e envia a cada nodo uma solicitação para preparar para o commit.
- Commit: se todos os nodos participantes estão prontos, o coordenador envia um sinal de commit para cada participante e depois executa
  - Se um nodo falhar na preparação do coomit, o coordenador manda um sinal de rollback para todos.
  - Se o nodo coordenador cair: haverá um backup que será eleito. Em seguida por broadcast, os outros nodos são avisados da mundança.
  	
### Lock e Deadlock
Lock é quando uma ação está sendo tomada DB e para evitar a concorrência de 2 comandos em cima do mesmo registro ou tabela, um lock (travamento) é executado. Quando um lock é ativo a transação por sua vez aguarda o unlock (destravamento) da tarefa que estava a sua frente para assim poder ser executada. 
<br/>
Já o DeadLock, é um caso que ocorre nos bancos de dados quando são feitos muitos lock’s que dependem de outros lock’s para prosseguirem, causando uma fila eterna de bloqueio.

<img src="images/deadlock.png" width="80%" height="80%" align="center" valign="center"/> 

Isso causa um ciclo de dependências (dependência cíclica) e assim impedindo que qualquer tarefa possa ser executada. Geralmente em casos assim, os SGBD’s cancelam ambas as transações para que as próximas possam ser realizadas.

---

<br/>

### **Livros de Referência**
- [Sistemas de Banco de Dados - Elmasri e Navathe - 6ª Edicao](https://github.com/brunocampos01/banco-de-dados/blob/master/livros/Sistemas%20de%20Banco%20de%20Dados%20navathe%206%C2%AA%20Edicao.pdf)
- [Sistemas de Gerenciamento de Banco de Dados - Ramakrishnan e Gehrke - 6ª Edicao](https://github.com/brunocampos01/banco-de-dados/blob/master/livros/Sistemas%20de%20Gerenciamento%20de%20Banco%20de%20Dados%20-%203%C2%AA%20Ed.pdf)
- [Use a cabeca - SQL](https://github.com/brunocampos01/banco-de-dados/blob/master/livros/Use%20a%20Cabeca%20-%20SQL.pdf)

---

<p  align="left">
	<br/>
	<a href="mailto:brunocampos01@gmail.com" target="_blank"><img src="https://github.com/brunocampos01/brunocampos01/blob/main/images/email.png" width="30">
	</a>
	<a href="https://stackoverflow.com/users/8329698/bruno-campos" target="_blank"><img src="https://github.com/brunocampos01/brunocampos01/blob/main/images/stackoverflow.png" width="30">
	</a>
	<a href="https://www.linkedin.com/in/brunocampos01" target="_blank"><img src="https://github.com/brunocampos01/brunocampos01/blob/main/images/linkedin.png" width="30">
	</a>
	<a href="https://github.com/brunocampos01" target="_blank"><img src="https://github.com/brunocampos01/brunocampos01/blob/main/images/github.png" width="30"></a>
	<a href="https://medium.com/@brunocampos01" target="_blank"><img src="https://github.com/brunocampos01/brunocampos01/blob/main/images/medium.png" width="30">
	</a>
    <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png",  align="right" />
    </a>
    <br/>
</p>
