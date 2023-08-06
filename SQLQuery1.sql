USE avance_proyecto;
SELECT * FROM [dbo].DIRECCIONES
SELECT * FROM [dbo].Personas

CREATE TABLE Calle(
ID_Calle int not null,
Descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE Col_Bar(
ID_Col_Bar INT NOT NULL,
DESCRIPCION VARCHAR(50)
);
--Agregando la FK de calle en Col_Bar
ALTER TABLE [dbo].[Col_Bar] ADD ID_Calle INT NOT NULL UNIQUE

CREATE TABLE Municipios(
ID_Municipio INT NOT NULL,
DESCRIPCION VARCHAR(50) NOT NULL,
ID_Col_Bar INT NOT NULL UNIQUE
);

CREATE TABLE Departamentos(
ID_Departamento INT NOT NULL,
DESCRIPCION VARCHAR(50) NOT NULL,
ID_Municipio INT
);

--Procedimiento almacenado para cambiar nombres de tablas o columnas; si se va a cambiar el nombre de una columna
-- al final solo se le agrega 'column', ver ejemplo ID_Departamento
EXEC SP_RENAME
'Col_BAr', --NOMBRE ACTUAL DE LA TABLA
'Col_Bar' --NOMBRE NUEVO

EXEC SP_RENAME
'Calle', --NOMBRE ACTUAL DE LA TABLA
'Calles' --NOMBRE NUEVO

EXEC sp_RENAME
'Departamentos.ID_Departamento', --NOMBRE ACTUAL DE LA TABLA
'ID_Departamento', --NOMBRE NUEVO
'COLUMN'

EXEC SP_RENAME
'Personas.S_nommbre', --NOMBRE ACTUAL DE LA TABLA
'S_nombre', --NOMBRE NUEVO
'COLUMN'

--ALterando la tabla DIRECCIONES en la columna ID_Departamento para cambiar el tipo de dato.
ALTER TABLE [dbo].[DIRECCIONES] ALTER COLUMN ID_Departamento INT NOT NULL

--ALterando la tabla Personas en la columna ID_Direccion para cambiar el tipo de dato.
ALTER TABLE [dbo].[Personas] DROP COLUMN ID_Direccion 
ALTER TABLE [dbo].[Personas] ADD ID_Direccion INT NOT NULL

--Creación de las PK
ALTER TABLE [dbo].[Calles] ADD CONSTRAINT PK_ID_Calle PRIMARY KEY (Id_Calle)
ALTER TABLE [dbo].[Col_Bar] ADD CONSTRAINT PK_ID_Col_Bar PRIMARY KEY (ID_Col_Bar)
ALTER TABLE [dbo].[Municipios] ADD CONSTRAINT PK_ID_Municipio PRIMARY KEY (ID_Municipio)
ALTER TABLE [dbo].[Departamentos] ADD CONSTRAINT PK_ID_Departamento PRIMARY KEY (ID_Departamento)
ALTER TABLE [dbo].[DIRECCIONES] ADD CONSTRAINT PK_ID_DIRECCION PRIMARY KEY (ID_DIRECCION)
ALTER TABLE [dbo].[Personas] ADD CONSTRAINT PK_ID_Persona PRIMARY KEY (ID)

--Creacion de las FK
ALTER TABLE [dbo].[Col_Bar] ADD CONSTRAINT FK_ID_Calle FOREIGN KEY (ID_Calle) REFERENCES [dbo].[Calles](ID_Calle)
ALTER TABLE [dbo].[Municipios] ADD CONSTRAINT FK_ID_Col_Bar FOREIGN KEY (ID_Col_Bar) REFERENCES [dbo].[Col_Bar](ID_Col_Bar)
ALTER TABLE [dbo].[Departamentos] ADD CONSTRAINT FK_ID_Municipio FOREIGN KEY (ID_Municipio) REFERENCES [dbo].[Municipios](ID_Municipio)
ALTER TABLE [dbo].[DIRECCIONES] ADD CONSTRAINT FK_ID_Departamento FOREIGN KEY (ID_Departamento) REFERENCES [dbo].[Departamentos](ID_Departamento)
ALTER TABLE [dbo].[Personas] ADD CONSTRAINT FK_ID_Direccion FOREIGN KEY (ID_Direccion) REFERENCES [dbo].[DIRECCIONES](ID_Direccion)


------------------------------------AGREGANDO DATOS----------------------------------------------------------------
--AGREGANDO LOS DEPARTAMENTOS
INSERT INTO  [dbo].[Departamentos] (ID_Departamento, DESCRIPCION) 
VALUES (1, 'Atlántida'), (2, 'Choluteca'), (3, 'Colón'), (4, 'Comayagua'), (5, 'Copán'), (6, 'Cortés'), (7, 'El Paraíso'),
(8, 'Francisco Morazán'), (9, 'Gracias a Dios'), (10, 'Intibucá'), (11, 'Islas de la Bahía'), (12, 'La Paz'), (13, 'Lemnpira'),
(14, 'Ocotepeque'), (15, 'Olancho'), (16, 'Santa Bárbara'), (17, 'Valle'), (18, 'Yoro');

UPDATE [dbo].[Departamentos] SET DESCRIPCION = 'Lempira' WHERE ID_Departamento = 13;


SELECT * FROM [dbo].[DIRECCIONES]
SELECT * FROM [dbo].[Departamentos]