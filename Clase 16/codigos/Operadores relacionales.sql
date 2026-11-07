-- Operadores relacionales

-- Borramos primero la tabla libros si existe:

drop table if exists libros;
-- Creamos ahora la tabla libros con la siguiente estructura:

create table libros(
        titulo text,
        autor text,
        editorial text,
        precio real
 );
-- Agregamos registros a la tabla

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

 select titulo, precio
  from libros
  where precio>20;
-- Note que el valor con el cual comparamos el campo "precio", como es numérico (real), no se coloca entre comillas. Los libros cuyo precio es menor o igual a 20 pesos no aparece en la selección.

-- Recuperamos aquellos libros cuyo precio es menor o igual a 30:

 select * from libros
  where precio<=30;
  
  -- Problema propuesto
-- Borrar la tabla articulos si existe.

-- Crear la tabla articulos con la siguiente estructura:

create table articulos(
  codigo integer,
  nombre text,
  descripcion text,
  precio real,
  cantidad integer
 );
-- Ingrese estos registros en la tabla:

 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);
-- Seleccione los datos de las impresoras (2 registros)

-- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)

-- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)

-- Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)

drop table if exists articulos;
 
 create table articulos(
  codigo integer,
  nombre text,
  descripcion text,
  precio real,
  cantidad integer
 );
 
 
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

 select *
  from articulos
  where nombre='impresora';

 select *
  from articulos
  where precio>=400;

 select codigo,nombre
  from articulos
  where cantidad<30;

 select nombre, descripcion
  from articulos
  where precio<>100;