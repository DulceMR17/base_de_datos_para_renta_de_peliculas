-- 1. Calcular los ingresos generados por cada sucursal en el último mes
SELECT 
    s.sucursal_id,
    s.nombre AS sucursal,
    COALESCE(SUM(a.costo_total), 0) AS ingresos_ultimo_mes
FROM sucursales s
JOIN inventario i ON s.sucursal_id = i.sucursal_id
JOIN alquileres a ON i.inventario_id = a.inventario_id
WHERE a.fecha_alquiler >= (CURRENT_DATE - INTERVAL '1 month')
GROUP BY s.sucursal_id, s.nombre;

-- 2. Consultar el cliente con el mayor monto total de pagos realizados
SELECT 
    c.cliente_id,
    c.nombre,
    c.email,
    SUM(p.monto) AS total_pagado
FROM clientes c
JOIN pagos p ON c.cliente_id = p.cliente_id
GROUP BY c.cliente_id, c.nombre, c.email
ORDER BY total_pagado DESC
LIMIT 1;

-- 3. Obtener el porcentaje de películas alquiladas por género
SELECT 
    cat.nombre AS genero,
    COUNT(a.alquiler_id) AS total_alquileres,
    ROUND((COUNT(a.alquiler_id) * 100.0 / (SELECT COUNT(*) FROM alquileres)), 2) AS porcentaje
FROM alquileres a
JOIN inventario i ON a.inventario_id = i.inventario_id
JOIN peliculas p ON i.pelicula_id = p.pelicula_id
JOIN categorias cat ON p.categoria_id = cat.categoria_id
GROUP BY cat.nombre
ORDER BY porcentaje DESC;

-- 4. Identificar las sucursales con mayor número de transacciones de alquiler
SELECT 
    s.sucursal_id,
    s.nombre AS sucursal,
    COUNT(a.alquiler_id) AS total_alquileres
FROM sucursales s
JOIN inventario i ON s.sucursal_id = i.sucursal_id
JOIN alquileres a ON i.inventario_id = a.inventario_id
GROUP BY s.sucursal_id, s.nombre
ORDER BY total_alquileres DESC;

-- 5. Listar todas las películas disponibles para alquiler (título, género y precio)
SELECT DISTINCT
    p.pelicula_id,
    p.titulo,
    cat.nombre AS genero,
    p.precio_alquiler
FROM peliculas p
JOIN categorias cat ON p.categoria_id = cat.categoria_id
JOIN inventario i ON p.pelicula_id = i.pelicula_id
WHERE i.disponible = TRUE;

-- 6. Obtener el historial de alquileres de un cliente específico (ejemplo: cliente_id = 1)
SELECT 
    a.alquiler_id,
    p.titulo AS pelicula,
    a.fecha_alquiler,
    a.fecha_devolucion,
    a.costo_total
FROM alquileres a
JOIN inventario i ON a.inventario_id = i.inventario_id
JOIN peliculas p ON i.pelicula_id = p.pelicula_id
WHERE a.cliente_id = 1
ORDER BY a.fecha_alquiler DESC;

-- 7. Consultar las películas con precios de alquiler superiores a un valor especificado (ej: 3.50)
SELECT 
    p.pelicula_id,
    p.titulo,
    cat.nombre AS genero,
    p.precio_alquiler
FROM peliculas p
JOIN categorias cat ON p.categoria_id = cat.categoria_id
WHERE p.precio_alquiler > 3.50;

-- 8. Listar las películas lanzadas en los últimos 5 años que están disponibles para alquiler
SELECT DISTINCT
    p.pelicula_id,
    p.titulo,
    p.anio_lanzamiento,
    p.precio_alquiler
FROM peliculas p
JOIN inventario i ON p.pelicula_id = i.pelicula_id
WHERE p.anio_lanzamiento >= (EXTRACT(YEAR FROM CURRENT_DATE) - 5)
  AND i.disponible = TRUE;