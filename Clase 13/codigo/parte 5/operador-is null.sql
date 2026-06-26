-- operadores relacionales (is null)

-- Trabajamos con la tabla "libros" de una librería.
-- Creamos la tabla:

 create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
 );
-- Ingresamos algunos registros:

 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',15.90);
 insert into libros(titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',null);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
 insert into libros (titulo,autor,precio)
  values('Antología poética','Borges',25.50);
 insert into libros (titulo,autor,precio)
  values('Java en 10 minutos','Mario Molina',45.80);
 insert into libros (titulo,autor)
  values('Martin Fierro','Jose Hernandez');
 insert into libros (titulo,autor)
  values('Aprenda PHP','Mario Molina');
-- Recuperamos los registros en los cuales esté almacenado el valor "null" en el campo "editorial":

 select * from libros
  where editorial is null;
-- Seleccionamos los libros que no contiene "null" en "editorial":

 select * from libros
  where editorial is not null;