-- Clave primaria compuesta

-- Las claves primarias pueden ser simples, formadas por un solo campo o compuestas, más de un campo.

-- Recordemos que una clave primaria identifica 1 solo registro en una tabla. Para un valor del campo clave existe solamente 1 registro. Los valores no se repiten ni pueden ser nulos.

-- Problema resuelto
-- Un club dicta clases de distintos deportes. En una tabla llamada "inscriptos" almacena la información necesaria.

drop table if exists inscriptos;
-- La información a almacenar es la siguiente:

 create table inscriptos(
  documento text, 
  deporte text,  
  año integer,  
  nombre text,
  matricula text,
  primary key(documento,deporte,año)
 );
-- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en varios deportes en distintos años. Un socio no puede inscribirse en el mismo deporte el mismo año. Varios socios se inscriben en un mismo deporte en distintos años.

-- Inscriba a varios alumnos en el mismo deporte en el mismo año:

 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('12222222','Juan Perez','tenis',2005,'s');
 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('23333333','Marta Garcia','tenis',2005,'s');
 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('34444444','Luis Perez','tenis',2005,'n');
-- Inscriba a un mismo alumno en varios deportes en el mismo año:

 insert into inscriptos( documento, deporte, año, nombre, matricula)
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos( documento, deporte, año, nombre, matricula)
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos( documento, deporte, año, nombre, matricula)
  values ('12222222','Juan Perez','basquet','2005','n');
-- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos años:

 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('12222222','Juan Perez','tenis',2006,'s');
 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('12222222','Juan Perez','tenis',2007,'s'); 
-- Intente inscribir a un socio alumno en un deporte en el cual ya esté inscripto.

 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('12222222','Juan Perez','tenis',2005,'s');
-- Se genera un error:

UNIQUE constraint failed: inscriptos.documento, inscriptos.deporte, inscriptos.año:  

 insert into inscriptos( documento, nombre, deporte, año, matricula)
  values ('12222222','Juan Perez','tenis',2005,'s');
-- Intente actualizar un registro para que la clave primaria se repita:

 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  año=2005; 
-- También se genera un error:

-- UNIQUE constraint failed: inscriptos.documento, inscriptos.deporte, inscriptos.año:  

 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  año=2005;