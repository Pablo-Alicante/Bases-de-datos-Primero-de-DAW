CREATE DATABASE empresa;
USE empresa;
CREATE TABLE departamento (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    suma_salarios DECIMAL(10,2)
);
CREATE TABLE puesto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    salario_base DECIMAL (10,2)
);
CREATE TABLE empleado (
	dni CHAR(9) PRIMARY KEY,
	nombre VARCHAR(50),
    anyos_exp INT,
    puesto INT REFERENCES puesto (id),
    departamento INT REFERENCES departamento (id),
    salario DECIMAL (10,2)
);
INSERT INTO puesto VALUES (DEFAULT, 'Administrativo', 1300),
						  (DEFAULT, 'Técnico', 1200);
INSERT INTO departamento VALUES (DEFAULT, 'Administración', 0),
								(DEFAULT, 'Informática', 0);