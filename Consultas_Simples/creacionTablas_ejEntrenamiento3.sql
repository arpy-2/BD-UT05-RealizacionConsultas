CREATE DATABASE prereto3;
USE prereto3;

CREATE TABLE clientes_1 (id_cliente VARCHAR(10), nom_cli VARCHAR(30),
direccion VARCHAR(30), localidad VARCHAR(30), telefono INT(9));

CREATE TABLE pedidos_1 (id_pedido VARCHAR(10), id_cliente
VARCHAR(10), fecha DATE, importe NUMERIC(10,2));

CREATE TABLE platos_1 (id_plato VARCHAR(10), desc_plato VARCHAR(100),
ingredientes VARCHAR(100), precio NUMERIC(10,2));

CREATE TABLE detalle_pedido_1 (id_pedido VARCHAR(10), id_plato
VARCHAR(10), num_platos INT(2));

CREATE TABLE clientes_2 (id_cliente VARCHAR(10) PRIMARY KEY, nom_cli
VARCHAR(30), direccion VARCHAR(30), localidad VARCHAR(30), telefono
INT(9) UNIQUE NOT NULL);

CREATE TABLE pedidos_2 (id_pedido VARCHAR(10) PRIMARY KEY, id_cliente
VARCHAR(10), fecha DATE, importe NUMERIC(10,2) NOT NULL);

CREATE TABLE platos_2 (id_plato VARCHAR(10) PRIMARY KEY, desc_plato
VARCHAR(100), ingredientes VARCHAR(100), precio NUMERIC(10,2) NOT
NULL);

CREATE TABLE detalle_pedido_2 (id_pedido VARCHAR(10) REFERENCES
pedidos_2, id_plato VARCHAR(10) REFERENCES platos_2, num_platos
INT(2) NOT NULL, PRIMARY KEY(id_pedido, id_plato));