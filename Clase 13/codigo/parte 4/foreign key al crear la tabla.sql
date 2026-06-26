-- foreign key al crear la tabla

-- Creamos las tablas:

 create table editoriales(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint references editoriales(codigo),
  primary key(codigo)
 );
-- Ingresamos algunos registros en ambas tablas:

 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',1);
 insert into libros(titulo,autor,codigoeditorial) values('Martin Fierro','Jose Hernandez',2);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',2);
-- Ingresamos un libro con un código de editorial inexistente:

 insert into libros(titulo,autor,codigoeditorial) values('Aprenda ASP','Facundo Cabrera',7);
-- Aparece un mensaje de error y no se ejecuta la inserción.

