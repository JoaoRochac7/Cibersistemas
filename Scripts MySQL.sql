CREATE DATABASE monitoramento_DB;

USE monitoramento_DB;

CREATE TABLE maquina(
	id_maquina INT AUTO_INCREMENT PRIMARY KEY,
    nome_maquina VARCHAR(50),
    status VARCHAR(20) DEFAULT 'ativo',
    data_instalacao DATE
); SELECT * FROM maquina;

CREATE TABLE sensores (
	id_sensor INT AUTO_INCREMENT PRIMARY KEY,
	id_maquina INT,
	tipo_sensor VARCHAR(50),
	unidade_medida VARCHAR(20),
	FOREIGN KEY (id_maquina)
	REFERENCES maquina(id_maquina)
); SELECT * FROM sensores;

CREATE TABLE operadores(
	id_operador INT AUTO_INCREMENT PRIMARY KEY,
	nome_operador VARCHAR(50),
	turno VARCHAR(20),
    setor VARCHAR(25)
); SELECT * FROM operadores;

CREATE TABLE leituras (
	id_leitura INT AUTO_INCREMENT PRIMARY KEY,
	id_sensor INT,
	valor DECIMAL(10,2),
	data_leitura DATETIME,
	FOREIGN KEY (id_sensor)
	REFERENCES sensores(id_sensor)
); SELECT * FROM leituras;

CREATE TABLE alertas (
	id_alerta INT AUTO_INCREMENT PRIMARY KEY,
	id_leitura INT,
	mensagem VARCHAR(200),
	data_alerta DATETIME,
	FOREIGN KEY (id_leitura)
	REFERENCES leituras(id_leitura)
); SELECT * FROM alertas;

CREATE TABLE manutencoes(
	id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
	id_maquina INT,
	id_operador INT,
	data_manutencao DATE,
	tipo_manutencao VARCHAR(25),
	descricao VARCHAR(200),
	FOREIGN KEY (id_maquina) REFERENCES maquina(id_maquina),
	FOREIGN KEY (id_operador) REFERENCES operadores(id_operador)
); SELECT * FROM manutencoes;

INSERT INTO maquina(nome_maquina, status, data_instalacao)
VALUES
('Misturador Industrial', 'ativo', '2023-02-10'),
('Forno Industrial', 'ativo', '2022-07-15'),
('Máquina de Embalagem', 'manutencao', '2021-11-30'),
('Esteira Transportadora', 'ativo', '2020-05-20'),
('Cortador Industrial', 'inativo', '2019-09-12');

INSERT INTO sensores(id_maquina, tipo_sensor, unidade_medida)
VALUES
(1, 'Temperatura', '°C'),
(2, 'Temperatura', '°C'),
(3, 'Pressão', 'bar'),
(4, 'Sensor de Presença', 'sim/não'),
(5, 'Sensor de Segurança', 'on/off');

INSERT INTO operadores (nome_operador, turno, setor)
VALUES
('Carlos Silva', 'manhã', 'Mistura'),
('Ana Souza', 'tarde', 'Forno'),
('João Pereira', 'noite', 'Embalagem'),
('Mariana Costa', 'manhã', 'Transporte'),
('Lucas Santos', 'tarde', 'Corte');

INSERT INTO leituras (id_sensor, valor, data_leitura)
 VALUES
(1, 75.50, '2026-03-26 08:00:00'),
(2, 180.00, '2026-03-26 09:00:00'),
(3, 2.50, '2026-03-26 10:00:00'),
(4, 1.00, '2026-03-26 11:00:00'),
(5, 1.00, '2026-03-26 12:00:00'); 

INSERT INTO alertas (id_leitura, mensagem, data_alerta)
VALUES
(1, 'Temperatura acima do normal no misturador', '2026-03-26 08:05:00'),
(2, 'Temperatura muito alta no forno industrial', '2026-03-26 09:05:00'),
(3, 'Pressão fora do padrão na máquina de embalagem', '2026-03-26 10:05:00'),
(4, 'Produto detectado na esteira', '2026-03-26 11:00:10'),
(5, 'Sensor de segurança ativado', '2026-03-26 12:00:05');

INSERT INTO manutencoes (id_maquina, id_operador, data_manutencao, tipo_manutencao, descricao)
 VALUES
(1, 1, '2026-03-20', 'preventiva', 'Lubrificação e ajuste do misturador'),
(2, 2, '2026-03-18', 'corretiva', 'Correção de superaquecimento no forno'),
(3, 3, '2026-03-15', 'preventiva', 'Verificação de pressão e vedação'),
(4, 4, '2026-03-10', 'corretiva', 'Troca de sensor de presença da esteira'),
(5, 5, '2026-03-05', 'preventiva', 'Ajuste e limpeza do cortador industrial');