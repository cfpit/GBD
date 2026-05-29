-- CREATE TRIGGER nombre_disp momento_disp evento_disp
    -- ON nombre_tabla FOR EACH ROW sentencia_disp


-- Un disparador es un objeto con nombre en una base de datos que se asocia con una tabla, 
-- y se activa cuando ocurre un evento en particular para esa tabla.


-- momento_disp es el momento en que el disparador entra en acción. Puede ser BEFORE (antes)
-- o AFTER (despues), para indicar que el disparador se ejecute antes o después que la 
-- sentencia que lo activa.

-- evento_disp indica la clase de sentencia que activa al disparador. Puede ser INSERT, 
-- UPDATE, o DELETE. Por ejemplo, un disparador BEFORE para sentencias INSERT podría 
-- utilizarse para validar los valores a insertar.

-- No puede haber dos disparadores en una misma tabla que correspondan al mismo momento y 
-- sentencia. Por ejemplo, no se pueden tener dos disparadores BEFORE UPDATE. Pero sí es 
-- posible tener los disparadores BEFORE UPDATE y BEFORE INSERT o BEFORE UPDATE y AFTER 
-- UPDATE.

-- sentencia_disp es la sentencia que se ejecuta cuando se activa el disparador. Si se 
-- desean ejecutar múltiples sentencias, deben colocarse entre BEGIN ... END, el 
-- constructor de sentencias compuestas.

-- Las columnas de la tabla asociada con el disparador pueden referenciarse empleando los 
-- alias OLD y NEW. 

-- OLD.nombre_col hace referencia a una columna de una fila existente, antes de ser 
-- actualizada o borrada.(before update o before delete).
 
-- NEW.nombre_col hace referencia a una columna en una nueva fila a punto de ser insertada
-- (before insert), o en una fila existente luego de que fue actualizada (after update).

-- EJEMPLO

-- Administrar los datos de dos tablas llamadas: "libros" y "ventas". Cada vez que se 
-- produzca la venta de libros reducir el campo stock de la tabla "libros" mediante un 
-- trigger definido en la tabla ventas.

create database disparadores;

use disparadores;
-- Borramos las tablas "libros" y "ventas" si existen:

drop table if exists ventas;
drop table if exists libros;

-- Creamos las dos tablas con las siguientes estructuras:

 create table libros(
  codigo int auto_increment,
  titulo varchar(50),
  autor varchar(50),
  editorial varchar(30),
  precio float, 
  stock int,
  primary key (codigo)
 );

 create table ventas(
  numero int auto_increment,
  codigolibro int,
  precio float,
  cantidad int,
  primary key (numero)
 );

-- Insertamos algunas filas de prueba en la tabla "libros":

 insert into libros(titulo, autor, editorial, precio, stock)
  values('Uno','Richard Bach','Planeta',15,100);   
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Ilusiones','Richard Bach','Planeta',18,50);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('El aleph','Borges','Emece',25,200);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Aprenda PHP','Mario Molina','Emece',45,200);
  
select * from libros;
select * from ventas;

-- Si existe el trigger 'before_ventas_insert' procedemos a eliminarlo:

 drop trigger if exists before_ventas_insert;  

-- Creamos el disparador 'before_ventas_insert' con la siguiente lógica:

 delimiter //
 create trigger before_ventas_insert
   before insert
   on ventas
   for each row
 begin
   update libros set stock=libros.stock-new.cantidad
     where new.codigolibro=libros.codigo; 
 end //
 delimiter ;

-- El disparador 'before_ventas_insert' se asocia a la tabla 'ventas' y se dispara cada 
-- vez que ejecutamos el comando SQL insert:

 -- create trigger before_ventas_insert
 -- before insert
 -- on ventas

-- La lógica que implementamos dentro del trigger consiste en reducir el stock actual del 
-- libro que se vende:

   -- update libros set stock=libros.stock-new.cantidad
   --  where new.codigolibro=libros.codigo; 

-- Procedemos a insertar una fila en la tabla 'ventas':

 insert into ventas(codigolibro, precio, cantidad)
  values(1, 15, 7); 

-- Luego si controlamos la cantidad de libros en stock veremos que se ha reducido en 7
select * from libros;
select * from ventas;