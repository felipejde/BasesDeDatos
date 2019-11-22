ALTER TABLE Tener ADD CONSTRAINT ck_Tener_memb CHECK (pk_id_no_memb IS NOT NULL);
ALTER TABLE Tener ADD CONSTRAINT ck_Tener_socio CHECK (pk_id_no_socio IS NOT NULL);


--llaves primarias
ALTER TABLE Persona  ADD CONSTRAINT pk_id_persona PRIMARY KEY (pk_id_persona);
ALTER TABLE Entrenador  ADD CONSTRAINT pk_id_empleado PRIMARY KEY (pk_id_empleado);
ALTER TABLE Instructor  ADD CONSTRAINT pk_id_instructor PRIMARY KEY (pk_id_instructor);
ALTER TABLE Socio ADD CONSTRAINT pk_id_socio PRIMARY KEY (pk_id_socio);
ALTER TABLE Cliente ADD CONSTRAINT pk_id_cliente PRIMARY KEY (pk_id_cliente);
ALTER TABLE Clase ADD CONSTRAINT pk_id_clase PRIMARY KEY (pk_id_clase);
ALTER TABLE Nombre_Clase ADD CONSTRAINT pk_id_nombre_clase PRIMARY KEY (pk_id_nombreClase);
ALTER TABLE Area ADD CONSTRAINT pk_id_area PRIMARY KEY (pk_id_area);
ALTER TABLE visita ADD CONSTRAINT pk_id_visita PRIMARY KEY (pk_id_socio,pk_id_area);
ALTER TABLE Tener ADD CONSTRAINT pk_Tener PRIMARY KEY (pk_id_no_memb,pk_id_no_socio);
ALTER TABLE Membresia ADD CONSTRAINT pk_id_membresia PRIMARY KEY (pk_No_membresia);
ALTER TABLE TipoMembresia ADD CONSTRAINT pk_id_tipo PRIMARY KEY (pk_id_tipo);
ALTER TABLE Producto ADD CONSTRAINT pk_id_producto PRIMARY KEY (pk_id_producto);

--Llaves foraneas
ALTER TABLE Entrenador ADD CONSTRAINT fk_Entrenador_id_persona FOREIGN KEY (fk_idpersona) REFERENCES Persona(pk_id_persona) ON DELETE CASCADE;
ALTER TABLE Instructor ADD CONSTRAINT fk_Instructor_id_persona FOREIGN KEY (fk_idpersona) REFERENCES Persona(pk_id_persona)ON DELETE CASCADE;
ALTER TABLE Cliente ADD CONSTRAINT fk_Cliente_id_persona FOREIGN KEY (fk_idpersona) REFERENCES Persona(pk_id_persona)ON DELETE CASCADE;
ALTER TABLE Socio ADD CONSTRAINT fk_Socio_id_persona FOREIGN KEY (fk_idpersona) REFERENCES Persona(pk_id_persona)ON DELETE CASCADE;
ALTER TABLE Socio ADD CONSTRAINT fk_Socio_id_clase FOREIGN KEY (fk_id_clase) REFERENCES Clase(pk_id_clase)ON DELETE CASCADE;
ALTER TABLE Socio ADD CONSTRAINT fk_Socio_id_cliente FOREIGN KEY (fk_id_cliente) REFERENCES Cliente(pk_id_cliente)ON DELETE CASCADE;
ALTER TABLE Clase ADD CONSTRAINT fk_Clase_Nombre_Cliente FOREIGN KEY (fk_id_nombreClase) REFERENCES Nombre_Clase(pk_id_nombreClase)ON DELETE CASCADE;
ALTER TABLE Tener ADD CONSTRAINT fk_Tener_no_memb FOREIGN KEY (pk_id_no_memb) REFERENCES Membresia(pk_No_membresia)ON DELETE CASCADE;
ALTER TABLE Tener ADD CONSTRAINT fk_Tener_no_socio FOREIGN KEY (pk_id_no_socio) REFERENCES Socio(pk_id_socio)ON DELETE CASCADE;
ALTER TABLE Membresia ADD CONSTRAINT fk_Memebresia_tipo FOREIGN KEY (fk_id_tipo) REFERENCES TipoMembresia(pk_id_tipo)ON DELETE CASCADE;
ALTER TABLE Producto ADD CONSTRAINT fk_Producto_id_empleado FOREIGN KEY (fk_id_empleado) REFERENCES Entrenador(pk_id_empleado)ON DELETE CASCADE;
ALTER TABLE Producto ADD CONSTRAINT fk_Producto_id_cliente FOREIGN KEY (fk_id_cliente) REFERENCES Cliente(pk_id_cliente)ON DELETE CASCADE;

--restricciones
ALTER TABLE Persona ADD CONSTRAINT ck_Persona CHECK (Edad > 0);
ALTER TABLE Persona ADD CONSTRAINT unq_Persona UNIQUE (Email);
ALTER TABLE Entrenador ADD CONSTRAINT ck_Entrenador CHECK (Direccion IS NOT NULL);
ALTER TABLE Socio ADD CONSTRAINT ck_Socio CHECK (Contacto_fam IS NOT NULL);
ALTER TABLE Cliente ADD CONSTRAINT ck_Cliente CHECK (puntos_dados IS NOT NULL);
ALTER TABLE Cliente ADD CONSTRAINT ck_Cliente_fecha CHECK (fecha_registro IS NOT NULL);
ALTER TABLE nombre_clase ADD CONSTRAINT ck_Clase_nombre CHECK (nombre_clase IS NOT NULL);
ALTER TABLE Clase ADD CONSTRAINT ck_Clase_dia CHECK (dia_semana IS NOT NULL);
ALTER TABLE Producto ADD CONSTRAINT ck_Producto_precio CHECK (Precio>=0);
ALTER TABLE Producto ADD CONSTRAINT ck_Producto_nombre CHECK (nombre_producto IS NOT NULL);

