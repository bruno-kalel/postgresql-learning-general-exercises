select * from aluno;
select * from aluno_curso;
select * from curso;

/* no caso de querer deletar um aluno que está matriculado em um curso */
/* ou de deletar um curso em que já está matrículado um aluno */
/* tal ação não é permitida */
delete from aluno where id = 1;
delete from curso where id = 1;

/* podemos substituir o impedimento da ação de exclusão */
/* por excluir o aluno e também remover ele do curso */

drop table aluno_curso;

create table aluno_curso
(
	aluno_id int,
	curso_id int,
	primary key (aluno_id, curso_id),
	/* on delete cascade desmatricula o aluno do curso */
	/* ou seja, exclui o aluno da tabela aluno_curso */
	/* por padrão, é on delete restrict */
	foreign key (aluno_id) references aluno (id) on delete cascade,
	foreign key (curso_id) references curso (id)
);

insert into aluno_curso (aluno_id, curso_id) values (1, 1);
insert into aluno_curso (aluno_id, curso_id) values (1, 2);
insert into aluno_curso (aluno_id, curso_id) values (2, 1);
insert into aluno_curso (aluno_id, curso_id) values (2, 2);

select * from aluno_curso;

delete from aluno where id = 1;

select * from aluno;

/* aluno de id 1 também foi removido da tabela aluno_curso com todas as suas matrículas */
select * from aluno_curso;