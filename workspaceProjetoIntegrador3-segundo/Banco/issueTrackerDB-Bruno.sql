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



insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (2,"Bruno","Teste assunto 1","Teste descricao do assunto 1",1,null,"01/12/2019","01:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (2,"Bruno","Teste assunto 2","Teste descricao do assunto 2",2,null,"01/12/2019","02:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (2,"Bruno","Teste assunto 3","Teste descricao do assunto 3",3,null,"01/12/2019","03:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (2,"Bruno","Teste assunto 4","Teste descricao do assunto 4",4,null,"02/12/2019","04:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Alice","Teste assunto 5","Teste descricao do assunto 5",5,null,"02/12/2019","05:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Alice","Teste assunto 6","Teste descricao do assunto 6",6,null,"02/12/2019","06:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Alice","Teste assunto 7","Teste descricao do assunto 7",8,null,"02/12/2019","07:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Alice","Teste assunto 8","Teste descricao do assunto 8",8,null,"03/12/2019","08:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Alice","Teste assunto 9","Teste descricao do assunto 9",9,null,"03/12/2019","09:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (1,"Alice","Teste assunto 10","Teste descricao do assunto 10",8,null,"03/12/2019","09:47","5",2);

insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (12,"Maria","Teste assunto ","Teste descricao do assunto ",1,null,"03/12/2019","01:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (12,"Maria","Teste assunto ","Teste descricao do assunto ",2,null,"04/12/2019","02:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (12,"Maria","Teste assunto ","Teste descricao do assunto ",8,null,"05/12/2019","08:47","5",2);
insert into tickets(idCliente,nomeCliente,assunto,descricao,status,linkPrint,data,hora,tempoCriacao,atribuicaoTecnico) values (12,"Maria","Teste assunto ","Teste descricao do assunto ",9,null,"06/12/2019","09:47","5",2);




insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Alice","Mirian","a@gmail.com","123","cliente",99);/* Empresa 1 ID 1 */
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Bruno","Pedroso","b@gmail.com","123","cliente",99);/* Empresa 1  ID 2*/
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Claudia","Silva","c@gmail.com","123","cliente",99);/* Empresa 1  ID 3*/
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Joao","Lins","j@gmail.com","123","cliente",99);/* Empresa 1  ID 4*/
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Thiago","Willis","t@gmail.com","123","cliente",99);/* Empresa 2  ID 5*/
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("John","Depp","j@gmail.com","123","cliente",99);/* Empresa 2  ID 6*/
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Robert","Downey","r@gmail.com","12345","cliente",99);/* Empresa 3 ID 7*/
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Ricardo","meshi","6@gmail.com","1","cliente",99); /* Empresa 1 ID 9 */
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Laura","ameshi","7@gmail.com","1","cliente",99); /* Empresa 1 ID 10 */
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Mauricio","rameshi","8@gmail.com","1","cliente",99); /* Empresa 1 ID 11 */
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Maria","shi","9@gmail.com","1","cliente",99); /* Empresa 1 ID 12 */

insert into empresas(nome,cnpj) values ("TecnoLog","00001");
insert into empresas(nome,cnpj) values ("EnovaTech","00002");
insert into empresas(nome,cnpj) values ("SystemMaster","00003");

insert into clientesEmpresas(idCliente,idEmpresa) values (1,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (2,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (3,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (4,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (5,2);
insert into clientesEmpresas(idCliente,idEmpresa) values (6,3);
insert into clientesEmpresas(idCliente,idEmpresa) values (7,3);
insert into clientesEmpresas(idCliente,idEmpresa) values (9,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (10,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (11,1);
insert into clientesEmpresas(idCliente,idEmpresa) values (12,1);

insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Lucas","Lima","1@1","1","cliente",99);
insert into usuarios(nome,sobrenome,email,senha,nivel,status) values ("Maria","Barbosa","2@2","2","cliente",99);

