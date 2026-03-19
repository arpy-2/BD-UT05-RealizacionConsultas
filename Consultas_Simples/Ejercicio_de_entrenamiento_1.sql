-- TEMA 5: Realización de consultas | CONSULTAS SIMPLES | creacionBBDD_banco.sql

# 1. Selecciona todas las filas de las tabla clientes
SELECT * FROM banco.clientes;

# 2. Selecciona todas las filas de la tabla directores
SELECT * FROM banco.directores;

# 3. Selecciona todas las filas de la tabla sucursales sin repeticiones
SELECT DISTINCT * FROM banco.sucursales;

# 4. Selecciona el campo directores de la tabla sucursales primero con repeticiones (select normal) y luego sin repeticiones para que veáis la diferencia
SELECT director FROM sucursales;
SELECT DISTINCT director FROM sucursales;

# 5. Selecciona el nombre, apellidos y el crédito de los clientes de la sucursal 1001
SELECT nombre, apellidos, credito FROM banco.clientes WHERE nsucursal=1001;

# 6. Selecciona el nombre, apellidos y nsucursal de los clientes poniéndole a esta última columna el nombre “Número_de_sucursal”
SELECT nombre, apellidos, nsucursal Número_de_sucursal FROM clientes;  

# 7. Selecciona los directores cuyo sueldo sea mayor a 80000
SELECT * FROM banco.directores WHERE sueldo>80000;

# 8. Averigua quién es el director de la sucursal 1001, y luego selecciona todos los datos de ese director
SELECT director FROM banco.sucursales WHERE nsucursal=1001;
SELECT * FROM banco.directores WHERE id=12;

# 9. Muestra los clientes cuyo crédito es de 1500.
SELECT * FROM banco.clientes WHERE credito=1500;

# 10. A través de la interfaz gráfica cambia el crédito de Carlos Ledio a 1600 y aplica los cambios (si queréis hacerlo a través de SQL sería:
UPDATE clientes SET credito=1600 where nombre like 'Carlos')

# 11. Averigua quién es el cliente cuyo crédito es 1600. Después saca la información de la sucursal a la que pertenece este cliente. Finalmente obtén la información del director de esta sucursal.
SELECT * FROM banco.clientes WHERE credito=1600;
SELECT * FROM banco.sucursales WHERE nsucursal=1008;
SELECT * FROM banco.directores WHERE id=113;

# 12. Selecciona el nombre, apellido y crédito de todos los clientes ordenados por crédito de mayor a menor y a igualdad de crédito, por apellido de menor a mayor.
SELECT nombre, apellido, credito FROM clientes ORDER BY credito desc, apellidos;

# 13. Selecciona todos los datos de los clientes cuyo nombre empiece por A y tenga en total 6 letras, y que además, su DNI termine en la letra K.
SELECT * from clientes WHERE nombre LIKE 'A_____' AND dni LIKE '%K';

# 14. Selecciona todos los datos de los clientes cuya fecha de alta no sea nula.
SELECT * FROM clientes WHERE fecha_de_alta IS NOT NULL;

# 15. Selecciona todos los datos de los clientes cuyo DNI termine en la letra A o en K.
select * from clientes where dni like '%K' OR dni like '%A';

# 16. Selecciona todos los datos de las sucursales cuyo número de sucursal pertenezca a la lista (1005, 1010 y 1015)
select * from sucursales where nsucursal IN (1005, 1010, 1015);

# 17. Selecciona el nombre y apellidos de los directores cuyo sueldo esté entre 43000 y 50000.  
select  nombre, apellidos from directores where sueldo BETWEEN 43000 AND 50000;

