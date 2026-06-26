-- check

-- Trabajamos con la tabla "libros" de una librería.
-- La creamos e ingresamos algunos registros:

 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2),
  primary key(codigo)
 );

 insert into libros (titulo,autor,editorial,preciomin,preciomay)
   values ('Uno','Bach','Planeta',22,20);
 insert into libros (titulo,autor,editorial,preciomin,preciomay)
   values ('El quijote','Cervantes','Emece',15,13);
 insert into libros (titulo,autor,editorial,preciomin,preciomay)
    values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);
 insert into libros (titulo,autor,editorial,preciomin,preciomay)
    values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);
-- Agregamos una restricción "check" para asegurar que los valores de los campos correspondientes a precios no puedan ser negativos:

 alter table libros
 add constraint CK_libros_precios_positivo
 check (preciomin>=0 and preciomay>=0);
-- Si intentamos ingresar un valor inválido para algún campo correspondiente al precio, que vaya en contra de la restricción, por ejemplo el valor "-15" aparecerá un mensaje de error indicando que hay conflicto con la restricción creada anteriormente y la inserción no se realiza. Igualmente si intentamos actualizar un precio, que vaya en contra de la restricción.

-- Si intentamos agregar una restricción que no permita que el precio mayorista supere el precio minorista, aparece un mensaje de error y la sentencia no se ejecuta, porque hay registros que no cumplen con la restricción que intentamos establecer. Podemos modificar los datos que no cumplen la condición de la restricción o eliminar los registros:

 update libros set preciomay=48
  where titulo='Aprenda PHP';

 delete from libros where titulo='Java en 10 minutos'; 
-- Ahora PostgreSQL si nos permite agregar la restricción "check" que impida que se ingresen valores para "preciomay" superiores a "preciomin":

 alter table libros
 add constraint CK_libros_preciominmay
 check (preciomay<=preciomin);
-- Veamos las restricciones de la tabla (constraint_type y constraint_name):

 select *
  from information_schema.table_constraints 
  where table_name = 'libros';
-- Ingresamos un registro con valores por defecto:

 insert into libros default values;
-- Note que los campos correspondientes a precios admiten valores 0 y 999.99 (por el tipo de dato y la restricción), además del valor "null".