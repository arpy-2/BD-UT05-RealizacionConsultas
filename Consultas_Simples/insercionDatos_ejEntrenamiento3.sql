# 1. Realiza las inserciones de las siguientes filas en la tabla CLIENTES_1.
INSERT INTO clientes_1 (id_cliente, nom_cli, direccion, localidad, telefono)
VALUES (151, 'ANTONIO SOL GRANDE', 'PORVENIR, 12-3','ALICANTE', 646678986),
(152, 'LUIS MARTINEZ JUAN', 'GRAN VIA, 32-4','VALENCIA', 646234127),
(153, 'MATEO RUIZ SEÑOR', 'OCASIO, 21-21','ALICANTE', 687565454),
(154, 'ALBA LAZARO PEDROS', 'ROMA, 153-25','ALICANTE', 690343434),
(155, 'MARIA SERRA TORNER', 'ZARAGOZA, 34-23','VALENCIA', 696340929),
(156, 'CARLOS TUSET BOADA', 'TORRES QUEVEDO, 15-30','TERUEL', 623758940);

# 2. Realiza las inserciones de las siguientes filas en la tabla PEDIDOS_1.
INSERT INTO pedidos_1 (id_pedido, id_cliente, fecha, importe)
VALUES (133, 153, '2007-09-29',9.5),
(237,154, '2007-11-12', 2.5),
(475,156,'2007-11-23', 3.5), 
(334,156,'2007-10-12',2),
(289,151,'2007-10-11',4);

#3. Realiza las inserciones de las siguientes filas en la tabla PLATOS_1.
INSERT INTO platos_1 (id_plato, desc_plato, ingredientes, precio)
VALUES (1, 'ARROZ AL HORNO', 'ARROZ, CARNE DE CERDO, AJO,etc', 2),
(2, 'PAELLA CONEJO', 'ARROZ, POLLO, CONEJO, VERDURA', 2),
(3, 'PAELLA VERDURA', 'ARROZ, CARNE DE CERDO, AJO,etc', 1.5),
(4, 'PAELLA MARISCO', 'ARROZ GAMBAS,SEPIA,etc', 2.5),
(5, 'PAELLA MIXTA', 'ARROZ, POLLO, CONEJO, GAMBAS', 2.5),
(6, 'ENSALADA', 'LECHUGA, TOMATE, ZANAHORIA, etc', 1.5),
(7, 'ENSALADA ESPECIAL', 'LECHUGA, TOMATE. QUESO, etc', 2),
(8, 'SALPICON DE MARISCO', 'PULPO, GAMBITAS, PIMIENTO', 2);

#4. Realiza las inserciones de las siguientes filas en la tabla DETALLE_PEDIDO_1.
INSERT INTO detalle_pedido_1 (id_pedido, id_plato, num_platos)
VALUES (133, 2, 2), (133, 6, 1),(133, 8, 1),(237, 4, 1), (475, 2, 1), 
(475, 3, 1), (334, 8, 1), (289, 1, 1), (289, 2, 1);

#5. Intenta insertar una nueva fila en la tabla PLATOS_1 y luego lo mismo en PLATOS_2 con los siguientes valores:
INSERT INTO platos_1 (id_plato, desc_plato, ingredientes, precio)
VALUES (9, 'MACARRONES', 'PASTA, TOMATO, JAMON, etc', null);
#INSERT INTO platos_2 (id_plato, desc_plato, ingredientes, precio)
#VALUES (9, 'MACARRONES', 'PASTA, TOMATO, JAMON, etc', null);

#6 Incrementa el precio de los platos en 50 céntimos.
UPDATE platos_1 SET precio =  precio + 0.5;

#7 Modifica los ingredientes del plato con id_plato = 7
UPDATE platos_1 SET ingredientes = 'BROTES, TOMATE, QUESO' WHERE id_plato = 7;

#8 Indica los pasos necesarios para modificar el código del plato con id_plato=8 para que pase a ser id_plato=9.
UPDATE platos_1 SET id_plato = 9 WHERE id_plato = 8;

#9 Elimina los platos que cuyo importe sea menor a 2.5.
DELETE FROM platos_1 WHERE precio < 2.5;

#10 Elimina los detalles de los pedidos cuyo identificador esté entre 200 y 300.
DELETE FROM detalle_pedido_1 WHERE id_pedido BETWEEN 200 AND 300;



