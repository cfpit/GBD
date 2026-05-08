-- Funciones para el uso de fecha y hora

-- -adddate(fecha, interval expresion): retorna la fecha agregándole el intervalo especificado. 

-- Ejemplos: 
select adddate('2006-10-10',interval 25 day); 
-- retorna "2006-11-04". 
select adddate('2006-10-10',interval 5 month);
-- retorna "2007-03-10".

-- -adddate(fecha, dias): retorna la fecha agregándole a fecha "dias". 

-- Ejemplo: 
select adddate('2006-10-10',25);
-- retorna "2006-11-04".

-- -addtime(expresion1,expresion2): agrega expresion2 a expresion1 y retorna el resultado.

-- -current_date: retorna la fecha de hoy con formato "YYYY-MM-DD" o "YYYYMMDD".

-- -current_time: retorna la hora actual con formato "HH:MM:SS" o "HHMMSS".

-- -date_add(fecha,interval expresion tipo) y date_sub(fecha,interval expresion tipo): el 
-- argumento "fecha" es un valor "date" o "datetime", "expresion" especifica el valor de 
-- intervalo a ser añadido o substraído de la fecha indicada (puede empezar con "-", para 
-- intervalos negativos), "tipo" indica la medida de adición o substracción. 

-- Ejemplo: 
select date_add('2006-08-10', interval 1 month); -- retorna "2006-09-10"; 
select date_add('2006-08-10', interval -1 day); -- retorna "2006-08-09"; 
select date_sub('2006-08-10 18:55:44', interval 2 minute); -- retorna "2006-08-10 18:53:44"; 
select date_sub('2006-08-10 18:55:44', interval '2:3' minute_second); 
-- retorna "2006-08-10 18:53:41". 

-- Los valores para "tipo" pueden ser: second, minute, hour, day, month, year, minute_second 
-- (minutos y segundos), hour_minute (horas y minutos), day_hour (días y horas), year_month 
-- (año y mes), hour_second (hora, minuto y segundo), day_minute (dias, horas y minutos), 
-- day_second(dias a segundos).

-- -datediff(fecha1,fecha2): retorna la cantidad de días entre fecha1 y fecha2.

-- -dayname(fecha): retorna el nombre del día de la semana de la fecha. 
-- Ejemplo: 
select dayname('2020-09-24');
-- retorna "thursday".

-- -dayofmonth(fecha): retorna el día del mes para la fecha dada, dentro del rango 1 a 31. 

-- Ejemplo: 
select dayofmonth('2006-08-10'); -- retorna 10.

-- -dayofweek(fecha): retorna el índice del día de semana para la fecha pasada como argumento. 
-- Los valores de los índices son: 1=domingo, 2=lunes,... 7=sábado). 

-- Ejemplo: 
select dayofweek('2006-08-10'); -- retorna 5, o sea jueves.

-- -dayofyear(fecha): retorna el día del año para la fecha dada, dentro del rango 1 a 366. 
-- Ejemplo: 
select dayofyear('2020-09-24'); -- retorna 268.

-- -extract(tipo from fecha): extrae partes de una fecha.

-- Ejemplos:
select extract(year from '2006-10-10'); -- retorna "2006".
select extract(year_month from '2006-10-10 10:15:25'); -- retorna "200610".
select extract(day_minute from '2006-10-10 10:15:25'); -- retorna "101015";

-- Los valores para tipo pueden ser: second, minute, hour, day, month, year, minute_second, 
-- hour_minute, day_hour, year_month, hour_second (horas, minutos y segundos), day_minute 
-- (días, horas y minutos), day_second (días a segundos).

-- -hour(hora): retorna la hora para el dato dado, en el rango de 0 a 23.

-- Ejemplo: 
select hour('18:25:09'); -- retorna "18";

-- -minute(hora): retorna los minutos de la hora dada, en el rango de 0 a 59.

-- -monthname(fecha): retorna el nombre del mes de la fecha dada.

-- Ejemplo: 
select monthname('2006-08-10'); -- retorna "August".

-- -month(fecha): retorna el mes de la fecha dada, en el rango de 1 a 12.

-- -now() y sysdate(): retornan la fecha y hora actuales.
select now();
select sysdate();

-- -period_add(p,n): agrega "n" meses al periodo "p", en el formato "YYMM" o "YYYYMM"; retorna 
-- un valor en el formato "YYYYMM". El argumento "p" no es una fecha, sino un año y un mes. 

-- Ejemplo: 
select period_add('200608',2); -- retorna "200610".

-- -period_diff(p1,p2): retorna el número de meses entre los períodos "p1" y "p2", en el formato
-- "YYMM" o "YYYYMM". Los argumentos de período no son fechas sino un año y un mes. 

-- Ejemplo: 
select period_diff('200608','200602'); -- retorna 6.

-- -second(hora): retorna los segundos para la hora dada, en el rango de 0 a 59.


-- -sec_to_time(segundos): retorna el argumento "segundos" convertido a horas, minutos y segundos. 

-- Ejemplo: 
select sec_to_time(90); -- retorna "1:30".

-- -timediff(hora1,hora2): retorna la cantidad de horas, minutos y segundos entre hora1 y hora2.

-- -time_to_sec(hora): retorna el argumento "hora" convertido en segundos.

-- -to_days(fecha): retorna el número de día (el número de día desde el año 0).

-- -weekday(fecha): retorna el índice del día de la semana para la fecha pasada como argumento. 
-- Los índices son: 0=lunes, 1=martes,... 6=domingo). 

-- Ejemplo: 
select weekday('2006-08-10'); -- retorna 3, o sea jueves.


-- -year(fecha): retorna el año de la fecha dada, en el rango de 1000 a 9999. 
-- Ejemplo: 
select year('06-08-10'); -- retorna "2006".

-- Un listado completo de todas las funciones relacionadas a fechas y horas las podemos consultar 
-- en la documentación oficial.

-- Ejemplo
-- Ingresemos al programa "Workbench" y ejecutemos el siguiente bloque de instrucciones SQL 
-- empleando algunas funciones para el manejo de fechas y horas:

drop table if exists prestamos;

create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo date not null,
  fechadevolucion date,
  devuelto char(1) default 'n'
 );

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('Manual de 1 grado','23456789','2006-08-10',date_add('2006-08-10', interval 5 day));

select * from prestamos;

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
values ('Alicia en el pais de las maravillas','23456789',
'2006-08-12',date_add('2006-08-12', interval 5 day));

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
values ('El aleph','22543987','2006-08-15',date_add('2006-08-15', interval 5 day));

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
values ('Manual de geografia 5 grado','25555666','2006-08-30', date_add('2006-08-30', interval 5 day));

select * from prestamos;

insert into prestamos (titulo,documento,fechaPrestamo,fechaDevolucion)
  values ('Atlas universal','24000111',current_date,date_add(current_date, interval 5 day));

select * from prestamos;

 



 
