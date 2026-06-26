-- Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería.

-- Creamos la tabla:

 create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio float,
  cantidad integer
 );
-- Veamos la estructura de la tabla:

 select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'libros';
-- Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);
-- Veamos todos los campos la tabla:

 select * from libros;
-- Veamos solamente el título, autor y editorial de todos los libros especificando los nombres de los campos separados por comas:

 select titulo,autor,editorial from libros; 
-- Con la siguiente sentencia seleccionamos los títulos y precios de todos los libros:

 select titulo,precio from libros;
-- Veamos solamente la editorial y la cantidad de libros tipeamos:

 select editorial,cantidad from libros; 