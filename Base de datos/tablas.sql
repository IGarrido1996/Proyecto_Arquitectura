create table empresa(
name varchar(30),
empresaID char(5)primary key);

create table usuarios(
usuario varchar(20)primary key,
tipo varchar(20) check(tipo='recursos humanos' or tipo='empleado'),
contraseña varchar(30));

create table proyecto(
name varchar(30),
proyectoID char(5)primary key,
empresaID char(5),
foreign key (empresaID) references empresa (empresaID) on delete cascade);

create table proyectoTrabajadores(
trabajadorID char(5),
proyectoID char(5),
foreign key (trabajadorID) references trabajadores (trabajadorID) on delete cascade,
foreign key (proyectoID) references proyecto (proyectoID) on delete cascade);

insert into usuarios(usuario,tipo,contraseña)values('Admin','recursos humanos','RRHH');
insert into usuarios(usuario,tipo,contraseña)values('Pruebas','empleado','Pruebas');
insert into empresa(name,empresaID)values('Movistar','00001');
insert into empresa(name,empresaID)values('Vodafone','00002');
insert into empresa(name,empresaID)values('Telepizza','00003');
insert into empresa(name,empresaID)values('Zara','00005');
insert into proyecto(name,proyectoID,empresaID)values('web','00001','00001');
insert into proyecto(name,proyectoID,empresaID)values('basededatos','00002','00001');
insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin,horasTotales) values ('David','00002','Admin','2020-12-10 12:32','2020-12-10 19:50','8');
insert into peticiones(peticionesID,fecha,categoria,texto,estado) values ('00001','2020-12-10','deberes','Queria solicitar vacaciones','en espera');
insert into trabajadores(name,trabajadorID,horaInicio,horaFin,horasTotales) values ('Carlos','00001','2021-01-10 00:01','2021-01-10 09:50','8');
insert into trabajadores(name,trabajadorID,horaInicio,horaFin,horasTotales) values ('kike','00004','2021-01-10 00:01',null,null);
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('00001','00001');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('00001','00002');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('00002','00002');
insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('00004','2021-01-13','vacaciones','me gustaría tomarme unas vacaciones','en espera');
insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('00002','2021-01-13','dia libre','me gustaría tomarme un dia libre','en espera');
insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('00003','2021-01-13','deberes','tengo deberes pendientes','denegada');
insert into peticionesTrabajadores(trabajadorID,peticionesID)values('00001','00001');
insert into peticionesTrabajadores(trabajadorID,peticionesID)values('00002','00002');
insert into peticionesTrabajadores(trabajadorID,peticionesID)values('00002','00003');

select * from proyectoTrabajadores inner join trabajadores where proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID;
select * from empresa;
select * from proyecto;
select * from trabajadores;
select * from proyectotrabajadores;
select * from peticiones;
select * from usuarios;
select * from peticionesTrabajadores; 

update trabajadores set peticionesID='00001' where trabajadorID='00001';
select proyecto.name, proyecto.proyectoID, proyecto.empresaID from trabajadores inner join proyectoTrabajadores inner join proyecto where trabajadores.usuario='Pruebas' and  proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID and proyectoTrabajadores.proyectoID=proyecto.proyectoID;
select trabajadores.name,trabajadores.trabajadorID,peticiones.peticionesID, peticiones.fecha, peticiones.categoria, peticiones.texto, peticiones.estado from peticiones inner join peticionesTrabajadores inner join trabajadores where peticionesTrabajadores.peticionesID=peticiones.peticionesID and trabajadores.usuario='Pruebas' and peticionesTrabajadores.trabajadorID=trabajadores.trabajadorID;

create table trabajadores(
name varchar(30),
trabajadorID char(5)primary key,
usuario varchar(20),
horaInicio datetime,
horaFin datetime,
horasTotales numeric (6,3),
foreign key (usuario) references usuarios (usuario) on delete cascade);

create table peticiones(
peticionesID char(5)primary key,
fecha date,
categoria varchar(14) check(categoria='dia libre' or categoria='vacaciones' or categoria='horas libres' or categoria='deberes'),
texto text,
estado varchar(10) check(estado='en espera' or estado='aprobada' or estado='denegada'));

create table peticionesTrabajadores(
trabajadorID char(5),
peticionesID char(5),
foreign key (trabajadorID) references trabajadores (trabajadorID) on delete cascade,
foreign key (peticionesID) references peticiones (peticionesID) on delete cascade);