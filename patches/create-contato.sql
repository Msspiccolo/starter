CREATE DATABASE starter;

USE starter;

CREATE TABLE contato (
	id_contato INT auto_increment NOT NULL,
	nome varchar(100) NOT NULL,
	telefone varchar(25) NOT NULL,
	genero char(1) NULL,
	ativo BOOL DEFAULT true NOT NULL,
	estado_civil varchar(10) NULL,
	observacoes TEXT NULL,
	CONSTRAINT contato_PK PRIMARY KEY (id_contato)
);

CREATE TABLE sintomas(
    id_sintoma int auto_increment NOT NULL,
    sintoma varchar (100) NOT NULL,
    id_pet int not null,
    constraint sintomas_PK PRIMARY KEY (id_sintoma),
    constraint FK_sintoma_pet FOREIGN KEY (id_pet) REFERENCES pet(id_pet)
);

CREATE TABLE pet (
     id_pet INT auto_increment NOT NULL,
     nome varchar(100) NOT NULL,
     dataNascimento TIMESTAMP NOT NULL,
     raca varchar(10) NULL,
     genero varchar(10) NULL,
     CONSTRAINT pet_pk PRIMARY KEY (id_pet)
);

ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
