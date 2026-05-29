-- Triggers

create database disparadores;

use disparadores;

create table control(
	id int auto_increment primary key,
    tabla varchar(25) not null,
    accion enum('INSERT','DELETE','UPDATE'),
    fecha date,
    hora time,
    usuario varchar(25),
    idRegistro int
);

select * from control;


create table clientes(
	id int auto_increment primary key,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	edad int,
	direccion varchar(50),
	email varchar(30),
	telefono varchar(25),
	tipoDocumento enum('DNI','LIBRETA_CIVICA','LIBRETA_ENROLAMIENTO','PASS'),
	numeroDocumento char(8)
);


INSERT INTO `clientes` VALUES 
(1,'Fernando','Acme',34,'lima 222','intercrios@hotmail.com','23232312','DNI','12345678'),
(2,'Teofilo','GarciaLasca',43,'lima 222','lawlercarlospatricio@gmail.com','23232312','DNI','23567898'),
(3,'Coyote','Acme',34,'lima 222','c.rios@bue.edu.ar','23232312','DNI','12345679'),
(4,'Graciela','Meza',18,'lima 222','intercrios@hotmail.com','23232312','DNI','11111111'),
(5,'Juan ','Gomez',21,'medrano 165','gomez@gmail.com','33333333','DNI','88888888'),
(6,'Laura','Rojas',19,'medrano 165','rojas@gmail.com','77777777','DNI','77777777');

select * from clientes;


delimiter //
create trigger TR_Clientes_Insert
	before insert on clientes
    for each row
    begin
		insert into control (tabla,accion) values ('clientes','insert');
    end;
// delimiter ;

delimiter //
create trigger TR_Clientes_Delete
	before delete on clientes
    for each row
    begin
		insert into control (tabla,accion) values ('clientes','delete');
    end;
// delimiter ;

select * from control;
select * from clientes;

insert into clientes (nombre,apellido) values 
	('Rodrigo','Pereyra'),
    ('Veronica','Conte');

select * from control;
select * from clientes;


set sql_safe_updates=0;
delete from clientes;
delete from clientes where id>10;

select * from control;
select * from clientes;



drop trigger if exists TR_Clientes_Insert;
drop trigger if exists TR_Clientes_Delete;

select * from control;
truncate control;
describe control;

delimiter //
create trigger TR_Clientes_Insert
	after insert on clientes
    for each row
    begin
		insert into control (tabla,accion,fecha,hora,usuario,idRegistro) 
        values ('clientes','insert',curdate(),curtime(),current_user(),NEW.id);
    end;
// delimiter ;

insert into clientes (nombre,apellido) values 
	('Rodrigo','Pereyra'),
    ('Veronica','Conte');

select * from control;
select * from clientes;


