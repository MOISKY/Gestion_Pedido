--Creacion de base de datos gestion pedidos--
CREATE DATABASE gestion_pedidos;

--Se la base de datos de gestion de pedidos--
USE gestion_pedidos;

--Tabla de los datos de cliente del sistema---
CREATE TABLE DB_Cliente(
    id_DB_Cliente INT PRIMARY KEY AUTO INCREMENT,
    nombre_DB_Cliente VARCHAR(50),
    apellido_paterno_DB_Cliente VARCHAR(50),
    apellido_materno_DB_Cliente VARCHAR(50),
    numero_telefonico_DB_Cliente VARCHAR(15),
    correo_DB_Cliente VARCHAR(100),
    direccion_DB_Cliente VARCHAR(255),
    estado_DB_Cliente VARCHAR(20)
);

--Tabla de los datos del proveedor--
CREATE TABLE DB_Proveedor(
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

--Tabla de los datos de los pedidos del sistema--
CREATE TABLE DB_Producto(
    codigo_barras_BD_Producto VARCHAR(13) PRIMARY KEY,
    nombre_DB_Producto VARCHAR(100),
    precio_DB_Producto DECIMAL(10),
    tiempo_realizacion_DB_Producto TIME,
    descripcion_DB_Producto VARCHAR(255),
    estado_DB_Producto VARCHAR(20),
    RFC_proveedor_DB_Producto VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (RFC_proveedor_DB_Producto) REFERENCES DB_Proveedor(RFC_DB_Proveedor)
);

--Tabla de los datos del compra del sistema--
CREATE TABLE DB_Compra(
    codigo_DB_Compra VARCHAR(50) PRIMARY KEY,
    fecha_compra_DB_Compra DATE,
    hora_compra_DB_Compra TIME,
    importe_DB_Compra DECIMAL(25),
    cantidad_producto_DB_Compra INT,
    estado_DB_Compra VARCHAR(25),
    Codigo_Barras_DB_Compra VARCHAR(13) PRIMARY KEY,
    FOREIGN KEY (codigo_barras_BD_Producto) REFERENCES DB_Producto(codigo_barras_BD_Producto)
);

--Tabla de los datos del inventario del sistema
CREATE TABLE DB_Inventario(
    codigo_DB_Inventario INT PRIMARY KEY AUTO INCREMENT,
    stock_minimo_DB_Inventario INT,
    stock_maximo_DB_Inventario INT,
    exitencia_DB_Inventario INT,
    codigo_barras_producto_DB_Inventario VARCHAR(13) PRIMARY KEY,
    FOREIGN KEY (codigo_barras_producto_DB_Inventario) REFERENCES DB_Producto(codigo_barras_BD_Producto)
);

--Tabla de los datos de la pedido--
CREATE TABLE DB_Pedido(
    numero_pedido_DB_Pedido VARCHAR(50) PRIMARY KEY,
    fecha_entrega_DB_Pedido DATE,
    hora_entrega_DB_Pedido TIME,
    ubicacion_actual_DB_Pedido VARCHAR(100),
    ubicacion_destino_DB_Pedido VARCHAR(100),
    estado_DB_Pedido VARCHAR(20),
    codigo_Barras_DB_pedido VARCHAR(13) PRIMARY KEY,
    id_Cliente_DB_Cliente INT PRIMARY KEY,
    FOREIGN KEY (codigo_Barras_DB_pedido) REFERENCES DB_Producto(codigo_barras_BD_Producto),
    FOREIGN KEY (id_Cliente_DB_Cliente) REFERENCES DB_Cliente(id_DB_Cliente)
);

--Tabla de los datos de informacion pedido--
 CREATE TABLE DB_informacion_Pedido(
    codigo_DB_informacion_Pedido VARCHAR(50) PRIMARY KEY,
    fecha_entrega_DB_informacion_Pedido DATE,
    hora_entrega_DB_informacion_pedido TIME,
    ubicacion_actual_DB_informacion_pedido VARCHAR(100),
    ubicacion_destino_DB_informacion_pedido VARCHAR(100),
    estado_DB_informacion_pedido VARCHAR(25),
    numero_pedido_DB_informacion_Pedido VARCHAR(50) PRIMARY KEY,
    codigo_barras_DB_informacion_Pedido VARCHAR(13) PRIMARY KEY,
    id_Cliente_DB_inforamcion_Pedido INT PRIMARY KEY,
    FOREIGN KEY (numero_pedido_DB_informacion_Pedido) REFERENCES DB_Pedido(numero_pedido_DB_Pedido),
    FOREIGN KEY (codigo_barras_DB_informacion_Pedido) REFERENCES DB_Pedido(codigo_Barras_DB_pedido),
    FOREIGN KEY (id_Cliente_DB_inforamcion_Pedido) REFERENCES DB_Pedido(id_Cliente_DB_Cliente)
 );