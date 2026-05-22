-- Ejercicio: 
-- Realizar un procedimiento almacenado que nos retorne dos valores aleatorios distintos 
-- comprendidos entre 0 y 10.

create database procedimientos;

use procedimientos;

drop procedure if exists pa_generar_dos_aleatorios;

delimiter //
create procedure pa_generar_dos_aleatorios
(out valor1 int, out valor2 int)
begin
declare cont int;
  set valor1=0;
  set valor2=0;
  set cont = 0;
  while valor1=valor2 do
    set valor1=rand()*10;
    set valor2=rand()*10;
set cont = cont + 1;
  end while;
select cont;
end //
delimiter ;

call pa_generar_dos_aleatorios(@v1,@v2);

select @v1,@v2;  

-- repeat
/*
La sintaxis es la siguiente:

repeat
  [instrucciones]
until [condición]
end repeat;

El bloque de instrucciones encerrado entre repeat y end repeat se ejecuta hasta que la 
condición del until se verifica verdadera.

Tener en cuenta que debemos pensar la condición de corte del bloque repetitivo con una 
condición contraria al while. El while se repite mientras la condición se verifica 
verdadera y el repeat se repite hasta que la condición sea verdadera.

La estructura repetitiva repeat es conveniente utilizarla cuando el bloque a repetir 
se debe ejecutar por lo menos una vez.
*/

-- Confeccionar un procedimiento almacenado que nos retorne dos valores aleatorios distintos
-- comprendidos entre 0 y 10.

drop procedure if exists pa_generar_dos_aleatorios;

delimiter //
create procedure pa_generar_dos_aleatorios
(out valor1 int, out valor2 int)
begin
declare cont int;
set cont = 0;
  repeat
    set valor1=rand()*10;
    set valor2=rand()*10;
set cont = cont + 1;
  until valor1<>valor2  
  end repeat;
select cont;
end //
delimiter ;

call pa_generar_dos_aleatorios(@v1,@v2);

select @v1,@v2;  

-- loop

/*
Este tipo de estructura repetitiva encierra un bloque de instrucciones entre los comandos 
'loop' y 'end loop'.

Para finalizar el bloque encerrado por los comandos 'loop' y 'end loop' debemos ejecutar 
el comando 'leave' e indicar una etiqueta definida previa al comando 'loop'.

La sintaxis es la siguiente:

[etiqueta]:loop
  [instrucciones]
end loop;

*/

-- Ejercicio:
-- Realizar un procedimiento almacenado que nos retorne dos valores aleatorios distintos 
-- comprendidos entre 0 y 10.

drop procedure if exists pa_generar_dos_aleatorios;

delimiter //
create procedure pa_generar_dos_aleatorios
(out valor1 int, out valor2 int)
begin
  etiqueta1:loop
    set valor1=rand()*10;
    set valor2=rand()*10;
    if valor1<>valor2 then
      leave etiqueta1;
    end if;
  end loop;
end //
delimiter ;

call pa_generar_dos_aleatorios(@v1,@v2);

select @v1,@v2;  

-- Es importante que en algún momento de la ejecución de las instrucciones contenidas 
-- entre loop y end loop se ejecute el comando leave, de no ser así estamos en presencia 
-- de una estructura repetitiva infinita.


 