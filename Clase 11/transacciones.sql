/*
Transacciones en MYSQL

El servidor de bases de datos MySQL soporta distintos tipos de tablas, tales como ISAM, MyISAM,
InnoDB. De éstos, InnoDB es el tipo de tabla más importante (después del tipo predeterminado,
MyISAM).


Las tablas del tipo InnoDB están estructuradas de forma distinta que MyISAM, ya que permite trabajar con
transacciones, y definir reglas de integridad referencial.


Las transacciones aportan una fiabilidad superior a las bases de datos. Si disponemos de una serie de 
consultas SQL que deben ejecutarse en conjunto, con el uso de transacciones podemos tener la certeza de 
que nunca nos quedaremos a medio camino de su ejecución. De hecho, podríamos decir que las transacciones 
aportan una característica de "deshacer" a las aplicaciones de bases de datos.


Para este fin, las tablas que soportan transacciones, como es el caso de InnoDB, son mucho más seguras y 
fáciles de recuperar si se produce algún fallo en el servidor, ya que las consultas se ejecutan o no en 
su totalidad. Por otra parte, las transacciones pueden hacer que las consultas tarden más tiempo en 
ejecutarse.


Para asegurarnos que tenemos soporte para el tipo de tablas InnoDB podemos ejecutar la siguiente sentencia:*/

SHOW VARIABLES LIKE '%innodb%';
-- +---------------------------------+------------+
-- | Variable_name | Value |
-- +---------------------------------+------------+
-- | have_innodb | YES |

/*
En efecto, una de las principales características de las tablas del tipo InnoDB es que pueden trabajar 
con transacciones, o sentencias SQL que son agrupadas como una sola. Un ejemplo típico d esto es una 
transacción bancaria. Por ejemplo, si una cantidad de dinero es transferida de la cuenta de una persona 
a otra, se requerirán por lo menos dos consultas:*/

UPDATE cuentas SET balance = balance - cantidad_transferida WHERE cliente = persona1;
UPDATE cuentas SET balance = balance + cantidad_transferida WHERE cliente = persona2;

/*Estas dos consultas deben trabajar bien, ¿pero que sucede si ocurre algún imprevisto y "se cae" el 
sistema después de que se ejecuta la primer consulta, pero la segunda aún no se ha completado?. 
La persona1 tendrá una cantidad de dinero removida de su cuenta, y creerá que ha realizado su pago, 
sin embargo, la persona2 estará enfadada puesto que pensará que no se le ha depositado el dinero que le 
deben. 

En este ejemplo tan sencillo se ilustra la necesidad de que las consultas sean ejecutadas de manera 
conjunta, o en su caso, que no se ejecute ninguna de ellas. Es aquí donde las transacciones toman un 
papel muy importante.

Los pasos para usar transacciones en MySQL son:
1) Iniciar una transacción con el uso de la sentencia BEGIN.
2) Actualizar, insertar o eliminar registros en la base de datos.
3) Si se quieren los cambios a la base de datos, completar la transacción con el uso de la sentencia
COMMIT. Únicamente cuando se procesa un COMMIT los cambios hechos por las consultas serán
permanentes.
4) Si sucede algún problema, podemos hacer uso de la sentencia ROLLBACK para cancelar los cambios
que han sido realizados por las consultas que han sido ejecutadas hasta el momento.

Crear una tabla especificando que es InnoDB:*/
create database transacciones;

use transacciones;

CREATE TABLE innotest (campo INT NOT NULL PRIMARY KEY) ENGINE = InnoDB;

INSERT INTO innotest VALUES(1);
INSERT INTO innotest VALUES(2);
INSERT INTO innotest VALUES(3);

SELECT * FROM innotest;

BEGIN;
INSERT INTO innotest VALUES(4);
SELECT * FROM innotest;

-- Si en este momento ejecutamos un ROLLBACK, la transacción no será completada, y los cambios
-- realizados sobre la tabla no tendrán efecto.
ROLLBACK;
SELECT * FROM innotest;


-- Ahora vamos a ver que sucede si perdemos la conexión al servidor antes de que la transacción sea
-- completada.
BEGIN;
INSERT INTO innotest VALUES(4);
SELECT * FROM innotest;

/*Detener el servicio de mysql(query -> reconnect to server).
Cuando obtengamos de nuevo la conexión, podemos verificar que el registro no se insertó, ya que la
transacción no fue completada.*/
SELECT * FROM innotest;


-- Ahora vamos a repetir la sentencia INSERT ejecutada anteriormente, pero con un COMMIT.
BEGIN;
INSERT INTO innotest VALUES(4);
COMMIT;

-- Una vez que hacemos un COMMIT, la transacción es completada, y todas las sentencias SQL que han
-- sido ejecutadas previamente afectan de manera permanente a las tablas de la base de datos.
SELECT * FROM innotest;


/*LECTURAS CONSISTENTES
Por default, las tablas InnoDB ejecutan una lectura consistente. Esto significa que
cuando una sentencia SELECT es ejecutada, MySQL regresa los valores presentes en la base de datos
hasta la transacción más reciente que ha sido completada. 

Si alguna transacción está en progreso, los cambios hechos por alguna sentencia INSERT o UPDATE no serán 
reflejados. Sin embargo, existe una excepción: las transacciones abiertas si pueden ver sus propios cambios. 
Para demostrar esto, necesitamos establecer dos conexiones al servidor MySQL.

Primero agregaremos un registro dentro de una transacción con la primera conexión:*/
BEGIN;
INSERT INTO innotest VALUES(5);

-- Ahora, desde la segunda conexión consultamos los datos de nuestra tabla.
SELECT * FROM innotest;

-- Como se puede observar, el registro que hemos insertado desde la 1ra. conexión no es regresado
-- puesto que forma parte de una transacción que no ha sido completada. Ahora, desde la 1ra. conexión
-- ejecutamos la misma consulta SELECT.
SELECT * FROM innotest;
COMMIT;

-- Después de completar la transacción con una sentencia COMMIT en la 1ra. conexión podremos verificar
-- que desde la 2da. conexión los cambios ya son visibles.
SELECT * FROM innotest;

-- EJEMPLO

-- Crear una sencilla tabla llamada ventas que sea del tipo InnoDB.
CREATE TABLE ventas
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	producto VARCHAR(30) NOT NULL,
	cantidad TINYINT NOT NULL
) ENGINE = InnoDB;

INSERT INTO ventas VALUES(0,'Maria Garcia',3);
SELECT * FROM ventas;

-- Ahora vamos a iniciar una transacción con la sentencia BEGIN.
BEGIN;
UPDATE ventas SET cantidad=4 WHERE id=1;

-- Verificamos que los cambios han sucedido.
SELECT * FROM ventas;

-- Si queremos deshacer los cambios, entonces ejecutamos un ROLLBACK.
ROLLBACK;

-- Verificamos que se deshicieron los cambios.
SELECT * FROM ventas;

-- Vamos a actualizar el registro usando otra transacción.
BEGIN;
UPDATE ventas SET cantidad=2 WHERE id=1;
SELECT * FROM ventas;

-- Vamos a confirmar que deseamos los cambios.
COMMIT;

-- En este momento los cambios son permanentes y definitivos.
SELECT * FROM ventas;