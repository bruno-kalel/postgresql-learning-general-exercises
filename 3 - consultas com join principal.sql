/* consultas */
/* isto é, juntar mais de uma tabela em uma consulta */

select * from aluno;
select * from curso;
select * from aluno_curso;

insert into aluno_curso (aluno_id, curso_id) values (2, 2);

/* join principal, onde os dados precisam necessariamente existir nas duas tabelas */
/* neste caso, retornarão todos os dados da tabela aluno com todos os dados da tabela curso */
/* em que há a ligação */
select aluno.nome as "nome do aluno", curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id;