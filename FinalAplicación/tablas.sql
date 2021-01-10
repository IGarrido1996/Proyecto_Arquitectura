create table empresa(
name varchar(30),
empresaID char(5)primary key);

create table proyecto(
name varchar(30),
proyectoID char(5)primary key,
empresaID char(5),
foreign key (empresaID) references empresa (empresaID) on delete cascade);
insert into trabajadores(name,trabajadorID,horaInicio,horaFin,horasTotales,proyectoID,peticionesID) values ('David','00001','2020-12-10 12:32','2020-12-10 19:50','8','00001',null);
insert into peticiones(peticionesID,fecha,categoria,texto,estado) values ('00001','2020-12-10','deberes','Queria solicitar vacaciones','nada');
select * from peticiones;
create table trabajadores(
name varchar(30),
trabajadorID char(5)primary key,
horaInicio datetime,
horaFin datetime,
horasTotales numeric (6,3),
proyectoID char(5),
peticionesID char(5),
foreign key (proyectoID) references proyecto (proyectoID) on delete cascade,
foreign key (peticionesID) references peticiones (peticionesID) on delete cascade);

create table peticiones(
peticionesID char(5)primary key,
fecha date,
categoria varchar(14) check(categoria='dia libre' or categoria='vacaciones' or categoria='horas libres' or categoria='deberes'),
texto text,
estado varchar(10) check(estado='en espera' or estado='aprobada' or estado='denegada'));