-- Clave primaria

-- Una clave primaria es un campo (o varios) que identifica un solo registro (fila) en una tabla.
Para un valor del campo clave existe solamente un registro.

-- Veamos un ejemplo, si tenemos una tabla con datos de personas, el número de documento puede establecerse como clave primaria, es un valor que no se repite; puede haber personas con igual apellido y nombre, incluso el mismo domicilio (padre e hijo por ejemplo), pero su documento será siempre distinto.

-- Si tenemos la tabla "usuarios", el nombre de cada usuario puede establecerse como clave primaria, es un valor que no se repite; puede haber usuarios con igual clave, pero su nombre de usuario será siempre diferente.

-- Podemos establecer que un campo sea clave primaria al momento de crear la tabla o luego que ha sido creada. Vamos a aprender a establecerla al crear la tabla. Hay 2 maneras de hacerlo, por ahora veremos la sintaxis más sencilla.

-- Tenemos nuestra tabla "usuarios" definida con 2 campos ("nombre" y "clave").
-- La sintaxis básica y general es la siguiente:

 create table NOMBRETABLA(
  CAMPO TIPO not null,
  ...
  primary key (NOMBRECAMPO)
 );
-- En el siguiente ejemplo definimos una clave primaria, para nuestra tabla "usuarios" para asegurarnos que cada usuario tendrá un nombre diferente y único:

create table usuarios(
        nombre text not null,
        clave text,
        primary key(nombre)
);
-- Lo que hacemos agregar luego de la definición de cada campo, "primary key" y entre paréntesis, el nombre del campo que será clave primaria.

-- Una tabla sólo puede tener una clave primaria. Cualquier campo (de cualquier tipo) puede ser clave primaria, debe cumplir como requisito, que sus valores no se repitan. Al definir un campo como clave primaria es importante en SQLite definirlo con "not null".

-- Luego de haber establecido un campo como clave primaria, al ingresar los registros, SQLite controla que los valores para el campo establecido como clave primaria no estén repetidos en la tabla; si estuviesen repetidos, muestra un mensaje y la inserción no se realiza. Es decir, si en nuestra tabla "usuarios" ya existe un usuario con nombre "juanperez" e intentamos ingresar un nuevo usuario con nombre "juanperez", aparece un mensaje y la instrucción "insert" no se ejecuta.

-- Igualmente, si realizamos una actualización, SQLite controla que los valores para el campo establecido como clave primaria no estén repetidos en la tabla, si lo estuviese, aparece un mensaje indicando que se viola la clave primaria y la actualización no se realiza.

-- Acotaciones.
-- De acuerdo con el estándar SQL, PRIMARY KEY siempre debe implicar NOT NULL. Desafortunadamente, debido a un error en algunas versiones anteriores, este no es el caso en SQLite.
-- SQLite permite valores NULL en una columna PRIMARY KEY si no la definimos 'not null'. SQLite podría arreglarse para cumplir con el estándar, pero hacerlo podría romper las aplicaciones heredadas. Por lo tanto, se ha decidido simplemente documentar el hecho de que SQLite permite valores NULL en la mayoría de las columnas PRIMARY KEY.

-- Problema resuelto
-- Trabajamos con la tabla "usuarios". La borramos si ya existe:

drop table if exists usuarios;
-- Creamos la tabla definiendo el campo "nombre" como clave primaria:

create table usuarios(
	nombre text not null,
	clave text,
        primary key(nombre)
);
-- Al campo "nombre" lo definimos "not null" para no permitir ingresar dicho valor.

-- Ingresamos algunos registros:

insert into usuarios (nombre, clave)
  values ('juanperez','Boca');
insert into usuarios (nombre, clave)
  values ('raulgarcia','River');
-- Recordemos que cuando un campo es clave primaria, sus valores no se repiten. Intentamos ingresar un valor de clave primaria existente:

insert into usuarios (nombre, clave)
  values ('juanperez','payaso');  
  
  -- Como definimos el campo nombre con el valor "not null" luego no podemos ingresar dicho valor. Intentamos ingresar el valor "null" en el campo clave primaria:

insert into usuarios (nombre, clave)
  values (null,'payaso');
-- aparece un mensaje de error y la sentencia no se ejecuta.

-- Si realizamos alguna actualización, SQLite controla que los valores para el campo establecido como clave primaria no estén repetidos en la tabla. Intentemos actualizar el nombre de un usuario colocando un nombre existente:

update usuarios set nombre='juanperez'
  where nombre='raulgarcia';
-- Problema propuesto
-- Trabaje con la tabla "libros" de una librería.

-- Borrar la tabla "libros" si existe

drop table if exists libros;
-- Crear la tabla "libros" con la siguiente estructura:

create table libros(
	codigo Integer not null,
	titulo text not null,
	autor text not null,
	editorial text null,
        primary key(codigo)
);
-- Ingrese los siguientes registros:

insert into libros (codigo,titulo,autor,editorial)
  values (1,'El aleph','Borges','Emece');
insert into libros (codigo,titulo,autor,editorial)
  values (2,'Martin Fierro','Jose Hernandez','Planeta');
insert into libros (codigo,titulo,autor,editorial)
  values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');
-- Ingrese un registro con código repetido.

-- Intente ingresar el valor null en el campo "codigo"

drop table if exists libros;

create table libros(
	codigo Integer not null,
	titulo text not null,
	autor text not null,
	editorial text null,
    primary key(codigo)
);

insert into libros (codigo,titulo,autor,editorial)
  values (1,'El aleph','Borges','Emece');
insert into libros (codigo,titulo,autor,editorial)
  values (2,'Martin Fierro','Jose Hernandez','Planeta');
insert into libros (codigo,titulo,autor,editorial)
  values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');
  
insert into libros (codigo,titulo,autor,editorial)
  values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');  
   
update libros set codigo=1
  where titulo='Martin Fierro';
  
select * from libros;  