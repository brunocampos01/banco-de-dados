-- Bruno A R M Campos

-- 1. Exiba no OpenJUMP todos os municípios.
SELECT *
FROM municipios_2010 

-- 2. Exiba no OpenJUMP a cidade onde você nasceu.
SELECT *
FROM municipios_2010 
WHERE nome = 'Florianópolis'

-- 3. Qual a área da cidade onde você naceu? st_area
SELECT st_area(geom)
FROM municipios_2010 
WHERE nome = 'Florianópolis' 

-- 4.Qual a cidade do estado de Santa Catarinacom a maior área (apresentar SQL)? st_area
SELECT max(st_area(geom))
FROM municipios_2010 
WHERE uf = 'SC'

-- 6. Qual a distância entre entre Florianópolis e Lages(apresentar SQL)? st_distance
SELECT st_distance(
	(SELECT geom
	FROM municipios_2010 
	WHERE nome = 'Florianópolis')
	,
	(SELECT geom
	FROM municipios_2010 
	WHERE nome = 'Lages')
)
FROM municipios_2010 

-- 7. Quais são os municípios vizinhos a Blumenau?
SELECT t.geom, t.nome
FROM municipios_2010 b , municipios_2010 t
WHERE b.nome= 'Blumenau' and st_touches(b.geom, t.geom)

SELECT t.geom, t.nome
FROM municipios_2010 b , municipios_2010 t
WHERE b.nome= 'Blumenau' and ST_Intersects(b.geom, t.geom)

