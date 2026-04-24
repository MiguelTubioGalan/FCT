-- 1. Denominaciones de Origen (D.O.)
CREATE TABLE Denominaciones (
    id_do INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    region VARCHAR(50) DEFAULT 'Galicia'
);

-- 2. Bodegas (Empresas)
CREATE TABLE Bodegas (
    id_bodega INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    cif VARCHAR(20) UNIQUE,
    direccion VARCHAR(255),
    historia TEXT,
    web_url VARCHAR(255),
    id_do INT,
    FOREIGN KEY (id_do) REFERENCES Denominaciones(id_do) ON DELETE SET NULL
);

-- 3. Vinos
CREATE TABLE Vinos (
    id_vino INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    tipo ENUM('Blanco', 'Tinto', 'Rosado', 'Espumoso'),
    añada INT,
    graduacion DECIMAL(4,2),
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    imagen_url VARCHAR(255),
    id_bodega INT,
    FOREIGN KEY (id_bodega) REFERENCES Bodegas(id_bodega) ON DELETE CASCADE
);

-- 4. Variedades de Uva (Muchos a Muchos con Vinos)
CREATE TABLE Uvas (
    id_uva INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Vino_Uvas (
    id_vino INT,
    id_uva INT,
    porcentaje INT, -- Opcional: % de cada uva en el coupage
    PRIMARY KEY (id_vino, id_uva),
    FOREIGN KEY (id_vino) REFERENCES Vinos(id_vino) ON DELETE CASCADE,
    FOREIGN KEY (id_uva) REFERENCES Uvas(id_uva) ON DELETE CASCADE
);

-- 5. Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- Aquí guardarás el hash, nunca plano
    direccion_envio TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Reseñas
CREATE TABLE Reseñas (
    id_reseña INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_vino INT,
    puntuacion TINYINT CHECK (puntuacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_vino) REFERENCES Vinos(id_vino) ON DELETE CASCADE
);

-- 7. Pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('Pendiente', 'Pagado', 'Enviado', 'Cancelado') DEFAULT 'Pendiente',
    metodo_pago ENUM('Tarjeta', 'PayPal', 'Simulado') DEFAULT 'Simulado',
    total DECIMAL(10,2) NOT NULL,
    direccion_entrega_snapshot TEXT, -- Guardamos la dirección aquí por si el usuario la cambia en su perfil después
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE SET NULL
);

-- 8. Detalle del Pedido
CREATE TABLE Pedido_Detalle (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_vino INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_vino) REFERENCES Vinos(id_vino)
);

-- 9.Historial de Transacciones
CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    referencia_pago VARCHAR(100), -- Un código aleatorio que generarás tú (ej: "SIM-12345")
    estado_pago VARCHAR(20) DEFAULT 'EXITOSO', 
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido) ON DELETE CASCADE
);