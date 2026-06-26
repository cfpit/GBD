-- Función SQL con retorno de dato compuesto

-- Creamos la tabla libros:

 create table libros(
  codigo serial,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
 );
-- Insertamos cuatro registros:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
 insert into libros (titulo,autor,editorial,precio)
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);
-- Implementamos una función que reciba un código de libro y retorne toda el registro que coincida con dicho código:

 create or replace function retornarlibro(int) returns libros 
 as
 'select * from libros where codigo=$1 ;'
 language sql;
-- Llamamos a la función:

 select retornarlibro(4);