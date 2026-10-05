-- procedure.sql
CREATE OR REPLACE PROCEDURE registrar_pago(
    p_cliente_id INT,
    p_monto NUMERIC(8, 2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_existe_cliente INT;
BEGIN
    -- Validar que el monto sea positivo
    IF p_monto <= 0 THEN
        RAISE EXCEPTION 'Error: El monto del pago debe ser mayor a cero. Valor recibido: %', p_monto;
    END IF;

    -- Validar existencia del cliente
    SELECT COUNT(*) INTO v_existe_cliente 
    FROM clientes 
    WHERE cliente_id = p_cliente_id;

    IF v_existe_cliente = 0 THEN
        RAISE EXCEPTION 'Error: El cliente con ID % no existe.', p_cliente_id;
    END IF;

    -- Insertar el registro de pago si pasa las validaciones
    INSERT INTO pagos (cliente_id, monto, fecha_pago)
    VALUES (p_cliente_id, p_monto, CURRENT_TIMESTAMP);

    RAISE NOTICE 'Pago registrado exitosamente para el cliente ID: %, Monto: %', p_cliente_id, p_monto;

EXCEPTION
    WHEN OTHERS THEN
        -- El bloque EXCEPTION en PL/pgSQL realiza un ROLLBACK implícito del bloque
        RAISE NOTICE 'Transacción revertida (ROLLBACK): %', SQLERRM;
END;
$$;