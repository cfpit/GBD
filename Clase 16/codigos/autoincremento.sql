-- autoincremento

-- El gestor de base de datos SQLite administra de una forma muy particular los campos con autoincremento. En SQLite cuando definimos un campo de tipo Integer y dicho campo es primary key luego dicho campo si en un insert no lo cargamos se genera en forma automática con el último valor para dicho campo más 1.

-- Si por ejemplo creamos la tabla libros y definimos su campo codigo como clave primaria:

drop table if exists libros;
 
create table libros(
	codigo integer,
	titulo text,
	autor text,
	editorial text,
	primary key (codigo)
);
-- Seguidamente insertamos dos filas en la tabla sin hacer referencia al campo codigo:

insert into libros (titulo,autor,editorial)
  values('El aleph','Borges','Planeta');
  
insert into libros (titulo,autor,editorial)
  values('Martin Fierro','Jose Hernandez','Paidos'); 
-- Luego podemos comprobar que en el campo codigo se cargó un valor numérico en forma automática:

select codigo, titulo, autor, editorial from libros;

-- Lo importante de hacer notar que el gestor SQLite siempre que creamos una tabla genera un campo extra llamado 'rowid' con un valor integer autoincremental. Luego el campo codigo al ser primary key en realidad es un alias del campo 'rowid'.

-- Probemos de ejecutar el siguiente select:

select rowid, codigo, titulo, autor, editorial from libros;

-- Esto quiere decir que siempre que creamos una tabla se crea este campo autoincremental, si luego definimos un campo de tipo 'integer' primary key, dicho campo coincide con el campo 'rowid' para un manejo más eficiente del espacio de almacenamiento.

-- Luego veremos que hay formas de indicar a SQLite que no cree el campo 'rowid' que en pocas situaciones puede tener sentido.

-- Conclusión
-- La creación de un campo con autoincremento se hace definiendo un campo de tipo 'integer' que sea clave primaria.

-- Siempre se crea el campo 'rowid':

drop table if exists usuarios;

create table usuarios (
	 nombre text,
	 clave text
);

insert into usuarios (nombre, clave) values ('MarioPerez','Marito');

select rowid, nombre, clave from usuarios;

-- Problema resuelto
-- Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

drop table if exists medicamentos;
-- Creamos la tabla 'medicamentos':

create table medicamentos(
	codigo integer,
	nombre text,
	laboratorio text,
	precio real,
	cantidad integer,
	primary key (codigo)
);
-- Ingrese los siguientes registros

insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
 values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);
-- Verifique que el campo "código" generó los valores de modo automático:

select codigo,nombre,laboratorio,precio,cantidad from medicamentos;  
-- Ingrese un registro con un valor de clave primaria no repetido salteando la secuencia:

insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(12,'Paracetamol 500','Bago',1.90,200);
-- Ingrese el siguiente registro:

insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Bayaspirina','Bayer',2.10,150); 
-- Note que sigue la secuencia.

-- Cuando la clave primaria es un solo campo la sintaxis más común para definirla es indicarla inmediatamente después del nombre de campo:

create table medicamentos(
	codigo integer primary key,
	nombre text,
	laboratorio text,
	precio real,
	cantidad integer
);
-- Problema propuesto
-- Almacenar información sobre películas en una tabla llamada "peliculas"

-- Borrar la tabla "peliculas" si existe

-- Crear la tabla peliculas con la siguiente estructura:

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);
-- Ingrese los siguientes registros:

insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel Radcliffe',180);
insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel Radcliffe',190);
insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','Roberto Benigni',220);
-- Seleccione todos los registros y verifique la carga automática de los códigos.

-- Muestre solo el campo codigo y rowid.

-- Intente ingresar un registro con valor de clave repetida.

drop table if exists peliculas;

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);

insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel Radcliffe',180);
insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel Radcliffe',190);
insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','Roberto Benigni',220);
  
select codigo,titulo,actor,duracion from peliculas;  

select rowid,codigo from peliculas;

insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Tootsie','D. Hoffman',90);