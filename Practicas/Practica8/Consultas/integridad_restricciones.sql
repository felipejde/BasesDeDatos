ALTER TABLE Membresia ADD CONSTRAINT pk_Membresia_idMembresia PRIMARY KEY (idMembresia); 	
ALTER TABLE Membresia ADD CONSTRAINT ck_Membresia CHECK (Vigencia <= 36);
ALTER TABLE Producto ADD CONSTRAINT pk_Producto_idProducto PRIMARY KEY (idProducto);
ALTER TABLE Producto ADD CONSTRAINT ck_Producto CHECK (Precio <= 10000);
ALTER TABLE Clase ADD CONSTRAINT pk_Clase_idClase PRIMARY KEY Clase(idClase);
ALTER TABLE Clase ADD CONSTRAINT ck_Clase CHECK (Costo <= 350);
ALTER TABLE HoraInicio ADD CONSTRAINT pk_HoraInicio_HoraIn PRIMARY KEY HoraInicio(HoraIn);
ALTER TABLE HoraInicio ADD CONSTRAINT fk_HoraInicio_idClase FOREIGN KEY (idClase) REFERENCES Clase(idClase) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE HoraFinal ADD CONSTRAINT pk_HoraFinal_HoraFin PRIMARY KEY HoraFinal(HoraFin);
ALTER TABLE HoraFinal ADD CONSTRAINT fk_HoraFinal_idClase FOREIGN KEY (idClase) REFERENCES Clase(idClase) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE DiasImpartidos ADD CONSTRAINT pk_DiasImpartidos_DiaImp PRIMARY KEY DiasImpartidos(DiaImp);
ALTER TABLE DiasImpartidos ADD CONSTRAINT fk_DiasImpartidos_idClase FOREIGN KEY (idClase) REFERENCES Clase(idClase) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Socio ADD CONSTRAINT pk_Socio_idSocio PRIMARY KEY Socio(idSocio);
ALTER TABLE Cliente ADD CONSTRAINT pk_Cliente_idCliente PRIMARY KEY Cliente(idCliente);
ALTER TABLE Entrenador ADD CONSTRAINT pk_Entrenador_idEmpleado PRIMARY KEY Entrenador(idEmpleado);
ALTER TABLE Entrenador ADD CONSTRAINT ck_Instructor CHECK (Numero != 0);
ALTER TABLE Instructor ADD CONSTRAINT pk_Instructor_idInstructor PRIMARY KEY Instructor(idInstructor);
ALTER TABLE Area ADD CONSTRAINT pk_Area_NombreArea PRIMARY KEY Area(NombreArea);
ALTER TABLE Accesar ADD CONSTRAINT fk_Accesar_NombreArea FOREIGN KEY (NombreArea) REFERENCES Area(NombreArea) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Accesar ADD CONSTRAINT fk_Accesar_idSocio FOREIGN KEY (idSocio) REFERENCES Socio(idSocio) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TomarS ADD CONSTRAINT fk_TomarS_idSocio FOREIGN KEY (idSocio) REFERENCES Socio(idSocio) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TomarS ADD CONSTRAINT fk_TomarS_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TomarS ADD CONSTRAINT fk_TomarS_idClase FOREIGN KEY (idClase) REFERENCES Clase(idClase) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TomarC ADD CONSTRAINT fk_TomarC_idCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE TomarC ADD CONSTRAINT fk_TomarC_idClase FOREIGN KEY (idClase) REFERENCES Clase(idClase) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarS ADD CONSTRAINT fk_ComprarS_idSocio FOREIGN KEY (idSocio) REFERENCES Socio(idSocio) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarS ADD CONSTRAINT fk_ComprarS_idProducto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarE ADD CONSTRAINT fk_ComprarE_idEntrenador FOREIGN KEY (idEntrenador) REFERENCES Entrenador(idEntrenador) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarE ADD CONSTRAINT fk_ComprarE_idProducto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarI ADD CONSTRAINT fk_ComprarI_idInstructor FOREIGN KEY (idInstructor) REFERENCES Instructor(idInstructor) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarI ADD CONSTRAINT fk_ComprarI_idProducto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarC ADD CONSTRAINT fk_ComprarC_idCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ComprarC ADD CONSTRAINT fk_ComprarC_idProducto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SocioM ADD CONSTRAINT fk_SocioM_idSocio FOREIGN KEY (idSocio) REFERENCES Socio(idSocio) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SocioM ADD CONSTRAINT fk_SocioM_idMembresia FOREIGN KEY (idMembresia) REFERENCES Membresia(idMembresia) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SocioE ADD CONSTRAINT fk_SocioE_idSocio FOREIGN KEY (idSocio) REFERENCES Socio(idSocio) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SocioE ADD CONSTRAINT fk_SocioE_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES Entrenador(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Ser ADD CONSTRAINT fk_Ser_idEmpleado FOREIGN KEY (idEmpleado) REFERENCES Entrenador(idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Ser ADD CONSTRAINT fk_Ser_idInstructor FOREIGN KEY (idInstructor) REFERENCES Instructor(idInstructor) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Impartir CONSTRAINT fk_Impartir_idClase FOREIGN KEY (idClase) REFERENCES Clase(idClase) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Impartir CONSTRAINT fk_Impartir_idInstructor FOREIGN KEY (idInstructor) REFERENCES Instructor(idInstructor) ON DELETE CASCADE ON UPDATE CASCADE;