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

create table trabajadores(
name varchar(30),
trabajadorID char(5)primary key,
usuario varchar(20),
horaInicio datetime,
horaFin datetime,
foreign key (usuario) references usuarios (usuario) on delete cascade);

create table proyectoTrabajadores(
trabajadorID char(5),
proyectoID char(5),
foreign key (trabajadorID) references trabajadores (trabajadorID) on delete cascade,
foreign key (proyectoID) references proyecto (proyectoID) on delete cascade);

create table horasProyectoTrabajador(
trabajadorID char(5),
proyectoID char(5),
horasTotales numeric (6,3),
foreign key (trabajadorID) references trabajadores (trabajadorID) on delete cascade,
foreign key (proyectoID) references proyecto (proyectoID) on delete cascade);

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

insert into empresa(name,empresaID)values('Movistar','1');
insert into empresa(name,empresaID)values('Vodafone','2');
insert into empresa(name,empresaID)values('Telepizza','3');
insert into empresa(name,empresaID)values('Zara','5');

insert into usuarios(usuario,tipo,contraseña)values('Admin','recursos humanos','RRHH');
insert into usuarios(usuario,tipo,contraseña)values('Pruebas','empleado','Pruebas');
insert into usuarios(usuario,tipo,contraseña)values('UsuarioAntonio','empleado','ContraseñaAntonio');
insert into usuarios(usuario,tipo,contraseña)values('UsuarioJuan','recursos humanos','ContraseñaJuan');
insert into usuarios(usuario,tipo,contraseña)values('UsuarioDavid','empleado','ContraseñaDavid');

insert into proyecto(name,proyectoID,empresaID)values('web','1','5');
insert into proyecto(name,proyectoID,empresaID)values('basededatos','2','1');
insert into proyecto(name,proyectoID,empresaID)values('aplicación','3','2');
insert into proyecto(name,proyectoID,empresaID)values('cables','6','1');

insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('David','1','UsuarioDavid',null,null);
insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('Antonio','2','UsuarioAntonio',null,null);
insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('Juan','4','UsuarioJuan',null,null);
insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('Carlos','10','Pruebas',null,null);
insert into trabajadores(name,trabajadorID,usuario,horaInicio,horaFin) values ('Marta','15','Admin',null,null);

insert into proyectoTrabajadores(trabajadorID,proyectoID)values('1','1');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('2','1');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('4','1');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('1','2');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('1','6');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('2','3');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('10','3');
insert into proyectoTrabajadores(trabajadorID,proyectoID)values('10','6');

insert into peticiones(peticionesID,fecha,categoria,texto,estado) values ('1','2020-12-10','deberes','Queria solicitar vacaciones','en espera');
insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('4','2021-01-13','vacaciones','me gustaría tomarme unas vacaciones','en espera');
insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('2','2021-01-13','dia libre','me gustaría tomarme un dia libre','en espera');
insert into peticiones(peticionesID,fecha,categoria,texto,estado)values('3','2021-01-13','deberes','tengo deberes pendientes','denegada');

insert into peticionesTrabajadores(trabajadorID,peticionesID)values('1','1');
insert into peticionesTrabajadores(trabajadorID,peticionesID)values('2','2');
insert into peticionesTrabajadores(trabajadorID,peticionesID)values('2','3');
insert into peticionesTrabajadores(trabajadorID,peticionesID)values('4','4');

insert into horasproyectotrabajador (trabajadorID,proyectoID,horasTotales) values ('1','1',3);
insert into horasproyectotrabajador (trabajadorID,proyectoID,horasTotales) values ('1','2',3);
insert into horasproyectotrabajador (trabajadorID,proyectoID,horasTotales) values ('1','6',2);

select * from proyectoTrabajadores inner join trabajadores where proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID;
select * from empresa;
select * from proyecto;
select * from trabajadores;
select * from proyectotrabajadores;
select * from peticiones;
select * from usuarios;
select * from peticionesTrabajadores; 
select * from horasproyectotrabajador;
update trabajadores set horaInicio='2021-01-16 19:37' where trabajadores.usuario='Pruebas';
insert into horasproyectotrabajador(trabajadorID,proyectoID,horasTotales) values ('1','1','7');
delete from horasproyectotrabajador where horasproyectotrabajador.proyectoID='1';

update trabajadores set peticionesID='00001' where trabajadorID='00001';
select proyecto.name, proyecto.proyectoID, proyecto.empresaID from trabajadores inner join proyectoTrabajadores inner join proyecto where trabajadores.usuario='Pruebas' and  proyectoTrabajadores.trabajadorID=trabajadores.trabajadorID and proyectoTrabajadores.proyectoID=proyecto.proyectoID;
select trabajadores.name,trabajadores.trabajadorID,peticiones.peticionesID, peticiones.fecha, peticiones.categoria, peticiones.texto, peticiones.estado from peticiones inner join peticionesTrabajadores inner join trabajadores where peticionesTrabajadores.peticionesID=peticiones.peticionesID and trabajadores.usuario='Pruebas' and peticionesTrabajadores.trabajadorID=trabajadores.trabajadorID;
delete from trabajadores where trabajadorID='00001';
select horasproyectotrabajador.trabajadorID, horasproyectotrabajador.proyectoID, horasproyectotrabajador.horasTotales from horasproyectotrabajador inner join trabajadores where trabajadores.trabajadorID=horasproyectotrabajador.trabajadorID and trabajadores.usuario="UsuarioDavid";




