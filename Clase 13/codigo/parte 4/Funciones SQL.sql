-- Funciones SQL

-- Creamos una función que reciba dos enteros y retorne la suma de los mismos:

 create or replace function sumar(integer,integer) returns integer 
 AS 
   'select $1+$2;'
 language sql;
-- Llamamos la función que acabamos de crear:

 select sumar(3,4);
-- Creamos la tabla usuarios:

 create table usuarios (
   nombre varchar(30),
   clave varchar(10)
 );
-- Insertamos un conjunto de registros:

 insert into usuarios (nombre, clave) values ('Marcelo','Boca');
 insert into usuarios (nombre, clave) values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave) values ('Susana','River');
 insert into usuarios (nombre, clave) values ('Luis','River');
-- Creamos una función que reciba una cadena con el nombre de usuario y retorne la clave de dicho usuario:

 create or replace function retornarclave(varchar) returns varchar
 as
   'select clave from usuarios where nombre=$1;'
 language sql;
-- Llamamos la función recuperando la clave del usuario llamada 'Susana':

 select retornarclave('Susana');