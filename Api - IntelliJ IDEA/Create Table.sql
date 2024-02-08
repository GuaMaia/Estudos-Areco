create database produtos;

use produtos;

CREATE TABLE PRODUTO (
    ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(100),
    UNIDADE CHAR(2),
    PRECO_UNITARIO NUMERIC(20,2)
);