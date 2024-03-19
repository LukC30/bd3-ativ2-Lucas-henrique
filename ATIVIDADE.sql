create database ativ_bd3_Lucas_henrique;
use  ativ_bd3_Lucas_henrique;

create table tbl_turma(
id_turma int unsigned auto_increment not null,
sigla varchar(10),
nome varchar(100),

constraint primary key (id_turma),
constraint unique (sigla)
);

create table tbl_disciplinas(
id_disciplina int unsigned auto_increment not null,
id_turma int unsigned not null,
sigla varchar(50),

constraint primary key (id_disciplina),
foreign key (id_turma) 
references tbl_turma(id_turma)

);

create table tbl_aluno(
id_aluno int unsigned auto_increment not null,
id_turma int unsigned not null,
nome varchar(100) not null,
cpf char(11) not null,
rg char(9) not null,
telefone_aluno varchar(11),
telefone_responsavel varchar(11),
email varchar(100),
data_nascimento date default('2000-1-1'),

constraint primary key(id_aluno),
constraint unique (cpf),
foreign key (id_turma) 
references tbl_turma(id_turma)


);

create table tbl_frequencia(
id int unsigned auto_increment not null, 
id_aluno int unsigned,
id_disciplina int unsigned,
data_chamada datetime default now(),
frequencia decimal(2,2),

constraint primary key (id),
foreign key (id_aluno) 
references tbl_aluno(id_aluno),
foreign key(id_disciplina)
references tbl_disciplinas(id_disciplina)

);


insert into tbl_turma(sigla, nome) values('3D', '3 ANO D'),('2B', '2 ANO B');

