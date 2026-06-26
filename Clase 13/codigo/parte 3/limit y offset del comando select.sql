-- limit y offset del comando select

-- Problema:
-- Trabajamos con la tabla "libros" de una librería.

-- Creamos la tabla:

 create table libros(
  codigo serial,
  titulo varchar(50) not null,
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  primary key (codigo)
 );
-- Agregamos algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Planeta',15);
 insert into libros (titulo,autor,editorial,precio)
  values('Martin Fierro','Jose Hernandez','Emece',22.20);
 insert into libros (titulo,autor,editorial,precio)
  values('Antologia poetica','Borges','Planeta',40);
 insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Emece',18.20);
 insert into libros (titulo,autor,editorial,precio)
  values('Cervantes y el quijote','Borges','Paidos',36.40);
 insert into libros (titulo,autor,editorial,precio)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);
 insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
 insert into libros (titulo,autor,editorial,precio)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);
-- Para recuperar 4 libros desde el registro cero tipeamos:

 select * from libros limit 4 offset 0;
-- Para recuperar 4 libros a partir del registro 5:

 select * from libros limit 4 offset 5;
-- Si colocamos solo el limit, éste indica el máximo número de registros a retornar, comenzando desde 0:

 select * from libros limit 8;
-- Muestra los primeros 8 registros.

-- Mostrar los tres primeros registro ordenados por código:

 select * from libros order by codigo limit 3;