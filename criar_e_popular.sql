CREATE TABLE cliente (
    nome VARCHAR(150) NOT NULL PRIMARY KEY UNIQUE,
    endereco VARCHAR(150) NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    idade INTEGER NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    doenca_pre_existente BOOLEAN NOT NULL
);

CREATE TABLE plano_de_saude (
    nome VARCHAR(150) PRIMARY KEY UNIQUE,
    registro_anvisa VARCHAR(25) NOT NULL,
    fk_cliente_nome VARCHAR(150),
    valor_pago DOUBLE
);

CREATE TABLE medico (
    nome VARCHAR(150) NOT NULL PRIMARY KEY UNIQUE,
    tipo_contrato VARCHAR(10) NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    tipo_residencia VARCHAR(50) NOT NULL,
    escola_origem VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    crm INTEGER NOT NULL
);

CREATE TABLE funcionarios (
    nome VARCHAR(150) NOT NULL PRIMARY KEY UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    funcao VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL,
    salario_bruto DOUBLE NOT NULL,
    estado_civil VARCHAR(15) NOT NULL,
    dependentes VARCHAR(5) NOT NULL,
    fk_medico_nome VARCHAR(150)
);

CREATE TABLE info_pagamento (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    fk_medico_nome VARCHAR(150) NOT NULL,
    recebido_por_medico DOUBLE NOT NULL,
    comissao_clinica DOUBLE,
    imposto DOUBLE NOT NULL,
    data_recebimento DATE NOT NULL,
    data_repasse DATE
);

CREATE TABLE consulta (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    fk_cliente_nome VARCHAR(150) NOT NULL,
    fk_medico_nome VARCHAR(150) NOT NULL,
    exame_realizado VARCHAR(150) NOT NULL,
    data_exame DATE NOT NULL,
    doenca_cronica BOOLEAN NOT NULL
);

CREATE TABLE atende (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    fk_medico_nome VARCHAR(150) NOT NULL,
    fk_plano_de_saude_nome VARCHAR(150) NOT NULL
);

CREATE TABLE pagamento (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT UNIQUE,
    fk_info_pagamento_id INTEGER,
    fk_plano_de_saude_nome VARCHAR(150)
);
ALTER TABLE pagamento ADD CONSTRAINT FK_pagamento_1
    FOREIGN KEY (fk_info_pagamento_id)
    REFERENCES info_pagamento (id)
    ON DELETE SET NULL;
 
ALTER TABLE pagamento ADD CONSTRAINT FK_pagamento_2
    FOREIGN KEY (fk_plano_de_saude_nome)
    REFERENCES plano_de_saude (nome)
    ON DELETE SET NULL;
 
ALTER TABLE plano_de_saude ADD CONSTRAINT FK_plano_de_saude_2
    FOREIGN KEY (fk_cliente_nome)
    REFERENCES cliente (nome)
    ON DELETE CASCADE;
 
ALTER TABLE funcionarios ADD CONSTRAINT FK_funcionarios_2
    FOREIGN KEY (fk_medico_nome)
    REFERENCES medico (nome)
    ON DELETE CASCADE;
 
ALTER TABLE info_pagamento ADD CONSTRAINT FK_info_pagamento_2
    FOREIGN KEY (fk_medico_nome)
    REFERENCES medico (nome)
    ON DELETE CASCADE;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_1
    FOREIGN KEY (fk_cliente_nome)
    REFERENCES cliente (nome)
    ON DELETE CASCADE;
 
ALTER TABLE consulta ADD CONSTRAINT FK_consulta_2
    FOREIGN KEY (fk_medico_nome)
    REFERENCES medico (nome)
    ON DELETE CASCADE;
 
ALTER TABLE atende ADD CONSTRAINT FK_atende_1
    FOREIGN KEY (fk_medico_nome)
    REFERENCES medico (nome)
    ON DELETE CASCADE;
 
ALTER TABLE trabalhodb.atende ADD CONSTRAINT FK_atende_2
    FOREIGN KEY (fk_plano_de_saude_nome)
    REFERENCES plano_de_saude (nome)
    ON DELETE CASCADE;
    
    ## populando o banco de dados ##

