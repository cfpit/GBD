-- foreign key en la misma tabla

-- Una mutual almacena los datos de sus afiliados en una tabla llamada "afiliados". Algunos afiliados inscriben a sus familiares. La tabla contiene un campo que hace referencia al afiliado que lo incorporó a la mutual, del cual dependen.
-- Creamos la tabla:

 create table afiliados(
  numero serial,
  documento char(8) not null,
  nombre varchar(30),
  afiliadotitular int,
  primary key (documento),
  unique (numero)
 );
-- En caso que un afiliado no haya sido incorporado a la mutual por otro afiliado, el campo "afiliadotitular" almacenará "null".

-- Establecemos una restricción "foreign key" para asegurarnos que el número de afiliado que se ingrese en el campo "afiliadotitular" exista en la tabla "afiliados":

 alter table afiliados
  add constraint FK_afiliados_afiliadotitular
  foreign key (afiliadotitular)
  references afiliados (numero);
-- Ingresamos algunos registros:

 insert into afiliados(documento,nombre,afiliadotitular) values('22222222','Perez Juan',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('23333333','Garcia Maria',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('24444444','Lopez Susana',null);
 insert into afiliados(documento,nombre,afiliadotitular) values('30000000','Perez Marcela',1);
 insert into afiliados(documento,nombre,afiliadotitular) values('31111111','Morales Luis',1);
 insert into afiliados(documento,nombre,afiliadotitular) values('32222222','Garcia Maria',2);
-- Podemos eliminar un afiliado, siempre que no haya otro afiliado que haga referencia a él en "afiliadotitular", es decir, si el "numero" del afiliado está presente en algún registro en el campo "afiliadotitular":

 delete from afiliados where numero=1;
-- No se puede.