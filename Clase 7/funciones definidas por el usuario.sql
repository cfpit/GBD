
-- ------------------------
-- Funciones 
-- UDF User Define Function 
-- ------------------------

-- Las UDF en MySQL si se las define desde Script hay que usar dos limitadores

create database funciones;

use funciones;

create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
 );

insert into libros values('Uno','Richard Bach','Planeta',15);
insert into libros values('Ilusiones','Richard Bach','Planeta',18);
insert into libros values('El aleph','Borges','Emece',25);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45);
insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',12);
insert into libros values('Java en 10 minutos','Mario Molina','Paidos',35);

delimiter //
create function f_incremento10 (avalor decimal(6,2))
  returns decimal(6,2)
 begin 
   return avalor+(avalor*0.1);
 end;
// delimiter ;

select titulo,precio,f_incremento10(precio) from libros;


-- --------------------
-- Consulta de catalogo
-- --------------------

-- use information_schema;
show tables;

delimiter //
create function f_incremento (avalor decimal(6,2), aincremento int)
  returns decimal (5,2)
  begin 
   return avalor+(avalor*aincremento/100);
  end;
// delimiter ;

select titulo,precio,f_incremento(precio,20) from libros;

select titulo,precio,f_incremento(precio,50) from libros;


delimiter //
create function f_costoso (avalor decimal(5,2))
  returns varchar(20)
 begin
   declare valorretornado varchar(20);
   set valorretornado='';
   if avalor<=20 then
    set valorretornado='economico';
   else set valorretornado='costoso';
   end if;
   return valorretornado;
 end;
// delimiter ;

select titulo,precio,f_costoso(precio) from libros;

select f_costoso (10) from dual;


-- Funcion PI
-- Funcion PI ya esta definida en Mysql
select pi();

delimiter //
create function PI()
returns decimal(6,4)
begin
return 3.14159;
end;
// delimiter ;
-- Se sobreescibe una funcion nativa

select PI();


delimiter //
create function f_promedio (avalor1 int, avalor2 int)
 returns decimal(6,2)
 begin 
   return (avalor1+avalor2)/2;
 end;
// delimiter ;


select f_promedio(35,26) from dual;




-- -------------------------------------------------------------
-- CONTROL DE FLUJO Y REPETICION
-- Control de flujo               IF  CASE
-- Estructura de Repeticion       LOOP FOR WHILE-LOOP
-- ------------------------------------------------------------


-- -------------------
-- Control de Flujo IF
-- -------------------

drop table if exists notas;
create table notas(
  nombre varchar(30),
  nota decimal(4,2)
 );
 insert into notas values('Acosta Ana', 6.7);
 insert into notas values('Bustos Brenda', 9.5);
 insert into notas values('Caseros Carlos', 3.7);
 insert into notas values('Dominguez Daniel', 2);
 insert into notas values('Fuentes Federico', 8);
 insert into notas values('Gonzalez Gaston', 7);
 insert into notas values('Juarez Juana', 4);
 insert into notas values('Lopez Luisa',5.3);


delimiter //
create function f_condicion (anota decimal(5,2))
  returns varchar(20)
 begin
   declare condicion varchar(20);
   set condicion='';
   if anota<4 then
    set condicion='desaprobado';
   else set condicion='aprobado';
   end if;
   return condicion;
 end;
 // delimiter ;
 
 select nombre, nota, f_condicion(nota) from notas;
 
-- ----------------
-- borrar funciones
-- ----------------

drop function f_condicion;




delimiter //
create function f_condicion (anota decimal(5,2))
  returns varchar(20)
 begin
   declare condicion varchar(20);
   set condicion='aprobado';
   if anota<4 then
    set condicion='desaprobado';
   end if;
   return condicion;
 end;
 // delimiter ;
 
select nombre, nota, f_condicion(nota) from notas;


drop function f_condicion;

delimiter //
create function f_condicion (anota decimal)
  returns varchar(20)
 begin
  declare condicion varchar(20);
   set condicion='';
   if anota<4 then
     set condicion='desaprobado';
   else
     if anota<8 then
      set condicion='regular';
     else
      set condicion='promocionado';
     end if;
   end if;
   return condicion;
 end;
 // delimiter ;



select nombre, nota, f_condicion(nota) from notas;



