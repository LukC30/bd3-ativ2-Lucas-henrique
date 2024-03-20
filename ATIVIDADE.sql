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


insert into tbl_aluno(id_turma, nome, cpf, rg, telefone_aluno, telefone_responsavel, email, data_nascimento) 
values 
(1, 'João Silva', '11111111111', '123456789', '999888777', '888999777', 'joao.silva@example.com', '2002-05-10'),
(1, 'Maria Oliveira', '22222222222', '234567890', '888777666', '777888666', 'maria.oliveira@example.com', '2003-08-15'),
(1, 'Pedro Santos', '33333333333', '345678901', '777666555', '666777555', 'pedro.santos@example.com', '2004-11-20'),
(1, 'Ana Pereira', '44444444444', '456789012', '666555444', '555666444', 'ana.pereira@example.com', '2005-03-25'),
(1, 'Lucas Costa', '55555555555', '567890123', '555444333', '444555333', 'lucas.costa@example.com', '2006-06-30');

insert into tbl_aluno(id_turma, nome, cpf, rg, telefone_aluno, telefone_responsavel, email, data_nascimento) 
values 
(2, 'Mariana Oliveira', '66666666666', '123456789', '999888777', '888999777', 'mariana.oliveira@example.com', '2002-05-10'),
(2, 'Felipe Santos', '77777777777', '234567890', '888777666', '777888666', 'felipe.santos@example.com', '2003-08-15'),
(2, 'Juliana Pereira', '88888888888', '345678901', '777666555', '666777555', 'juliana.pereira@example.com', '2004-11-20'),
(2, 'Rafael Costa', '99999999999', '456789012', '666555444', '555666444', 'rafael.costa@example.com', '2005-03-25'),
(2, 'Camila Silva', '10101010101', '567890123', '555444333', '444555333', 'camila.silva@example.com', '2006-06-30');

insert into tbl_disciplinas(id_turma, sigla) values(1, "port"),
(1, "math"),
(1, "cie"),
(1, "hist"),
(2, "port"),
(2, "math"),
(2, "cie"),
(2, "hist");


create view dados as
select a.nome, a.telefone_aluno, a.telefone_responsavel, a.email, b.sigla as sala, c.sigla as materia
from tbl_aluno a 
inner join tbl_turma b on a.id_turma = b.id_turma
inner join tbl_disciplinas c on c.id_turma = b.id_turma;

create view sala_materia as
select a.sigla as materia, b.sigla as sala, b.nome as nome_sala
from tbl_disciplinas a 
inner join tbl_turma b on a.id_turma = b.id_turma;

create view aluno_sala as
select a.id_aluno, a.nome, a.telefone_aluno, a.telefone_responsavel, a.email, b.nome as nome_sala, b.sigla as sigla_sala, c.sigla
from tbl_aluno a
inner join tbl_turma b on a.id_turma = b.id_turma
inner join tbl_disciplinas c on c.id_turma = b.id_turma;

