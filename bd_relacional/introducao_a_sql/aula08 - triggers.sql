CREATE TABLE log(
identificador INT, tabela VARCHAR (10), operacao VARCHAR (10), dado VARCHAR (100) );

-- FUNÇÃO PARA REGISTRAR LOGS
CREATE OR REPLACE FUNCTION registra_log() RETURNS TRIGGER AS $body$
DECLARE dados_antigos TEXT; dados_novos TEXT;
BEGIN
IF (TG_OP = 'UPDATE') THEN
	dados_antigos := ROW(OLD.*); dados_novos := ROW(NEW.*);
	INSERT INTO log VALUES (dados_antigos, dados_novos); RETURN NEW;
ELSIF (TG_OP = 'DELETE') THEN
	dados_antigos := ROW(OLD.*);
	INSERT INTO log VALUES (dados_antigos, DEFAULT); RETURN OLD;
ELSIF (TG_OP = 'INSERT') THEN
	dados_novos := ROW(NEW.*);
	INSERT INTO log VALUES (DEFAULT, dados_novos); RETURN NEW;
END IF;
END;
$body$
LANGUAGE plpgsql;


CREATE TRIGGER log_pacientes
AFTER INSERT OR UPDATE OR DELETE ON pacientes
FOR EACH ROW EXECUTE PROCEDURE registra_log();

CREATE TRIGGER log_medicos
AFTER INSERT OR UPDATE OR DELETE ON medicos
FOR EACH ROW EXECUTE PROCEDURE registra_log();

CREATE TRIGGER log_ambulatorios
AFTER INSERT OR UPDATE OR DELETE ON ambulatorios
FOR EACH ROW EXECUTE PROCEDURE registra_log();

INSERT INTO pacientes
VALUES (9,'eueue', 1, 'florianopolis', 12345678999, 'catapora');

--DELETAR TRIGGERS
DROP TRIGGER  log_pacientes ON pacientes;
DROP TRIGGER log_medicos ON medicos;
DROP TRIGGER log_ambulatorios ON ambulatorios;