CREATE DATABASE IF NOT EXISTS JOTUN CHARACTER SET utf8 COLLATE utf8_spanish_ci;;

USE JOTUN;

CREATE TABLE IF NOT EXISTS ADMINISTRADORES(
  ID_ADMINISTRADOR INT AUTO_INCREMENT,
  NOMBRE VARCHAR (75),
  USUARIO VARCHAR (25),
  PASSWORD VARCHAR (100),
  PRIMARY KEY (ID_ADMINISTRADOR)
)ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS PRODUCTOS(
  ID_PRODUCTO INT AUTO_INCREMENT,
  NOMBRE VARCHAR (75),
  CATEGORIA VARCHAR (25),
  MEDIDA CHAR,
  -- 'K' KILO , 'R' RACIÓN, 'U' UNIDAD
  PRECIO FLOAT,
  PEDIDO_MIN INT,
  PRIMARY KEY (ID_PRODUCTO)
)ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;
-- Se decide hacer un insert de cliente por cada pedido (Pues al no haber cuentas no hay forma de "segurizar" el formulario de pedidos. Por lo que la tabla cliente y pedido se fusionan.


CREATE TABLE IF NOT EXISTS PEDIDOS(
  ID_PEDIDO INT AUTO_INCREMENT,
  NOMBRE VARCHAR (50),
  CORREO VARCHAR (100),
  TELEFONO VARCHAR (9),
  COMENTARIO VARCHAR(255),
  FECHA DATE,
  FECHA_ENTREGA DATE,
  ESTADO CHAR,
  -- 'P'PENDIENTE DE CONFIRMACION, 'A' ACEPTADO, 'R' RECHAZADO, 'E' ENTREGADO, 'N' NO RECOGIDO
  PRIMARY KEY (ID_PEDIDO)
)ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS PRODUCTOS_POR_PEDIDO(
  ID_PEDIDO INT,
  ID_PRODUCTO INT,
  CANTIDAD INT,
  FOREIGN KEY (ID_PEDIDO)
    REFERENCES PEDIDOS(ID_PEDIDO),
  FOREIGN KEY (ID_PRODUCTO)
    REFERENCES PRODUCTOS(ID_PRODUCTO)
      ON DELETE CASCADE
)ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_unicode_ci;

-- Insert de admin
INSERT INTO administradores(NOMBRE, USUARIO, PASSWORD) VALUES ('administrador de escuela de hosteleria','cocina2','12345A');

-- Insert de productos

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Croquetas de hongos - Pack de 12','FRITOS','R',5,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Croquetas de jamón ibérico - Pack de 12','FRITOS','R',5,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tigres (mejillones rellenos) - Pack de 12','FRITOS','R',5.3,2);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Escalibada de verduras con ventresca de atún','ENTRANTES','R',6.4,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Ensalada César con virutas de pavo braseado','ENTRANTES','R',3.5,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Canelones rellenos de espinacas y hongos','ENTRANTES','R',3.75,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Pencas de acelga rellenas de jamón y queso','ENTRANTES','R',4.2,2);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Piquillos rellenos de merluza y gambas','PESCADOS','R',4.8,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Bacalao a la vizcaína','PESCADOS','R',8,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Chipirones en su tinta','PESCADOS','R',6,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Kokotxas de bacalao con gulas','PESCADOS','R',10.5,2);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Albóndigas de pollo en salsa verde','CARNES','R',4.5,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Carrilleras ibéricas al Rioja Alavesa','CARNES','R',6,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Lengua rellena de Idiazabal y salsa agridulce','CARNES','R',4.7,2);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Callos  de ternera en salsa vizcaína','CARNES','R',4.7,2);

-- Todas las variedades de tartas y semifríos son de 8 raciones
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Delicia de arroz y canela','SEMIFRIOS','K',12,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Mousse de chocolate','SEMIFRIOS','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Charlota de crema','SEMIFRIOS','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Bavarroi de frutas','SEMIFRIOS','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Mousse de queso y frambuesa','SEMIFRIOS','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Delicia de yogur y chocolate blanco','SEMIFRIOS','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tiramisú','SEMIFRIOS','K',13,0);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Brazo de gitano de chocolate	','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Brazo de gitano de yema','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Brazo de gitano de nata','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Brazo de gitano de crema','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta San Marcos - yemA','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta Moka - mantequilla','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta Mascota - almendra','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta Imperial - merengue','TARTAS DE BIZCOCHO','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta Selva Negra - chocolate','TARTAS DE BIZCOCHO','K',13,0);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Milhojas de nata','TARTAS DE HOJALDRE','K',15,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Milhojas de crema','TARTAS DE HOJALDRE','K',15,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta Gasteiz','TARTAS DE HOJALDRE','K',15,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Banda de manzana','TARTAS DE HOJALDRE','K',12,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Banda de frutas rojas','TARTAS DE HOJALDRE','K',12,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Banda de frutos secos','TARTAS DE HOJALDRE','K',12,0);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta de manzana','TARTAS VARIADAS','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Quiché de frutas variadas','TARTAS VARIADAS','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tatin de pera o manzana','TARTAS VARIADAS','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Pastel vasco','TARTAS VARIADAS','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta de queso cocida','TARTAS VARIADAS','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Tarta Santiago','TARTAS VARIADAS','K',10,0);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Pastas (cajas de 600 gramos)','VARIEDADES','K',15,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Galletas cookies','VARIEDADES','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Polvorones','VARIEDADES','K',13,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Trufas','VARIEDADES','K',25,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Plum cake de frutas (8 raciones)','VARIEDADES','K',11,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Plum cake con perlitas de chocolate (8 raciones)','VARIEDADES','K',11,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Bizcocho de nata','VARIEDADES','K',11,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Brownie','VARIEDADES','K',11,0);

INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Goxua','VARIEDADES','U',2,6);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Arroz con leche','VARIEDADES','U',1.5,6);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Natillas a la casera','VARIEDADES','U',1.5,6);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Flan de queso','VARIEDADES','U',1.5,6);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Flan de huevo','VARIEDADES','U',1.5,6);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Canutillos rellenos','VARIEDADES','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Crema frita','VARIEDADES','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Torrijas','VARIEDADES','K',10,0);
INSERT INTO productos(NOMBRE, CATEGORIA, MEDIDA, PRECIO, PEDIDO_MIN) VALUES ('Petit choux de nata y chocolate','VARIEDADES','K',10,0);
