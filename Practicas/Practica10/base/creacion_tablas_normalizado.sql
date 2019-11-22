CREATE TABLE Persona(
--LLAVE
pk_id_persona NUMBER,
Nombre VARCHAR(90),
Fecha_Nac DATE,
Edad NUMBER,
Sexo CHAR(1),
Telefono VARCHAR(30),
Email VARCHAR(60)
);

 CREATE TABLE Entrenador(
--llave
pk_id_empleado INTEGER,
fk_idPersona NUMBER,
Direccion VARCHAR(90)
 );
 
CREATE TABLE Instructor(
--llave
pk_id_instructor INTEGER,
fk_idPersona NUMBER
);

CREATE TABLE Socio(
--llave 
pk_id_socio INTEGER,
fk_idPersona NUMBER,
fk_id_clase INTEGER,
fk_id_cliente NUMBER,
Contacto_fam VARCHAR(30)
);


CREATE TABLE Cliente(
--llave
pk_id_cliente NUMBER,
fk_idPersona NUMBER,
fecha_registro DATE,
puntos_dados NUMBER

);

CREATE TABLE Clase(
--llave
pk_id_clase INTEGER,
fk_id_nombreClase INTEGER,
dia_semana VARCHAR(20),
Hora_inicio DATE,
Hora_final DATE
);

CREATE TABLE Nombre_Clase(
pk_id_nombreClase INTEGER,
nombre_clase VARCHAR(50),
puntos NUMBER
);

CREATE TABLE Area(
--llave
pk_id_area INTEGER,
nombre_area VARCHAR(30)
);

CREATE TABLE visita(
pk_id_socio INTEGER,
pk_id_area INTEGER

);

CREATE TABLE Membresia(
--llave
pk_No_membresia NUMBER,
fk_id_tipo NUMBER
); 

CREATE TABLE TipoMembresia(
--llave
pk_id_tipo NUMBER,
tipo VARCHAR(30),
Costo INTEGER,
Beneficio VARCHAR(500)
);

CREATE TABLE Tener(
pk_id_no_socio INTEGER,
pk_id_no_memb NUMBER
);

CREATE TABLE Producto(
--llave
pk_id_producto INTEGER,
fk_id_empleado INTEGER,
fk_id_cliente NUMBER,
Nombre_producto VARCHAR(60),
Marca VARCHAR(60),
Precio INTEGER,
Presentacion VARCHAR(50),
Descripcion VARCHAR(100),
Cantidad_existencia NUMBER
);

CREATE TABLE Imparte(
fk_id_empleado INTEGER,
fk_id_instructor INTEGER,
fk_id_clase INTEGER
);

