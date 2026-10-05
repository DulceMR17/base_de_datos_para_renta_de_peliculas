-- Categorías
INSERT INTO categorias (nombre) VALUES
('Acción'), ('Comedia'), ('Drama'), ('Ciencia Ficción'), ('Terror');

-- Sucursales (5)
INSERT INTO sucursales (nombre, direccion) VALUES
('Sucursal Central', 'Av. Reforma 123, Zona 10'),
('Sucursal Norte', 'Calle Las Flores 45, Zona 1'),
('Sucursal Sur', 'Calzada Aguilar Batres 89, Zona 11'),
('Sucursal Este', 'Blvd. Los Próceres 12, Zona 10'),
('Sucursal Oeste', 'Anillo Periférico 304, Zona 7');

-- Películas (15)
INSERT INTO peliculas (titulo, director, anio_lanzamiento, precio_alquiler, categoria_id) VALUES
('Inception', 'Christopher Nolan', 2010, 3.50, 4),
('Dune: Part Two', 'Denis Villeneuve', 2024, 4.50, 4),
('Oppenheimer', 'Christopher Nolan', 2023, 4.50, 3),
('The Dark Knight', 'Christopher Nolan', 2008, 3.00, 1),
('Everything Everywhere All at Once', 'Daniel Kwan', 2022, 4.00, 2),
('Parasite', 'Bong Joon-ho', 2019, 3.50, 3),
('Top Gun: Maverick', 'Joseph Kosinski', 2022, 4.00, 1),
('Spider-Man: Across the Spider-Verse', 'Joaquim Dos Santos', 2023, 4.00, 1),
('Alien: Romulus', 'Fede Álvarez', 2024, 4.50, 5),
('Get Out', 'Jordan Peele', 2017, 3.00, 5),
('Superbad', 'Greg Mottola', 2007, 2.50, 2),
('Barbie', 'Greta Gerwig', 2023, 4.00, 2),
('Interstellar', 'Christopher Nolan', 2014, 3.50, 4),
('Gladiator II', 'Ridley Scott', 2024, 4.50, 1),
('The Whale', 'Darren Aronofsky', 2022, 3.50, 3);

-- Clientes (10)
INSERT INTO clientes (nombre, email, telefono, direccion) VALUES
('Juan Pérez', 'juan.perez@email.com', '555-0101', 'Zona 10, Ciudad'),
('María López', 'maria.lopez@email.com', '555-0102', 'Zona 14, Ciudad'),
('Carlos Gómez', 'carlos.gomez@email.com', '555-0103', 'Zona 1, Ciudad'),
('Ana Martínez', 'ana.martinez@email.com', '555-0104', 'Zona 11, Ciudad'),
('Luis Hernández', 'luis.hernandez@email.com', '555-0105', 'Zona 7, Ciudad'),
('Sofia Ramirez', 'sofia.ramirez@email.com', '555-0106', 'Zona 15, Ciudad'),
('Diego Morales', 'diego.morales@email.com', '555-0107', 'Zona 9, Ciudad'),
('Laura Torres', 'laura.torres@email.com', '555-0108', 'Mixco, Guatemala'),
('Pedro Castillo', 'pedro.castillo@email.com', '555-0109', 'Villa Nueva, Guatemala'),
('Elena Rios', 'elena.rios@email.com', '555-0110', 'Antigua Guatemala');

-- Inventario (Asociación de películas y sucursales)
INSERT INTO inventario (pelicula_id, sucursal_id, disponible) VALUES
(1, 1, true), (2, 1, true), (3, 1, false), (4, 1, true),
(2, 2, true), (5, 2, true), (6, 2, true),
(7, 3, false), (8, 3, true), (9, 3, true),
(10, 4, true), (11, 4, true), (12, 4, true),
(13, 5, true), (14, 5, true), (15, 5, true);

-- Alquileres (10)
INSERT INTO alquileres (cliente_id, inventario_id, fecha_alquiler, fecha_devolucion, costo_total) VALUES
(1, 1, CURRENT_TIMESTAMP - INTERVAL '15 days', CURRENT_TIMESTAMP - INTERVAL '12 days', 3.50),
(2, 3, CURRENT_TIMESTAMP - INTERVAL '5 days', NULL, 4.50),
(3, 5, CURRENT_TIMESTAMP - INTERVAL '20 days', CURRENT_TIMESTAMP - INTERVAL '18 days', 4.00),
(4, 8, CURRENT_TIMESTAMP - INTERVAL '2 days', CURRENT_TIMESTAMP - INTERVAL '1 day', 4.00),
(5, 7, CURRENT_TIMESTAMP - INTERVAL '4 days', NULL, 4.00),
(1, 2, CURRENT_TIMESTAMP - INTERVAL '10 days', CURRENT_TIMESTAMP - INTERVAL '8 days', 4.50),
(6, 10, CURRENT_TIMESTAMP - INTERVAL '25 days', CURRENT_TIMESTAMP - INTERVAL '22 days', 3.00),
(7, 12, CURRENT_TIMESTAMP - INTERVAL '30 days', CURRENT_TIMESTAMP - INTERVAL '28 days', 4.00),
(8, 14, CURRENT_TIMESTAMP - INTERVAL '12 days', CURRENT_TIMESTAMP - INTERVAL '10 days', 4.50),
(9, 15, CURRENT_TIMESTAMP - INTERVAL '1 day', NULL, 3.50);

-- Pagos (10)
INSERT INTO pagos (cliente_id, monto, fecha_pago) VALUES
(1, 3.50, CURRENT_TIMESTAMP - INTERVAL '15 days'),
(2, 4.50, CURRENT_TIMESTAMP - INTERVAL '5 days'),
(3, 4.00, CURRENT_TIMESTAMP - INTERVAL '20 days'),
(4, 4.00, CURRENT_TIMESTAMP - INTERVAL '2 days'),
(5, 4.00, CURRENT_TIMESTAMP - INTERVAL '4 days'),
(1, 4.50, CURRENT_TIMESTAMP - INTERVAL '10 days'),
(6, 3.00, CURRENT_TIMESTAMP - INTERVAL '25 days'),
(7, 4.00, CURRENT_TIMESTAMP - INTERVAL '30 days'),
(8, 4.50, CURRENT_TIMESTAMP - INTERVAL '12 days'),
(9, 3.50, CURRENT_TIMESTAMP - INTERVAL '1 day');