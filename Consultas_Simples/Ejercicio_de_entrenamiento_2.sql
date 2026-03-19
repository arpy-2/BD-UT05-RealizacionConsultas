-- TEMA 5: Realización de consultas | CONSULTAS SIMPLES | creacionBBDD_banco.sql

# 1. Selecciona los clientes que se llaman Antonio, mostrando sus nombres y apellidos:
select nombre, apellidos from clientes where nombre LIKE ‘Antonio’;

# 2. Selecciona los directores cuyo sueldo sea mayor de 40000 y muestra sus nombres, apellidos y sueldo:
select nombre, apellidos, sueldo from directores where sueldo > 40000;

# 3. Selecciona los clientes cuyo crédito sea menor de 1000 y muestra sus nombres, apellidos y crédito
select nombre, apellidos, credito from clientes where credito < 1000;

# 4. Selecciona todos los nombres de la tabla clientes que comienzan por ‘Ma’:
select nombre, apellidos from clientes where nombre like 'Ma%';

# 5. Selecciona los clientes que tengan al menos una ‘a’ en su nombre:
select nombre, apellidos from clientes where nombre like '%a%';

# 6. Selecciona los clientes con todos sus datos cuyo nombre empieza por ‘Ma’ y tengan 5 caracteres en total:
select * from clientes where nombre like ‘Ma___’;

# 7. Selecciona los clientes cuyo nombre empieza por ‘P’ o por ‘J’:
select nombre, apellidos from clientes where nombre like 'P%' or nombre like 'J%';

# 8. Selecciona clientes con una fecha de alta mayor a ‘2014-10-01’ y que además sean de la sucursal 1001:
select nombre, apellidos, fecha_de_alta, nsucursal from clientes where fecha_de_alta > ‘2014-10-01’ AND nsucursal = 1001;

# 9. Selecciona clientes de las sucursales mayores a 1008 y que, o su crédito es mayor a 1000 o bien, que su apellido contenga ‘dea’ en cualquier parte del campo:
select nombre, apellidos, credito, nsucursal from clientes where nsucursal > 1008 and (credito > 1000 or apellidos like '%dea%');

# 10. Selecciona los directores cuyo sueldo esté entre 45000 y 68000 ordenados por sueldo:
select nombre, apellidos, sueldo from directores where sueldo between 45000 and 68000 order by sueldo;

# 11. Selecciona los clientes que sean de la sucursal 1001 o de la sucursal 1002 ordenados por sucursal: 
select nombre, apellidos, nsucursal from clientes where nsucursal =1001 or nsucursal = 1002 order by nsucursal;

# 12. Selecciona las sucursales que no tengan directores:
select * from sucursales where director is null;
