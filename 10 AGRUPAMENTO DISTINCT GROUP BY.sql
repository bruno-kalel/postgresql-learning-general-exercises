/* agrupando consultas */

select nome from funcionarios;

/* estudo de caso, listar todos os nomes da tabela funcionários sem que eles se repitam */
/* no caso daqueles funcionários que possuem o nome igual */

select nome from funcionarios order by nome;

/* há três diogos */
/* duas formas de mostrar apenas uma linha 'diogo' */
/* forma 1 - distinct, faz com os dados não se repitam */
/* se vem um igual um anterior, apenas ignora */
select distinct nome from funcionarios order by nome;
/* com mais de um argumento, a regra se aplica ao último na sequência */
/* nesse exemplo, a regra se aplicará ao sobrenome (não repetirá 'mascarenhas') */
select distinct nome, sobrenome from funcionarios order by nome;
/* foram 2 - group by */
/* group by é utilizado para fazer agrupamento também */
/* porém quando também precisamos realizar uma função de agregação */
select nome, sobrenome, count (id) from funcionarios group by nome, sobrenome order by nome;
select nome, sobrenome, count (id) from funcionarios group by 1, 2 order by nome;

select curso.nome, count(aluno.id) from aluno
join aluno_curso on aluno.id = aluno_curso.aluno_id
join curso       on curso.id = aluno_curso.curso_id
group by 1 order by 1