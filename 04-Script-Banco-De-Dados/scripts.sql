------------------------------------------------------------------------
-------------------Criação do Banco-------------------------------------
------------------------------------------------------------------------


CREATE DATABASE "AlugueJa"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


------------------------------------------------------------------------
-----------------Criação das Tabelas e Tipos----------------------------
------------------------------------------------------------------------


CREATE TYPE tpuser AS(
	nome VARCHAR(40),
	idade INTEGER,
	cpf VARCHAR(14)
);

CREATE TYPE tplocal AS(
	cidade VARCHAR(50),
	estado VARCHAR(2)
);

CREATE TYPE tpInfoimovel AS(
	nome VARCHAR(50),
	qtQuartos INTEGER,
	qtBanheiros INTEGER,
	aluguel INTEGER
);


CREATE TYPE tpendereco AS(
	rua VARCHAR(100),
	numero VARCHAR(5),
	complemento VARCHAR(50),
	bairro VARCHAR(50),
	cidade VARCHAR(50),
	estado VARCHAR(2)
);


CREATE TABLE IF NOT EXISTS usuario(
	idUsuario serial NOT NULL,
	pessoa tpuser,
	endereco tplocal,
	telefone VARCHAR(18) ARRAY,
	email VARCHAR(50),
	senha VARCHAR(50),
	CONSTRAINT usuario_key PRIMARY KEY (idUsuario)
);


CREATE TABLE IF NOT EXISTS imovel(
	idImovel INTEGER PRIMARY KEY,
	favoritado BOOLEAN,
	disponivel BOOLEAN,
	endereco tpendereco,
	imovelInfo infoImovel,
	responsavel INTEGER,
	CONSTRAINT imovel_fkey FOREIGN KEY(responsavel) REFERENCES usuario(idUsuario)  
);


------------------------------------------------------------------------
---------------------------Inserções------------------------------------
------------------------------------------------------------------------

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Vinicius', 25, '098.345.232-01'), 
	ROW('Quixadá', 'CE'), 
	ARRAY['(88 9 8858-8188)', '(85) 9 8858-5195'], 'vinicius@gmail.com', ‘012345senha’
); 

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Ruan Silva', 45, '098.005.432-00'), 
	ROW('Quixadá', 'CE'), 
	ARRAY['(88 9 9888-7298)', '(88) 9 9752-5105'], 'ruan@gmail.com', ‘abcdfg00’
);

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Weslley Salguero', 32, '037.705.400-10'), 
	ROW('Quixeramobim', 'CE'), 
	ARRAY['(88 9 9998-1268)', '(85) 9 9988-6175'], 'weslley@gmail.com', ‘987zxyabc123’
); 


INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Weslley Salguero', 32, '037.705.400-10'), 
	ROW('Quixeramobim', 'CE'), 
	ARRAY['(88 9 9998-1268)', '(85) 9 9988-6175'], 'weslley@gmail.com', '987zxyabc123'
); 
INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('José Maria', 22, '099.435.453-22'), 
	ROW('Quixeramobim', 'CE'), 
	ARRAY['(88 9 9999-1666)', '(85) 9 9688-6679'], 'jose@gmail.com', 'ab12'
);

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Rafaela Costa', 23, '195.045.205-15'), 
	ROW('Quixadá', 'CE'), 
	ARRAY['(88 9 8893-1008)', '(88) 9 8955-5132'], 'rafaela@gmail.com', 'bc23'
);

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Rafael Onofre', 28, '095.545.235-05'), 
	ROW('Quixadá', 'CE'), 
	ARRAY['(88 9 8558-8008)', '(88) 9 8958-5105'], 'rafael@gmail.com', 'fggh12'
); 

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Ruth Costa', 21, '125.005.225-12'), 
	ROW('Mombaça', 'CE'), 
	ARRAY['(88 9 9093-1808)', '(88) 9 9955-5232'], 'rutha@gmail.com', 'joao34'
);

