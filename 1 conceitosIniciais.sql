create table aluno
(
	id serial,
	nome varchar(255),
	cpf char(11),
	observacao text,
	idade integer,
	saldo_conta numeric (10, 2),
	altura real,
	ativo boolean,
	data_nascimento date,
	horario_aula time,
	matriculado_em timestamp
);

select * from aluno;

/* para inserir valores em todos os campos da tabela:
insert into * values () */

/* de todo modo, o mais comum e recomendado é
mesmo indicar quais colunas serão preenchidas, como abaixo */

/* id é incluído automaticamente, não é preciso adicionar */

/* string entre aspas simples */

insert into aluno
(
	nome,
	cpf,
	observacao,
	idade,
	saldo_conta,
	altura,
	ativo,
	/* yyyy-mm-dd */
	data_nascimento,
	/* hh24:mi:ss */
	horario_aula,
	/* yyyy-mm-dd hh24:mi:ss */
	matriculado_em
)

values
(
	'bruno',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
	99,
	567.01,
	1.27,
	true,
	'1536-04-23',
	'17:05:47',
	'2653-03-06 20:07:58'
)

select * from aluno;

/* select * from aluno where id = 1; */

update
aluno

set
nome = 'kalel', cpf = '98765432101'

where
id = 1;

/* select * from aluno where nome = 'kalel'; */

delete from
aluno

where
nome = 'kalel';

select * from aluno;

/* as = alias */

select
nome as "nome do aluno",
idade as "idade do aluno",
ativo as "situação do aluno"
from aluno;

select * from aluno;

insert into aluno (nome) values ('bruno2');
insert into aluno (nome) values ('bruno3');
insert into aluno (nome) values ('bruno4');
insert into aluno (nome) values ('bruno5');
insert into aluno (nome) values ('bruno99');

select * from aluno;

/* filtros de caracteres */

/* output: linha do aluno bruno2 */
select * from aluno where nome = 'bruno2';

/* output: blank, pois não há aluno com esse nome */
select * from aluno where nome = 'bruno10';

/* output: todos os alunos, pois não há aluno com esse nome */
/* obs: <> = != */
select * from aluno where nome <> 'bruno10';
select * from aluno where nome != 'bruno10';

/* output: apenas o aluno com nome bruno */
select * from aluno where nome like 'bruno';

/* output: apenas o aluno com nome bruno */
/* operador especial do like _  = any */
select * from aluno where nome like '_runo';

/* output: todos os alunos com nomes que iniciam em bruno
e possuem UMA outra coisa depois */
select * from aluno where nome like 'bruno_';

/* output: todos os alunos com nomes que iniciam em bruno
e possuem DUAS outras coisas depois */
select * from aluno where nome like 'bruno__';

/* not like */

/* output: ficam de fora aqueles que possuem UMA coisa depois no nome */
select * from aluno where nome not like 'bruno_';

/* operador especial do like % = any from or before that point */
/* output: todos os alunos, pois todos começam com b */
select * from aluno where nome like 'b%';

/* output: apenas o aluno bruno99, pois apenas ele termina com 99 */
select * from aluno where nome like '%99';

/* output: nenhum aluno, pois nenhum possui espaço no nome */
select * from aluno where nome like '% %';

/* output: todos os alunos, pois todos atendem à condição */
select * from aluno where nome like '%u%o%';

/* filtro especial que funciona para todos os tipos de campo */

/* output: todos os alunos, pois todos possuem o campo nome preenchido */
select * from aluno where nome is not null;

/* output: nenhum aluno, pois todos possuem o campo nome preenchido */
select * from aluno where nome is null;

/* output: apenas o aluno bruno, pois só ele possui os outros campos prenchidos */
select * from aluno where cpf is not null;

/* filtros numéricos */
/* obs: também serve para data e hora */

/* output: bruno */
select * from aluno where idade = 99;

/* output: nenhum aluno */
select * from aluno where idade = 98;

/* output: bruno */
select * from aluno where idade <> 98;

/* output: nenhum aluno */
/* obs: esse tipo de filtro não compreende os campos nulos como diferentes de 99, neste exemplo */
select * from aluno where idade <> 99;

/* output: bruno */
select * from aluno where idade >= 99;

/* output: nenhum aluno */
select * from aluno where idade <= 98;

/* output: nenhum aluno */
select * from aluno where idade > 99;
select * from aluno where idade < 98;

/* obs: o between é inclusivo, ou seja, inclui o número declarado na busca */

/* output: bruno */
/* inclui o 90 e o 10 na busca (>= / <=) */
select * from aluno where idade between 90 and 100;

/* output: nenhum aluno */
/* inclui o 10 e o 20 na busca (>= / <=) */
select * from aluno where idade between 10 and 20;

/* filtros booleanos */
/* de forma semelhante, o retorno do false não inclui os nulos */

/* output: bruno */
select * from aluno where ativo = true;

/* output: nenhum aluno */
select * from aluno where ativo = false;

/* filtros lógicos e e ou */

/* and é válido quando as duas condições retornam como verdadeiras */
/* output: todos os alunos que possuem nome iniciando em bruno
e cpf preenchido */
select * from aluno where nome like 'bruno%' and cpf is not null;

/* or é válido quando ao menos uma das duas condições retornam como verdadeiras */
/* aqui ele consegue trazer o aluno bruno, mesmo não existindo um bruno200 */
select * from aluno where nome like 'bruno' or nome like 'bruno200*';

/* output: todos os alunos que possuem nome iniciando em bruno,
cpf preenchido
e idade preenchida */
select * from aluno where nome like 'bruno%' and cpf is not null and idade is not null;

/* chaves primárias */

/* inserindo valores nulos no identificador, o que não é ideal */
create table curso
(
	id integer,
	nome varchar(255)
);

insert into curso
( 
	id,
	nome
)

values
(
	NULL,
	NULL
);

select * from curso;

drop table curso;

/* evitando que o identificador possa ser nulo, mas ainda podem existir identificadores iguais */
create table curso
(
	id integer not null,
	nome varchar(255) not null
);

insert into curso
( 
	id,
	nome
)

values
(
	1,
	'curso1'
);

insert into curso
( 
	id,
	nome
)

values
(
	1,
	'curso2'
);

select * from curso;

drop table curso;

/* evitando que identificadores possam se repetir */
create table curso
(
	id integer not null,
	nome varchar(255) not null
);

insert into curso
( 
	id,
	nome
)

values
(
	1,
	'curso1'
);

insert into curso
( 
	id,
	nome
)

values
(
	2,
	'curso2'
);

select * from curso;

/* id agora possui as características de um chave primária */
/* chaves primárias não podem ser nulas e precisam ser únicas */

/* argumento not null unique pode ser substituído pelo argumento primary key */
create table curso
(
	id integer primary key,
	nome varchar(255) not null
);

insert into curso
( 
	id,
	nome
)

values
(
	1,
	'curso1'
);

insert into curso
( 
	id,
	nome
)

values
(
	2,
	'curso2'
);

select * from curso;