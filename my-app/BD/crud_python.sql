
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS `crud_python`;
USE `crud_python`;

-- Crear la tabla tbl_empleados
CREATE TABLE IF NOT EXISTS `tbl_empleados` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(50) DEFAULT NULL,
  `apellido_empleado` VARCHAR(50) DEFAULT NULL,
  `sexo_empleado` INT DEFAULT NULL,
  `telefono_empleado` VARCHAR(50) DEFAULT NULL,
  `email_empleado` VARCHAR(50) DEFAULT NULL,
  `profesion_empleado` VARCHAR(50) DEFAULT NULL,
  `foto_empleado` MEDIUMTEXT,
  `salario_empleado` BIGINT DEFAULT NULL,
  `fecha_registro` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_departamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  CONSTRAINT `fk_empleado_departamento`
    FOREIGN KEY (`id_departamento`) REFERENCES `departamentos`(`id_departamento`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos en tbl_empleados
INSERT INTO `tbl_empleados` 
(`nombre_empleado`, `apellido_empleado`, `sexo_empleado`, `telefono_empleado`, `email_empleado`, `profesion_empleado`, `foto_empleado`, `salario_empleado`, `fecha_registro`, `id_departamento`)
VALUES 
('Urian', 'Viera', 1, '54544454', 'programadorphp2017@gmail.com', 'Ingeniero de Sistemas', 'fda30f83ebbc4fb1a2ce2609b2b1e34c6614c1dff6e44460b9ba27ed5bb8e927.png', 3500000, '2023-08-23 17:04:49', 2),
('Brenda', 'Viera', 2, '323543543', 'brenda@gmail.com', 'Dev', '22c055aeec314572a0046ec50b84f21719270dac6ea34c91b8380ac289fff9e5.png', 1200000, '2023-08-23 17:05:34', 2),
('Alejandro', 'Torres', 1, '324242342', 'alejandro@gmail.com', 'Técnico', '7b84aceb56534d27aa2e8b727a245dca9f60156a070a47c491ff2d21da1742e5.png', 2100, '2023-08-23 17:06:13', NULL),
('Karla', 'Ramos', 2, '345678', 'karla@gmail.com', 'Ingeniera', '248cc9c38cfb494bb2300d7cbf4a3b317522f295338b4639a8e025e6b203291c.png', 2300, '2023-08-23 17:07:28', NULL);

-- Crear la tabla users
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_surname` VARCHAR(100) NOT NULL,
  `email_user` VARCHAR(50) NOT NULL,
  `pass_user` TEXT NOT NULL,
  `created_user` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insertar datos en users
INSERT INTO `users` (`name_surname`, `email_user`, `pass_user`, `created_user`) 
VALUES 
('Urian', 'dev@gmail.com', 'scrypt:32768:8:1$ZXqvqovbXYQZdrAB$66758083429739f4f8985992b22cb89fb58c04b99010858e7fb26f73078a23dd3e16019a17bf881108d582a91a635d2c21d26d80da1612c2d9c9bbb9b06452dc', '2024-07-21 20:10:01'), 
('demo', 'demo@gmail.com', 'scrypt:32768:8:1$Yl2tGU1Ru1Q4Jrzq$d88a0ded538dcfc3a01c8ebf4ea77700576203f6a7cc765f04627464c6047bdcf8eaad84ca3cf0bb5ed058d2dff8ee7a0ba690803538764bedc3ba6173ac6a8a', '2024-07-21 20:29:28');

-- Crear la tabla empleados_usuarios
CREATE TABLE IF NOT EXISTS `empleados_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `rol` VARCHAR(50) DEFAULT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_empleado`) REFERENCES `tbl_empleados`(`id_empleado`) ON DELETE CASCADE,
  FOREIGN KEY (`id_usuario`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla departamentos
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `nombre_departamento` VARCHAR(100) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos en departamentos
INSERT INTO `departamentos` (`nombre_departamento`, `descripcion`) VALUES
('Recursos Humanos', 'Gestión del talento humano'),
('Tecnología', 'Desarrollo e infraestructura tecnológica'),
('Marketing', 'Promoción y ventas');

-- Crear la tabla proyectos
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id_proyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre_proyecto` VARCHAR(100) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos en proyectos
INSERT INTO `proyectos` (`nombre_proyecto`, `descripcion`, `fecha_inicio`, `fecha_fin`) VALUES
('Proyecto Alpha', 'Desarrollo de nueva plataforma web', '2024-01-01', '2024-12-31'),
('Proyecto Beta', 'Optimización del sistema actual', '2024-02-01', NULL);

-- Crear la tabla asignacion_proyectos
CREATE TABLE IF NOT EXISTS `asignacion_proyectos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` INT NOT NULL,
  `id_proyecto` INT NOT NULL,
  `rol_en_proyecto` VARCHAR(50) DEFAULT NULL,
  `fecha_asignacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_empleado`) REFERENCES `tbl_empleados`(`id_empleado`) ON DELETE CASCADE,
  FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos`(`id_proyecto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar datos en asignacion_proyectos
INSERT INTO `asignacion_proyectos` (`id_empleado`, `id_proyecto`, `rol_en_proyecto`) VALUES
(4, 1, 'Líder Técnico'),
(5, 1, 'Desarrollador'),
(6, 2, 'Técnico de Soporte');
