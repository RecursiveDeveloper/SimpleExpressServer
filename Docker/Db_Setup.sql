/*
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'secret';
flush privileges;
*/

CREATE DATABASE nodedb;
USE nodedb;

CREATE TABLE carta
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plato VARCHAR(25) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(12, 2) NOT NULL,
    disponible BOOLEAN
);

INSERT INTO carta 
(plato, descripcion, precio, disponible) 
VALUES
("Paella", "sed do eiusmod tempor incididunt ut labore", 9.99, true),
("Entrecot", "Lorem ipsum dolor sit amet", 19.99, true);
