CREATE DATABASE entrenamiento5;
USE entrenamiento5;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE,
    monto_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (nombre, direccion, telefono) VALUES
    ('Cliente1', 'Calle A, Ciudad X', '1234567890'),
    ('Cliente2', 'Calle B, Ciudad Y', '9876543210'),
    ('Cliente3', 'Calle C, Ciudad Z', '5555555555');

INSERT INTO pedidos (id_cliente, fecha_pedido, monto_total) VALUES
    (1, '2024-02-01', 100.50),
    (2, '2024-02-02', 75.25),
    (1, '2024-02-03', 50.00),
    (3, '2024-02-04', 120.75);