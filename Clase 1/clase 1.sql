use pubs;

-- comentario de linea

/*
	comentario 
    de
    bloque
*/

-- funciones de agrupacion
select max(price) 'titulo mas caro' from titles;-- 22.95
select min(price) 'titulo mas barato' from titles;-- 2.99
select avg(price) promedio from titles;-- 14.76
select sum(price) total from titles;-- 236.26
select count(title_id) cantidad from titles;-- 19

select * from titles;
select count(*) cantidad from titles;-- 19
select count(price) cantidad from titles;-- 16

-- agrupaciones
-- listar la cantidad y el precio promedio de los titulos por categoria. No incluir
-- las categorias no definidas y cuya cantidad de titulos pertenecientes sea mayor a 2.
-- Ordenar por categoria en forma alfabetica.
select 		type as categoria,
			count(title_id) cantidad,
			round(avg(price),2) promedio
from		titles
where		type <> ''
group by	type
-- having		count(title_id) > 2;
having		cantidad > 2
-- order by	type;
order by	categoria;

-- Consultas relacionadas
create database comercio;

use comercio;

create table sucursales(suc_id int, suc_nombre varchar(20));
create table empleados(emp_id int, emp_nombre varchar(20), suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Caballito'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Jose',2),(3,'Carlos',2),(4,'Palermo',null);

select * from sucursales;
select * from empleados;

-- inner join
-- listar el nombre de los empleados y las sucursales donde ellos trabajan.
select		e.emp_nombre 'Nombre de Empleado',
			s.suc_nombre sucursal
from		sucursales as s
inner join	empleados e
on			(e.suc_id = s.suc_id);
        












