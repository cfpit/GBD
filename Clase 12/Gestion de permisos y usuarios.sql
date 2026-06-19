-- Creo un nuevo usuario
CREATE USER 'pepe'@'localhost' IDENTIFIED BY '123';

-- Otorgo privilegios al nuevo usuario
GRANT SELECT, INSERT, UPDATE, DELETE ON negocio.* TO 'pepe'@'localhost';

-- Elimino privilegios al nuevo usuario
REVOKE SELECT, INSERT, UPDATE, DELETE ON negocio.* FROM 'pepe'@'localhost';

 -- Lista de usuarios
 SELECT * FROM mysql.user;
 
 -- ver el usuario actual
SELECT USER();

-- ver privilegios de un usuario(mysql server)
SHOW CREATE USER 'pepe'@'localhost';

 -- ver todas las variables
 SHOW VARIABLES;
 
 -- version de mySQL
 SELECT @@version;-- las variables de sistema empiezan con @@
 
 -- Elimino el usuario 
 DROP USER 'pepe'@'localhost';

-- Otorgo todos los privilegios
GRANT ALL PRIVILEGES ON *.* TO 'pepe'@'localhost'  WITH GRANT OPTION;


-- Revoco todos los privilegios
revoke all privileges ON *.* from 'pepe'@'localhost';



