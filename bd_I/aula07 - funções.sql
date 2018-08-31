--CONDICIONAL
CREATE OR REPLACE FUNCTION numero_par (i int)
RETURNS boolean AS $$
DECLARE
	temp int;
BEGIN
	temp := i % 2;
	IF temp = 0 THEN RETURN true;
	ELSE RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;
SELECT numero_par(3), numero_par(42);

--LAÇO
CREATE OR REPLACE FUNCTION fatorial (i numeric)
RETURNS numeric AS $$
DECLARE
	temp numeric; resultado numeric;
BEGIN
	resultado:=1;
	FOR temp IN 1 .. i LOOP
		resultado:= resultado*temp;
	END LOOP;
	RETURN resultado;
END;
$$ LANGUAGE plpgsql;
SELECT fatorial (4::numeric);

-- LOOP WHILE
CREATE OR REPLACE FUNCTION fatorial (i numeric)
RETURNS numeric AS $$
DECLARE
	temp numeric; resultado numeric;
BEGIN
	resultado:=1; temp:=1;
	WHILE temp<= i LOOP
		resultado:=resultado*temp;
		temp:=temp + 1;
	END LOOP;
	RETURN resultado;
END;
$$ LANGUAGE plpgsql;
SELECT fatorial(4::numeric);

--RECURSIVIDADE
CREATE OR REPLACE FUNCTION fatorial (i numeric)
RETURNS numeric AS $$
BEGIN
	IF i = 0 THEN
		RETURN 1;
	ELSIF i = 1 THEN
		RETURN 1;
	ELSE
		RETURN i * fatorial(i - 1);
	END IF;
END;
$$ LANGUAGE plpgsql;
SELECT fatorial(42::numeric);

--SQL DINAMICO ??????????????
CREATE OR REPLACE FUNCTION inseri_medicos(codm int)
RETURNS codm AS $$
DECLARE
	registro RECORD;
BEGIN
	EXECUTE ’INSERT INTO medicos
	VALUES (9, 'bruno', 50, 'neurologista', 12345678919, 'florianopolis', 2)'
	RETURN registro;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM inseri_medicos(1);



