CREATE DATABASE Empresa; 

USE Empresa;

CREATE TABLE Funcionarios (
	id_funcionario INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	salario DECIMAL(10,2)
);

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE LOGIN operador_login WITH PASSWORD = '123@Senha';
CREATE LOGIN supervisor_login WITH PASSWORD = '123@Senha';
CREATE LOGIN admin_login WITH PASSWORD = '123@Senha';

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE USER operador FOR LOGIN operador_login;
CREATE USER supervisor FOR LOGIN supervisor_login;
CREATE USER admin FOR LOGIN admin_login;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE ROLE operador_role;
CREATE ROLE supervisor_role;
CREATE ROLE admin_role;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Operador: inserir
GRANT INSERT ON Funcionarios TO operador_role;

-- Supervisor: visualizar
GRANT SELECT ON Funcionarios TO supervisor_role;

-- Admin: tudo
GRANT CONTROL ON DATABASE::Empresa TO admin_role;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

ALTER ROLE operador_role  ADD MEMBER operador;
ALTER ROLE supervisor_role ADD MEMBER supervisor;
ALTER ROLE admin_role ADD MEMBER admin;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

EXECUTE AS USER = 'admin';
SELECT * FROM Funcionarios;
REVERT;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

EXECUTE AS USER = 'operador'
INSERT INTO Funcionarios(nome, salario)
VALUES
('João', 2000),
('Maria Souza', 3200),
('Carlos Oliveira', 2800),
('Ana Santos', 3500),
('Pedro Lima', 2200),
('Juliana Costa', 4000),
('Lucas Pereira', 2700),
('Fernanda Alves', 3100),
('Rafael Gomes', 2900),
('Camila Rocha', 3600);
REVERT;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

UPDATE Funcionarios
SET nome = 'João Pedro'
WHERE id_funcionario = 1

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Senha@forte123';

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE CERTIFICATE MeuCertificado
WITH SUBJECT = 'Proteção de dados';

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE SYMMETRIC KEY MinhaChave
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MeuCertificado;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

CREATE TABLE Usuarios(
	id_usuario INT IDENTITY PRIMARY KEY,
	nome VARCHAR(50),
	senha VARBINARY(MAX)
);

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

OPEN SYMMETRIC KEY MinhaChave
DECRYPTION BY CERTIFICATE MeuCertificado;

INSERT INTO Usuarios (nome,senha)
VALUES ('João Pedro', ENCRYPTBYKEY(KEY_GUID('MinhaChave'), '123456'));

CLOSE SYMMETRIC KEY MinhaChave;

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>

OPEN SYMMETRIC KEY MinhaChave
DECRYPTION BY CERTIFICATE MeuCertificado;

SELECT nome,
		CONVERT(VARCHAR, DECRYPTBYKEY(senha)) AS senha
FROM Usuarios;

CLOSE SYMMETRIC KEY MinhaChave;