-- operadores aritmeticos y de concatenacion

-- Es posible obtener salidas en las cuales una columna sea el resultado de un cálculo y no un campo de una tabla.

-- Los operadores aritméticos permiten realizar cálculos con valores numéricos.
-- Son: multiplicación (*), división (/) y módulo (%) (el resto de dividir números), suma (+) y resta (-)

-- Si por ejemplo tenemos la tabla libros con los siguientes datos:

drop table if exists libros;

create table libros(
	codigo integer primary key,
	titulo text,
	autor text not null, 
	editorial text,
	precio real,
	cantidad integer
);

insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Planeta',15,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Antologia poetica','Borges','Planeta',40,150);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Aprenda PHP','Mario Molina','Emece',18.20,200);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Cervantes y el quijote','Borges','Paidos',36.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00,500);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00,300);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null,50);
  
 select titulo, precio,cantidad,precio*cantidad
  from libros;    
-- Si queremos saber el monto total en dinero de un título podemos multiplicar el precio por la cantidad por cada título, SQLite puede realizar el cálculo y mostrarlo en una columna extra en la salida:

select titulo, precio,cantidad,precio*cantidad
  from libros;  
  
  -- Si queremos saber el precio de cada libro con un 10% de descuento podemos incluir en la sentencia los siguientes cálculos:

select titulo, precio,precio*0.1,precio-(precio*0.1)
  from libros;  
-- También podemos actualizar los datos empleando operadores aritméticos, por ejemplo reducir el 10% del precio de todos los libros:

update libros set precio=precio-(precio*0.1);
-- El operador de concatenación se obtiene con los caracteres ||.

-- Para concatenar el título, el autor y la editorial de cada libro usamos el operador de concatenación ("||"):

 select titulo||'-'||autor||'-'||editorial
  from libros;
-- Note que concatenamos además unos guiones para separar los campos.

-- Problema propuesto
-- Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese nombre.

-- Borrar la tabla "articulos" si existe

-- Crear la tabla artículos con la siguiente estructura:

create table articulos (
	codigo integer primery key,
	nombre text,
	descripcion text,
	precio real,
	cantidad integer
);
-- Ingrese los siguientes registros:

 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora', 'MULTIFUNCION HP 2135', 1800, 10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora', 'MULTIFUNCION EPSON EXPRESSION XP241 WI-FI', 2500, 30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor', 'Samsung 23', 1200, 10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado', 'ingles Biswal', 100, 50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado', 'español Biswal', 90, 50);
-- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los precios empleando operadores aritméticos.

-- Vea el resultado

-- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos separados por coma.

-- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")

-- Vea nuevamente como quedó la tabla.

drop table if exists articulos;

 create table articulos (
	codigo integer primery key,
	nombre text,
	descripcion text,
	precio real,
	cantidad integer
 );

 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora', 'MULTIFUNCION HP 2135', 1800, 10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora', 'MULTIFUNCION EPSON EXPRESSION XP241 WI-FI', 2500, 30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor', 'Samsung 23', 1200, 10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado', 'ingles Biswal', 100, 50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado', 'español Biswal', 90, 50);
  
 select * from articulos;

 update articulos set precio=precio+(precio*0.15);

 select * from articulos; 
 
 select nombre||','||descripcion
  from articulos; 
  
 update articulos set cantidad=cantidad-5
  where nombre='teclado';  
  
 select * from articulos;   