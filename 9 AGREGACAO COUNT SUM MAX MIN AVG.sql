/* funções de agregação */
/* count, sum, max, min, avg */

select * from funcionarios;

/* no caso de contar quantos registros há na tabela */
/* count aceita um campo */
select count(id) from funcionarios;
/* também aceita o coringa *, que significa todos os campos */
select count(*) from funcionarios;

/* sum */
/* 1 + 2 + 3 + 4 + 5 + 6 + 7 */
select sum(id) from funcionarios;

/* max */
select max(id) from funcionarios;

/* min */
select min(id) from funcionarios;

/* avg */
/* (1 + 2 + 3 + 4 + 5 + 6 + 7) / 7 */
select avg(id) from funcionarios;
select round(avg(id)) from funcionarios;
select round(avg(id), 0) from funcionarios;
select round(avg(id), 1) from funcionarios;
select round(avg(id), 2) from funcionarios;
select round(avg(id), 3) from funcionarios;