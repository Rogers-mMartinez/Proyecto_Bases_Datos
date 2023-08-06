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
ID_Municipio INT,
DESCRIPCION VARCHAR(50) NOT NULL,
ID_Col_Bar INT NOT NULL UNIQUE
);

CREATE TABLE Departamentos(
ID_Departamento INT,
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

--Creación de las PK
ALTER TABLE [dbo].[Calles] ADD CONSTRAINT PK_ID_Calle PRIMARY KEY (Id_Calles)
ALTER TABLE [dbo].[Col_Bar] ADD CONSTRAINT PK_ID_Col_Bar PRIMARY KEY (ID_Col_Bar)
ALTER TABLE [dbo].[Municipios] ADD CONSTRAINT PK_ID_Municipio PRIMARY KEY (ID_Municipio)
ALTER TABLE [dbo].[Municipios] ADD CONSTRAINT PK_ID_Departamento PRIMARY KEY (ID_Departamento)

--Creacion de las FK
ALTER TABLE [dbo].[Col_Bar] ADD CONSTRAINT FK_ID_Calle FOREIGN KEY (ID_Calle) REFERENCES [dbo].[Calle](ID_Calles)
ALTER TABLE [dbo].[Municipios] ADD CONSTRAINT FK_ID_Col_Bar FOREIGN KEY (ID_Col_Bar) REFERENCES [dbo].[Col_Bar](ID_Col_Bar)
ALTER TABLE [dbo].[Departamentos] ADD CONSTRAINT FK_ID_Municipio FOREIGN KEY (ID_Municipio) REFERENCES [dbo].[Municipios](ID_Municipio)