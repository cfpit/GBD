drop table if exists libros;

-- Crearemos dos índices únicos, uno por un solo campo y otro multicolumna
create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  unique i_codigo (codigo),
  unique i_tituloeditorial (titulo,editorial)
);

show index from libros;
/*
Table	Non_unique	Key_name	Seq_in_index	Column_name	Null
____________________________________________________________________________
libros		0	i_codigo		1	codigo
libros		0	i_tituloeditorial	1	titulo		
libros		0	i_tituloeditorial	2	editorial	YES
Aparecen 3 filas.

La tabla tiene 2 índices (2 filas corresponden al mismo índice).

Ambos índices son únicos, o sea, no permiten valores repetidos, esto se indica 
en la columna "Non_unique". La columna "Key_name" indica el nombre de los índices. 
La columna "Seq_in_index" y "Column_name" muestran la secuencia de la indexación 
para cada campo del índice "i_tituloeditorial". En el índice "i_tituloeditorial" y 
el campo "titulo" muestra 1 y para el campo "editorial" muestra 2, esto significa 
que está indexado en ese orden.

La columna "Null" indica si el campo permite valores nulos; el índice "i_codigo" no 
los permite; el campo "titulo" del índice "i_tituloeditorial" no los permite 
(recuerde que lo definimos "not null"), el campo "editorial" si los permite (YES).

*/

-- Ejercicio1
/*
Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - año de inscripción,
 - número de inscripto, comienza desde 1 cada año,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.
*/

-- 1- Elimine la tabla "alumnos" si existe.

-- 2- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
-- inscripto), un índice único por el campo "documento" y un índice común por ciudad y provincia:

 create table alumnos(
  año year not null,
  numero int unsigned not null,
  nombre varchar(30),
  documento char(8) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar(20),  
  primary key(año,numero),
  unique i_documento (documento),
  index i_ciudadprovincia (ciudad,provincia)
 );

-- 3- Vea los índices de la tabla.

-- 4- Ingrese algunos registros. Ingrese 2 ó 4 alumnos para los años 2004, 2005 y 2006.

-- 5- Intente ingresar un alumno con clave primaria repetida.

-- 6- Intente ingresar un alumno con documento repetido.

-- 7- Ingrese varios alumnos de la misma ciudad y provincia.


-- Ejercicio2
/*
Una clínica registra las consultas de los pacientes en una tabla llamada "consultas" que 
almacena la siguiente información:
 - fecha de la consulta,
 - número de consulta por día,
 - documento del paciente,
 - obra social del paciente,
 - nombre del médico que atiende al paciente,
*/

-- 1- Elimine la tabla si existe.

-- 2- Cree la tabla con una clave primaria compuesta (fecha y número de consulta); 
-- un índice único (fecha,documento y médico). Hay 2 campos por los cuales podemos 
-- realizar consultas frecuentemente: "medico" y "obrasocial", cree índices para esos campos.

-- 3- Cree la tabla con la siguiente estructura:
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

-- 5- Los valores de la clave primaria no pueden repetirse. Intente ingresar dos pacientes 
-- el mismo día con el mismo número de consulta.

-- 6- Los valores para el índice único no pueden repetirse. Intente ingresar una consulta 
-- del mismo paciente, en la misma fecha con el mismo médico.

-- 7- Note que los índices por los campos "medico" y "obrasocial" son comunes, porque los 
-- valores se repiten. Ingrese consultas en las cuales se repitan los médicos y las obras 
-- sociales.

-- Ejercicio3
-- Una empresa de remises tiene registrada la información de sus vehículos en una tabla 
-- llamada "remis".

-- 1- Elimine la tabla si existe.

-- 2- Cree la tabla con una clave primaria por número de vehículo y un índice único por "patente", 
-- éste es un valor por el cual podemos realizar consultas frecuentemente y es único (igual que el 
-- número del remis):
 create table remis(
  patente char(6) not null,
  numero tinyint unsigned not null,
  marca varchar(15),
  modelo year,
  primary key (numero),
  unique i_patente (patente)
 );

-- 3- Vea los índices y analice la información.

-- 4- Los valores de la clave primaria no pueden repetirse. Intente ingresar 2 vehículos con 
-- el mismo número.

-- 5- Los valores para el índice único no pueden repetirse. Intente ingresar 2 vehículos con 
-- igual patente.

