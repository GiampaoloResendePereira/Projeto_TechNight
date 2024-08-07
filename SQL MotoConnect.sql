-- Cria o banco de dados
CREATE DATABASE  crud;

-- Usa o banco de dados criado
USE crud;

-- Tabela Login
CREATE TABLE  login (
    id_login INT AUTO_INCREMENT PRIMARY KEY,
    nome_do_usuario VARCHAR(50) UNIQUE,
    senha VARCHAR(100)
);

INSERT INTO login (nome_do_usuario, senha) VALUES ('admin', 'admin123');

-- Tabela Atendente
CREATE TABLE  atendente (
    id_atendente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cep CHAR(10) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    cpf CHAR(14) UNIQUE NOT NULL,
    senha VARCHAR(100)
);

-- Tabela Entregador
CREATE TABLE  entregador (
    id_entregador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cep CHAR(10) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    cpf CHAR(14) NOT NULL,
    documento_da_moto VARCHAR(17),
    senha VARCHAR(100)
);

-- Tabela Cliente
CREATE TABLE  cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf_cliente CHAR(14) UNIQUE NOT NULL,
    cep_cliente CHAR(10) NOT NULL,
    estado_cliente VARCHAR(100) NOT NULL,
    cidade_cliente VARCHAR(100) NOT NULL,
    bairro_cliente VARCHAR(100) NOT NULL,
    rua_cliente VARCHAR(100) NOT NULL,
    numero_cliente VARCHAR(10),
    telefone_cliente VARCHAR(15),
    email_cliente VARCHAR(100)
);

INSERT INTO cliente (nome_cliente, cpf_cliente, cep_cliente, estado_cliente, cidade_cliente, bairro_cliente, rua_cliente, numero_cliente, telefone_cliente, email_cliente)
VALUES 
('Ana Clara', '12345678900', '29000000', 'ES', 'Vitória', 'Praia do Canto', 'Rua das Flores', '100', '27999998888', 'anaclara@example.com'),
('Pedro Henrique', '98765432100', '29010000', 'ES', 'Vila Velha', 'Centro', 'Avenida Central', '200', '27998887777', 'pedrohenrique@example.com'),
('Joana Pereira', '87654321098', '29030000', 'ES', 'Cariacica', 'Campo Grande', 'Av. das Palmeiras', '300', '27997766555', 'joanapereira@example.com'),
('Lucas Oliveira', '23456789012', '29100000', 'ES', 'Serra', 'Manguinhos', 'Rua das Palmeiras', '400', '27995544332', 'lucasoliveira@example.com');


-- Tabela Destinatario
CREATE TABLE  destinatario (
    id_destinatario INT AUTO_INCREMENT PRIMARY KEY,
    destinatario VARCHAR(100) NOT NULL,
    telefone_destinatario CHAR(14) NOT NULL,
    cep_destinatario CHAR(10) NOT NULL,
    estado_destinatario VARCHAR(100) NOT NULL,
    cidade_destinatario VARCHAR(100) NOT NULL,
    bairro_destinatario VARCHAR(100) NOT NULL,
    rua_destinatario VARCHAR(100) NOT NULL,
    numero_destinatario VARCHAR(10),
    opcao_selecionada VARCHAR(50)
);

INSERT INTO destinatario (destinatario, telefone_destinatario, cep_destinatario, estado_destinatario, cidade_destinatario, bairro_destinatario, rua_destinatario, numero_destinatario, opcao_selecionada)
VALUES 
('José Silva', '27999997777', '29050000', 'ES', 'Serra', 'Jardim Limoeiro', 'Rua dos Lírios', '300', 'Documentos'),
('Maria Oliveira', '27998888888', '29010000', 'ES', 'Vila Velha', 'Praia da Costa', 'Avenida Central', '201', 'Produtos'),
('Maria Souza', '27997765544', '29030000', 'ES', 'Cariacica', 'Campo Grande', 'Av. das Flores', '400', 'Documentos'),
('Pedro Santos', '27991122334', '29100000', 'ES', 'Serra', 'Jardim Limoeiro', 'Rua das Lírios', '301', 'Produtos');


-- Tabela Calculo Frete
CREATE TABLE  calculo_frete (
    numero_pedido INT AUTO_INCREMENT PRIMARY KEY,
    peso DECIMAL(10, 2),  -- Define o campo 'peso' como DECIMAL com 10 dígitos no total e 2 casas decimais
    cidade_origem VARCHAR(100),
    cidade_destino VARCHAR(100),
    valor FLOAT(10, 2)  -- Define o campo 'valor' como FLOAT com 10 dígitos no total e 2 casas decimais
);

INSERT INTO calculo_frete (peso, cidade_origem, cidade_destino, valor)
VALUES 
(5.5, 'Viana', 'Vila Velha', 45.00),
(5.3, 'Viana', 'Vitória', 70.00),
(7.2, 'Vila Velha', 'Vitória', 90.00),
(3.5, 'Cariacica', 'Vitória', 50.00),
(6.8, 'Cariacica', 'Vitória', 60.00);

-- Tabela Detalhes de encomendas
CREATE TABLE detalhes (
    id_detalhes INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_destinatario INT NOT NULL,
    numero_pedido INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_destinatario) REFERENCES destinatario(id_destinatario),
    FOREIGN KEY (numero_pedido) REFERENCES calculo_frete(numero_pedido)
);

-- Criação da tabela encomendas
CREATE TABLE encomendas (
    id_encomenda INT AUTO_INCREMENT PRIMARY KEY,
    data_entrega DATETIME,
    statuss VARCHAR(50)
);

-- Inserção de dados
INSERT INTO encomendas (data_entrega, statuss) VALUES ('2024-06-15 10:00:00', 'Pendente');
INSERT INTO encomendas (data_entrega, statuss) VALUES ('2024-06-16 12:30:00', 'Entregue');
INSERT INTO encomendas (data_entrega, statuss) VALUES ('2024-06-17 09:45:00', 'Pendente');
INSERT INTO encomendas (data_entrega, statuss) VALUES ('2024-06-18 14:20:00', 'Cancelada');

-- Consulta de todos os registros
SELECT * FROM encomendas;

-- Tabela Comentarios e Observacoes
CREATE TABLE  comentarios_e_observacoes (
    id_comentarios_e_observacoes INT AUTO_INCREMENT PRIMARY KEY
);

-- Tabela Alertas
CREATE TABLE  alertas (
    id_alertas INT AUTO_INCREMENT PRIMARY KEY
);

