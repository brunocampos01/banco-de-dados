-- SELECTS
﻿-- a)Apresente as informações de todas as locações com o nome de seus respectivos clientes e funcionários.
SELECT l.*, c.nome, f.nome
FROM locacoes l
    JOIN clientes c ON l.cpf = c.cpf
    JOIN funcionarios f ON l.codf = f.codf;
  
-- b) Busque o nome dos func e a data de sua última loc (mesmo os que nunca participaram da locação de um veículo). 
﻿SELECT f.nome, max(l.inicio)
FROM locacoes l RIGHT JOIN funcionarios f ON l.codf = f.codf
GROUP BY f.codf, f.nome;

-- c) Apresente o tipo de cada uma das habilitações e o respectivo número de clientes que as possuem.
﻿SELECT h.tipo, count(*)
FROM habilitacoes h JOIN clientes c ON c.codh = h.codh
GROUP BY h.tipo;

-- d) Busque o nome, o estado civil e o número de filhos dos clientes que locaram veículos por mais de dois dias.
﻿SELECT c.nome, c.estado_civil, c.num_filhos
FROM clientes c JOIN locacoes l ON c.cpf = l.cpf
WHERE l.fim - l.inicio > 2;

--e) Para cada func apresente o nome, o código e o sal acrescido de 5% por cada loc a partir do dia 05/01/2017.
﻿SELECT f.nome, f.codf, (f.salario + f.salario * count(*) * 0.05)
FROM funcionarios f JOIN locacoes l ON f.codf = l.codf
WHERE l.inicio > '2017-01-05'
GROUP BY f.codf, f.nome;

SELECT f.nome, f.codf, (f.salario + f.salario *
  (SELECT count(*) * 0.05
   FROM locacoes l
   WHERE f.codf = l.codf AND l.inicio > '2017-01-05')
)
FROM funcionarios f;

-- f) Apresente o nome, o código e o salário acrescido de 15% do funcionário que mais participou de locações.
﻿SELECT f.nome, f.codf, f.salario * 1.15
FROM funcionarios f JOIN locacoes l ON f.codf = l.codf
GROUP BY f.codf, f.nome
HAVING count(*) >= ALL(SELECT count(*)
                       FROM locacoes
                       GROUP BY codf);


