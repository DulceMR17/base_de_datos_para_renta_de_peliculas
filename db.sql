
-- Borra las tablas si existen y crea las tablas necesarias para la base de datos de alquiler de películas
DROP TABLE IF EXISTS pagos CASCADE;
DROP TABLE IF EXISTS alquileres CASCADE;
DROP TABLE IF EXISTS inventario CASCADE;
DROP TABLE IF EXISTS peliculas CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;
DROP TABLE IF EXISTS sucursales CASCADE;
-- creación de las tabla categoria
CREATE TABLE categorias(
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
-- creación de la tabla peliculas
CREATE TABLE peliculas(
    pelicula_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    anio_lanzamiento INT NOT NULL,
    precio_alquiler NUMERIC(8,2) NOT NULL CHECK (precio_alquiler >= 0),
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);
-- creación de la tabla sucursales
CREATE TABLE sucursales(
    sucursal_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL
);
-- creación de la tabla clientes
CREATE TABLE clientes(
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL,
    direccion TEXT NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);
-- creación de la tabla inventario
CREATE TABLE inventario (
    inventario_id SERIAL PRIMARY KEY,
    sucursal_id INT NOT NULL,
    pelicula_id INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE NOT NULL,
    FOREIGN KEY (sucursal_id) REFERENCES sucursales(sucursal_id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(pelicula_id)
);
-- creación de la tabla alquileres
CREATE TABLE alquileres (
    alquiler_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    inventario_id INT NOT NULL,
    fecha_alquiler TIMESTAMP DEFAULT CURRENT_DATE NOT NULL,
    fecha_devolucion TIMESTAMP CHECK (fecha_devolucion >= fecha_alquiler),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (inventario_id) REFERENCES inventario(inventario_id),
    costo_total NUMERIC(8,2) NOT NULL CHECK (costo_total >= 0) 
);
-- creación de la tabla pagos 
CREATE TABLE pagos (
    pago_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    monto NUMERIC(8,2) NOT NULL CHECK (monto >= 0),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
