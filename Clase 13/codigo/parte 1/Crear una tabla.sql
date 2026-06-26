-- Vamos a crear una tabla llamada "usuarios".

-- Recordar que debemos finalizar cada comando con un punto y coma.

-- La tabla "usuarios" contendrá los siguientes campos:

-- - nombre: varchar de 30 caracteres de longitud,
-- - clave: varchar de 10 caracteres de longitud.
-- Eliminamos la tabla, si existe:

 drop table if exists  usuarios;
-- Ahora si creamos la tabla:

create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );
-- aparece un mensaje indicando que el comando se completó exitosamente.

-- Veamos la estructura de la tabla "usuarios":

select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'usuarios';
aparece el nombre de la tabla, los campos y sus tipos de datos, su longitud:

-- table_name      column_name     udt_name        character_maximum_length
-- usuarios        clave	        varchar	        10
-- usuarios        nombre          varchar         30
-- Intentemos crear una tabla con el mismo nombre, mostrará un mensaje indicando que ya hay un objeto llamado 'usuarios' en la base de datos y la sentencia no se ejecutará (ERROR: relation "usuarios" already exists):

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );
-- Eliminemos la tabla:

 drop table usuarios;
-- Verifiquemos si se ha eliminado:

select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'usuarios';