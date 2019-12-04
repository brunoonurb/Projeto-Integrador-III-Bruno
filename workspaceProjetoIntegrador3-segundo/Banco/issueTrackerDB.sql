create database issuetracker;
use issuetracker;



create table logAcessos(
id int(15) auto_increment,
data varchar(50) not null,
hora varchar(50) not null,
nomeUsuario varchar(100) not null,
sobrenomeUsuario varchar (100) not null,
nivelUsuario varchar(50) not null,
idUsuario int(15) not null,
primary key(id)
);

create table logAcoes(
id int (15) auto_increment,
data varchar(50) not null,
hora varchar(50) not null,
acao varchar(200) not null,
nomeUsuario varchar(100) not null,
sobrenomeUsuario varchar (100) not null,
nivelUsuario varchar(50) not null,
idUsuario int(15) not null,
primary key (id)
);

/*Alex ->  Verifica o que voce quer colocar a mais no formulario da empresa*/
create table empresas(
id int (15) auto_increment,
nome varchar (100) not null,
cnpj varchar (50) not null,
primary key(id)
);

create table clientesEmpresas(
id int (15) auto_increment,
idCliente int (15) not null,
idEmpresa int (15) not null,
primary key(id)
);

create table usuarios (
id int (15) auto_increment,
nome varchar(100) not null,
sobrenome varchar (100) not null,
email varchar (100) not null,
senha varchar (100) not null,
nivel varchar  (50) not null,
status int (15) not null,
primary key (id)
);


create table tickets (
id int (15) auto_increment,
idCliente int (15) ,
nomeCliente varchar(100),
assunto varchar(100) ,
descricao varchar (255) ,
status int (15) not null,
linkPrint varchar (250),
data varchar(50) not null ,
hora varchar (50) not null,
tempoCriacao varchar(50) ,
atribuicaoTecnico int(15), 
primary key (id)
);

create table statusTickets (
id int (15) ,
descricao varchar(100)
);

/*Professor -> Caso der tempo vamos separar a parte da edição para uma tabela diferente*/
create table respostasTickets (
id int (15) auto_increment,
idTicket int (15) not null,
idUsuario int (15) ,
nomeUsuario varchar (50) not null,
nivelUsuario varchar(50) not null,
resposta varchar(255) not null,
data varchar(50) not null ,
hora varchar (50) not null,
primary key (id)
);

create table edicaoTickets(
id int (15) auto_increment,
idResposta int (15),
edicaoIdUsuario int (15),
edicaoNomeUsuario varchar (50),
edicaoSobrenomeUsuario varchar (50),
edicaoNivelUsuario varchar (50),
edicaoData varchar (50),
edicaoHora varchar (50),
primary key (id)
);
/*

insert into edicaoTickets (idResposta) values (7);
insert into statusTickets (id,descricao) values (1,"novo");
insert into statusTickets (id,descricao) values (2,"pendente");
insert into statusTickets (id,descricao) values (3,"atribuido");
insert into statusTickets (id,descricao) values (4,"em progresso");
insert into statusTickets (id,descricao) values (5,"pendente c.");
insert into statusTickets (id,descricao) values (6,"pendente t.");
insert into statusTickets (id,descricao) values (7,"resolvido");
insert into statusTickets (id,descricao) values (8,"fechado");
insert into statusTickets (id,descricao) values (9,"reaberto");

	

insert into respostasTickets (idTicket,idUsuario,nomeUsuario,nivelUsuario,resposta,data,hora) values (5,5,"Lezard Valeth","Tecnico","Resposta 1","data1","hora1");
insert into respostasTickets (idTicket,idUsuario,nomeUsuario,nivelUsuario,resposta,data,hora) values (5,9,"Jet Li","Cliente","Resposta 2","data2","hora2");
insert into respostasTickets (idTicket,idUsuario,nomeUsuario,nivelUsuario,resposta,data,hora) values (5,5,"Lezard Valeth","Tecnico","Resposta 3","data3","hora3");
insert into respostasTickets (idTicket,idUsuario,nomeUsuario,nivelUsuario,resposta,data,hora) values (5,9,"Jet Li","Cliente","Resposta 4","data4","hora4");
insert into respostasTickets (idTicket,idUsuario,nomeUsuario,nivelUsuario,resposta,data,hora) values (5,8," Valeth","Tecnico","Resposta 5","data5","hora5");

*/


/*-----------------------------------------------------------Base----------------------------------------------------------------------*/
/*
Seleciona a ultima edição do ticket
select distinct * from edicaoTickets where id in (select max(id) as ultimaEdicao from edicaoTickets  group by idResposta);  
*/
/*
select tickets.*,statusTickets.descricao as explicacao,usuarios.nome as nomeTecnico,usuarios.sobrenome as sobrenomeTecnico from tickets inner join statusTickets on tickets.status=statusTickets.id inner join usuarios on tickets.atribuicaoTecnico=usuarios.id having explicacao in('pendente c.','resolvido','atribuido');

*/

/*Verificar a nomenclatura e verificar se o atributo descricao não vai entrar em conflito com query strings*/


/*
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",3,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",4,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",7,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",2,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",5,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",8,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",9,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",1,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",6,null,"24/10/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Keanu Reeves","Teste assunto 1","Teste descricao do assunto 1",1,null,"24/10/2019","04:47","5",2);
*/

/*Base Thiago*/
/*
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Yusuke","Urameshi","leigan@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Ichigo","Kurosaki","bankai@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Naruto","Uzumaki","rasengan@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Luffy","Monkey D.","gomugomu@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Ippo","Makunoushi","dempseyroll@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Hiei","Jaganshi","jagan@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Shaka","de Virgo","god@gmail.com","12345","supervisor",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Hiei","Jaganshi","jagan@gmail.com","12345","supervisor",99);

insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Dante","The D.","rebellion@gmail.com","12345","tecnico",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Kratos","The God","sparta@gmail.com","12345","tecnico",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Leon","Kennedy","umbrella@gmail.com","12345","tecnico",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Cloud","Strife","avalanche@gmail.com","12345","tecnico",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Lezard","Valeth","rebellion@gmail.com","12345","tecnico",99);

insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Daenerys","Targaryen","dracarys@gmail.com","12345","coordenador",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Rick","Grimes","dead@gmail.com","12345","coordenador",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Ross","Geller","rachel@gmail.com","12345","coordenador",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Dexter","Morgan","bloody@gmail.com","12345","coordenador",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Eleven","S.T.","demogorgon@gmail.com","12345","coordenador",99);

insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Keanu","Reeves","matrix@gmail.com","12345","cliente",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Jet","Li","wongfeifong@gmail.com","12345","cliente",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Bruce","Willis","comeget@gmail.com","12345","cliente",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Johnny","Depp","jack@gmail.com","12345","cliente",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Robert","Downey Jr","jarvis@gmail.com","12345","cliente",99);

*/
/*Base Bruno*/
/*
insert into empresas(nome,cnpj) values ("Friboi","00001");
insert into empresas(nome,cnpj) values ("Sadia","00002");

insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Lucas","Lima","1@1","1","cliente",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Maria","Barbosa","2@2","2","cliente",99);

insert into clientesEmpresas(idCliente,idEmpresa) values (1,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (2,1);

*/
