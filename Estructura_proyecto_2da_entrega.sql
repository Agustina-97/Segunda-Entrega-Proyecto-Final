DROP DATABASE IF EXISTS bolt_shipping;
CREATE DATABASE bolt_shipping;
USE bolt_shipping;

CREATE TABLE vendedores ( 
id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre_vendedor TEXT,
tipo_vendedor ENUM ("MAYORISTA","MINORISTA"),
domicilio_vendedor VARCHAR (200),
email_vendedor VARCHAR (200) UNIQUE
);

CREATE TABLE productos (
id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_vendedor INT,
categoría_producto VARCHAR (200),
titulo_publicacion VARCHAR (200),
SKU VARCHAR (200)
);

ALTER TABLE productos
ADD CONSTRAINT fk_constraint_id_vendedor
foreign key (id_vendedor) REFERENCES vendedores (id_vendedor);

CREATE TABLE centro_de_distribucion (
id_centro_de_distribucion INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
ubicacion VARCHAR (200),
fecha_recepcion DATETIME DEFAULT (CURRENT_TIMESTAMP),
id_operario INT,
id_producto INT
);

ALTER TABLE centro_de_distribucion
ADD CONSTRAINT fk_id_producto
foreign key (id_producto) REFERENCES productos (id_producto);

CREATE TABLE operarios (
id_operarios INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_categoria_operario VARCHAR (200),
nombre_operario text,
domicilio_operario VARCHAR (200),
fecha_ingreso DATE
);

  

CREATE TABLE categoria_operarios (
id_categoria_operarios INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
descripcion_tareas VARCHAR (200)
);

CREATE TABLE shipment (
id_shipment INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
carrier VARCHAR (200),
zona_cliente VARCHAR (200),
status_shipment VARCHAR (200)
);


CREATE TABLE clientes (
id_clientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
id_vendedor INT,
domicilio_cliente VARCHAR (200),
email_cliente VARCHAR (200) UNIQUE ,
zona_cliente VARCHAR (200)
);

ALTER TABLE centro_de_distribucion
ADD CONSTRAINT fk_id_operarios
foreign key (id_operario) REFERENCES operarios (id_operarios)

ALTER TABLE shipment 
ADD CONSTRAINT fk_zona_cliente
foreign key (zona_cliente) REFERENCES  cliente (zona_cliente)

ALTER TABLE clientes
ADD CONSTRAINT fk_id_vendedor
foreign key (id_vendedor) REFERENCES vendedores (id_vendedor);

ALTER TABLE operarios
ADD CONSTRAINT 	fk_id_categoria_operario	
foreign key (id_categoria_operario) REFERENCES categoria operarios (id_categoria_operario);
