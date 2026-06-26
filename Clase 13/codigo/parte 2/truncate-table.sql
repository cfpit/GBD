-- Trabajamos con la tabla "libros" de una librería.

 create table libros(
  codigo serial,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );
-- Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros (titulo,autor,editorial)
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros (titulo,autor,editorial)
  values('Cervantes y el quijote','Borges','Paidos');
 insert into libros (titulo,autor,editorial)
  values('Matematica estas ahi', 'Paenza', 'Paidos');
 insert into libros (titulo,autor,editorial)
  values('El aleph', 'Borges', 'Emece');
-- Eliminemos todos los registros con "delete":

 delete from libros;
-- Veamos el resultado:

 select * from libros;
-- La tabla ya no contiene registros.

-- Ingresamos un nuevo registro:

 insert into libros (titulo,autor,editorial)
  values('Antología poetica', 'Borges', 'Emece');
-- Veamos el resultado:

 select * from libros;
-- Para el campo "codigo" se guardó el valor 6 porque el valor más alto de ese campo, antes de eliminar todos los registros era "5".

-- Ahora vaciemos la tabla:

 truncate table libros;
-- Veamos qué sucede si ingresamos otro registro sin valor para el código:

 insert into libros (titulo,autor,editorial)
  values('Antología poetica', 'Borges', 'Emece');
-- Vemos que la secuencia de "codigo" continúa.

-- Ejecutamos entonces:

select * from libros;