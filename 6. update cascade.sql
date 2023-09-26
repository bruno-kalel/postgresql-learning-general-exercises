/* no caso de desejar atualizar id de um aluno vinculado a um curso */
/* pois está sendo utilizado como chave na tabela de relacionamento aluno_curso */
/* não é possível */
update aluno set id = 10 where id = 2;

drop table aluno_curso;

create table aluno_curso
(
	aluno_id int,
	curso_id int,
	primary key (aluno_id, curso_id),
	/* on update cascade atualiza o aluno no curso */
	/* ou seja, altera o id do aluno da tabela aluno_curso */
	/* por padrão, é on update update */
	foreign key (aluno_id) references aluno (id) on delete cascade on update cascade,
	foreign key (curso_id) references curso (id)
);

insert into aluno_curso (aluno_id, curso_id) values (2, 1);
insert into aluno_curso (aluno_id, curso_id) values (2, 2);

select * from aluno_curso;

/* agora a atualização de id do aluno funciona */;
update aluno set id = 10 where id = 2;

select * from aluno_curso;

select aluno.id   as "id do aluno",
       aluno.nome as "nome do aluno",
	   curso.id   as "id do curso",
	   curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id;

update aluno set id = 100 where id = 10;

/* alteração feita no id do aluno refletiu na tabela aluno_curso */
select aluno.id   as "id do aluno",
       aluno.nome as "nome do aluno",
	   curso.id   as "id do curso",
	   curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id;

select * from aluno_curso;
