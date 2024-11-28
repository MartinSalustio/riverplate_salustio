DROP DATABASE IF EXISTS riverplate;
CREATE DATABASE riverplate;
USE riverplate;

-- TABLAS SIN FK

CREATE TABLE posicion(
    id_posicion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    posicion VARCHAR(100)
);

CREATE TABLE competicion(
    id_competicion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_competicion VARCHAR(200),
    alcance VARCHAR(200)
);

CREATE TABLE estadio_del_mundo(
    id_estadio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_estadio VARCHAR(200),
    pais VARCHAR(200),
    ciudad VARCHAR(200),
    capacidad INT
);

CREATE TABLE arbitro(
    id_arbitro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200),
    apellido VARCHAR(200),
    pais_nacimiento VARCHAR(200) DEFAULT 'Argentina'
);

-- TABLAS CON FK

CREATE TABLE plantel(
    id_integrante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_posicion INT,
    nombre VARCHAR(200),
    apellido VARCHAR(200),
    fecha_nacimiento DATE,
    edad INT,
    pais_nacimiento VARCHAR(200),
    inicio_contrato DATE,
    fin_contrato DATE,
    goles INT,
    asistencias INT,
    clausula DECIMAL(10, 2)
);

CREATE TABLE partido(
    id_partido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_competicion INT,
    id_estadio INT,
    id_club INT,
    id_arbitro INT,
    fecha DATE,
    goles_realizados INT,
    goles_recibidos INT
);

CREATE TABLE club_del_mundo(
    id_club INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_estadio INT,
    nombre_club VARCHAR(200),
    pais VARCHAR(200),
    ciudad VARCHAR(200)
);

CREATE TABLE plantel_partido(
    id_plantel_partido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_integrante INT,
    id_partido INT,
    goles INT,
    asistencias INT
);

-- Referencias

ALTER TABLE plantel
    ADD CONSTRAINT fk_constraint_id_posicion
    FOREIGN KEY (id_posicion) REFERENCES posicion(id_posicion);

ALTER TABLE partido
    ADD CONSTRAINT fk_constraint_id_competicion
    FOREIGN KEY (id_competicion) REFERENCES competicion(id_competicion);

ALTER TABLE partido
    ADD CONSTRAINT fk_constraint_id_estadio
    FOREIGN KEY (id_estadio) REFERENCES estadio_del_mundo(id_estadio);

ALTER TABLE partido
    ADD CONSTRAINT fk_constraint_id_club
    FOREIGN KEY (id_club) REFERENCES club_del_mundo(id_club);

ALTER TABLE partido
    ADD CONSTRAINT fk_constraint_id_arbitro
    FOREIGN KEY (id_arbitro) REFERENCES arbitro(id_arbitro);

ALTER TABLE club_del_mundo
    ADD CONSTRAINT fk_constraint_id_estadio_club
    FOREIGN KEY (id_estadio) REFERENCES estadio_del_mundo(id_estadio);

ALTER TABLE plantel_partido
    ADD CONSTRAINT fk_constraint_id_integrante
    FOREIGN KEY (id_integrante) REFERENCES plantel(id_integrante);

ALTER TABLE plantel_partido
    ADD CONSTRAINT fk_constraint_id_partido
    FOREIGN KEY (id_partido) REFERENCES partido(id_partido);