drop function f_condicion;
-- elsif NO EXISTE
-- hay que anidar

delimiter // 
create function f_condicion (anota decimal(6,2))
  returns varchar(20)
  
 begin
   declare condicion varchar(20);
   set condicion='';
   if anota<4 then
     set condicion='desaprobado';
   else if anota<8 then
     set condicion='regular';
   else
    set condicion='promocionado';
   end if;
   end if;
   return condicion;
 end;
 // delimiter ;
 
 select nombre, nota, f_condicion(nota) from notas;
 


-- ---------------------
-- Control de Flujo CASE
-- ---------------------
 
 
delimiter //
 create function f_mes(afecha date)
   returns varchar(20)
 begin
   declare mes varchar(20);
   set mes='enero';
   case extract(month from afecha)
     when 1 then set mes='enero';
     when 2 then set mes='febrero';
     when 3 then set mes='marzo';
     when 4 then set mes='abril';
     when 5 then set mes='mayo';
     when 6 then set mes='junio';
     when 7 then set mes='julio';
     when 8 then set mes='agosto';
     when 9 then set mes='setiembre';
     when 10 then set mes='octubre';
     when 11 then set mes='noviembre';
     else set mes='diciembre';
   end case;
   return mes;
 end;
// delimiter ;

select f_mes('10/10/2008');
select f_mes(curdate());


delimiter //
create function mesactual()
returns varchar(20)
begin
  declare m varchar(20);
  set m= f_mes(current_date);
return m;
end;
// delimiter ;

select mesactual();


delimiter //
create function f_trimestre(afecha date)
   returns varchar(20)
 begin
   declare mes varchar(20);
   declare trimestre int;
   set mes=extract(month from afecha);
   set trimestre=4;
   case mes
     when 1 then set trimestre=1;
     when 2 then set trimestre=1;
     when 3 then set trimestre=1;
     when 4 then set trimestre=2;
     when 5 then set trimestre=2;
     when 6 then set trimestre=2;
     when 7 then set trimestre=3;
     when 8 then set trimestre=3;
     when 9 then set trimestre=3;
     else set trimestre=4;
   end case;
   return trimestre;
 end;
 // delimiter ;
 
select f_trimestre(curdate());


create table empleados(
  legajo int not null,
  documento char(8),
  sexo char(1),
  constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion int not null,
  cantidadhijos int,
  constraint CK_empleados_hijos check (cantidadhijos>=0),
  estadocivil char(10),
  constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso date,
  constraint PK_empleados primary key (legajo),
  sueldo decimal(6,2),
  constraint CK_empleados_sueldo check (sueldo>=0),
  constraint UQ_empleados_documento
   unique(documento)
);

  insert into empleados values(1,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10',700);
 insert into empleados values(2,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10',550);
 insert into empleados values(3,'24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12',600);
 insert into empleados values(4,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09',860);
 insert into empleados values(5,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09',750);


select nombre,
  case extract(month from fechaingreso)
   when 1 then 1
   when 2 then 1
   when 3 then 1
   when 4 then 2
   when 5 then 2
   when 6 then 2
   when 7 then 3
   when 8 then 3
   when 9 then 3
  else  4
  end as trimestre
  from empleados
  order by trimestre;

  
select * from empleados;
  
 

-- ---------------------- 
-- Control de flujo Loop
-- ----------------------

drop procedure iterar;

delimiter //
create procedure iterar()
begin
  declare resultado int;
  declare multiplicador int;
  set multiplicador=0;
  iterator: loop
    set resultado=4*multiplicador;
    if multiplicador >=50 then leave iterator;
		end if;
    select '4x ',multiplicador,' = ',resultado;
    set multiplicador=multiplicador+1;
  end loop iterator;
end;
// delimiter ;

call iterar();


-- --------------------
-- Control de flujo FOR
-- --------------------

-- -------------------------------------
-- NO EXISTE LA ESTRUCTURA FOR EN MY SQL
-- -------------------------------------



-- -----------------
-- Estructura While
-- -----------------


drop procedure iterar;

delimiter //
create procedure iterar()
begin
declare numero int;
declare resultado int;
set numero=0;
  while numero<=5 do
   set resultado=3*numero;
   select '3* ',numero,' = ',resultado;
   set numero=numero+1;
  end while;
end;
// delimiter ;

call iterar();

