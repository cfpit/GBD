-- Subconsultas con in

-- Trabajamos con las tablas "libros" y "editoriales" de una librería.
-- Creamos las tablas:

 create table editoriales(
  codigo serial,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint,
  primary key(codigo)
 );
-- Ingresamos algunos registros:

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial) values('Uno','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Ilusiones','Richard Bach',1);
 insert into libros(titulo,autor,codigoeditorial) values('Aprenda PHP','Mario Molina',4);
 insert into libros(titulo,autor,codigoeditorial) values('El aleph','Borges',2);
 insert into libros(titulo,autor,codigoeditorial) values('Puente al infinito','Richard Bach',2);
-- Queremos conocer el nombre de las editoriales que han publicado libros del autor "Richard Bach":

 select nombre
  from editoriales
  where codigo in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');
-- Probamos la subconsulta separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo:

 select codigoeditorial
  from libros
  where autor='Richard Bach';
-- Podemos reemplazar por un "join" la primera consulta:

 select distinct nombre
  from editoriales as e
  join libros
  on codigoeditorial=e.codigo
  where autor='Richard Bach';
-- También podemos buscar las editoriales que no han publicado libros de "Richard Bach":

 select nombre
  from editoriales
  where codigo not in
   (select codigoeditorial
     from libros
     where autor='Richard Bach');