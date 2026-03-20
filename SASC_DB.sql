CREATE DATABASE SASC_DB;
USE SASC_DB;

CREATE TABLE Usuarios(
	id_usuarios INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	login VARCHAR(50) UNIQUE,
	senha VARBINARY(MAX),
	perfil VARCHAR(20)
);
CREATE TABLE Sensores(
	id_sensores INT PRIMARY KEY IDENTITY(1,1),
	nome_sensor VARCHAR(50),
	tipo_sensor VARCHAR(30),
	localizacao VARCHAR(50)
);
CREATE TABLE Leituras(
	id_leituras INT PRIMARY KEY IDENTITY(1,1),
	id_sensores INT,
	valor VARBINARY(MAX),
	data_leitura DATETIME,
	FOREIGN KEY(id_sensores)
	REFERENCES Sensores(id_sensores)
);
CREATE TABLE Equipamentos(
	id_equipamento INT PRIMARY KEY IDENTITY(1,1),
	nome_equipamento VARCHAR(50),
	status VARCHAR(20),
	localizacao VARCHAR(50)
);

CREATE LOGIN operador_login_1 WITH PASSWORD = '123@Senha';
CREATE LOGIN admin_login_1 WITH PASSWORD = '123@Senha';

-- >>>>>>>>>>>>>>>>>>>

CREATE USER operador FOR LOGIN operador_login_1;
CREATE USER admin FOR LOGIN admin_login_1;

-- >>>>>>>>>>>>>>>>>>>

CREATE ROLE operador_role_1;
CREATE ROLE admin_role_1;

-- >>>>>>>>>>>>>>>>>>>

GRANT INSERT ON Usuarios TO operador_role_1;
GRANT CONTROL ON DATABASE::SASC_DB TO admin_role_1;

-- >>>>>>>>>>>>>>>>>>>

ALTER ROLE operador_role_1 ADD MEMBER operador;
ALTER ROLE admin_role_1 ADD MEMBER admin;

-- >>>>>>>>>>>>>>>>>>>

EXECUTE AS USER = 'operador'
INSERT INTO Usuarios(nome, login, senha, perfil)
VALUES
('João Silva', 'joao.silva', '123456', 'operador'),
('Maria Souza', 'maria.souza', '123456', 'operador'),
('Carlos Lima', 'carlos.lima', '123456', 'operador'),
('Ana Pereira', 'ana.pereira', '123456', 'operador'),
('Lucas Oliveira', 'lucas.oliveira', '123456', 'operador'),
('Fernanda Costa', 'fernanda.costa', '123456', 'operador'),
('Bruno Rocha', 'bruno.rocha', '123456', 'operador'),
('Juliana Alves', 'juliana.alves', '123456', 'operador'),
('Rafael Martins', 'rafael.martins', '123456', 'operador'),
('Patricia Gomes', 'patricia.gomes', '123456', 'operador'),
('Diego Barros', 'diego.barros', '123456', 'operador'),
('Camila Ribeiro', 'camila.ribeiro', '123456', 'operador'),
('Eduardo Fernandes', 'eduardo.fernandes', '123456', 'operador'),
('Larissa Carvalho', 'larissa.carvalho', '123456', 'operador'),
('Gustavo Dias', 'gustavo.dias', '123456', 'operador'),
('Aline Teixeira', 'aline.teixeira', '123456', 'operador'),
('Rodrigo Nunes', 'rodrigo.nunes', '123456', 'operador'),
('Beatriz Freitas', 'beatriz.freitas', '123456', 'operador'),
('Thiago Moreira', 'thiago.moreira', '123456', 'operador'),
('Vanessa Melo', 'vanessa.melo', '123456', 'operador');

