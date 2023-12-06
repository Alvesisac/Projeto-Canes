create database dbCanes;

use dbCanes;

create table Funcionarios(
	idFuncionario int primary key auto_increment,
	nomeFuncionario varchar (60) not null,
	login varchar (20) not null unique,
	email varchar (50) not null unique,
	senha varchar (255) not null,
	departamento enum ("Administração", "Lideres", "Vendedores Locais",
    "Vendedores Externos", "Logística", "Diretoria")
);

describe Funcionarios;
show tables;

create table Fornecedores(
	idFornecedor int primary key auto_increment,
    nomeForn varchar(50) not null,
    cnpjForn varchar(20) not null,
    telForn varchar(20) not null,
    emailForn varchar(50) not null unique,
    cep varchar(9),
    enderecoForn varchar(100),
    numEndereco varchar(10),
    bairro varchar(40),
    cidade varchar(40),
    estado char(2)
);

describe Fornecedores;

alter table Fornecedores modify column cnpjForn varchar (20) not null unique;

create table produtos(
    idProduto int primary key auto_increment,
    nomeProd varchar(50) not null,
    descricaoProd text,
    precoProd decimal(10.2) not null,
    estoqueProd int not null,
    categoriaProd enum ("Limpeza", "Higiene"),
    idFornecedor int not null,
    foreign key (idFornecedor) references Fornecedores (idFornecedor)
 );
 
 alter table produtos rename to Produtos;
 
 create table Clientes (
	idCliente int primary key auto_increment,
    nome varchar(100) not null,
    cpf char (14)not null unique,
    cnpj varchar(20) unique,
    tel varchar(20) not null,
    email varchar(50) not null unique,
    cep varchar(9),
    endereco varchar(100),
    numEndereco varchar(10),
    bairro varchar(40),
    cidade varchar(40),
    estado char(2)
);

describe Clientes;

create table Pedidos (
	idPedido int primary key auto_increment,
    dataPed timestamp default current_timestamp,
    statusPed enum ("Pedente","Finalizado","Cancelado") not null,
    idFuncionario int not null,
    foreign key (idFuncionario) references Funcionarios (idFuncionario),
	foreign key (idCliente) references Clientes (idCliente),
    idCliente int not null
);

describe Pedidos;

create table ItensPedidos (
	idItensPed int primary key auto_increment,
    idPedido int not null,
    idProduto int not null,
    foreign key (idPedido) references Pedidos (idPedido),
    foreign key(idProduto) references produtos (idProduto),
    qualidade int not null
);

