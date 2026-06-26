-- Trabajamos con la tabla "libros" de una librería.
-- Creamos la tabla especificando que los campos "titulo" y "autor" no admitan valores nulos:

 create table libros(
  titulo varchar(30) not null,
  autor varchar(30) not null,
  editorial varchar(15) null,
  precio float
 );
-- Los campos "editorial" y "precio" si permiten valores nulos; el primero, porque lo especificamos colocando "null" en la definición del campo, el segundo lo asume por defecto.

-- Agregamos un registro a la tabla con valor nulo para el campo "precio":

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);
-- Recuerde que el valor "null" no es una cadena de caracteres, por lo tanto no se coloca entre comillas.

-- Ingresamos otro registro, con valor nulo para el campo "editorial", campo que admite valores "null":

 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais','Lewis Carroll',null,0);
-- Veamos lo que sucede si intentamos ingresar el valor "null" en campos que no lo admiten, como "titulo":

 insert into libros (titulo,autor,editorial,precio)
  values(null,'Borges','Siglo XXI',25);
-- aparece un mensaje y la sentencia no se ejecuta.

-- Para ver cuáles campos admiten valores nulos y cuáles no, empleamos:

select table_name,column_name,udt_name,character_maximum_length,is_nullable 
  from information_schema.columns 
  where table_name = 'libros';
-- nos muestra muchas columnas, una de ellas tiene el encabezado "is_nullable", vemos que aparece "NO" en los campos que no permiten valores nulos y "YES" en los campos que si los permiten.

-- Dijimos que el valor "null" no es lo mismo que una cadena vacía. Vamos a ingresar un registro con cadena vacía para el campo "editorial":

 insert into libros (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','',18.50);
-- Ingresamos otro registro, ahora cargamos una cadena vacía en el campo "titulo":

 insert into libros (titulo,autor,editorial,precio)
  values('','Richard Bach','Planeta',22);
-- Veamos todos los registros ingresados:

 select * from libros;
-- Recuperemos los registros que contengan el valor "null" en el campo "precio":

 select * from libros
  where precio is null;
-- La sentencia anterior tendrá una salida diferente a la siguiente:

 select * from libros
  where precio=0;
-- Con la primera sentencia veremos los libros cuyo precio es igual a "null" (desconocido); con la segunda, los libros cuyo precio es 0.

-- Recuperemos los libros cuyo nombre de editorial es "null":

 select * from libros
  where editorial is null;
-- Ahora veamos los libros cuya editorial almacena una cadena vacía:

 select * from libros
  where editorial=''; 
-- Para recuperar los libros cuyo precio no sea nulo tipeamos:

 select * from libros
  where precio is not null;