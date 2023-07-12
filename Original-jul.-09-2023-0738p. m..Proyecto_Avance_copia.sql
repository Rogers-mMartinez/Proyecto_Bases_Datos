--Crear la base de datos
CREATE DATABASE avance_proyecto

--Para borrar la base de datos
/*DROP DATABASE PROYECTO
*/

--Crear una tabla PERSONAS
CREATE TABLE Persona(
ID int not null,
P_nombre VARCHAR(50) NOT NULL,
S_nommbre VARCHAR(50) NOT NULL,
P_apellido VARCHAR(50) NOT NULL,
S_apelido VARCHAR(50) NOT NULL,
F_nacimiento DATETIME NOT NULL,
Correo VARCHAR(50) NOT NULL,
Telefono VARCHAR(50) NOT NULL,
ID_Direccion TEXT NOT NULL,
);


--CAMBIARLE EL NOMBRE A UNA TABLE METODO 1:
EXEC sp_rename 'Persona', 'Personas'


SELECT * FROM [dbo].Personas


--ALTER TABLE PERSONAS;


--Crear una tabla DIRECCIONES
CREATE TABLE DIRECCIONES(
ID_Direccion INT NOT NULL,
Pais text NOT NULL,
Descripcion VARCHAR(30) NOT NULL,
ID_Departamento VARCHAR(45) NOT NULL
);

/*creacion de las PK y FK*/
--personas
ALTER TABLE PERSONA ADD CONSTRAINT PK_ID PRIMARY KEY (ID);
ALTER TABLE FK_ID_Direccion ADD FOREIGN KEY (ID_Direccion) REFERENCES DIRECCIONES(ID_Direccion);
--direcciones
ALTER TABLE PK_ID_Direccion ADD PRIMARY KEY (ID_Direccion)
ALTER TABLE FK_ID_Departamento ADD FOREIGN KEY (ID_Departamento) REFERENCES DEPARTAMENTOS(ID_Departamento)