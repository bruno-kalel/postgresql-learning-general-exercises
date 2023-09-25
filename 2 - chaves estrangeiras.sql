/* chaves estrangeiras */

select * from curso;

select * from aluno;

drop table aluno;

create table aluno
(
	id serial primary key,
	nome varchar(255) not null
);

insert into aluno (nome)

values ('bruno1');

insert into aluno (nome)

values ('bruno2');

create table aluno_curso
(
	aluno_id int,
	curso_id int,
	primary key (aluno_id, curso_id) /* chave primária composta, não recomendado */
);

select * from aluno_curso;

insert into aluno_curso (aluno_id, curso_id)

values (1, 1);

insert into aluno_curso (aluno_id, curso_id)

values (2, 1);

select * from aluno where id = '1';
select * from curso where id = '1';

select * from aluno where id = '2';
select * from curso where id = '1';

/* caso fosse adicionado um aluno de id 3 (que não existe), essa tabela aceitaria, o que não é ideal */

drop table aluno_curso;

create table aluno_curso
(
	aluno_id int,
	curso_id int,
	primary key (aluno_id, curso_id) /* chave primária composta, não recomendado */,
	foreign key (aluno_id) references aluno (id),
	foreign key (curso_id) references curso (id)
);

insert into aluno_curso (aluno_id, curso_id)
values (1, 1);
/* funciona */

insert into aluno_curso (aluno_id, curso_id)
values (1, 2);
/* funciona */

insert into aluno_curso (aluno_id, curso_id)
values (2, 1);
/* funciona */

insert into aluno_curso (aluno_id, curso_id)
values (1, 3);
/* não funciona !! */

insert into aluno_curso (aluno_id, curso_id)
values (3, 1);
/* não funciona !! */

insert into aluno_curso (aluno_id, curso_id)
values (3, 3);
/* não funciona !! */

select * from aluno_curso;