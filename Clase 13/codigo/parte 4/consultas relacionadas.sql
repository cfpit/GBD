-- consultas relacionadas

-- Una librería almacena la información de sus libros para la venta en tres tablas, "libros", "autores" y "editoriales".
-- Creamos las tablas:

 create table libros(
  codigo serial,
  titulo varchar(40),
  codigoautor int not null,
  codigoeditorial smallint not null,
  precio decimal(5,2),
  primary key(codigo)
 );

 create table autores(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );

 create table editoriales(
  codigo serial,
  nombre varchar(20),
  primary key (codigo)
 );
-- Ingresamos algunos registros:

 insert into editoriales(nombre) values('Planeta');
 insert into editoriales(nombre) values('Emece');
 insert into editoriales(nombre) values('Siglo XXI');
 insert into editoriales(nombre) values('Plaza');
 
 insert into autores(nombre) values ('Richard Bach');
 insert into autores(nombre) values ('Borges');
 insert into autores(nombre) values ('Jose Hernandez');
 insert into autores(nombre) values ('Mario Molina');
 insert into autores(nombre) values ('Paenza');
 
 insert into libros(titulo,codigoautor,codigoeditorial,precio) 
   values('El aleph',2,2,20);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Martin Fierro',3,1,30);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Aprenda PHP',4,3,50);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Uno',1,1,15);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Java en 10 minutos',0,3,45);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Matematica estas ahi',0,0,15);
 insert into libros(titulo,codigoautor,codigoeditorial,precio)
   values('Java de la A a la Z',4,0,50);
-- Recuperamos todos los datos de los libros consultando las tres tablas:

 select titulo,a.nombre,e.nombre,precio
  from autores as a
  join libros as l
  on codigoautor=a.codigo
  join editoriales as e
  on codigoeditorial=e.codigo;
-- Los libros cuyo código de autor no se encuentra en "autores" (caso de "Java en 10 minutos" y "Matematica estas ahi") y cuya editorial no existe en "editoriales" (caso de "Matematica estas ahi" y "Java de la A a la Z"), no aparecen porque realizamos una combinación interna.

-- Podemos combinar varios tipos de join en una misma sentencia:

 select titulo,a.nombre,e.nombre,precio
  from autores as a
  right join libros as l
  on codigoautor=a.codigo
  left join editoriales as e
  on codigoeditorial=e.codigo;
-- En la consulta anterior solicitamos el título, autor y editorial de todos los libros que encuentren o no haya coincidencia con "autores" ("right join") y a ese resultado lo combinamos con "editoriales", encuentren o no coincidencia.