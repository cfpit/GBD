-- like - not like

-- Existe un operador que se usa para realizar comparaciones exclusivamente de cadenas, "like" y "not like".

-- Hemos realizado consultas utilizando operadores relacionales para comparar cadenas. Por ejemplo, sabemos recuperar los libros cuyo autor sea igual a la cadena "Borges":

 select * from libros
  where autor='Borges';
-- El operador igual ("=") nos permite comparar cadenas de caracteres, pero al realizar la comparación, busca coincidencias de cadenas completas, realiza una búsqueda exacta.

-- Imaginemos que tenemos registrados estos 2 libros:

 -- "El Aleph", "Borges";
 -- "Antologia poetica", "J.L. Borges";
-- Si queremos recuperar todos los libros de "Borges" y especificamos la siguiente condición:

 select * from libros
 where autor='Borges';
-- sólo aparecerá el primer registro, ya que la cadena "Borges" no es igual a la cadena "J.L. Borges".

-- Esto sucede porque el operador "=" (igual), también el operador "<>" (distinto) comparan cadenas de caracteres completas. Para comparar porciones de cadenas utilizamos los operadores "like" y "not like".

-- Entonces, podemos comparar trozos de cadenas de caracteres para realizar consultas. Para recuperar todos los registros cuyo autor contenga la cadena "Borges" debemos codificar en SQLite:

 select * from libros
  where autor like "%Borges%";
-- El símbolo "%" (porcentaje) reemplaza cualquier cantidad de caracteres (incluyendo ningún caracter). Es un caracter comodín. "like" y "not like" son operadores de comparación que señalan igualdad o diferencia.

-- Para seleccionar todos los libros que comiencen con "M":

 select * from libros
  where titulo like 'M%';
-- Note que el símbolo "%" ya no está al comienzo, con esto indicamos que el título debe tener como primera letra la "M" y luego, cualquier cantidad de caracteres.

-- Para seleccionar todos los libros que NO comiencen con "M":

 select * from libros
  where titulo not like 'M%';
-- Así como "%" reemplaza cualquier cantidad de caracteres, el guión bajo "_" reemplaza un caracter, es otro caracter comodín. Por ejemplo, queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe "Carroll" o "Carrolt", entonces tipeamos esta condición:

 select * from libros
  where autor like "%Carrol_";
-- "like" se emplea con tipos de datos text.

-- Problema resuelto
-- Trabajar con la tabla medicamentos.

drop table if exists medicamentos;
-- Cree la tabla con la siguiente estructura:

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
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Sertal compuesto', 'Bayer', 5.10, 130); 
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Paracetamol 1000', 'Bago', 2.90, 90);
insert into medicamentos (nombre, laboratorio, precio, cantidad)
  values('Amoxinil', 'Roche', 17.80, 230); 
-- Recuperar los medicamentos cuyo nombre comiencen con "Amox"

select codigo, nombre, laboratorio, precio
  from medicamentos
  where nombre like 'Amox%';  
-- Recuperar los medicamentos "Paracetamol" cuyo precio sea menor a 2

select codigo,nombre,laboratorio,precio
  from medicamentos
  where nombre like 'Paracetamol%' and
  precio<2;  
-- Mostrar todos los medicamentos que no contengan la cadena "compuesto":

select codigo,nombre,laboratorio,precio
  from medicamentos
  where nombre not like '%compuesto%';  
-- Eliminar todos los registros cuyo laboratorio contenga la letra "y"

delete from medicamentos
  where laboratorio like '%y%';  
-- Cambiar el precio por 5, al "Paracetamol" cuyo precio es mayor a 2

update medicamentos set precio=5
  where nombre like 'Paracetamol%' and
  precio>2;  
-- Problema propuesto
-- Borrar la tabla "usuarios" si existe

-- Crear la tabla "usuarios" con la siguiente estructura:

create table usuarios (
	nombre text primary key,
	clave text
);
-- Ingrese los siguientes registros:

insert into usuarios (nombre, clave) values ('Leonardo','payaso');
insert into usuarios (nombre, clave) values ('MarioPerez','Marito');
insert into usuarios (nombre, clave) values ('Marcelo','River');
insert into usuarios (nombre, clave) values ('Gustavo','Boca');
insert into usuarios (nombre, clave) values ('MarcosMercado','RealMadrid');
insert into usuarios (nombre, clave) values ('Susana','chapita');
insert into usuarios (nombre, clave) values ('Gonzalo','Z80');
insert into usuarios (nombre, clave) values ('GustavoPereyra','RealMadrid');
-- Recupere con un select los registros cuya clave contenga sólo 5 letras.

-- Busque los registros cuyo nombre de usuario termine con "o".

drop table if exists usuarios;

create table usuarios (
	nombre text primary key,
	clave text
);

insert into usuarios (nombre, clave) values ('Leonardo','payaso');
insert into usuarios (nombre, clave) values ('MarioPerez','Marito');
insert into usuarios (nombre, clave) values ('Marcelo','River');
insert into usuarios (nombre, clave) values ('Gustavo','Boca');
insert into usuarios (nombre, clave) values ('MarcosMercado','RealMadrid');
insert into usuarios (nombre, clave) values ('Susana','chapita');
insert into usuarios (nombre, clave) values ('Gonzalo','Z80');
insert into usuarios (nombre, clave) values ('GustavoPereyra','RealMadrid');

select * from usuarios
  where clave like '_____';
  
select * from usuarios
  where nombre like '%o';  