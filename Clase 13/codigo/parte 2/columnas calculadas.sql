-- Trabajamos con la tabla "libros" de una librería.
Creamos la tabla:

 create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad smallint default 0,
  primary key (codigo)
 );
-- Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
-- Queremos saber el monto total en dinero de cada libro:

 select titulo, precio,cantidad,
  precio*cantidad
  from libros;
-- Queremos saber el precio de cada libro con un 10% de descuento:

 select titulo,precio,
  precio-(precio*0.1)
  from libros;
-- Actualizamos los precios con un 10% de descuento y vemos el resultado:

 update libros set precio=precio-(precio*0.1);
 select * from libros;
-- Queremos una columna con el título, el autor y la editorial de cada libro:

 select titulo||'-'||autor||'-'||editorial
  from libros;