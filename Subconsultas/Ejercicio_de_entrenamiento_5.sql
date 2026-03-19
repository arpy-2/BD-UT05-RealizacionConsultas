-- TEMA 5.3: SUbconsultas | SUBCONSULTAS | scriptEjEntrenamiento5.sql.

# 1. Clientes con pedidos: encuentra todos los clientes que han realizado pedidos.
-- Solución con multitabla:
SELECT DISTINCT c.* FROM clientes c INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
-- Solución con subconsultas:
SELECT c.* FROM clientes c WHERE c.id_cliente IN (SELECT id_cliente FROM pedidos);

# 2. Pedidos de un cliente específico: dado el nombre de un cliente (Cliente2), encuentra todos los pedidos realizados por ese cliente.
SELECT * FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nombre like 'Cliente2');

# 3. Monto total de pedidos de todos los clientes: para cada cliente, mostrar el nombre y el cálculo del monto total de todos sus pedidos.
-- Solución con subconsultas:
SELECT nombre, (SELECT SUM(monto_total) FROM pedidos WHERE id_cliente = c.id_cliente) AS monto_total FROM clientes c;
-- Solución con multitabla (tiene más sentido resolverlo de esta forma):
SELECT nombre, SUM(monto_total) FROM pedidos p, clientes c WHERE p.id_cliente = c.id_cliente GROUP BY c.id_cliente;

# 4. Monto total de pedidos de un cliente: para un cliente específico (Cliente_1), calcula el monto total de todos sus pedidos.
SELECT SUM(monto_total) FROM pedidos p WHERE p.id_cliente = (SELECT c.id_cliente FROM clientes c WHERE nombre like 'Cliente1');

# 5. Clientes que no han realizado pedidos: encuentra todos los clientes que no han realizado ningún pedido (meter algún valor más porque sale null)
SELECT * FROM clientes WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM pedidos);

# 6.  Pedidos realizados en una fecha específica: dada una fecha (2024-02-02), encuentra el nombre de todos los clientes que realizaron un pedido en dicha fecha
SELECT nombre FROM clientes WHERE id_cliente IN (SELECT id_cliente FROM pedidos WHERE fecha_pedido = '2024-02-02');

# 7.  Clientes con pedidos superiores a un monto específico: encuentra todos los clientes cuyo monto total de pedidos sea superior a 110.
-- Solución con multitabla
SELECT c.* FROM clientes c INNER JOIN pedidos p ON c.id_cliente = p.id_cliente GROUP BY id_cliente HAVING SUM(monto_total)>110;
-- Solución con subconsultas
SELECT c.* FROM clientes c WHERE id_cliente IN(SELECT id_cliente FROM pedidos GROUP BY id_cliente HAVING SUM(monto_total)>110);

# 8. Clientes que han realizado pedidos más de una vez: encuentra los clientes que han realizado más de un pedido.
SELECT c.* FROM clientes c WHERE id_cliente IN (SELECT id_cliente FROM pedidos GROUP BY (id_cliente) HAVING COUNT(*)>1);

# 9. Clientes que realizaron pedidos después de una fecha específica: dada una fecha, encuentra todos los clientes que realizaron pedidos después de esa fecha (2024-02-02).
-- Subconsulta
SELECT DISTINCT c.* FROM clientes c WHERE id_cliente IN (SELECT id_cliente FROM pedidos WHERE fecha_pedido > '2024-02-02');
-- Consulta multitabla
SELECT DISTINCT c.* FROM clientes c INNER JOIN pedidos p ON c.id_cliente = p.id_cliente WHERE p.fecha_pedido > '2024-02-02';


