drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo),
  index i_editorial (editorial),
  unique i_tituloeditorial (titulo,editorial)
 );

show index from libros;

drop index i_editorial on libros;

drop index i_tituloeditorial on libros;

show index from libros;

-- Ejercicio
-- Una clínica registra las consultas de los pacientes en una tabla llamada "consultas".

-- 1- Elimine la tabla si existe.

-- 2- Cree la tabla con la estructura siguiente:
 create table consultas(
  fecha date,
  numero int unsigned,
  documento char(8) not null,
  obrasocial varchar(30),
  medico varchar(30),
  primary key(fecha,numero),
  unique i_consulta(documento,fecha,medico),
  index i_medico (medico),
  index i_obrasocial (obrasocial)
 );

-- 4- Vea los índices.

-- 5- Elimine el índice único.

-- 6- Elimine el índice "i_medico".

-- 7- Verifique las eliminaciones anteriores visualizando los índices.

-- 8- Elimine el índice "i_obrasocial".



