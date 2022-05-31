CREATE TABLE grupo (
	id INT PRIMARY KEY,
    nombre VARCHAR(50),
    num_alumnos INT
);
CREATE TABLE alumno (
	dni CHAR(9),
	nombre VARCHAR(50),
    grupo INT REFERENCES grupo(id)
);
INSERT INTO grupo VALUES (1, "Pollitos", 0);
INSERT INTO grupo VALUES (2, "Tortuguitas", 0);