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

CREATE TABLE pet (
     id_pet INT auto_increment NOT NULL,
     nome varchar(100) NOT NULL,
     dataNascimento TIMESTAMP NOT NULL,
     raca varchar(10) NULL,
     CONSTRAINT pet_pk PRIMARY KEY (id_pet)
);
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
