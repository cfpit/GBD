-- Relaciones y agrupaciones

-- Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".
-- Creamos las tablas:

 create table libros(
  codigo serial,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial smallint not null,
  precio decimal(5,2),
  primary key(codigo)
 );
 create table editoriales(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
);
-- Ingresamos algunos registros en ambas tablas:

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');

 insert into libros(titulo,autor,codigoeditorial,precio) 
   values('El aleph','Borges',1,20);
 insert into libros(titulo,autor,codigoeditorial,precio) 
  values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros(titulo,autor,codigoeditorial,precio)
  values('Aprenda PHP','Mario Molina',3,50);
 insert into libros(titulo,autor,codigoeditorial,precio)
  values('Uno','Richard Bach',3,15);
 insert into libros(titulo,autor,codigoeditorial,precio)
  values('Java en 10 minutos',default,4,45);
-- Contamos la cantidad de libros de cada editorial consultando ambas tablas:

 select nombre as editorial,
  count(*) as cantidad
  from editoriales as e
  join libros as l
  on codigoeditorial=e.codigo
  group by e.nombre;
-- Buscamos el libro más costoso de cada editorial con un "left join":

 select nombre as editorial,
  max(precio) as mayorprecio
  from editoriales as e
  left join libros as l
  on codigoeditorial=e.codigo
  group by nombre;