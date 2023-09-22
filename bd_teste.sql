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
insert into * values ()*/

/* de todo modo, o mais comum e recomendado é
mesmo indicar quais colunas serão preenchidas, como abaixo*/

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