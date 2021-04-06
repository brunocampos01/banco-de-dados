# Noções Básicas de BD Distribuídos

## Transações
É qualquer execução única de um programa usuário que exerce uma série de operações.

### Propriedades
Todo banco de dados RELACIONAL deve possuir as propriedades ACID:
- ATOMICIDADE: todas as operações de uma transação são realizadas.<br/>
- CONSISTENCIA: leva o DB de um estado consistente para outro estado consistente.<br/>
- INDEPENDENCIA: o processamento de transações não deve interferir em outras transações<br/>
- DURABILIDADE: resultados de operações confirmadas não devem interferir em outras transações.<br/>

### Controle de transações
Controle de transações serve para garantir as caracteristicas fundamentais de uma transação (ACID).

### Escalonamento de transações
- com lock
- otimista

#### Protocolo 2phase commit

##### Preparação
Um dos participantes é eleito coordenador e envia a cada nodo uma solicitação para preparar para o commit.

##### Commit
- Se todos os nodos participantes estão prontos, o coordenador envia um sinal de commit para cada participante e depois executa
- Se um nodo falhar na preparação do coomit, o coordenador manda um sinal de rollback para todos.
- Se o nodo coordenador cair: haverá um backup que será eleito. Em seguida por broadcast, os outros nodos são avisados da mundança.


### Deadlocks
...

---

# Processamento e Otimização de consultas
É sempre necessário levar em conta:
- replicação dos dados
- reconstrução das relações a partir de fragmentos
- tempo de recuperação
- tempo de processamento
- transmissão pela rede

## Fragmentação de dados
Um dado ou relação será fragmentado e armazenado em diferentes nodos.<br>
A fragmentação pode ser de 2 formas:
- Horizontal: os fragmentos são definidos por SELEÇÃO
- Vertical: os fragmentos são definidos por PROJEÇÃO
