# Transações
É qualquer execução única de um programa usáriuo que exercce uma série de operações.

## Recuperação de Falhas
O SGBD garante que as alteraçoes de transações parciais não sejam vistas por outras transações

## Propriedades:
Todo banco de dados RELACIONAL deve possuir as propriedades ACID:
ATOMICIDADE: todas as operações de uma transação são realizadas.
CONSISTENCIA: leva o DB de um estado consistente para outro estado consistente.
INDEPENDENCIA: o processamento de transações não deve interferir em outras transações
DURABILIDADE: resultados de operações confirmadas não devem interferir em outras transações.

## Controle de transações
Controle de transações serve para garantir as caracteristicas fundamentais de uma transação (ACID).

## Escalonamento de transações
Com lock<br\>
otimista
### Protocolo 2phase commit
#### Preparação
Um dos participantes é eleito coordenador e envia a cada nodo uma solicitação para preparar para o commit.

#### Commit
- Se todos os nodos participantes estão prontos
