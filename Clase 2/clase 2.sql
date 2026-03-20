-- JOINS

create database empresa;

use empresa;

create table sucursales(suc_id int, suc_nombre varchar(20));
create table empleados(emp_id int, emp_nombre varchar(20), suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Almagro'),(4,'Palermo');

insert into empleados values(1,'Juan',1),(2,'Jose',2),(3,'Carlos',2),(4,'Maria',null);

select * from sucursales;
select * from empleados;

-- listar el nombre de las sucursales y de los empleados que trabajan en ellas
select		suc_nombre, emp_nombre
from		sucursales as s
inner join	empleados e
on			s.suc_id = e.suc_id;

-- no ANSI
select		suc_nombre, emp_nombre
from		sucursales as s, empleados e
where		s.suc_id = e.suc_id;

-- producto cartesiano
select		suc_nombre, emp_nombre
from		sucursales, empleados;

select		suc_nombre, emp_nombre
from		sucursales
cross join	empleados;

-- listar los empleados que no trabajan en ninguna sucursal
-- tabla ppal: empleados
select		e.emp_nombre
			-- , s.*
from		sucursales s right join empleados e
on			e.suc_id = s.suc_id
where		s.suc_id is null;

-- listar las sucursales dnd no trabaja ningun empleado
-- tabla ppal: sucursales
select 	s.suc_nombre
		-- ,e.*
-- from	empleados e right outer join sucursales s
from	sucursales s left outer join empleados e
on		e.suc_id = s.suc_id
where	e.emp_id is null;

-- 
use pubs;

-- 1 Seleccionar todos los libros junto a todos los datos de 
-- la editorial la cual lo publicó.
select		t.title titulo,
			p.pub_name editorial
from		publishers p
inner join	titles t
on			p.pub_id = t.pub_id;

-- 2 Mostrar el nombre del libro y el nombre de la editorial 
-- la cual lo publicó sólo de las editoriales que tengan 
-- residencia en USA. Mostrar un apodo para cada columna. 
select		t.title titulo,
			p.pub_name editorial
from		publishers p
inner join	titles t
on			p.pub_id = t.pub_id
where		p.country = 'USA';

-- 3 Listar los autores que residan en el mismo estado que las 
-- tiendas. Mostrar el nombre y apellido del autor en una 
-- columna y el nombre de la tienda en otra. Apodar ambas 
-- columnas. Ordenar por la columna 1
select		concat(a.au_fname,' ',a.au_lname) as autor,
			s.stor_name tienda,
			s.state estado
from		authors a
inner join	stores s
on			s.state = a.state
-- order by	autor;
order by	1;

-- 4 Mostrar el nombre y apellido del autor y el nombre de los libros 
-- publicados por el mismo. Mostrar un apodo para cada columna. Ordenar 
-- por la primera columna de la consulta.
select		concat(a.au_fname,' ',a.au_lname) as autor,
			t.title titulo
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on ta.title_id = t.title_id
order by	1;

-- 5 Mostrar los libros junto a su autor y su editorial. 
-- Se debe mostrar los datos en una unica columna de la siguiente 
-- manera con los siguientes textos literales: 
-- 'El libro XXXXXXXXXXXXX fue escrito por XXXXXXXXXXXXX y publicado 
-- por la editorial XXXXXXXXXXXXX'
select 		concat('El libro ', t.title,' fue escrito por ', a.au_fname,' ',a.au_lname, ' y 
			publicado por la editorial ', p.pub_name) as consulta
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on ta.title_id = t.title_id	
inner join	publishers p on t.pub_id = p.pub_id;

-- 6. Mostrar el nombre de las editoriales que no hayan publicado ningún libro
-- tabla ppal: publishers
select		p.pub_name editorial
			-- ,t.*
from		publishers p 
left join	titles t on p.pub_id = t.pub_id
where		t.title_id is null;

-- 7. Mostrar el nombre de los libros que nunca fueron vendidos
-- tabla ppal: titles
select 		t.title titulo
			-- ,s.*
from		sales s
right join	titles t on t.title_id = s.title_id
where		s.stor_id is null;

-- 8. Mostrar el nombre y apellido de los empleados y la descripción del trabajo que 
-- realiza. Basar la relación en el nivel de trabajo. 
select		concat(e.fname , ' ' , e.lname) empleado,
			j.job_desc descripcion
from		employee e
inner join	jobs j on j.job_id = e.job_id
-- where		e.job_lvl between j.min_lvl and j.max_lvl;
where		e.job_lvl between 80 and 120;


-- 9. Mostrar el producto cartesiano entre los libros de negocio (business) y las 
-- tiendas ubicadas en California (CA). Mostrar el nombre de la tienda y el nombre 
-- del libro. Ordenar por nombre de tienda.
select 		title titulo,
			stor_name tienda,
			type categoria,
			state estado
from		titles
cross join	stores
where		type like '%bus%'
and			state = 'ca'
order by	2;



























