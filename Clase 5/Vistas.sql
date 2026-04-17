create database pruebaVista;

use pruebaVista;

-- Una empresa almacena la información de sus empleados en dos tablas llamadas 
-- "empleados" y "secciones".


 create table secciones(
  codigo tinyint auto_increment,
  nombre varchar(20),
  sueldo decimal(5,2),
  constraint CK_secciones_sueldo check (sueldo>=0),
  constraint PK_secciones primary key (codigo)
 );
 
 describe secciones;
 
 create table empleados(
  legajo int auto_increment,
  documento char(8),
  sexo char(1),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion tinyint not null,
  cantidadhijos tinyint,
  estadocivil char(10),
  fechaingreso datetime,
  constraint CK_empleados_sexo check (sexo in ('f','m')),
  constraint CK_empleados_hijos check (cantidadhijos>=0),
  -- constraint CK_empleados_documento check (documento rlike '^[0-9]$'),
  constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')), 
  constraint PK_empleados primary key (legajo),
  constraint FK_empleados_seccion foreign key (seccion)references secciones(codigo)on update cascade,
  constraint UQ_empleados_documento unique(documento)
  );
  
  drop table empleados;
  
  -- truncate table empleados;
  
  
  describe empleados;

-- Ingresamos algunos registros:

 insert into secciones values(null,'Administracion',300);
 insert into secciones values(null,'Contaduría',400);
 insert into secciones values(null,'Sistemas',500);
 
 -- truncate table secciones;
 
 
 insert into empleados values(null,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
 insert into empleados values(null,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
 insert into empleados values(null,'24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
 insert into empleados values(null,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
 insert into empleados values(null,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');


select * from secciones;

select * from empleados;

select version();




-- Creamos la vista "vista_empleados", que es resultado de una combinación en la
-- cual se muestran 5 campos:


 create view vista_empleados 
 as
	select 		concat(e.apellido,' ',e.nombre) as nombre,
				e.sexo,
				s.nombre seccion,
				e.cantidadhijos
   from 		empleados  e
   inner join 	secciones  s
   on 			(codigo=seccion);
   

-- Vemos la información de la vista:

 select * from vista_empleados;
 

-- Realizamos una consulta a la vista como si se tratara de una tabla:

  select seccion,count(*) as cantidad
  from vista_empleados
  group by seccion;
  
  
-- Es posible obligar a todas las instrucciones de modificación de datos
 -- que se ejecutan en una vista a cumplir ciertos criterios.
 
 -- Por ejemplo, creamos la siguiente vista:

 create view vista_empleados2
 as
  select apellido, e.nombre, sexo, s.nombre  seccion
  from empleados as e
  join secciones as s
  on seccion=codigo
  where s.nombre='Administracion';
  -- with check option;
  
  drop view vista_empleados2;

-- Consultamos la vista:

 select * from vista_empleados2;

-- Actualizamos el nombre de un empleado a través de la vista:

 update vista_empleados2 
 set 	nombre='Beatriz' 
 where 	nombre='Ana';

-- Veamos si la modificación se realizó en la tabla:

 select * from empleados;
 
 -- si se modifico
 
 
 -- En cambio, si queremos hacer la siguiente modificacion:
 
  update 	vista_empleados2 
  set 		nombre='Pedro' 
  where 	nombre='Marcos';
  
  -- Veamos si la modificación se realizó en la tabla:

 select * from empleados;
 
 -- no se modifico
 
 
 -- Creamos la vista "vista_empleados3" que muestre todos los campos de la
 -- tabla "empleados":
 create view vista_empleados3
 as
  select * from empleados;
  
 
-- Consultamos la vista:
 select * from vista_empleados3;


-- Agregamos un campo a la tabla "empleados":

 alter table empleados
 add column sueldo decimal(6,2);
 
 describe empleados;

-- Consultamos la vista "vista_empleados3":

 select * from vista_empleados3;

-- Note que el nuevo campo agregado a "empleados" no aparece, a pesar que 
-- la vista indica que muestre todos los campos de dicha tabla; esto sucede
-- porque los campos se seleccionan al ejecutar "create view", para que 
-- aparezcan debemos alterar la vista:


 alter view vista_empleados3
 as
  select * from empleados;

-- Consultemos la vista:

 select * from vista_empleados3;
 
 -- le otorgo un sueldo a Beatriz
 update		vista_empleados3
 set		sueldo = 1500
 where		legajo = 1;
 
 select * from vista_empleados3;



