-- Trabajamos con la tabla "usuarios" que consta de 2 campos: nombre de usuario y clave

Creamos la tabla:

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );
-- Vemos la estructura de la tabla:

 select table_name,column_name,udt_name,character_maximum_length 
  from information_schema.columns 
  where table_name = 'usuarios';
-- Ingresamos algunos registros:

 insert into usuarios (nombre, clave)
  values ('Marcelo','Boca');
 insert into usuarios (nombre, clave)
  values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave)
  values ('Susana','River');
 insert into usuarios (nombre, clave)
  values ('Luis','River');
-- Realizamos una consulta especificando una condición, queremos ver el usuario cuyo nombre es "Leonardo":

 select * from usuarios
  where nombre='Leonardo';
-- Queremos ver el nombre de los usuarios cuya clave es "River":

 select nombre from usuarios
  where clave='River';
-- Realizamos un "select" de los nombres de los usuarios cuya clave es "Santi":

 select nombre from usuarios
  where clave='Santi';
-- No se muestra ningún registro ya que ninguno cumple la condición.