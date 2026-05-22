-- Problema:
-- Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
-- 1- Eliminamos la tabla, si existe y la creamos:
-- drop table if exists empleados;

create database procedimientos;

use procedimientos;


 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
 );

-- 2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

select * from empleados;

-- 3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:
 drop procedure if exists pa_empleados_sueldo;

-- 4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
-- apellidos y sueldos de los empleados.
 delimiter //
 create procedure pa_empleados_sueldo()
 begin
   select nombre,apellido,sueldo
     from empleados;
 end //
 delimiter ;

-- 5- Ejecute el procedimiento creado anteriormente.
 call pa_empleados_sueldo();

-- 6- Elimine el procedimiento llamado "pa_empleados_hijos" si existe:
 drop procedure if exists pa_empleados_hijos;

-- 7- Cree un procedimiento almacenado llamado "pa_empleados_hijos" que seleccione los nombres, 
-- apellidos y cantidad de hijos de los empleados con hijos.
 delimiter //
 create procedure pa_empleados_hijos()
 begin
   select nombre,apellido,cantidadhijos
     from empleados
   where cantidadhijos>0;
 end //
 delimiter ;

-- borro el procedimiento
-- drop procedure pa_empleados_hijos;

-- 8- Ejecute el procedimiento creado anteriormente.
call pa_empleados_hijos();

-- 9- Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el procedimiento 
-- para verificar que ahora si aparece en la lista.
 update empleados set cantidadhijos=1 where documento='22333333';
 call pa_empleados_hijos();