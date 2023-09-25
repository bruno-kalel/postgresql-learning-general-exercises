create table funcionarios
(
	id serial primary key,
	matricula varchar(10),
	nome varchar(255),
	sobrenome varchar(255)
);

insert into funcionarios (matricula, nome, sobrenome) values ('m001', 'diogo', 'mascarenhas');
insert into funcionarios (matricula, nome, sobrenome) values ('m002', 'vinícius', 'dias');
insert into funcionarios (matricula, nome, sobrenome) values ('m003', 'nico', 'steppat');
insert into funcionarios (matricula, nome, sobrenome) values ('m004', 'joão', 'roberto');
insert into funcionarios (matricula, nome, sobrenome) values ('m005', 'diogo', 'mascarenhas');
insert into funcionarios (matricula, nome, sobrenome) values ('m006', 'alberto', 'martins');
insert into funcionarios (matricula, nome, sobrenome) values ('m007', 'diogo', 'oliveira');

/* ordenação por itens da coluna */

select * from funcionarios order by nome;

select * from funcionarios order by matricula;

select * from funcionarios order by matricula desc;

select * from funcionarios order by nome, matricula;

select * from funcionarios order by nome, matricula desc;

/* ordenação por índice da coluna */

select * from funcionarios order by 1;

select * from funcionarios order by 2;

select * from funcionarios order by 3;

select * from funcionarios order by 4;

/* 3 - nome, 4 - sobrenome, 2 - matrícula */
select * from funcionarios order by 3, 4, 2;

/* por padrão, a ondenação é feita em ascending */

/* em casos de nomes duplicados de colunas, é possível argumentar como nomedatabela.nomedacoluna */
select * from funcionarios order by funcionarios.nome;

/* não funciona */
select aluno.id   as "id do aluno",
       aluno.nome as "nome do aluno",
	   curso.id   as "id do curso",
	   curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id
order by nome

/* funciona */
select aluno.id   as "id do aluno",
       aluno.nome as "nome do aluno",
	   curso.id   as "id do curso",
	   curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id
order by curso.nome

/* funciona */
select aluno.id   as "id do aluno",
       aluno.nome as "nome do aluno",
	   curso.id   as "id do curso",
	   curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id
order by curso.nome desc