-- Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

-- Creamos con la siguiente estructura:

 create table visitantes(
  nombre varchar(30),
  edad integer,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11)
 );
-- Los campos "nombre", "domicilio" y "ciudad" almacenarán valores cuya longitud varía, por ello elegimos el tipo "varchar" y le damos a cada uno una longitud máxima estimando su tamaño. El campo "sexo" se define de tipo "char", porque necesitamos solamente 1 caracter "f" o "m", que siempre será fijo. El campo "telefono" también se define como varchar porque no todos los números telefónicos tienen la misma longitud.

-- Intentamos ingresar una cadena de mayor longitud que la definida:

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567');
-- aparece un mensaje de error y la sentencia no se ejecuta

-- Ingresamos un número telefónico olvidando las comillas, es decir, como un valor numérico:

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);
-- lo convierte a cadena, veámoslo:

 select * from visitantes;
-- Ahora borramos la tabla y la creamos utilizando como tipo de campo los alias existentes para los tipos de datos varchar y char:

 drop table visitantes;

 create table visitantes(
  nombre character varying(30),
  edad integer,
  sexo character(1),
  domicilio character varying(30),
  ciudad character varying(20),
  telefono character varying(11)
 );
-- Insertamos un registro:

insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono) values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);
-- Mostramos el registro cargado:

 select * from visitantes;