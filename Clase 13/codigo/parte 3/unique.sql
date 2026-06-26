-- unique

-- Trabajamos con la tabla "alumnos".
-- Creamos la tabla:

 create table alumnos(
  legajo char(4) not null,
  apellido varchar(20),
  nombre varchar(20),
  documento char(8)
 );
-- Agregamos una restricción "primary" para el campo "legajo":

 alter table alumnos
 add constraint PK_alumnos_legajo
 primary key(legajo);
-- Agregamos una restricción "unique" para el campo "documento":

 alter table alumnos
 add constraint UQ_alumnos_documento
 unique (documento);
-- Ingresamos algunos registros:

 insert into alumnos values('A111','Lopez','Ana','22222222');
 insert into alumnos values('A123','Garcia','Maria','23333333');
-- Si intentamos ingresar un legajo o documento repetido, aparece un mensaje de error.

-- Veamos las restricciones:

 select *
  from information_schema.table_constraints 
  where table_name = 'alumnos';
-- Aparecen las dos restricciones creadas anteriormente.