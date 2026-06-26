-- Subconsultas con Exists y Not Exists

-- Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una tabla llamada "facturas" y otra "detalles".
-- Creamos las tablas con las siguientes estructuras:

 create table facturas(
  numero int not null,
  fecha date,
  cliente varchar(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem)
 );
-- Ingresamos algunos registros:

 insert into facturas values(1200,'2017-01-15','Juan Lopez');
 insert into facturas values(1201,'2017-01-15','Luis Torres');
 insert into facturas values(1202,'2017-01-15','Ana Garcia');
 insert into facturas values(1300,'2017-01-20','Juan Lopez');

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
-- Empleamos una subconsulta correlacionada con un operador "exists" en la cláusula "where" para devolver la lista de clientes que compraron el artículo "lapiz":

 select cliente,numero
  from facturas as f
  where exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');
-- Buscamos los clientes que NO han comprado el artículo "lapiz":

 select cliente,numero
  from facturas as f
  where not exists
   (select *from detalles as d
     where f.numero=d.numerofactura
     and d.articulo='lapiz');