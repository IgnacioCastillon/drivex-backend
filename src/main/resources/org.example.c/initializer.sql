USE DriveX;

-- OPCIONAL: limpia tablas si ya tenían datos
-- Cuidado: borra TODO
-- DELETE FROM transactions;
-- DELETE FROM users;
-- DELETE FROM vehicles;

START TRANSACTION;

---------------------------
-- 1) VEHICLES
---------------------------
INSERT INTO vehicles
(reference, brand, model, description, price, year, fuel_type, created_at, updated_at)
VALUES
    ('DRV-001', 'Tesla',      'Model 3',  'Sedán eléctrico para uso diario',          34990.00, 2022, 'Electric', NOW(), NOW()),
    ('DRV-002', 'Toyota',     'Corolla',  'Compacto fiable, ideal como primer coche', 17990.00, 2018, 'Gas',      NOW(), NOW()),
    ('DRV-003', 'BMW',        '320d',     'Berlina cómoda para viajes largos',        27990.00, 2020, 'diesel',   NOW(), NOW()),
    ('DRV-004', 'Ford',       'Focus',    'Compacto versátil para ciudad',            15990.00, 2017, 'Gas',      NOW(), NOW()),
    ('DRV-005', 'Volkswagen', 'Golf',     'Hatchback equilibrado en todo',            18990.00, 2019, 'Gas',      NOW(), NOW()),
    ('DRV-006', 'Yamaha',     'MT-07',    'Moto naked ágil y divertida',               7490.00, 2021, 'Gas',      NOW(), NOW());

---------------------------
-- 2) USERS
---------------------------
INSERT INTO users
(username, email, password_hash, first_name, last_name,
 phone_number, is_active, created_at, updated_at, role)
VALUES
    ('admin',  'admin@drivex.com',        '$2a$10$HASH_FAKE_ADMIN', 'System', 'Admin',   '+34111111111', 1, NOW(), NOW(), 'Admin'),
    ('jdoe',   'john.doe@example.com',    '$2a$10$HASH_FAKE_USER1', 'John',   'Doe',     '+34911111111', 1, NOW(), NOW(), 'user'),
    ('maria',  'maria.lopez@example.com', '$2a$10$HASH_FAKE_USER2', 'María',  'López',   '+34922222222', 1, NOW(), NOW(), 'user'),
    ('pablo',  'pablo.ruiz@example.com',  '$2a$10$HASH_FAKE_USER3', 'Pablo',  'Ruiz',    '+34933333333', 1, NOW(), NOW(), 'user'),
    ('laura',  'laura.garcia@example.com','$2a$10$HASH_FAKE_USER4', 'Laura',  'García',  '+34944444444', 1, NOW(), NOW(), 'user');

-- Nota: cambia los password_hash por hashes reales si luego usas auth.

---------------------------
-- 3) TRANSACTIONS
---------------------------
-- Suponemos IDs:
-- vehicles: 1..6 en el orden insertado
-- users:    1..5 en el orden insertado

INSERT INTO transactions
(vehicle_id, buyer_id, seller_id, transaction_type, amount,
 order_status, transaction_date, rental_start_date, rental_end_data)
VALUES
-- Compra de Tesla Model 3 de María (3) a John Doe (2)
(1, 2, 3, 'purchase', 34000.00, 'paid',      NOW(),        NULL,        NULL),

-- Compra de BMW 320d de Pablo (4) a Laura (5)
(3, 5, 4, 'purchase', 27000.00, 'delivered', NOW(),        NULL,        NULL),

-- Alquiler de Toyota Corolla por 3 días (John alquila a María)
(2, 2, 3, 'rental',    180.00,  'pending',   NOW(),        CURDATE()+1, CURDATE()+4),

-- Alquiler de VW Golf por 5 días (Laura alquila a Pablo)
(5, 5, 4, 'rental',    260.00,  'shipped',   NOW(),        CURDATE()+2, CURDATE()+7),

-- Reserva de moto Yamaha aún pendiente
(6, 4, 3, 'purchase',  7200.00, 'pending',   NOW(),        NULL,        NULL);

COMMIT;

-- Comprobaciones rápidas
SELECT * FROM vehicles;
SELECT * FROM users;
SELECT * FROM transactions;
