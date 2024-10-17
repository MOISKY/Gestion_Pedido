-- Creación de base de datos gestión de pedidos
CREATE DATABASE gestion_pedidos;

-- Seleccionar la base de datos de gestión de pedidos
USE gestion_pedidos;

-- Tabla de los datos de cliente del sistema
CREATE TABLE DB_Cliente (
    id_DB_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_DB_Cliente VARCHAR(50),
    apellido_paterno_DB_Cliente VARCHAR(50),
    apellido_materno_DB_Cliente VARCHAR(50),
    numero_telefonico_DB_Cliente VARCHAR(15),
    correo_DB_Cliente VARCHAR(100),
    direccion_DB_Cliente VARCHAR(255),
    estado_DB_Cliente VARCHAR(20)
);

-- Tabla de los datos del proveedor
CREATE TABLE DB_Proveedor (
    RFC_DB_Proveedor VARCHAR(50) PRIMARY KEY,
    nombre_DB_Proveedor VARCHAR(50),
    apellido_paterno_DB_Proveedor VARCHAR(50),
    apellido_materno_DB_Proveedor VARCHAR(50),
    numero_telefonico_DB_Proveedor VARCHAR(15),
    correo_DB_Proveedor VARCHAR(100),
    direccion_DB_Proveedor VARCHAR(255),
    estado_DB_Proveedor VARCHAR(20),
    nombre_empresa_DB_Proveedor VARCHAR(100)
);

-- Tabla de los datos de los productos del sistema
CREATE TABLE DB_Producto (
    codigo_barras_DB_Producto VARCHAR(13) PRIMARY KEY,
    nombre_DB_Producto VARCHAR(100),
    precio_DB_Producto DECIMAL(10, 2),
    tiempo_realizacion_DB_Producto TIME,
    descripcion_DB_Producto VARCHAR(255),
    estado_DB_Producto VARCHAR(20),
    RFC_proveedor_DB_Producto VARCHAR(50),
    FOREIGN KEY (RFC_proveedor_DB_Producto) REFERENCES DB_Proveedor(RFC_DB_Proveedor)
);

-- Tabla de los datos de compra del sistema
CREATE TABLE DB_Compra (
    codigo_DB_Compra VARCHAR(50) PRIMARY KEY,
    fecha_compra_DB_Compra DATE,
    hora_compra_DB_Compra TIME,
    importe_DB_Compra DECIMAL(25, 2),
    cantidad_producto_DB_Compra INT,
    estado_DB_Compra VARCHAR(25),
    codigo_barras_DB_Compra VARCHAR(13),
    FOREIGN KEY (codigo_barras_DB_Compra) REFERENCES DB_Producto(codigo_barras_DB_Producto)
);

-- Tabla de los datos del inventario del sistema
CREATE TABLE DB_Inventario (
    codigo_DB_Inventario INT PRIMARY KEY AUTO_INCREMENT,
    stock_minimo_DB_Inventario INT,
    stock_maximo_DB_Inventario INT,
    existencia_DB_Inventario INT,
    codigo_barras_producto_DB_Inventario VARCHAR(13),
    FOREIGN KEY (codigo_barras_producto_DB_Inventario) REFERENCES DB_Producto(codigo_barras_DB_Producto)
);

-- Tabla de los datos del pedido
CREATE TABLE DB_Pedido (
    numero_pedido_DB_Pedido VARCHAR(50) PRIMARY KEY,
    fecha_entrega_DB_Pedido DATE,
    hora_entrega_DB_Pedido TIME,
    ubicacion_actual_DB_Pedido VARCHAR(100),
    ubicacion_destino_DB_Pedido VARCHAR(100),
    estado_DB_Pedido VARCHAR(20),
    codigo_Barras_DB_pedido VARCHAR(13),
    id_Cliente_DB_Cliente INT,
    FOREIGN KEY (codigo_Barras_DB_pedido) REFERENCES DB_Producto(codigo_barras_DB_Producto),
    FOREIGN KEY (id_Cliente_DB_Cliente) REFERENCES DB_Cliente(id_DB_Cliente)
);

-- Tabla de los datos de información del pedido
CREATE TABLE DB_informacion_Pedido (
    codigo_DB_informacion_Pedido VARCHAR(50) PRIMARY KEY,
    fecha_entrega_DB_informacion_Pedido DATE,
    hora_entrega_DB_informacion_Pedido TIME,
    ubicacion_actual_DB_informacion_Pedido VARCHAR(100),
    ubicacion_destino_DB_informacion_Pedido VARCHAR(100),
    estado_DB_informacion_Pedido VARCHAR(25),
    numero_pedido_DB_informacion_Pedido VARCHAR(50),
    codigo_barras_DB_informacion_Pedido VARCHAR(13),
    id_Cliente_DB_informacion_Pedido INT,
    FOREIGN KEY (numero_pedido_DB_informacion_Pedido) REFERENCES DB_Pedido(numero_pedido_DB_Pedido),
    FOREIGN KEY (codigo_barras_DB_informacion_Pedido) REFERENCES DB_Producto(codigo_barras_DB_Producto),
    FOREIGN KEY (id_Cliente_DB_informacion_Pedido) REFERENCES DB_Cliente(id_DB_Cliente)
);
