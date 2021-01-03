/* 1 - Click secundario sobre Bases de datos o en ingles Databases */
/* 2 - Click Nueva base de datos o en ingles New database */
/* 3 - Ponerle como nombre DBbilletera y aceptar */
/* 4 - Finalmente, ejecutar este archivo para que se creen las tablas */

USE DBbilletera

CREATE TABLE Usuario (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  Dni VARCHAR(100) NOT NULL,
  Telefono VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Usuario VARCHAR(100) NOT NULL,
  Contrasena VARCHAR(100) NOT NULL,
  Pais VARCHAR(100) NOT NULL,
  Provincia VARCHAR(100) NOT NULL,
  Localidad VARCHAR(100) NOT NULL,
  Calle VARCHAR(100) NOT NULL,
  Altura VARCHAR(100) NOT NULL
);

CREATE TABLE Saldo (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Usuario INT NOT NULL FOREIGN KEY REFERENCES Usuario (Id),
  Monto INT NOT NULL,
  Moneda VARCHAR(100) NOT NULL
);

CREATE TABLE Operacion (
  Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  Usuario INT NOT NULL FOREIGN KEY REFERENCES Usuario (Id),
  Fecha DATE,
  Monto INT NOT NULL,
  Tipo VARCHAR(100) NOT NULL
);

INSERT Usuario VALUES 
('Lautaro', 'Bustos','33111222', '351478965', 'laubus@gmail.com','laubus', '123456', 'arg', 'cba', 'cap', 'Talleres', '4521')