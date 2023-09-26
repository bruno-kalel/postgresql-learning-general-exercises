select * from aluno;
select * from aluno_curso;
select * from curso;

/* quais cursos estão sem alunos matriculados? */
select curso.nome, count(aluno.id) from curso
/* left join para pegar todos os alunos */
/* independentemente se estão matriculados ou não */
left join aluno_curso on aluno_curso.curso_id = curso.id
/* chegar até a tabela de alunos para saber quem são os alunos */
left join aluno on aluno.id = aluno_curso.aluno_id
/* essa linha não funciona */
/* não é possível usar funções de agrupamento dentro de um where */
/* where count (aluno.id) = 0 */
/* de apenas um item, é possível usar o where */
group by 1
/* função having para filtrar juntamente com funções de agrupamento */
/* count, sum, avg, min, max */
having count(aluno.id) = 0

select * from funcionarios;

/* caso de estudo, gerar listagem de funcionários que possuem nome duplicado */
select nome,
/* quantos nomes duplicados? */
count(id)
from funcionarios
group by nome
having count(id) > 1;

/* pelo amor de deus, não roda de cima pra baixo, e sim de uma vez só */

/* e quem não tem nome duplicado? */
select nome,
count(id)
from funcionarios
group by nome
having count(id) = 1;