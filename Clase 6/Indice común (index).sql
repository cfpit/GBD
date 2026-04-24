drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo),
  index i_editorial (editorial)
 );

show index from libros;
/*
	Analicemos esta información:

Table	Non_unique	Key_name	Column_name	Null
______________________________________________________________
libros		0	PRIMARY		codigo		
libros		1	i_editorial	editorial	YES
Vemos que la tabla tiene 2 índices, uno de ellos corresponde a la clave primaria (codigo) que se 
creó automáticamente al definir el campo "código" como clave primaria; el otro es el que creamos 
con "index" llamado "i_editorial".

La columna "Table" indica de qué tabla estamos visualizando los índices.

La columna "Non_unique" indica si los valores son "no únicos"; para el índice creado por la clave 
primaria indica "false" (0), significa que SON únicos, no hay valores repetidos para ese campo 
(recuerde lo aprendido sobre clave primaria); para el índice "i_editorial" indica "true" (1), 
es decir, NO son únicos, hay valores repetidos.

La columna "Key_name" muestra el nombre del índice; para el campo correspondiente a la clave primaria 
tomó el nombre "PRIMARY"; el otro nombre es el que le dimos nosotros al definirlo (i_editorial).

La columna "Column_name" muestra el nombre del campo por el que está ordenado el índice, "codigo" 
para el índice "PRIMARY" y "editorial" para nuestro índice.

La columna "Null" indica si permite valores nulos; el índice "PRIMARY" no los permite, el índice 
"i_editorial" si los permite (aparece YES).

*/


-- Indices de varios campos:
drop table if exists libros;

 create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo),
  index i_tituloeditorial (titulo,editorial)
 );
 
 
show index from libros;

/*
	Table	Non_unique	Key_name	Seq_in_index	Column_name	Null
____________________________________________________________________________
libros		0	PRIMARY			1	codigo
libros		1	i_tituloeditorial	1	titulo		
libros		1	i_tituloeditorial	2	editorial	YES
Aparecen 3 filas.

La tabla tiene 2 índices (2 filas corresponden al mismo índice): uno de ellos corresponde a la 
clave primaria (codigo) que se creó automáticamente al definir el campo "código" como clave 
primaria; el otro es el que creamos con "index" llamado "i_tituloeditorial".

El índice "PRIMARY", no tiene valores repetidos (No es "No único"); el índice "i_tituloeditorial" 
es "No único", o sea, hay valores repetidos.

La columna "Seq_in_index" y "Column_name" muestran la secuencia de la indexación para cada campo. 
En el índice "i_tituloeditorial" y el campo "titulo" muestra 1 y para el campo "editorial" muestra 
2, esto significa que está indexado en ese orden.

La columna "Null" indica si el campo permite valores nulos; el índice "PRIMARY" no los permite; 
el campo "titulo" del índice "i_tituloeditorial" no los permite (recuerde que lo definimos 
"not null"), el campo "editorial" si los permite (YES).

*/




-- Ejemplo1

-- Creamos la tabla  "medicamentos" de una farmacia.

-- 1- Elimine la tabla, si existe.
drop table if exists medicamentos;


-- 2- Cree la tabla e indéxela por el campo "laboratorio":
 create table medicamentos(
  codigo int unsigned auto_increment,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio decimal (6,2) unsigned,
  cantidad int unsigned,
  primary key(codigo),
  index i_laboratorio (laboratorio)
 );

-- 3- Visualice los índices de la tabla "medicamentos" y analice la información:
 show index from medicamentos;
 
 
 -- Ejemplo3
-- Creamos la tabla "clientes" de una empresa.

-- 1- Elimine la tabla "clientes", si existe.
drop table if exists clientes;


-- 2- Créela y defina un índice por múltiples campos, por ciudad y provincia:
 create table clientes (
  documento char (8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key (codigo), 
  index i_ciudadprovincia (ciudad,provincia)
 );

-- 3- Muestre los índices:
 show index from clientes;

-- 4- Analice la información:
/*
Aparecen 3 filas, 3 índices. Uno de ellos corresponde a la clave primaria (PRIMARY), es único (los 
valores no se repiten) y no acepta valores nulos. 

Otro índice, llamado "i_ciudadprovincia", es No 
único, es decir, acepta valores repetidos, consta de 2 campos, el orden es "ciudad" y "provincia" y 
acepta valores nulos (ambos campos).*/


-- Creamos la tabla "agenda" que registra la información referente a sus amigos.

-- 1- Elimine la tabla si existe.
drop table if exists agenda;


-- 2- Cree la tabla con la siguiente estructura:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20) not null,
  domicilio varchar(30),
  telefono varchar(11),
  mail varchar(30),
  index i_apellido (apellido)
 );

-- 3- Ingrese los siguientes registros:
 insert into agenda values('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
 insert into agenda values('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
 insert into agenda values('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
 insert into agenda values('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
 insert into agenda values('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
 insert into agenda values('Ferreyra','Patricia','Colon 1534','4585858',null);
 insert into agenda values('Perez','Susana','San Martin 333',null,null);
 insert into agenda values('Perez','Luis','Urquiza 
444','0354545256','perezluisalberto@hotmail.com');
 insert into agenda values('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

-- 4- Vea la información de los índices:
 show index from agenda;

-- 5- Analice la información.










