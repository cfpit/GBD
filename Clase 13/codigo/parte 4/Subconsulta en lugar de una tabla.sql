-- Subconsulta en lugar de una tabla

-- Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una tabla llamada "facturas", otra "detalles" y otra "clientes".
-- Creamos las tablas con las siguientes estructuras:

 create table clientes(
  codigo serial,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table facturas(
  numero int not null,
  fecha date,
  codigocliente int not null,
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

 insert into clientes(nombre,domicilio) values('Juan Lopez','Colon 123');
 insert into clientes(nombre,domicilio) values('Luis Torres','Sucre 987');
 insert into clientes(nombre,domicilio) values('Ana Garcia','Sarmiento 576');

 insert into facturas values(1200,'2017-01-15',1);
 insert into facturas values(1201,'2017-01-15',2);
 insert into facturas values(1202,'2017-01-15',3);
 insert into facturas values(1300,'2017-01-20',1);

 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
-- Vamos a realizar un "select" para recuperar el número de factura, el código de cliente, la fecha y la suma total de todas las facturas:

 select f.*,
  (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
 from facturas as f;
-- Esta consulta contiene una subconsulta correlacionada.

-- Ahora utilizaremos el resultado de la consulta anterior como una tabla derivada que emplearemos en lugar de una tabla para realizar un "join" y recuperar el número de factura, el nombre del cliente y el monto total por factura:

 select td.numero,c.nombre,td.total
  from clientes as c
  join (select f.*,
   (select sum(d.precio*cantidad)
    from detalles as d
    where f.numero=d.numerofactura) as total
  from facturas as f) as td
  on td.codigocliente=c.codigo;
-- Note que para referenciar la tabla derivada debimos colocar un alias a la consulta.