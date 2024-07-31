-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS ConstruccionPC;
USE ConstruccionPC;

-- Creación de la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

-- Creación de la tabla Configuraciones
CREATE TABLE IF NOT EXISTS Configuraciones (
    configuracion_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    nombre_configuracion VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);

-- Creación de la tabla Componentes
CREATE TABLE IF NOT EXISTS Componentes (
    componente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_componente VARCHAR(100) NOT NULL,
    tipo_componente VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Creación de la tabla Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    configuracion_id INT,
    fecha_pedido DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (configuracion_id) REFERENCES Configuraciones(configuracion_id)
);

-- Insertar algunos datos de ejemplo en la tabla Usuarios
INSERT INTO Usuarios (nombre, email, password, direccion, telefono)
VALUES ('Juan Perez', 'juan.perez@example.com', 'password123', 'Calle Falsa 123', '1234567890'),
       ('Maria Gomez', 'maria.gomez@example.com', 'password456', 'Avenida Siempre Viva 456', '0987654321');

-- Insertar algunos datos de ejemplo en la tabla Componentes
INSERT INTO Componentes (nombre_componente, tipo_componente, precio, stock)
VALUES ('Procesador Intel i5', 'Procesador', 250.00, 10),
       ('Memoria RAM 8GB', 'Memoria', 80.00, 20),
       ('Disco Duro 1TB', 'Almacenamiento', 50.00, 15);

-- Insertar algunos datos de ejemplo en la tabla Configuraciones
INSERT INTO Configuraciones (usuario_id, nombre_configuracion, presupuesto, fecha_creacion)
VALUES (1, 'Configuración Gamer', 1000.00, '2024-01-01 12:00:00'),
       (2, 'Configuración Oficina', 600.00, '2024-01-02 15:00:00');

-- Insertar algunos datos de ejemplo en la tabla Pedidos
INSERT INTO Pedidos (configuracion_id, fecha_pedido, total, estado)
VALUES (1, '2024-02-01 10:00:00', 900.00, 'En proceso'),
       (2, '2024-02-02 11:00:00', 500.00, 'Completado');

-- Consultar todos los registros de la tabla Usuarios
SELECT * FROM Usuarios;

-- Consultar todos los registros de la tabla Componentes
SELECT * FROM Componentes;

-- Consultar todos los registros de la tabla Configuraciones
SELECT * FROM Configuraciones;

-- Consultar todos los registros de la tabla Pedidos
SELECT * FROM Pedidos;

-- Actualizar datos de un registro en la tabla Usuarios
UPDATE Usuarios
SET direccion = 'Calle Actualizada 789'
WHERE usuario_id = 1;

-- Contar el número de registros en la tabla Usuarios
SELECT COUNT(*) FROM Usuarios;



