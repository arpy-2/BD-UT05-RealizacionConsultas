-- TEMA 5: Realización de consultas | CONSULTAS SIMPLES | creacionTablas_ejEntrenamiento3.sql / insercionTablas_EjEntrenamiento3.sql

# 1. Mostrar los datos de los 3 primeros clientes ordenados por nombre: 
SELECT id_cliente, nom_cli, direccion, localidad, telefono FROM clientes ORDER BY nom_cli LIMIT 3;

# 2. Mostrar los datos de los clientes ordenados alfabéticamente por nombre mostrando desde el segundo hasta el cuarto cliente: 
SELECT id_cliente, nom_cli, direccion, localidad, telefono, c_postal FROM clientes ORDER BY nom_cli LIMIT 1, 3;

# 3. Mostrar el total de los importes de los pedidos realizados: 
SELECT SUM (importe) FROM pedidos;

# 4. Mostrar la fecha del pedido más reciente que se haya realizado: 
SELECT MAX (fecha) FROM pedidos;

# 5. Muestra en una misma consulta el precio del plato más caro y el del plato más barato: 
SELECT MAX (precio), MIN (precio) FROM platos;

# 6. Calcula el importe medio de los pedidos: 
SELECT AVG (importe) FROM pedidos;

# 7. Calcula cuántos clientes viven en Alicante: 
SELECT COUNT(*) FROM clientes WHERE localidad like ‘ALICANTE’;

# 8. Obtén cuánto dinero se ha gastado cada cliente teniendo en cuenta que pueden haber realizado más de un pedido: 
SELECT id_cliente, SUM(importe) FROM pedidos GROUP BY id_cliente;

# 9. Obtén cuántos platos hay que tengan el mismo precio: 
SELECT precio, COUNT(*) FROM platos GROUP BY precio;

# 10. Haz lo mismo que en el punto anterior pero teniendo en cuenta solamente aquellos cuyo importe sea menor o igual a 1,5 (si este precio no existiera pon 2,50 en su lugar, ya que es probable que lo incrementases en otro ejercicio): 
SELECT precio, COUNT(*) FROM platos WHERE precio <= 2.5 GROUP BY precio;

# 11. Selecciona las localidades que tengan tres o más clientes: 
SELECT localidad, COUNT(*) FROM clientes GROUP BY localidad HAVING COUNT(*) >=3;

# 12. Selecciona las localidades que tengan dos o menos clientes y cuyo identificador sea menor o igual a 153: 
SELECT localidad, COUNT(*) FROM clientes WHERE id_cliente <=153 GROUP BY localidad HAVING COUNT(*) <=2;
