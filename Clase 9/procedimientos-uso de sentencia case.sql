
/* 

Realizar un procedimiento almacenado que le enviemos un entero comprendido entre 1 y 3. 
El segundo parámetro debe retornar el tipo de medalla que representa dicho número, sabiendo que:

1 - oro
2 - plata
3 - bronce

*/

create database procedimientos;

use procedimientos;

drop procedure if exists pa_tipo_medalla;

delimiter //
create procedure pa_tipo_medalla
(in puesto int, out tipo varchar(20))
begin
  case puesto
    when 1 then
      set tipo='oro';
    when 2 then
      set tipo='plata';
    when 3 then
      set tipo='bronce';
  end case;          
end //
delimiter ;

call pa_tipo_medalla(1,@ti);

select @ti;

call pa_tipo_medalla(2,@ti);

select @ti;

-- Ejercicio:

-- Realizar un procedimiento almacenado que le enviemos un entero comprendido entre 1 y 999. 
-- El segundo parámetro debe retornar la cantidad de dígitos que tiene dicho número:

drop procedure if exists pa_cantidad_digitos;

delimiter //
create procedure pa_cantidad_digitos
(in numero int, out cantidad int)
begin
  case 
    when numero<10 then
      set cantidad=1;
    when numero>=10 and numero<100 then
      set cantidad=2;
    when numero>=100 and numero<1000 then
      set cantidad=3;      
  end case;
end //
delimiter ;

call pa_cantidad_digitos(5, @cant);
select @cant;

call pa_cantidad_digitos(50, @cant);
select @cant;

call pa_cantidad_digitos(500, @cant);
select @cant;