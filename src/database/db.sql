CREATE TABLE Producto(
	id int primary key identity,
	nombre varchar(30),
	fecha_caducidad date

)

Alter table Producto add precio decimal(5,2);

select * from Producto;
insert into Producto values('Chetos','2021/10/12');

Create table Ciudad(
	id int primary key identity,
	nombre varchar(20)
);

insert into Ciudad values('Monterrey');
insert into Ciudad values('Tequila');

Create table Tienda(
	id int primary key identity,
	nombre varchar(30),
	ciudad int,
	Constraint fk_ciudad FOREIGN KEY(ciudad) REFERENCES Ciudad(id)
);

insert into Tienda values('Sambors',1);
insert into Tienda values('Sears',2);
insert into Tienda values('Soriana',1);

select * from Tienda;

Create table Tienda_Producto(
	producto int,
	tienda int,
	Constraint fk_producto FOREIGN KEY (producto) REFERENCES Producto(id),
	Constraint fk_tienda FOREIGN KEY (tienda) REFERENCES Tienda,
	primary key(producto,tienda)
);

insert into Tienda_Producto values(2,3);

select * from Producto;
select* from Tienda;
Select * from Tienda_Producto;

Select P.nombre as 'Producto', T.tienda as 'Tienda' from Tienda_Producto T 
	 JOIN  Producto P
	ON P.id =T.producto;