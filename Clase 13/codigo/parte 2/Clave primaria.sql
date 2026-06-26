-- Trabajamos con la tabla "usuarios".
-- Creamos la tabla definiendo el campo "nombre" como clave primaria:

 create table usuarios(
  nombre varchar(20),
  clave varchar(10),
  primary key(nombre)
 );
-- Al campo "nombre" no lo definimos "not null", pero al establecerse como clave primaria, PostgreSQL lo convierte en "not null", veamos que en la columna "is_nullable" aparece "NO":

 select table_name,column_name,udt_name,character_maximum_length,is_nullable 
  from information_schema.columns 
  where table_name = 'usuarios';
-- Ingresamos algunos registros:

 insert into usuarios (nombre, clave)
  values ('juanperez','Boca');
 insert into usuarios (nombre, clave)
  values ('raulgarcia','River');
-- Recordemos que cuando un campo es clave primaria, sus valores no se repiten. Intentamos ingresar un valor de clave primaria existente:

  insert into usuarios (nombre, clave)
  values ('juanperez','payaso');
-- aparece un mensaje de error y la sentencia no se ejecuta.

-- Cuando un campo es clave primaria, sus valores no pueden ser nulos. Intentamos ingresar el valor "null" en el campo clave primaria:

  insert into usuarios (nombre, clave)
  values (null,'payaso');
-- aparece un mensaje de error y la sentencia no se ejecuta.

-- Si realizamos alguna actualización, PostgreSQL controla que los valores para el campo establecido como clave primaria no estén repetidos en la tabla. Intentemos actualizar el nombre de un usuario colocando un nombre existente:

  update usuarios set nombre='juanperez'
  where nombre='raulgarcia';
-- aparece un mensaje indicando que se viola la clave primaria y la actualización no se realiza.