## - Plano de Saúde
insert into plano_de_saude 	(nome, registro_anvisa) 
	values('UNIMED', '2219000960017'), ('PROMED', '81606090011'), ('GOLDEN CROSS', '2054410660019');

## Cliente
insert into cliente (nome, endereco, estado_civil, idade, sexo, doenca_pre_existente) 
	values ('Felipe Costa', 'Rua dos Bobo, 90', 'Casado', 28, 'Masculino', False),
('Daniela Costa', 'Rua dos Bobo, 90', 'Casado', 24, 'Feminino', True),
('Sandy Muniz', 'Rua Tiziu ,130', 'Solteira', 20, 'Feminino', False);


## Médico
insert into medico 	(nome, tipo_contrato, 	estado_civil, tipo_residencia, escola_origem, data_nascimento, especialidade, crm)
	values ('Adam', 'CLT', 'Casado(a)', 'Cardiologia', 'USP', '1982-4-14', 'Cardiologia', '123456789'),
('Jessica', 'PJ', 'Casado(a)', 'Dermatologia', 'UFMG', '1975-9-25', 'Dermatologia', '376543210'),
('Gilmar', 'PJ', 'Casado(a)', 'Oftalmologia', 'UFMG', '1979-8-19', 'Oftalmologia', '284563210'),
('Pedro', 'PJ', 'Solteiro(a)', 'Infectologia', 'UNIFENAS', '1980-8-15', 'Infectologia', '586541230'),
('Andressa', 'PJ', 'Casado(a)', 'Ginecologia e Obstetrícia', 'PUC Minas', '1977-4-12', 'Ginecologia e Obstetrícia', '045623789');

## Funcionarios \ MEDICO
insert into funcionarios (nome, data_nascimento, endereco, sexo, funcao, data_admissao, salario_bruto, estado_civil, dependentes, fk_medico_nome)
	values ('Adam','1982-4-14','Av. Laranjeiras, 514','Masculino','Médico','2020-8-1',12080.00,'Casado(a)','Não','Adam');


## Funcionarios
insert into funcionarios (nome, data_nascimento, endereco, sexo, funcao, data_admissao, salario_bruto, estado_civil, dependentes)
	values ('Rogerio','1990-2-15','Rua Tetris, 999','Masculino','Gerente Administrativo','2005-3-5',8570.00,'Solteiro(a)','Sim'),
('Dalva','1970-8-28','Av Tiradentes, 563','Feminino','Zelador(a)','2000-9-6',1630.00,'Casado(a)','Sim');

## Pagamentos
insert into info_pagamento (fk_medico_nome, recebido_por_medico, comissao_clinica, imposto, data_recebimento)
	values ('Andressa',358,8,12,'2021-6-9'),
('Andressa',270,5,12,'2021-3-25'),
('Pedro',390,10,8,'2021-4-19'),
('Gilmar',570,10,11,'2021-3-12'),
('Jessica',280,5,12,'2021-2-10'),
('Adam',370,10,6,'2021-5-18');

## Consultas
insert into consulta (fk_cliente_nome, fk_medico_nome, exame_realizado, data_exame, doenca_cronica)
	values ('Felipe Costa','Pedro','Infectologia','2021-4-19',False),
('Daniela Costa','Andressa','Ginecologia','2021-3-12',True),
('Daniela Costa','Gilmar','Oftalmologia','2021-6-9',True),
('Sandy Muniz','Andressa','Ginecologia','2021-3-25',False),
('Sandy Muniz','Jessica','Dermatologia','2021-2-10',False),
('Sandy Muniz','Adam','Cardiologia','2021-5-18',False);

## Planos que o médico atende
insert into atende (fk_medico_nome, fk_plano_de_saude_nome)
	Values ('Andressa','UNIMED'),
('Andressa','PROMED'),
('Pedro','UNIMED'),
('Pedro','PROMED'),
('Gilmar','PROMED'),
('Jessica','UNIMED'),
('Jessica','PROMED'),
('Adam','PROMED');

# Inserindo Auditoria Pagamentos
insert into pagamento (fk_info_pagamento_id, fk_plano_de_saude_nome)
	values (1,'UNIMED'),
(2,'UNIMED'),
(3,'PROMED'),
(4,'PROMED'),
(5,'UNIMED'),
(6,'PROMED');
 