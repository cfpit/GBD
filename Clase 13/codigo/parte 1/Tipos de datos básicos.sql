-- Vamos a crear una tabla llamada "libros".
-- Para almacenar información de los libros de una librería necesitamos los siguientes campos:

 -- -titulo, cadena de caracteres de 20 de longitud,
 -- -autor, cadena de caracteres de 15 de longitud,
 -- -editorial, caracteres de 10 de longitud,
 -- -precio, valor numérico con decimales y
 -- -cantidad, valor numérico entero.
-- Al crear la tabla, entonces, elegimos el tipo de dato más adecuado para cada campo:

 create table libros(
  titulo varchar(20),
  autor varchar(15),
  editorial varchar(10),
  precio float,
  cantidad integer
 );
-- Note que al especificar el tipo de dato de los campos numéricos, no colocamos entre paréntesis la longitud.

-- Vemos la estructura de la tabla:

select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'libros';
-- Aparece la siguiente información:

-- table_name    column_name    udt_name    character_maximum_length
-- libros        cantidad	     int4	
-- libros        precio	     float8	
-- libros        editorial	     varchar    10
-- libros        autor	     varchar    15
-- libros        titulo	     varchar    20
-- Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);
-- Note que al ingresar valores numéricos (float e integer) no se utilizan comillas y para el separador de decimales se usa el caracter punto(.).

-- Veamos los registros cargados:

 select * from libros;
-- Veamos lo que sucede si intentamos ingresar para el campo "titulo" una cadena de más de 20 caracteres:

 
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
-- aparece un mensaje de error y la sentencia no se ejecuta.

-- vamos a cortar la cadena para que PostgreSQL acepte el ingreso del registro:

 
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais','Lewis Carroll','Atlantida',10,200);
-- Veamos los registros cargados:

 select * from libros;