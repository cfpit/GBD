-- Funcion SQL sin retorno

-- Creamos la tabla usuarios:

 create table usuarios (
   nombre varchar(30),
   clave varchar(10)
 );
-- Definimos la función cargarusuarios:

create or replace function cargarusuarios() returns void
as
$$
 insert into usuarios (nombre, clave) values ('Marcelo','Boca');
 insert into usuarios (nombre, clave) values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave) values ('Susana','River');
 insert into usuarios (nombre, clave) values ('Luis','River');
$$
 language sql;
-- Llamamos la función cargarusuarios:

select cargarusuarios();
-- Mostramos el contenido de la tabla usuarios:

select * from usuarios;
