CREATE TABLE Pais (
  id_pais INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Provincia (
  id_provincia INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL
);

CREATE TABLE Usuario (
  idCliente INT NOT NULL PRIMARY KEY,
  Dni VARCHAR(45) NULL,
  Nombre VARCHAR(45) NULL,
  Apellido VARCHAR(45) NULL,
  Contrasena VARCHAR(45) NULL,
  Email VARCHAR(45) NULL,
  Direccion VARCHAR(45) NULL,
  Provincia INT NULL REFERENCES Provincia (id_provincia),
  Pais INT NULL REFERENCES Pais (id_pais)
);

CREATE TABLE Moneda (
  idMoneda INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) NULL,
  Cotizacion VARCHAR(45) NULL
);

CREATE TABLE Saldo (
  idSaldo INT NOT NULL PRIMARY KEY,
  Monto INT NOT NULL,
  Moneda INT NOT NULL FOREIGN KEY REFERENCES Moneda (idMoneda),
  Usuario INT NOT NULL FOREIGN KEY REFERENCES Usuario (idCliente)
);

CREATE TABLE Servicio (
  idServicio INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(45) NULL,
  Usuario INT NOT NULL REFERENCES Usuario (idCliente)
);

CREATE TABLE Factura (
  idFactura INT NOT NULL PRIMARY KEY,
  Monto INT NOT NULL,
  Fecha DATE NOT NULL,
  Servicio INT NOT NULL REFERENCES Servicio (idServicio)
);

CREATE TABLE Transferencia (
  idTranferencia INT NOT NULL PRIMARY KEY,
  Fecha DATE NULL,
  Monto VARCHAR(45) NULL,
  Usuario INT NOT NULL REFERENCES Usuario (idCliente),
  Moneda INT NOT NULL REFERENCES Moneda (idMoneda),
  Destino INT NOT NULL REFERENCES Usuario (idCliente),
);

CREATE TABLE PlazoFijo (
  idOperacionPlazo INT NOT NULL PRIMARY KEY,
  tiempo VARCHAR(45) NULL,
  monto VARCHAR(45) NULL,
  Usuario INT NOT NULL REFERENCES Usuario (idCliente)
);

CREATE TABLE FondoComun (
  idFondoComun INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(45) NULL,
  monto VARCHAR(45) NULL,
  Usuario INT NOT NULL REFERENCES Usuario (idCliente),
);

CREATE TABLE Tipo_Mov (
  id_tipo INT NOT NULL PRIMARY KEY,
  tipo_movimiento VARCHAR(100) NOT NULL
);


CREATE TABLE Movimiento (
  id_movimiento INT NOT NULL PRIMARY KEY,
  fec_movimiento DATE NOT NULL,
  Tipo INT NOT NULL REFERENCES Tipo_Mov (id_tipo),
  idCliente INT NOT NULL REFERENCES Usuario (idCliente),
  monto INT NOT NULL,
  num_comprobante INT NOT NULL,
);
