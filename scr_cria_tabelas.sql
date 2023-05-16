-- script de criação das tabelas
-- criado em: 02/05/2023

--criando a tabela cliente
create table cliente (
	codcli integer
	constraint cliente_pk primary key,
	nomcli varchar(40) not null,
	sexcli char(1)
	constraint cli_sexcli_ck check (sexcli in ('F', 'M')),
	datnascli date
);

comment on table cliente is 'Cadastro dos clientes';
comment on column cliente.codcli is 'Código do cliente';
comment on column cliente.nomcli is 'Nome do cliente';
comment on column cliente.sexcli is 'Sexo do cliente';
comment on column cliente.datnascli is 'Data de nascimento do cliente';

-- criando a tabela produto
create table produto (
	codpro integer
	constraint produto_pk primary key,
	nompro varchar(40) not null,
	vlrpro numeric(10,2) not null,
	qtdpro numeric(8,0) not null,
	fotpro bytea
);

--comment on table produto is 'Cadastro dos produto';
--comment on column produto.codcli is 'Código do produto';
--comment on column produto.nomcli is 'Nome do produto';
--comment on column produto.sexcli is 'Sexo do produto';
--comment on column produto.datnascli is 'Data de nascimento do produto';

-- criando a tabela funcionario
create table funcionario (
	codfun integer
	constraint funcionario_pk primary key,
	nomfun varchar(40) not null,
	sexfun char(1)
	constraint fun_sexfun_ck check (sexfun in ('F', 'M')),
	datnasfun date,
	codger integer
	constraint fun_codger_fk references funcionario(codfun)
);

-- criando a tabela venda
create table venda(
	codven integer
	constraint venda_pk primary key,
	datven timestamp not null
	default current_timestamp,
	codcli integer not null,
	constraint ven_codcli_fk foreign key(codcli)
	references cliente(codcli),
	codfun integer not null,
	constraint ven_codfun_fk foreign key(codfun)
	references funcionario(codfun)
);

-- criando a tabela venda item
create table venda_item(
	codven integer,
	codpro integer,
	constraint venda_item_pk primary key(codven, codpro),
	vlrproven numeric(10,2) not null,
	qtdproven numeric(8,0),
	constraint ven_codven_fk foreign key(codven)
	references venda(codven),
	constraint ven_codpro_fk foreign key(codpro)
	references produto(codpro)
);





















