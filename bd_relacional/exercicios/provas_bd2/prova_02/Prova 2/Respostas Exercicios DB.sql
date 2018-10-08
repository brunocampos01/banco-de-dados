& = Seleção
@ = projeção


-- A1) filtrar os funcionários desejados (das filias de Florianópolis e Blumenau) no
--   nodo1 e enviar o resultado para o nodo 2

NODO1. n1.func <- func
select nome, codF, func.nRoFilial from n1.func where n1.func in (n2.filial)

NODO2. n2.func <- &(Filial)cidade="Florianópolis"
|n2.Filial| = 20
ffln <- select nRoFilial from n2.Filial

NODO3. n3.func <- &(Filial)cidade="Blumenau"
|n3.Filial| = 10
fblu <- select nRoFilial from n3.Filial


-- A2) trazer os atributos desejados de funcionários e os códigos
--   das filiais de Blumenau para o nodo2 e processar a consulta no
--   nodo2

NODO1. n1.func <- func
select nome, codF, func.nRoFilial from n1.func where n1.func in (n2.filial)

NODO2. n2.func <- &(Filial)cidade="Florianópolis"
|n2.Filial| = 20
ffln <- select nRoFilial from n2.Filial

NODO3. n3.func <- &(Filial)cidade="Blumenau"
|n3.Filial| = 10
fblu <- select nRoFilial from n3.Filial




# +=============================================================================+ #
#                                     13/11/15                                    #
# +=============================================================================+ #
a.i)
# NODO SC
SC: sc.aluno <- S uf='SC'(Aluno)
SELECT * FROM Aluno WHERE uf='SC'

# NODO PB
PB: pb.aluno <- S uf='PB'(Aluno)
SELECT * FROM Aluno WHERE uf='PB'

a.ii)
SC: sc.cursa <- p * (Cursa C |x| sc.aluno A (C.idA = A.idA) )

PB: pb.cursa <- p * (Cursa C |x| sc.aluno A (C.idA = A.idA) )

a.iii)
SC: sc.disciplina <- disciplina

PB: pb.disciplina <- disciplina

a.iv)
# RS
RS: rs.aluno <- aluno
RS: rs.cursa <- cursa

# RJ
RJ: rj.aluno <- aluno
RJ: rj.cursa <- cursa

# PE
PE: pe.aluno <- aluno
PE: pe.cursa <- cursa

# DF
DF: df.aluno <- aluno
DF: df.cursa <- cursa

b.i)

SC:
consulta:
  SELECT D.idD, D.nome, sum(nAlunos) as nAlunos, (SUM(sumNotas)/nAlunos) AS nNotas
  FROM  SC.sumSc UNION PB.sumPb NAT JOIN Disciplina D
  GROUP BY D.idD, D.nome   


  CREATE VIEW SC.sumSc as { 
    SELECT c.idD, COUNT(A.*) AS nAlunos, SUM(c.nota) AS sumNotas
    FROM  sc.cursa c
    GROUP BY c.idD
  }

PB:
  CREATE VIEW PB.sumPb as {
    SELECT c.idD, COUNT(A.*) AS nAlunos, SUM(c.nota) AS sumNotas
    FROM  pb.cursa c
    GROUP BY c.idD
  }



