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