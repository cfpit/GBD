-- Trabajamos con la tabla "usuarios".

-- La creamos con la siguiente estructura:

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );
-- Agregamos registros a la tabla:

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');
-- Seleccionamos todos los registros:

 select * from usuarios;
-- Vamos a eliminar el registro cuyo nombre de usuario es "Marcelo":

 delete from usuarios
 where nombre='Marcelo';
-- Veamos el contenido de la tabla:

 select * from usuarios;
-- Intentamos eliminarlo nuevamente:

 delete from usuarios
 where nombre='Marcelo';
-- Veamos el contenido de la tabla:

 select * from usuarios;
-- Como ningún registro cumple con la condición no se borran registros.

-- Eliminamos todos los registros cuya clave es 'Boca':

 delete from usuarios
  where clave='Boca';
-- Veamos el contenido de la tabla:

 select * from usuarios;
-- Eliminemos todos los registros:

 delete from usuarios;
-- Veamos el contenido de la tabla:

 select * from usuarios;
-- No hay registros.