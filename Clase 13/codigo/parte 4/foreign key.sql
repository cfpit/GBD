-- foreign key

-- Creamos las tablas:

 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  primary key(codigo)
 );
 create table editoriales(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );
-- Ingresamos algunos registros en ambas tablas:

 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',1);
 insert into libros(titulo,autor,codigoeditorial) values('Martin Fierro','Jose Hernandez',2);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',2);
-- Agregamos una restricción "foreign key" a la tabla "libros":

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);
-- Ingresamos un libro con un código de editorial existente:

 insert into libros(titulo,autor,codigoeditorial) values('Aprenda ASP.Net','Jose Paez',2);
-- Ingresamos un libro con un código de editorial inexistente:

 insert into libros(titulo,autor,codigoeditorial) values('JSP basico','Tornado Luis',7);
-- Aparece un mensaje de error y no se ejecuta la inserción.