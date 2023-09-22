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