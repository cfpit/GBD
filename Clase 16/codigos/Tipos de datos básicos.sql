-- Tipos de datos básicos

-- Una empresa desea almacenar los datos de sus empleados en una tabla "empleados" que guarde: nombre, documento, sexo, domicilio, sueldo básico.
-- Elegir el tipo de dato para cada campo

-- Ingresar 3 registros en la tabla.

-- Mostrar todas las filas de la tabla.

create table empleados (
	nombre text,
	documento integer,
	sexo text,
	domicilio text,
	sueldobasico real
);

insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez',22333444,'m','Sarmiento 123',500.25);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

select * from empleados;