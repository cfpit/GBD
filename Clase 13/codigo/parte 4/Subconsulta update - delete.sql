-- Subconsulta update - delete

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
  precio decimal(5,2),
  primary key(codigo)
 );
-- Ingresamos algunos registros:

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Paidos');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('Uno','Richard Bach',1,15);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Ilusiones','Richard Bach',2,20);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('El aleph','Borges',3,10);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Aprenda PHP','Mario Molina',4,40);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Poemas','Juan Perez',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Cuentos','Juan Perez',3,25);
 insert into libros(titulo,autor,codigoeditorial,precio)
   values('Java en 10 minutos','Marcelo Perez',2,30);
-- Actualizamos el precio de todos los libros de editorial "Emece" incrementándolos en un 10%:

 update libros set precio=precio+(precio*0.1)
  where codigoeditorial=
   (select codigo
     from editoriales
     where nombre='Emece');
-- Eliminamos todos los libros de las editoriales que tiene publicados libros de "Juan Perez":

 delete from libros
  where codigoeditorial in
   (select e.codigo
    from editoriales as e
    join libros
    on codigoeditorial=e.codigo
    where autor='Juan Perez');