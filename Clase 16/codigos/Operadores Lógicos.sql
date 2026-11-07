-- Operadores Lógicos

-- Hasta el momento, hemos aprendido a establecer una condición con "where" utilizando operadores relacionales. Podemos establecer más de una condición con la cláusula "where", para ello aprenderemos los operadores lógicos.

-- Son los siguientes:

-- - and, significa "y",
-- - or, significa "y/o",
-- - not, significa "no", invierte el resultado
-- - (), paréntesis
-- Los operadores lógicos se usan para combinar condiciones.

-- Queremos recuperar todos los registros cuyo autor sea igual a "Borges" y cuyo precio no supere los 20 pesos, para ello necesitamos 2 condiciones:

select * from libros
  where autor='Borges' and
        precio<=20;  
-- Los registros recuperados en una sentencia que une 2 condiciones con el operador "and", cumplen con las 2 condiciones.

-- Queremos ver los libros cuyo autor sea "Borges" y/o cuya editorial sea "Planeta":

select * from libros
  where autor='Borges' or
        editorial='Planeta';		
-- En la sentencia anterior usamos el operador "or", indicamos que recupere los libros en los cuales el valor del campo "autor" sea "Borges" y/o el valor del campo "editorial" sea "Planeta", es decir, seleccionará los registros que cumplan con la primera condición, con la segunda condición o con ambas condiciones.

-- Los registros recuperados con una sentencia que une 2 condiciones con el operador "or", cumplen 1 de las condiciones o ambas.

-- Queremos recuperar los libros que no cumplan la condición dada, por ejemplo, aquellos cuya editorial NO sea "Planeta":

select * from libros
  where not editorial='Planeta';
-- El operador "not" invierte el resultado de la condición a la cual antecede.

-- Los registros recuperados en una sentencia en la cual aparece el operador "not", no cumplen con la condición a la cual afecta el "NO".

-- Los paréntesis se usan para encerrar condiciones, para que se evalúen como una sola expresión.

-- Cuando explicitamos varias condiciones con diferentes operadores lógicos (combinamos "and", "or") permite establecer el orden de prioridad de la evaluación; además permite diferenciar las expresiones más claramente.

-- Por ejemplo, las siguientes expresiones devuelven un resultado diferente:

select * from libros
  where (autor='Borges') or
        (editorial='Paidos' and precio<20);  
-- Otro ejemplo:

select*from libros
  where (autor='Borges' or editorial='Paidos') and
        (precio<20);		
-- Si bien los paréntesis no son obligatorios en todos los casos, se recomienda utilizarlos para evitar confusiones.

-- El orden de prioridad de los operadores lógicos es el siguiente: "not" se aplica antes que "and" y "and" antes que "or", si no se especifica un orden de evaluación mediante el uso de paréntesis.

-- Problema resuelto
-- Trabajar con la tabla medicamentos.

drop table if exists medicamentos;
-- Crear la tabla con la siguiente estructura:

create table medicamentos(
	codigo integer primary key,
	nombre text,
	laboratorio text,
	precio real,
	cantidad integer
);
-- Ingrese los siguientes registros:

insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Sertal', 'Roche', 5.2, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Buscapina', 'Roche', 4.10, 200);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal 500', 'Bayer', 15.60, 100);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Paracetamol 500', 'Bago', 1.90, 200);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Bayaspirina', 'Bayer', 2.10, 150); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxidal jarabe', 'Bayer', 5.10, 250); 
-- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea menor a 5:

select codigo, nombre
  from medicamentos
  where laboratorio='Roche' and
        precio<5;  
-- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5

select * from medicamentos
  where laboratorio='Roche' or
        precio<5;
-- Muestre todos los registros que no sean de "Bayer"

select * from medicamentos
  where not laboratorio='Bayer';  
-- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100

select * from medicamentos
  where not laboratorio='Bayer' and
        cantidad=100;
-- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100

select * from medicamentos
  where laboratorio='Bayer' and
        not cantidad=100;
-- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10:

delete from medicamentos
  where laboratorio='Bayer' and
        precio>10;  
-- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5

update medicamentos set cantidad=200
  where laboratorio='Roche' and
        precio>5;  
-- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3:

delete from medicamentos
  where laboratorio='Bayer' or
        precio<3;
-- Problema propuesto
-- Borrar la tabla "peliculas" si existe

-- Crear la tabla peliculas con la siguiente estructura:

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);
-- Insertar los siguientes registros:

insert into peliculas (titulo, actor, duracion)
  values('Mision imposible', 'Tom Cruise', 120);
insert into peliculas (titulo, actor, duracion)
  values('Harry Potter y la piedra filosofal', 'Daniel R.', 180);
insert into peliculas (titulo, actor, duracion)
  values('Harry Potter y la camara secreta', 'Daniel R.', 190);
insert into peliculas (titulo, actor, duracion)
  values('Mision imposible 2', 'Tom Cruise', 120);
insert into peliculas (titulo, actor, duracion)
  values('Mujer bonita', 'Richard Gere', 120);
insert into peliculas (titulo, actor, duracion)
  values('Tootsie', 'D. Hoffman', 90);
insert into peliculas (titulo, actor, duracion)
  values('Un oso rojo', 'Julio Chavez', 100);
insert into peliculas (titulo, actor, duracion)
  values('Elsa y Fred', 'China Zorrilla', 110);
-- Recupere los registros cuyo actor sea "Tom Cruise" o "Richard Gere"

-- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180.

-- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 100.

drop table if exists peliculas;

create table peliculas (
	codigo integer primary key,
	titulo text,
	actor text,
	duracion integer
);

insert into peliculas (titulo, actor, duracion)
  values('Mision imposible', 'Tom Cruise', 120);
insert into peliculas (titulo, actor, duracion)
  values('Harry Potter y la piedra filosofal', 'Daniel R.', 180);
insert into peliculas (titulo, actor, duracion)
  values('Harry Potter y la camara secreta', 'Daniel R.', 190);
insert into peliculas (titulo, actor, duracion)
  values('Mision imposible 2', 'Tom Cruise', 120);
insert into peliculas (titulo, actor, duracion)
  values('Mujer bonita', 'Richard Gere', 120);
insert into peliculas (titulo, actor, duracion)
  values('Tootsie', 'D. Hoffman', 90);
insert into peliculas (titulo, actor, duracion)
  values('Un oso rojo', 'Julio Chavez', 100);
insert into peliculas (titulo, actor, duracion)
  values('Elsa y Fred', 'China Zorrilla', 110);

select * from peliculas
  where actor="Tom Cruise" or actor="Richard Gere";
  
update peliculas
  set duracion=200
  where actor="Daniel R." and
        duracion=180;

delete from peliculas
  where not actor='Tom Cruise' and
            duracion<=100;		