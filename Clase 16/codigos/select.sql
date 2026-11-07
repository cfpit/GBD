-- select

-- Cree la tabla peliculas, si ya existe elimínela primero:

 -- drop table if exists peliculas;

 create table peliculas(
	titulo text,
	actor text,
	duracion integer,
	cantidad integer
 );

 -- Insertar 4 filas en la tabla:

insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);  

-- Realice un "select" mostrando solamente el título y actor de todas las películas

-- Luego cambie el select anterior para mostrar el título y duración de todas las peliculas


 drop table if exists peliculas;

 create table peliculas(
	titulo text,
	actor text,
	duracion integer,
	cantidad integer
 );
 
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);
  
 select titulo,actor from peliculas;

 select titulo,duracion from peliculas;