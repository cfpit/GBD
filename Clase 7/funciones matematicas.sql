
-- Funciones matemáticas

-- Los operadores aritméticos son "+","-","*" y "/". Todas las operaciones matemáticas 
-- retornan "null" en caso de error. Ejemplo:
 
 select 5/0;
 
-- -abs(x): retorna el valor absoluto del argumento "x". 

-- Ejemplo:
 select abs(-20);
-- retorna 20.

-- -ceiling(x): redondea hacia arriba el argumento "x". 

-- Ejemplo:
 select ceiling(12.34);
-- retorna 13.

-- -floor(x): redondea hacia abajo el argumento "x". 

-- Ejemplo:
 select floor(12.34);
-- retorna 12.

-- -greatest(x,y,..): retorna el argumento de máximo valor.

-- -least(x,y,...): con dos o más argumentos, retorna el argumento más pequeño.

-- -mod(n,m): significa "módulo aritmético"; retorna el resto de "n" dividido en "m". 

-- Ejemplos:
 select mod(10,3);-- devuelve el resto de la division
-- retorna 1.

 select mod(10,2);
-- retorna 0.

-- - %: %: devuelve el resto de una división. Ejemplos:

 select 10 % 3;
-- retorna 1.

 select 10%2;
-- retorna 0.

-- -power(x,y): retorna el valor de "x" elevado a la "y" potencia. 

-- Ejemplo:
 select power(2,3);
-- retorna 8.

-- -rand(): retorna un valor de coma flotante aleatorio dentro del rango 0 a 1.0.

-- -round(x): retorna el argumento "x" redondeado al entero más cercano. 

-- Ejemplos:
 select round(12.34);
-- retorna 12.

 select round(12.64);
-- retorna 13.

-- -srqt(): devuelve la raiz cuadrada del valor enviado como argumento.
select sqrt(4);

-- -truncate(x,d): retorna el número "x", truncado a "d" decimales. Si "d" es 0, el 
-- resultado no tendrá parte fraccionaria. 

-- Ejemplos:
 select truncate(123.4567,2);
-- retorna 123.45;

 select truncate (123.4567,0);
-- retorna 123.

-- Todas retornan null en caso de error.

-- Un listado completo de todas las funciones matemáticas de las diferentes versiones de 
-- MySQL las podemos consultar en la documentación oficial.

-- Ejemplo:
-- Ingresemos al programa "Workbench" y ejecutemos el siguiente bloque de instrucciones SQL 
-- para probar algunas funciones matemáticas de MySQL:

drop table if exists libros;

create table libros(
  codigo int unsigned auto_increment,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar (20),
  precio decimal(5,2) unsigned,
  primary key(codigo)
 );

insert into libros (titulo,autor,editorial,precio)
values('El alehp','Borges','Paidos',33.46);
insert into libros (titulo,autor,editorial,precio)
values('Alicia en el pais de las maravillas','L. Carroll','Planeta',16.31);
insert into libros (titulo,autor,editorial,precio)
values('Alicia a traves del espejo','L. Carroll','Planeta',18.89);

select * from libros;

select titulo, ceiling(precio),floor(precio)
  from libros;

select titulo, round(precio)
  from libros;

select titulo,truncate(precio,1)
  from libros;


 



 
