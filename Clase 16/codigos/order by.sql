-- order by

-- Podemos ordenar el resultado de un "select" para que los registros se muestren ordenados por algún campo, para ello usamos la cláusula "order by".

-- Por ejemplo, recuperamos los registros de la tabla "libros" ordenados por el título:

select codigo,titulo,autor,editorial,precio from libros order by titulo;
-- Aparecen los registros ordenados alfabéticamente por el campo especificado.

-- También podemos colocar el número de orden del campo por el que queremos que se ordene en lugar de su nombre. Por ejemplo, queremos el resultado del "select" ordenado por "precio":

select codigo,titulo,autor,editorial,precio from libros order by 5;
-- Por defecto, si no aclaramos en la sentencia, los ordena de manera ascendente (de menor a mayor). Podemos ordenarlos de mayor a menor, para ello agregamos la palabra clave "desc":

select codigo,titulo,autor,editorial,precio from libros order by editorial desc;
-- También podemos ordenar por varios campos, por ejemplo, por "titulo" y "editorial":

select codigo,titulo,autor,editorial,precio from libros order by titulo, editorial;
-- Incluso, podemos ordenar en distintos sentidos, por ejemplo, por "titulo" en sentido ascendente y "editorial" en sentido descendente:

select codigo,titulo,autor,editorial,precio 
  from libros order by titulo asc, editorial desc;
-- Debe aclararse al lado de cada campo, pues estas palabras claves afectan al campo inmediatamente anterior.

-- Es posible ordenar por un campo que no se lista en la selección:

select titulo, autor
  from libros
  order by precio;
-- Se permite ordenar por valores calculados o expresiones:

select titulo, autor, editorial, precio+(precio*0.1) as preciocondescuento
  from libros
  order by preciocondescuento;
-- Problema resuelto
-- Trabajaremos con la tabla llamada "medicamentos" que almacena la información de los productos que vende una farmacia.

drop table if exists medicamentos;
-- Creamos la tabla con la siguiente estructura:

create table medicamentos(
	codigo integer primary key,
	nombre text,
	laboratorio text,
	precio real,
	cantidad integer
);
-- Ingrese los siguientes registros:

insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Sertal', 'Roche', 5.2, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Buscapina', 'Roche', 4.10, 200);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal 500', 'Bayer', 15.60, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Paracetamol 500', 'Bago', 1.90, 200);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Bayaspirina', 'Bayer', 2.10, 150); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal jarabe', 'Bayer', 5.10, 250); 
-- Ordene los registros por precio, de mayor a menor:

select * from medicamentos order by precio desc;  
-- Ordene los medicamentos por número del campo "cantidad":

select codigo, nombre, laboratorio, precio, cantidad from medicamentos order by 5;
-- Ordene los registros por "laboratorio" (descendente) y cantidad (ascendente).

select codigo, nombre, laboratorio, precio, cantidad 
  from medicamentos order by laboratorio desc, cantidad asc;