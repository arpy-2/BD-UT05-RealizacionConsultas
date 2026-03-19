-- TEMA 5.2: Consultas multitabla | CONSULTAS MULTITABLA | scriptEjEntrenamiento4.sql.
 
# 1. Listar las oficinas del este indicando para cada una de ellas su número, ciudad, números y nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados, y hacer otra en las que aparezcan todas las oficinas del este incluso las que no tienen empleados.
-- Versión 1999: 
SELECT oficinas.oficina, ciudad, numemp, nombre FROM oficinas 
INNER JOIN empleados ON oficinas.oficina = empleados.oficina WHERE region = 'este';
-- Versión 1992: 
SELECT oficinas.oficina, ciudad, numemp, nombre FROM oficinas, 
empleados WHERE oficinas.oficina = empleados.oficina AND region = ‘este’;
SELECT oficinas.oficina, ciudad, numemp, nombre FROM oficinas 
LEFT JOIN empleados ON oficinas.oficina = empleados.oficina WHERE region = 'este';
-- No es necesaria esta solución: 
SELECT oficinas.oficina, ciudad, numemp, nombre FROM empleados RIGHT JOIN oficinas ON oficinas.oficina = empleados.oficina WHERE region = 'este';

# 2. Listar los pedidos mostrando su número, importe, nombre del cliente, y el límite de crédito del cliente correspondiente (todos los pedidos tienen cliente y representante). 
-- //Versión 1999:
SELECT numpedido, importe, clientes.nombre AS cliente, limitecredito 
FROM pedidos INNER JOIN clientes ON pedidos.clie = clientes.numclie;
-- //Versión 1992: 
SELECT numpedido, importe, nombre “nombre cliente”, limitecredito 
FROM pedidos, clientes WHERE clie = numclie;

# 3. Listar los datos de cada uno de los empleados, la ciudad y región en donde trabaja. (como dice de cada uno de los empleados tiene más sentido LEFT JOIN que INNER JOIN, pero como no lo dice de forma muy clara puedo dar válido INNER JOIN)
SELECT empleados.*, ciudad, region FROM empleados LEFT JOIN oficinas ON empleados.oficina = oficinas.oficina;
SELECT empleados.*, ciudad, region FROM empleados, oficinas WHERE oficinas.oficina = empleados.oficina;

# 4. Listar las oficinas con objetivo superior a 600.000 pts indicando para cada una de ellas el nombre de su director, incluso aquellos casos en los que la oficina no tenga director.
SELECT oficinas.*, nombre AS director FROM empleados RIGHT JOIN oficinas 
ON empleados.numemp = oficinas.director WHERE objetivo > 600000;
-- Versión con LEFT JOIN: 
SELECT oficinas.*, nombre “nombre director” FROM oficinas LEFT JOIN empleados 
ON director = numemp WHERE objetivo > 600000;

-- Revisar esta solución (añadir la clave ajena de la reflexiva y meter los insert en el orden adecuado): 
SELECT oficinas.*, nombre AS director FROM empleados RIGHT JOIN oficinas 
ON oficinas.oficina = empleados.oficina WHERE objetivo > 600000 AND oficinas.director = empleados.numemp;

# 5. Listar los pedidos superiores a 25.000 pts, incluyendo el nombre del empleado que tomó el pedido y el nombre del cliente que lo solicitó.
-- //Versión 1999: 
SELECT numpedido, importe, empleados.nombre AS representante, clientes.nombre 
AS cliente FROM (pedidos INNER JOIN clientes ON pedidos.clie = clientes.numclie) 
INNER JOIN empleados ON pedidos.rep = empleados.numemp WHERE importe > 25000;
-- //Versión 1992: 
SELECT pedidos.*, empleados.nombre “empleado”, clientes.nombre “cliente” 
FROM pedidos, empleados, clientes WHERE rep = numemp AND clie = numclie AND importe > 25000;

# 6. Hallar los empleados que realizaron su primer pedido el mismo día en que fueron contratados. 
SELECT empleados.* FROM empleados INNER JOIN pedidos ON pedidos.rep = empleados.numemp WHERE fechapedido = contrato;

# 7. Listar los empleados con una cuota superior a la de su jefe; para cada empleado sacar sus datos y el número, nombre y cuota de su jefe. (esto es una reflexiva)
-- //Versión 1999: 
SELECT empleados.*, jefes.numemp AS num_jefe, jefes.nombre AS nombre_jefe, 
jefes.cuota AS cuota_jefe FROM empleados INNER JOIN empleados as jefes 
ON empleados.jefe = jefes.numemp WHERE empleados.cuota > jefes.cuota;
-- //Versión 1992: 
SELECT empleados.*, jefes.numemp “nº jefe”, jefes.nombre “nombre jefe”, jefes.cuota “cuota jefe” 
FROM empleados, empleados AS jefes WHERE empleados.jefe = jefes.numemp AND empleados.cuota > jefes.cuota;

# 8. Listar los códigos de los empleados que tienen una línea de pedido superior a 10.000 pts o que tengan una cuota inferior a 10.000 pts (como no especifica que tengan que aparecer también empleados sin pedidos es válido usar INNER JOIN):
SELECT numemp FROM empleados LEFT JOIN pedidos ON pedidos.rep = empleados.numemp WHERE importe > 10000 OR cuota < 10000;
-- //Versión 1999: 
SELECT numemp FROM empleados INNER JOIN pedidos ON pedidos.rep = empleados.numemp WHERE importe > 10000 OR cuota < 10000;
-- //Versión 1992: 
SELECT numemp, nombre FROM empleados, pedidos WHERE empleados.numemp = pedidos.rep AND (importe > 10000 OR cuota <10000);
