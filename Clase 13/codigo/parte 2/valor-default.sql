-- Trabajamos con la tabla "libros" de una librería.
-- Creamos la tabla definiendo un valor por defecto para el campo "autor" y otro para el campo "cantidad":

 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint default 0,
 primary key(codigo)
 );
-- Ingresamos un registro omitiendo los valores para el campo "autor" y "cantidad":

 insert into libros (titulo,editorial,precio)
  values('Java en 10 minutos','Paidos',50.40);
-- PostgreSQL ingresará el registro con el siguiente valor de la secuencia en "codigo", con el título, editorial y precio ingresados, en "autor" colocará "Desconocido" y en cantidad "0":

 select * from libros;
-- Si ingresamos un registro sin valor para el campo "precio", que admite valores nulos, se ingresará "null" en ese campo:

 insert into libros (titulo,editorial)
  values('Aprenda PHP','Siglo XXI');
 select * from libros;
-- Visualicemos la estructura de la tabla:

 select *
  from information_schema.columns 
  where table_name = 'libros';
-- La columna "column_default", muestra el valor por defecto de cada campo.

-- Podemos emplear "default" para dar el valor por defecto a algunos campos:

 insert into libros (titulo,autor,precio,cantidad)
  values ('El gato con botas',default,default,100);
 select * from libros;
-- Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:

 insert into libros default values;
 select * from libros;
-- La sentencia anterior almacenará un registro con los valores predeterminados para cada uno de sus campos.

-- Que un campo tenga valor por defecto no significa que no admita valores nulos, puede o no admitirlos. Podemos ingresar el valor "null" en el campo "cantidad":

 insert into libros (titulo,autor,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll',null);