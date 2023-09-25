/* cláusula limit traz apenas os n primeiros registros que atendem às condições */
select * from funcionarios limit 5;
select * from funcionarios order by nome limit 5;

/* paginação de dados */
/* cláusula offset anda determinada quantidade de registros pra frente */

/* offset 0 - desde o primeiro registro */
select * from funcionarios order by id limit 5 offset 0;
/* offset 1 - id 2 ao id 6 - pular uma linha */
select * from funcionarios order by id limit 5 offset 1;
/* offset 2 - id 3 ao id 7 - pular duas linhas */
select * from funcionarios order by id limit 5 offset 2;

/* quando o n de linhas - valor do offset < n do limit, ele funciona porém com um número limit menor */
select * from funcionarios order by id limit 5 offset 5;