-- Union

-- Una academia de enseñanza almacena los datos de los alumnos en una tabla llamada "alumnos" y los datos de los profesores en otra denominada "profesores".
-- Creamos las tablas:

 create table profesores(
  documento varchar(8) not null,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table alumnos(
  documento varchar(8) not null,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(documento)
 );
-- Ingresamos algunos registros:

 insert into alumnos values('30000000','Juan Perez','Colon 123');
 insert into alumnos values('30111111','Marta Morales','Caseros 222');
 insert into alumnos values('30222222','Laura Torres','San Martin 987');
 insert into alumnos values('30333333','Mariano Juarez','Avellaneda 34');
 insert into alumnos values('23333333','Federico Lopez','Colon 987');
 insert into profesores values('22222222','Susana Molina','Sucre 345');
 insert into profesores values('23333333','Federico Lopez','Colon 987');
-- La academia necesita el nombre y domicilio de profesores y alumnos para enviarles una tarjeta de invitación.
-- Empleamos el operador "union" para obtener dicha información de ambas tablas:

 select nombre, domicilio from alumnos
  union
  select nombre, domicilio from profesores;
-- Note que existe un profesor que también está presente en la tabla "alumnos"; dicho registro aparece una sola vez en el resultado de "union". Si queremos que las filas duplicadas aparezcan, debemos emplear "all":

 select nombre, domicilio from alumnos
  union all
  select nombre, domicilio from profesores;
-- Ordenamos por domicilio:

 select nombre, domicilio from alumnos
  union
   select nombre, domicilio from profesores
  order by domicilio;
-- Podemos agregar una columna extra a la consulta con el encabezado "condicion" en la que aparezca el literal "profesor" o "alumno" según si la persona es uno u otro:

 select nombre, domicilio, 'alumno' as condicion from alumnos
  union
   select nombre, domicilio,'profesor' from profesores
  order by condicion;