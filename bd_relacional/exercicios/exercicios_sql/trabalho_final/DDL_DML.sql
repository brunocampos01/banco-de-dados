SELECT * FROM locacoes;
SELECT * FROM clientes;
SELECT * FROM funcionarios;
SELECT * FROM veiculos;
SELECT * FROM habilitacoes;
SELECT * FROM veiculosHabilitacoes;

/*a) A	 tabela	 VeiculosHabilitacoes possui  uma  chave primária natural composta.Você deverá substituir essa 
chave primária	por	outra, com	auto incremento.*/

-- Remove constraint da chave primária.
ALTER TABLE veiculoshabilitacoes DROP CONSTRAINT pk_veiculoshabilitacoes;
-- Cria campo de auto incremento.
ALTER TABLE veiculoshabilitacoes ADD COLUMN id serial NOT NULL;
-- Adiciona constraint de chave primária ao novo campo.
ALTER TABLE veiculoshabilitacoes ADD CONSTRAINT pk_veiculoshabilitacoes PRIMARY KEY (id);

/*b) Crie uma visão q exiba, p cada	CPF	e nome de cliente, a duraçã média (em dias)	das	locações feitas pelo mesmo 
juntamente	com	a média	do valor pago por essas	locações.*/
CREATE VIEW visao AS
SELECT clientes.cpf, clientes.nome, avg(locacoes.fim - locacoes.inicio) AS media_dias, avg(valor) AS media_valor
FROM clientes JOIN locacoes ON clientes.cpf = locacoes.cpf
GROUP BY clientes.cpf
ORDER BY clientes.cpf DESC;

/*c) Para	atender	a	algumas	regras	de	negócio	definidas	na	questão	1,	providencie	constraints, funções	e/ou	gatilhos	que:
1. garantam	que	a	data	de	início	de	uma	locação	seja	menor	do	que	a	data	de	fim	de	uma	locação	
(observando	que	há	locações	que	podem	ter	a	data	de	fim	nula); fim date CHECK(fim>inicio);
2. garantam	que	um	cliente	apenas	poderá	locar	veículos	para	os	quais	está habilitado.	(Peso:	2)*/

-- Definição da função.
CREATE OR REPLACE FUNCTION verifica_habilitacao() RETURNS TRIGGER AS
$body$
  DECLARE
    contador integer;
  BEGIN

    -- Recupera os dados relacionados (aqui, se obtém habilitações para veículos e clientes).
    SELECT count(*) INTO contador
      FROM veiculos v
      JOIN tiposveiculos tv ON v.codtipo = tv.codtipo
      JOIN veiculoshabilitacoes vh ON tv.codtipo = vh.codtipo
      JOIN habilitacoes h ON vh.codh = h.codh
      JOIN clientes c ON h.codh = c.codh
     WHERE c.cpf = NEW.cpf
       AND v.matricula = NEW.matricula;

    -- Caso não seja encontrada uma relação possível, exibe erro.
    IF contador = 0 THEN
      RAISE EXCEPTION 'O veículo não pode ser locado ao cliente pois o mesmo não possui a habilitação necessária!';
    END IF;

    RETURN NEW;
    
  END;
$body$
LANGUAGE plpgsql;

-- Definição do gatilho.
CREATE TRIGGER verifica_habilitacao
BEFORE INSERT OR UPDATE ON locacoes
FOR EACH ROW EXECUTE PROCEDURE verifica_habilitacao();
