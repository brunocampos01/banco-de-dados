SELECT * FROM consultas;

--o particionamento	deverá	ser	feito	pelo	campo	"data",	e	cada partição	deverá	armazenar dados	de	um	MES	inteiro;

CREATE TABLE consultas_outubro(
CONSTRAINT consultas_outubro_heranca CHECK (data>='01/10/2016' AND data>='31/10/2016')
) INHERITS (consultas);

CREATE TABLE consultas_novembro(
CONSTRAINT consultas_novembro_heranca CHECK (data>='01/11/2016' AND data>='30/11/2016')
) INHERITS (consultas);

--regras (rules) para a	distribuição de	dados nas tabelas com herança
