-- Subconsultas

-- Problema:
-- Trabajamos con la tabla "libros" de una librería.
Creamos la tabla:

 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
 );
-- Ingresamos los siguientes registros:

 insert into libros(titulo,autor,editorial,precio) 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros(titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',10.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros(titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',10.00);
-- Obtenemos el título, precio de un libro específico y la diferencia entre su precio y el máximo valor:

 select titulo,precio,
  precio-(select max(precio) from libros) as diferencia
  from libros
  where titulo='Uno';
-- Mostramos el título y precio del libro más costoso:

 select titulo,autor, precio
  from libros
  where precio=
   (select max(precio) from libros);
-- Actualizamos el precio del libro con máximo valor:

 update libros set precio=45
  where precio=
   (select max(precio) from libros);
-- Eliminamos los libros con precio menor:

 delete from libros
  where precio=
   (select min(precio) from libros);