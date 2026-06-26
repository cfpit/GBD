-- alter table - drop constraint

-- Trabajamos con la tabla "libros" de una librería.
-- La creamos estableciendo el campo código como clave primaria:

 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
 );
-- Definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos que cada libro tendrá un código diferente y único:

 alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);
-- Definimos una restricción "check" para asegurarnos que el precio no será negativo:

 alter table libros
 add constraint CK_libros_precio
 check (precio>=0);
-- Vemos las restricciones:

 select *
  from information_schema.table_constraints 
  where table_name = 'libros';
-- Aparecen 2 restricciones, 1 "check" y 1 "primary key".

-- Eliminamos la restricción "PK_libros_codigo":

 alter table libros
  drop constraint PK_libros_codigo;
-- Vemos si se eliminó:

 select *
  from information_schema.table_constraints 
  where table_name = 'libros';