INSERT INTO usuario (pessoa, endereco, telefone, email, senha) VALUES (
	ROW('Arthur Lima', 31, '025.305.244-18'), 
	ROW('Boa Viagem', 'CE'), 
	ARRAY['(88 9 9033-0808)', '(85) 9 9000-5202'], 'arthur@gmail.com', 'safk0909'
);

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 1', 4, 2, 500), ROW('Rua Oscar Barbosa', '206', 'Centro', 'Quixadá', 'CE'), 
	'false', 3
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 2', 2, 1, 250), ROW('Rua 7 de Setembro', '6', 'Cedro', 'Ipú', 'CE'), 
	'false', 4
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 3', 2, 1, 200), ROW('Rua Agusto Henrique', '63', 'Centro', 'Quixeramobim', 'CE'), 
	'false', 1
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 4', 2, 2, 230), ROW('T. Aristides G. da Silva', '294', 'Centro', 'Quixadá', 'CE'), 
	'false', 4
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 5', 3, 2, 480), ROW('Joaquim Noronha', '210', 'Lagoinha', 'Quixadá', 'CE'), 
	'false', 5
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 6', 3, 2, 500), ROW('Alta Mira', '145', 'Beleza', 'Mombaça', 'CE'), 
	'false', 4
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 7', 2, 1, 300), ROW('Rua José Elias Dias', '115', 'Centro', 'Quixeramobim', 'CE'), 
	'false', 3
); 

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 8', 4, 2, 350), ROW('Rua Majó Felipe Diacis', '25', 'Centro', 'Quixadá', 'CE'), 
	'false', 1
);  

INSERT INTO imovel (disponivel, imovelinfo, endereco, favoritado, responsavel) VALUES (
	'true', ROW('Imovel 9', 5, 2, 800), ROW('Rua Francisco Sousa', '256', 'Centro', 'Quixadá', 'CE'), 
	'false', 1
); 


------------------------------------------------------------------------
--------------------------DELETE----------------------------------------
------------------------------------------------------------------------

DELETE FROM imovel WHERE (imovelinfo).aluguel > 500

DELETE FROM imovel WHERE (endereco).bairro = 'Lagoinha'

DELETE FROM imovel WHERE disponivel = 'false'

DELETE FROM usuario WHERE (pessoa).cpf = '039.135.555-24'

DELETE FROM usuario WHERE idUsuario = 9

------------------------------------------------------------------------
-----------------------------UPDATE-------------------------------------
------------------------------------------------------------------------

UPDATE usuario SET email = 'rafaelcosta@gmail.com' WHERE idUsuario = 8

UPDATE usuario SET pessoa.cpf = '099.435.456-22' WHERE idUsuario = 5

UPDATE usuario SET pessoa.idade = '46' WHERE idUsuario = 3

UPDATE usuario SET pessoa.nome = 'Vinicius Furtado' WHERE idUsuario = 1

UPDATE imovel SET disponivel = 'false' WHERE idImovel = 2

UPDATE imovel SET endereco.numero = '116' WHERE idImovel = 7

UPDATE imovel SET endereco.cidade = 'Quixeré' WHERE idImovel = 8
------------------------------------------------------------------------
-------------------------Criação de views-------------------------------
------------------------------------------------------------------------

CREATE VIEW CONSULTA_usuario AS(
	SELECT idUsuario AS id_Usuario, (pessoa).nome AS Nome_Usuario, (pessoa).idade AS 
	idade_Usuario, (pessoa).cpf AS CPF, (endereco).cidade
	AS cidade, (endereco).estado AS UF, telefone AS telefone, email AS email, senha AS senha 
	FROM usuario
	ORDER BY idUsuario, cpf
); 
SELECT * FROM CONSULTA_usuario

CREATE VIEW CONSULTA_imovel AS(
	SELECT idImovel AS id_Imovel, favoritado AS favoritado, disponivel AS disponivel, (endereco).rua AS rua,
	(endereco).numero AS numero, (endereco).complemento AS
	complemento, (endereco).bairro AS bairro, (endereco).cidade
	AS cidade, (endereco).estado AS UF, (imoveis).nome AS Nome_Imovel,
	(imoveis).qtQuartos AS Quantidade_de_Quartos, (imoveis).qtBanheiros AS Quantidade_de_Banheiros,
	(imoveis).aluguel AS aluguel, responsavel AS responsavel 
	FROM imovel
	ORDER BY idImovel
);
SELECT * FROM CONSULTA_imovel

------------------------------------------------------------------------
-----------Exibindo os imóveis correspondentes a cada usuário-----------
------------------------------------------------------------------------

SELECT * FROM imovel IMV INNER JOIN usuario USR ON IMV.responsavel = USR.idUsuario



