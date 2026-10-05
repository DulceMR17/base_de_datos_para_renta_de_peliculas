CREATE DATABASE IF NOT EXISTS movierental_db;
USE movierental_db;

-- Borra las tablas si existen
DROP TABLE IF EXISTS pagos;
DROP TABLE IF EXISTS alquileres;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS sucursales;

-- Creación de la tabla categorias
CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla peliculas
CREATE TABLE peliculas (
    pelicula_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    anio_lanzamiento INT NOT NULL,
    precio_alquiler DECIMAL(8,2) NOT NULL CHECK (precio_alquiler >= 0),
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- Creación de la tabla sucursales
CREATE TABLE sucursales (
    sucursal_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL
);

-- Creación de la tabla clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL,
    direccion TEXT NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Creación de la tabla inventario
CREATE TABLE inventario (
    inventario_id INT PRIMARY KEY AUTO_INCREMENT,
    sucursal_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE NOT NULL,
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(pelicula_id)
);

-- Creación de la tabla alquileres
CREATE TABLE alquileres (
    alquiler_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    inventario_id INT NOT NULL,
    fecha_alquiler DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_devolucion DATETIME,
    costo_total DECIMAL(8,2) NOT NULL CHECK (costo_total >= 0),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (inventario_id) REFERENCES inventario(inventario_id),
    CONSTRAINT chk_fecha_devolucion CHECK (fecha_devolucion IS NULL OR fecha_devolucion >= fecha_alquiler)
);

-- Creación de la tabla pagos
CREATE TABLE pagos (
    pago_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    monto DECIMAL(8,2) NOT NULL CHECK (monto >= 0),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);