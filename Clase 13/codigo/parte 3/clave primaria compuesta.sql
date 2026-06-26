 -- Clave primaria compuesta
 
 -- Problema:
-- Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla llamada "vehiculos".
-- Creamos la tabla estableciendo dos campos como clave primaria:

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada time,
  horasalida time,
  primary key(patente,horallegada)
 );
-- Ingresamos algunos registros:

 insert into vehiculos values('AIC124','a','8:05','12:30');
 insert into vehiculos values('CAA258','a','8:05',null);
 insert into vehiculos values('DSE367','m','8:30','18:00');
 insert into vehiculos values('FGT458','a','9:00',null);
 insert into vehiculos values('AIC124','a','16:00',null);
 insert into vehiculos values('LOI587','m','18:05','19:55');
-- Si intentamos ingresar un registro con clave primaria repetida:

 insert into vehiculos values('LOI587','m','18:05',null);
-- aparece un mensaje de error y la inserción no se realiza.

-- Si ingresamos un registro repitiendo el valor de uno de los campos que forman parte de la clave, si lo acepta:

 insert into vehiculos values('LOI587','m','21:30',null);
-- Si intentamos actualizar un registro repitiendo la clave primaria:

 update vehiculos set horallegada='8:05'
  where patente='AIC124' and horallegada='16:00';
-- aparece un mensaje de error y la actualización no se realiza.

-- Recordemos que los campos que forman parte de la clave primaria no aceptan valores nulos, aunque no se haya aclarado en la definición de la tabla:

 insert into vehiculos values('HUO690','m',null,null);