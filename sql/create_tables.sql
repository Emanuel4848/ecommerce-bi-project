create table clientes (
	id_cliente INT PRIMARY KEY,
	nombre varchar(100),
	apellido varchar(100),
	email varchar(150),
	fecha_registro DATE,
	region VARCHAR(100)
);



select * from clientes;

create table categorias_productos (
	id_categoria INT PRIMARY KEY,
	categoria varchar(100),
	descripcion TEXT
);


select * from categorias_productos


create table productos (
	id_producto INT PRIMARY KEY,
	nombre_producto varchar(150),
	id_categoria INT,
	precio_unitario NUMERIC(10,2),
	stock INT,
	CONSTRAINT fk_productos_categorias
		FOREIGN KEY (id_categoria)
		REFERENCES categorias_productos(id_categoria)
);

create table metodos_pago (
    id_metodo INT PRIMARY KEY,
    metodo VARCHAR(100),
    descripcion TEXT
);


create table ventas (
    id_venta INT PRIMARY KEY,
    fecha DATE,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    id_metodo_pago INT,
    estado VARCHAR(50),

    CONSTRAINT fk_ventas_clientes
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_ventas_productos
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto),

    CONSTRAINT fk_ventas_metodos_pago
        FOREIGN KEY (id_metodo_pago)
        REFERENCES metodos_pago(id_metodo)
);






