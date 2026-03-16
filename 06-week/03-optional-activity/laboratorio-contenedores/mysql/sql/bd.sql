CREATE DATABASE laboratorio_docker;
USE laboratorio_docker;

CREATE TABLE estudiante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    fecha_registro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO estudiante (codigo, nombre, correo)
VALUES ('2026001', 'Ana Torres', 'ana.torres@corhuila.edu.co');

SELECT * FROM estudiante;