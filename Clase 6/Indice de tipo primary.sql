drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );

show index from libros;

-- Ejemplo1:
-- Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".

-- 1- Elimine la tabla "clientes" si existe.
drop table if exists clientes;


-- 2- Créela con los siguientes campos y clave:
 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );

-- 3- Vea la estructura de los índices la tabla y analice la información:
 show index from clientes;

-- Ejemplo2
-- Un instituto de enseñanza almacena los datos de sus 
-- estudiantes en una tabla llamada "alumnos".

-- 1- Elimine la tabla "alumnos" si existe.
drop table if exists alumnos;

-- 2- Cree la tabla con la siguiente estructura:
 create table alumnos(
  legajo varchar(4) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (legajo)
 );

-- 3- Vea la estructura de los índices de la tabla y analice la información:
 show index from alumnos;
 
 