/* left, right, cross e full joins */

/* aluno que não está matriculado em nenhum curso */
insert into aluno (nome) values ('bruno_nenhum_curso');

select * from aluno;

/* curso que não possui nenhum aluno */
insert into curso (id, nome) values (3, 'curso_nenhum_aluno');

select * from curso;

/* nesta consulta, bruno_nenhum_curso e curso_nenhum_aluno não aparecem */
select aluno.nome as "nome do aluno", curso.nome as "nome do curso" from aluno
join aluno_curso on aluno_curso.aluno_id = aluno.id
join curso       on curso.id             = aluno_curso.curso_id;

/* left join */
/* priorizar tabela da esquerda */
/* existe o dado na tabela da esquerda, mas não na tabela da direita */
/* aqui retornam todos os alunos, e caso estes não possuam matrícula, o campo vem como null */
select aluno.nome as "nome do aluno", curso.nome as "nome do curso" from aluno
left join aluno_curso on aluno_curso.aluno_id = aluno.id
left join curso       on curso.id             = aluno_curso.curso_id;

/* right join */
/* priorizar tabela da direita */
/* existe o dado na tabela da direita, mas não na tabela da esquerda */
/* aqui retornam todos os cursos, e caso estes não possuam alunos, o campo vem como null */
select aluno.nome as "nome do aluno", curso.nome as "nome do curso" from aluno
right join aluno_curso on aluno_curso.aluno_id = aluno.id
right join curso       on curso.id             = aluno_curso.curso_id;

/* full join */
/* prioriza o resgate de informações */
/* retornam todos os dados, dos dois lados, mesmo que um deles seja nulo */
select aluno.nome as "nome do aluno", curso.nome as "nome do curso" from aluno
full join aluno_curso on aluno_curso.aluno_id = aluno.id
full join curso       on curso.id             = aluno_curso.curso_id;

/* cross join */
/* todos por todos */
/* todos os dados da tabela a misturados com todos os dados da tabela b */
/* não precisa de declaração de campo de vínculo */
/* pois multiplica n dados da tabela a por m dados da tabela b */
select aluno.nome as "nome do aluno", curso.nome as "nome do curso" from aluno
cross join curso;