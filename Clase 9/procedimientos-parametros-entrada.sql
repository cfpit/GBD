-- Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
-- 1- Eliminamos la tabla, si existe y la creamos:
create database procedimientos;

use procedimientos;

 drop table if exists empleados;

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
-- apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como 
-- parámetro.


 delimiter //
 create procedure pa_empleados_sueldo
(in p_sueldo decimal(6,2))
 begin
   select nombre,apellido,sueldo
     from empleados
     where sueldo>=p_sueldo;
 end //
 delimiter ;

-- 5- Ejecute el procedimiento creado anteriormente con distintos valores:
 call pa_empleados_sueldo(400);
 call pa_empleados_sueldo(500);

-- 6- Intente ejecute el procedimiento almacenado "pa_empleados_sueldo" sin parámetros.
call pa_empleados_sueldo();
-- Muestra mensaje de error.

-- 7- Elimine el procedimiento almacenado "pa_empleados_actualizar_sueldo" si existe:
 drop procedure pa_empleados_actualizar_sueldo;

-- 8- Cree un procedimiento almacenado llamado "pa_empleados_actualizar_sueldo" que actualice los 
-- sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro.
 delimiter //
 create procedure pa_empleados_actualizar_sueldo
   (p_sueldoanterior decimal(6,2),
    p_sueldonuevo decimal(6,2))
 begin
   update empleados set sueldo=p_sueldonuevo
     where sueldo=p_sueldoanterior;
 end //
 delimiter ;

-- 9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:
 call pa_empleados_actualizar_sueldo(300, 350);
 select * from empleados;

-- 10- Ejecute el procedimiento "pa_empleados_actualizar_sueldo" enviando un solo parámetro.
call pa_empleados_actualizar_sueldo(700);
-- Error.