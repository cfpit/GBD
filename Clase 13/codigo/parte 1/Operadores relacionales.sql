-- Trabajamos con la tabla "libros" de una librería.

-- La creamos con la siguiente estructura:

 create table libros(
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio float
 );
-- Agregamos registros a la tabla:

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',24.50);
 insert into libros (titulo,autor,editorial,precio)
  values ('Martin Fierro','Jose Hernandez','Emece',16.00);
 insert into libros (titulo,autor,editorial,precio)
  values ('Aprenda PHP','Mario Molina','Emece',35.40);
 insert into libros (titulo,autor,editorial,precio)
  values ('Cervantes y el quijote','Borges','Paidos',50.90);
-- Seleccionamos los registros cuyo autor sea diferente de 'Borges':

 select * from libros
  where autor<>'Borges';
-- Seleccionamos los registros cuyo precio supere los 20 pesos, sólo el título y precio:

 select titulo,precio
  from libros
  where precio>20;
-- Note que el valor con el cual comparamos el campo "precio", como es numérico (float), no se coloca entre comillas. Los libros cuyo precio es menor o igual a 20 pesos no aparece en la selección.

-- Recuperamos aquellos libros cuyo precio es menor o igual a 30:

 select * from libros
  where precio<=30;