-- Agrupaciones
use pubs;

-- veo las tablas de la base pubs
show tables;

-- funciones de Agrupacion
-- informar la cantidad de empleados de la base
select count(emp_id) from employee;-- 236.26

-- Informar la sumatoria de precios de todos los libros
select sum(price) from titles;-- 236.26

-- informar el precio mas caro y barato
select 	max(price), 
		min(price)
from titles;-- 236.26

-- Informar el promedio de precios de todos los titulos
select	avg(price) from titles;-- 14.76

-- una unica query para todas las funciones agrupadas
select	max(price) 'titulo mas caro',
		min(price) 'titulo mas barato',
		count(title_id) 'cantidad de titulos',
		round(sum(price), 2) total,
		avg(price) promedio
from 	titles;

-- Listar la cantidad de titulos por categoria de libro. 
-- No mostrar aquellas categorias sin definir. Solo listar 
-- las categorias  cuya cantidad de titulos pertenecientes
-- sea mayor que 2. Ordenar por cantidad en forma descendente
select		type as categoria,
			count(title_id) as cantidad
from		titles
where		type != ''
group by	type
having		cantidad > 2
-- order by	cantidad desc, categoria;
order by	2 desc, 1;

-- Consultas Relacionadas
create database relaciones;
use relaciones;

create table sucursales(suc_id int, suc_nombre varchar(20));
create table empleados(emp_id int, emp_nombre varchar(20),suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Almagro'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Ana',2),(3,'Luis',2),(4,'Maria',null);

select * from sucursales;
select * from empleados;

-- INNER JOIN
-- retorna aquellos registros en los que coinciden los valores de los
-- campos por los cuales se relacionan las tablas. En este ejemplo, suc_id

-- Listar el nombre de los empleados y de las sucursales donde trabajan
select		emp_nombre, suc_nombre
from		empleados as e
inner join	sucursales s
on			e.suc_id = s.suc_id;

-- OUTER JOIN
-- retorna coincidencias y no coincidencias de los valores de los
-- campos por los cuales se relacionan las tablas. Aca ahora va a importar
-- obtener las no coincidencias.

-- Listar los empleados que no trabajan en ninguna sucursal
-- tabla ppal: es aquella de la cual quiero obtener datos -> empleados
-- tabla secundaria: sucursales
select		e.emp_nombre
			-- ,s.* -- todos los campos de la tabla secundaria
from		sucursales s right join empleados e
on			e.suc_id = s.suc_id
where		s.suc_id is null;-- que la clave ppal de la tabla secundaria sea nula











