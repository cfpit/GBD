-- where

-- Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería. Primero la eliminamos si existe en nuestra base de datos:

drop table if exists libros;

-- Creamos la tabla "libros":

create table libros(
        titulo text,
        autor text,
        editorial text,
        precio real,
        cantidad integer
 );

 -- Ingresamos algunos registros:

insert into libros(titulo,autor,editorial,precio,cantidad) values
  ('El aleph','Borges','Emece',100,3);
insert into libros(titulo,autor,editorial,precio,cantidad) values
  ('Martin Fierro','Jose Hernandez','Emece',67,44);
insert into libros(titulo,autor,editorial,precio,cantidad) values
  ('Martin Fierro','Jose Hernandez','Planeta',250.30,2);
insert into libros(titulo,autor,editorial,precio,cantidad) values
  ('Aprenda PHP','Mario Molina','Siglo XXI',120,1);

  -- Seleccione los registros cuyo autor sea "Borges" (1 registro)

 select * from libros where autor='Borges';
-- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)

 select titulo from libros where editorial='Emece';
-- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 registros)

 select editorial from libros where titulo='Martin Fierro';
 
 -- Problema propuesto
-- Crear una tabla llamada "agenda" que permita almacenar el apellido, nombre, domicilio y teléfono.

-- Ingrese los siguientes datos:

 -- Acosta, Ana, Colon 123, 4234567;
 -- Bustamante, Betina, Avellaneda 135, 4458787;
 -- Lopez, Hector, Salta 545, 4887788; 
 -- Lopez, Luis, Urquiza 333, 4545454;
 -- Lopez, Marisa, Urquiza 333, 4545454.
-- Seleccione todos los registros de la tabla

-- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)

-- Seleccione los nombres y domicilios de quienes tengan apellido igual a 'Lopez' (3 registros)

-- Muestre el nombre de quienes tengan el teléfono 4545454 (2 registros)

-- Muestre el nombre de quienes tengan el teléfono 4545454 (2 registros)

drop table if exists agenda;

create table agenda(
	apellido text,
	nombre text,
	domicilio text,
	telefono integer
);

insert into agenda(apellido,nombre,domicilio,telefono)
  values('Acosta', 'Ana', 'Colon 123', 4234567);
insert into agenda(apellido,nombre,domicilio,telefono)
  values('Bustamante', 'Betina', 'Avellaneda 135', 4458787);  
insert into agenda(apellido,nombre,domicilio,telefono)
  values('Lopez', 'Hector', 'Salta 545', 4887788 );  
insert into agenda(apellido,nombre,domicilio,telefono)
  values('Lopez', 'Luis', 'Urquiza 333', 4545454);
insert into agenda(apellido,nombre,domicilio,telefono)
  values('Lopez', 'Marisa', 'Urquiza 333', 4545454);
  
select * from agenda;

select * from agenda
  where nombre='Marisa';

select nombre,domicilio from agenda
  where apellido='Lopez';

select nombre from agenda
  where telefono=4545454;   