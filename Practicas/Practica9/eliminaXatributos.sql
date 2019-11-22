/*Existen 3 tablas a las qu no se le pueden eliminar ya que, esas talbas estan definicas por el
caso de uso: Nombre_clase, tipo_Memebresia y Area*/

/*Eliminar tuplas de la tabla Persona*/
DELETE FROM Persona WHERE pk_id_persona=2;
DELETE FROM Persona WHERE pk_id_persona=34;
DELETE FROM Persona WHERE pk_id_persona=24;
DELETE FROM Persona WHERE pk_id_persona=22;
DELETE FROM Persona WHERE pk_id_persona=62;
DELETE FROM Persona WHERE pk_id_persona=52;
DELETE FROM Persona WHERE pk_id_persona=32;
DELETE FROM Persona WHERE pk_id_persona=76;
DELETE FROM Persona WHERE pk_id_persona=25;
DELETE FROM Persona WHERE pk_id_persona=24;

/*Eliminar tuplas de la tabla Socio*/


DELETE FROM Socio WHERE pk_id_socio=302;
DELETE FROM Socio WHERE pk_id_socio=304;
DELETE FROM Socio WHERE pk_id_socio=310;
DELETE FROM Socio WHERE pk_id_socio=315;
DELETE FROM Socio WHERE pk_id_socio=320;
DELETE FROM Socio WHERE pk_id_socio=329;
DELETE FROM Socio WHERE pk_id_socio=332;
DELETE FROM Socio WHERE pk_id_socio=325;
DELETE FROM Socio WHERE pk_id_socio=352;
DELETE FROM Socio WHERE pk_id_socio=382;


/*Eliminar tuplas de la tabla Entrenador*/



DELETE FROM Entrenador WHERE pk_id_empleado=2;
DELETE FROM Entrenador WHERE pk_id_empleado=4;
DELETE FROM Entrenador WHERE pk_id_empleado=10;
DELETE FROM Entrenador WHERE pk_id_empleado=15;
DELETE FROM Entrenador WHERE pk_id_empleado=20;
DELETE FROM Entrenador WHERE pk_id_empleado=29;
DELETE FROM Entrenador WHERE pk_id_empleado=32;
DELETE FROM Entrenador WHERE pk_id_empleado=25;
DELETE FROM Entrenador WHERE pk_id_empleado=52;
DELETE FROM Entrenador WHERE pk_id_empleado=82;


/*Eliminar tuplas de la tabla Instructor*/

DELETE FROM Instructor WHERE pk_id_instructor=102;
DELETE FROM Instructor WHERE pk_id_instructor=104;
DELETE FROM Instructor WHERE pk_id_instructor=180;
DELETE FROM Instructor WHERE pk_id_instructor=185;
DELETE FROM Instructor WHERE pk_id_instructor=190;
DELETE FROM Instructor WHERE pk_id_instructor=199;
DELETE FROM Instructor WHERE pk_id_instructor=182;
DELETE FROM Instructor WHERE pk_id_instructor=187;
DELETE FROM Instructor WHERE pk_id_instructor=152;
DELETE FROM Instructor WHERE pk_id_instructor=172;


/*Eliminar tuplas de la tabla Cliente*/
DELETE FROM Cliente WHERE pk_id_cliente=201;
DELETE FROM Cliente WHERE pk_id_cliente=220;
DELETE FROM Cliente WHERE pk_id_cliente=221;
DELETE FROM Cliente WHERE pk_id_cliente=233;
DELETE FROM Cliente WHERE pk_id_cliente=205;
DELETE FROM Cliente WHERE pk_id_cliente=290;
DELETE FROM Cliente WHERE pk_id_cliente=203;
DELETE FROM Cliente WHERE pk_id_cliente=252;
DELETE FROM Cliente WHERE pk_id_cliente=262;
DELETE FROM Cliente WHERE pk_id_cliente=282;


/*Eliminar tuplas de la tabla Membresia*/
DELETE FROM Membresia WHERE pk_No_membresia=2;
DELETE FROM Membresia WHERE pk_No_membresia=1;
DELETE FROM Membresia WHERE pk_No_membresia=9;
DELETE FROM Membresia WHERE pk_No_membresia=11;
DELETE FROM Membresia WHERE pk_No_membresia=27;
DELETE FROM Membresia WHERE pk_No_membresia=28;
DELETE FROM Membresia WHERE pk_No_membresia=29;
DELETE FROM Membresia WHERE pk_No_membresia=25;
DELETE FROM Membresia WHERE pk_No_membresia=21;
DELETE FROM Membresia WHERE pk_No_membresia=56;

/*Eliminar tuplas de la tabla Tener*/
DELETE FROM Tener WHERE  pk_id_no_socio=65;
DELETE FROM Tener WHERE  pk_id_no_socio=66;
DELETE FROM Tener WHERE pk_id_no_socio=69;
DELETE FROM Tener WHERE  pk_id_no_socio=55;
DELETE FROM Tener WHERE  pk_id_no_socio=58;
DELETE FROM Tener WHERE  pk_id_no_socio=56;
DELETE FROM Tener WHERE  pk_id_no_socio=51;
DELETE FROM Tener WHERE  pk_id_no_socio=52;
DELETE FROM Tener WHERE  pk_id_no_socio=53;


/*Eliminar tuplas de la tabla Producto*/
DELETE FROM Producto WHERE pk_id_producto=2;
DELETE FROM Producto WHERE pk_id_producto=23;
DELETE FROM Producto WHERE pk_id_producto=100;
DELETE FROM Producto WHERE pk_id_producto=21;
DELETE FROM Producto WHERE pk_id_producto=12;
DELETE FROM Producto WHERE pk_id_producto=52;
DELETE FROM Producto WHERE pk_id_producto=42;
DELETE FROM Producto WHERE pk_id_producto=26;
DELETE FROM Producto WHERE pk_id_producto=29;
DELETE FROM Producto WHERE pk_id_producto=24;



/*Eliminar tuplas de la tabla Clase*/

DELETE FROM Clase Where fk_id_nombreClase=45;
DELETE FROM Clase Where fk_id_nombreClase=5;
DELETE FROM Clase Where fk_id_nombreClase=51;
DELETE FROM Clase Where fk_id_nombreClase=78;
DELETE FROM Clase Where fk_id_nombreClase=73;
DELETE FROM Clase Where fk_id_nombreClase=48;
DELETE FROM Clase Where fk_id_nombreClase=3;
DELETE FROM Clase Where fk_id_nombreClase=57;
DELETE FROM Clase Where fk_id_nombreClase=79;
DELETE FROM Clase Where fk_id_nombreClase=10;
DELETE FROM Clase Where fk_id_nombreClase=11;

/*Eliminar tuplas de la tabla Visita*/
DELETE FROM Visita Where pk_id_socio=315;
DELETE FROM Visita Where pk_id_area=4;
DELETE FROM Visita Where pk_id_socio=350;
DELETE FROM Visita Where pk_id_socio=321;
DELETE FROM Visita Where pk_id_area=1;
DELETE FROM Visita Where pk_id_socio=349;
DELETE FROM Visita Where pk_id_socio=364;
DELETE FROM Visita Where pk_id_socio=333;
DELETE FROM Visita Where pk_id_socio=363;
DELETE FROM Visita Where pk_id_socio=399;


