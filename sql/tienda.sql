DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE usuario (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(128) NOT NULL,
  nombre VARCHAR(128) NOT NULL
);

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  imagen VARCHAR(256) NOT NULL,
  descripcion VARCHAR(512) NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO usuario VALUES (1, 'usuario@usuario.es', 'f8032d5cae3de20fcec887f395ec9a6a', 'Usuario');
INSERT INTO usuario VALUES (2, 'usuario2@usuario2.es', '2fb6c8d2f3842a5ceaa9bf320e649ff0', 'Usuario2');

INSERT INTO fabricante VALUES (001, 'Nvidia');
INSERT INTO fabricante VALUES (002, 'Intel');
INSERT INTO fabricante VALUES (003, 'AMD');

INSERT INTO producto VALUES (0001, 'Nvidia GTX 1080 TI MSI', '680', '001', '../fotos/1.jpg', 'Tarjeta Grafica GTX 1080 TI');
INSERT INTO producto VALUES (0002, 'Nvidia GTX 1050 TI MSI', '180', '001', '../fotos/2.jpg', 'Tarjeta Grafica GTX 1050 TI');
INSERT INTO producto VALUES (0003, 'Intel Core i9-7940X 3.1Ghz BOX', '1259', '002', '../fotos/3.jpg', 'Procesador Intel i9');
INSERT INTO producto VALUES (0004, 'Intel Core i7-7820X 3.6Ghz BOX', '519', '002', '../fotos/4.jpg', 'Procesador Intel i7');
INSERT INTO producto VALUES (0005, 'AMD Ryzen Threadripper 1950X 3.4GHz', '839', '003', '../fotos/5.jpg', 'Procesador AMD Ryzen Thr.');
INSERT INTO producto VALUES (0006, 'AMD Ryzen 5 1600 3.2GHZ BOX', '164', '003', '../fotos/6.jpg', 'Procesador AMD Ryzen');