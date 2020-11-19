insert into Pais values 
(1, 'Argentina'),
(2, 'Uruguay');

insert into Provincia values
(1, 'Cordoba'),
(2, 'Buenos Aires');

insert into Usuario values
(1, '33111222', 'Juan', 'Perez', '123456', 'juan@gmail.com', 'Colon 444', 1, 1),
(2, '33111223', 'Lucas', 'Sanchez', '123457', 'lucas@gmail.com', 'Gral Paz 444', 1, 1);

insert into Servicio values
(1, 'Epec', 1),
(2, 'Aguas cordobesas', 1),
(3, 'Epec', 2);

insert into Factura values
(1, 3000, '01-08-2020', 1),
(2, 2000, '01-09-2020', 1),
(3, 650, '01-08-2020', 2);

insert into Moneda values
(1, 'Peso Argentino', '1'),
(2, 'Dolar', '76,87'),
(3, 'Bitcoin', '812.479,27');

insert into Saldo values
(1, 10000, 1, 1),
(2, 20000, 2, 1),
(3, 5000, 1, 2);

insert into Transferencia values
(1, '02-10-2020', 200, 1, 1, 2);



/* Algunas consultas */

--dame los usuarios de la base de datos
SELECT *
FROM Usuario;

--dame los saldos del dni 33222111
SELECT s.Monto, 
       m.Nombre
FROM Usuario u, 
     Saldo s, 
     Moneda m
WHERE u.idCliente = s.Usuario
      AND s.Moneda = m.idMoneda
      AND u.Dni = 33111222;