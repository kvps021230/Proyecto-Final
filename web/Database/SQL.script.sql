CREATE DATABASE torneo;
USE torneo;
SELECT * FROM usuarios;

CREATE TABLE roles (
rolId INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50)
);

INSERT INTO roles (nombre) VALUES 
('Administrador'),('Usuario');


CREATE TABLE usuarios (
usuarioId INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
correo VARCHAR (50),
clave VARCHAR(100) NOT NULL,
rolId INT NOT NULL
);
INSERT INTO usuarios (nombre, correo, clave, rolId)
VALUES
('Adrian', 'adrian@gmail.com', '1234', 1),
('Carlos', 'carlos@gmail.com', '5678', 2);

SELECT *
FROM usuarios u
LEFT JOIN roles r
    ON u.rolId = r.rolId
WHERE u.correo = 'adrian@gmail.com'
AND u.clave = '1234';
