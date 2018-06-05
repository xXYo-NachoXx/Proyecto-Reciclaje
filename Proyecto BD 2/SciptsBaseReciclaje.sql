

---Schemas 

CREATE SCHEMA `reciclaje` ;




--Tables 


CREATE TABLE `reciclaje`.`pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación de cada país',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de cada país ',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador ',
  `fecha_creacion` DATE NULL COMMENT 'Fecha de creación ',
  PRIMARY KEY (`idPais`))
COMMENT = 'Tabla donde se almacenan los diferentes países de operación';
DROP TRIGGER IF EXISTS `reciclaje`.`Pais_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Pais_BEFORE_INSERT` BEFORE INSERT ON `Pais` FOR EACH ROW
BEGIN
	insert into pais(creado_por, fecha_creacion )
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`provincia` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación de cada provincia',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de cada provincia ',
  `idPais` INT NULL COMMENT 'Referencia al país correspondiente',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador',
  `fecha_creacion` DATE NULL COMMENT 'Fecha de creación',
  PRIMARY KEY (`idProvincia`),
  INDEX `idPais_idx` (`idPais` ASC) VISIBLE,
  CONSTRAINT `idPais`
    FOREIGN KEY (`idPais`)
    REFERENCES `reciclaje`.`pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacena provincias/estados';
DROP TRIGGER IF EXISTS `reciclaje`.`Provincia_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Provincia_BEFORE_INSERT` BEFORE INSERT ON `Provincia` FOR EACH ROW
BEGIN
	insert into provincia(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`canton` (
  `idCanton` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación de cada cantón',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de cada uno de los cantones ',
  `idProvincia` INT NULL COMMENT 'Referencia a cada una de las provincias ',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL COMMENT 'Fecha creación',
  PRIMARY KEY (`idCanton`),
  INDEX `idProvincia_idx` (`idProvincia` ASC) VISIBLE,
  CONSTRAINT `idProvincia`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `reciclaje`.`provincia` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacena cada uno de los cantones correspondientes ';
DROP TRIGGER IF EXISTS `reciclaje`.`canton_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`canton_BEFORE_INSERT` BEFORE INSERT ON `canton` FOR EACH ROW
BEGIN
	insert into canton(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;

CREATE TABLE `reciclaje`.`distrito` (
  `idDistrito` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificacion de distrito ',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de cada distrito ',
  `idCanton` INT NULL COMMENT 'Referencia al canton correpondiente ',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador ',
  `fecha_creacion` DATE NULL COMMENT 'Fecha de creación',
  PRIMARY KEY (`idDistrito`),
  INDEX `idCanton_idx` (`idCanton` ASC) VISIBLE,
  CONSTRAINT `idCanton`
    FOREIGN KEY (`idCanton`)
    REFERENCES `reciclaje`.`canton` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla distrito que almacena los distintos ';
DROP TRIGGER IF EXISTS `reciclaje`.`Distrito_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Distrito_BEFORE_INSERT` BEFORE INSERT ON `Distrito` FOR EACH ROW
BEGIN
	insert into distrito(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`telefono` (
  `idTelefono` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación de los teléfonos',
  `telefono` INT NOT NULL COMMENT 'Número de teléfono',
  PRIMARY KEY (`idTelefono`))
COMMENT = 'Tabla que almacena los teléfonos de cada persona';
DROP TRIGGER IF EXISTS `reciclaje`.`Telefono_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Telefono_BEFORE_INSERT` BEFORE INSERT ON `Telefono` FOR EACH ROW
BEGIN
	insert into telefono(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de la persona',
  `apellido` VARCHAR(45) NOT NULL COMMENT 'Apellido de la persona',
  `fechaNac` DATE NOT NULL COMMENT 'Fecha de Nacimiento de la persona',
  `email` VARCHAR(60) NULL COMMENT 'Correo electrónico',
  `cedula` INT NOT NULL COMMENT 'Identificación cívil de la persona ',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  `editado_por` VARCHAR(45) NULL,
  `fecha_edicion` DATE NULL,
  PRIMARY KEY (`idPersona`))
COMMENT = 'Tabla que almacena las personas en las bases de datos';
DROP TRIGGER IF EXISTS `reciclaje`.`Persona_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Persona_BEFORE_INSERT` BEFORE INSERT ON `Persona` FOR EACH ROW
BEGIN
	insert into persona(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `reciclaje`.`Persona_BEFORE_UPDATE`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Persona_BEFORE_UPDATE` BEFORE UPDATE ON `Persona` FOR EACH ROW
BEGIN
	insert into persona(editado_por, fecha_edicion)
    values(user(), sysdate());
END$$
DELIMITER ;




CREATE TABLE `reciclaje`.`centroacopio` (
  `idCentroAcopio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(200) NULL,
  `telefono` INT NULL,
  `idEncargado` INT NOT NULL,
  `idDistrito` INT NOT NULL,
  `latitud` VARCHAR(45) NULL,
  `longitud` VARCHAR(45) NULL,
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  `editado_por` VARCHAR(45) NULL,
  `fecha_edicion` DATE NULL,
  PRIMARY KEY (`idCentroAcopio`),
  INDEX `idEncargado_idx` (`idEncargado` ASC) VISIBLE,
  INDEX `idDistrito_idx` (`idDistrito` ASC) VISIBLE,
  CONSTRAINT `idEncargado`
    FOREIGN KEY (`idEncargado`)
    REFERENCES `reciclaje`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDistrito`
    FOREIGN KEY (`idDistrito`)
    REFERENCES `reciclaje`.`distrito` (`idDistrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacenará los distintos centro que reciben reciclaje';
DROP TRIGGER IF EXISTS `reciclaje`.`CentroAcopio_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`CentroAcopio_BEFORE_INSERT` BEFORE INSERT ON `CentroAcopio` FOR EACH ROW
BEGIN
	insert into centroacopio(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS `reciclaje`.`CentroAcopio_BEFORE_UPDATE`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`CentroAcopio_BEFORE_UPDATE` BEFORE UPDATE ON `CentroAcopio` FOR EACH ROW
BEGIN
	insert into centroacopio(editado_por, fecha_edicion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`dedicacion` (
  `idDedicacion` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificacion del rol de cada usuario',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de la dedidación',
  `creado_por` VARCHAR(50) NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`idDedicacion`))
COMMENT = 'Tablas para mostrar los roles de cada uno de los usuarios';
DROP TRIGGER IF EXISTS `reciclaje`.`Dedicacion_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Dedicacion_BEFORE_INSERT` BEFORE INSERT ON `Dedicacion` FOR EACH ROW
BEGIN
	insert into dedicacion(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`tipomaterial` (
  `idtipoMaterial` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación del material ',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del tipo del material \n',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador ',
  `fecha_creacion` DATE NULL COMMENT 'Fecha de creación',
  PRIMARY KEY (`idtipoMaterial`)
COMMENT = 'tabla para asignar el tipo de material al que se asigne el reciclaje ';
DROP TRIGGER IF EXISTS `reciclaje`.`tipoMaterial_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`tipoMaterial_BEFORE_INSERT` BEFORE INSERT ON `tipoMaterial` FOR EACH ROW
BEGIN
	insert into tipoMaterial(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;



CREATE TABLE `reciclaje`.`material` (
  `idMaterial` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificacición del material',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del material ',
  `valor` INT NULL COMMENT 'Valor en ecolones/kilogramo que cuesta el material \n ',
  `id_tipo` INT NOT NULL COMMENT 'Tipo de material del que está formado',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador',
  `fecha_creacion` DATE NULL COMMENT 'Fecha de creación',
  PRIMARY KEY (`idMaterial`),
  INDEX `idTipo_idx` (`id_tipo` ASC) VISIBLE,
  CONSTRAINT `idTipo`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `reciclaje`.`tipomaterial` (`idtipoMaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacena los materiales que se pueden reciclar';
DROP TRIGGER IF EXISTS `reciclaje`.`Material_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Material_BEFORE_INSERT` BEFORE INSERT ON `Material` FOR EACH ROW
BEGIN
	insert into Material(creado_por, fecha_creacion)
    values(user(), sysdate());
	
END$$
DELIMITER ;

CREATE TABLE `reciclaje`.`tipocomercio` (
  `idtipoComercio` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificacion de comercio',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de la clasificación',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador',
  `fecha_creacion` DATE NULL COMMENT 'Fecha de creación',
  PRIMARY KEY (`idtipoComercio`))
COMMENT = 'Clasificaciones de los comercios';
DROP TRIGGER IF EXISTS `reciclaje`.`tipoComercio_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`tipoComercio_BEFORE_INSERT` BEFORE INSERT ON `tipoComercio` FOR EACH ROW
BEGIN
	insert into tipoComercio(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`bitacorausuario` (
  `idBitacoraUsuario` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificacion de cada bitacora para cada usuario ',
  `nuevaClave` VARCHAR(200) NULL COMMENT 'Nueva clave',
  `viejaClave` VARCHAR(200) NULL COMMENT 'Vieja Clave',
  `creado_por` VARCHAR(45) NULL COMMENT 'Usuario creador ',
  `fecha_creacion` DATE NULL COMMENT 'fecha de creación',
  `editado_por` VARCHAR(45) NULL,
  `fecha_edicion` DATE NULL,
  PRIMARY KEY (`idBitacoraUsuario`))
COMMENT = 'Bitacora que guarda las contraseñas';
DROP TRIGGER IF EXISTS `reciclaje`.`BitacoraUsuario_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`BitacoraUsuario_BEFORE_INSERT` BEFORE INSERT ON `BitacoraUsuario` FOR EACH ROW
BEGIN
	insert into BitacoraUsuario(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS `reciclaje`.`BitacoraUsuario_BEFORE_UPDATE`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`BitacoraUsuario_BEFORE_UPDATE` BEFORE UPDATE ON `BitacoraUsuario` FOR EACH ROW
BEGIN
	 insert into BitacoraUsuario(editado_por, fecha_edicion)
	 values(user(), sysdate());
END$$
DELIMITER ;



CREATE TABLE `reciclaje`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación del usuario ',
  `usuario` VARCHAR(75) NOT NULL COMMENT 'Descripción',
  `clave` VARCHAR(200) NOT NULL COMMENT 'Contrasena del usuario ',
  `idBitacora` INT NOT NULL COMMENT 'Bitacora asociada',
  `puntos` INT NULL COMMENT 'Cantidad de puntos obtenidos ',
  `puntosCanjeados` INT NULL COMMENT 'Cantidad de puntos intercambiados',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  `idDedicacion` INT NOT NULL COMMENT 'Rol del usuario \n',
  PRIMARY KEY (`idUsuario`),
  INDEX `idDedicacion_idx` (`idDedicacion` ASC) VISIBLE,
  INDEX `idBitacora_idx` (`idBitacora` ASC) VISIBLE,
  CONSTRAINT `idDedicacion`
    FOREIGN KEY (`idDedicacion`)
    REFERENCES `reciclaje`.`dedicacion` (`idDedicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idBitacora`
    FOREIGN KEY (`idBitacora`)
    REFERENCES `reciclaje`.`bitacorausuario` (`idBitacoraUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacenan los usuarios ';
DROP TRIGGER IF EXISTS `reciclaje`.`Usuario_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Usuario_BEFORE_INSERT` BEFORE INSERT ON `Usuario` FOR EACH ROW
BEGIN
	insert into usuario(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`persona_x_usuario` (
  `idPersona` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `idUsuario`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idPersonaU`
    FOREIGN KEY (`idPersona`)
    REFERENCES `reciclaje`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUser`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `reciclaje`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacena cada uno de los usarios de las personas';


CREATE TABLE `reciclaje`.`comercio` (
  `idComercio` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación del comercio',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del comercio',
  `idTipo` INT NOT NULL COMMENT 'Tipo de comercio',
  `idAdministrador` INT NOT NULL COMMENT 'Persona administradora\n',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  `editado_por` VARCHAR(45) NULL,
  `fecha_edicion` DATE NULL,
  PRIMARY KEY (`idComercio`),
  INDEX `idAdmin_idx` (`idAdministrador` ASC) VISIBLE,
  INDEX `idType_idx` (`idTipo` ASC) VISIBLE,
  CONSTRAINT `idAdmin`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `reciclaje`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idType`
    FOREIGN KEY (`idTipo`)
    REFERENCES `reciclaje`.`tipocomercio` (`idtipoComercio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla que almacena los comercios';
DROP TRIGGER IF EXISTS `reciclaje`.`Comercio_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Comercio_BEFORE_INSERT` BEFORE INSERT ON `Comercio` FOR EACH ROW
BEGIN
	insert into comercio(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS `reciclaje`.`Comercio_BEFORE_UPDATE`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Comercio_BEFORE_UPDATE` BEFORE UPDATE ON `Comercio` FOR EACH ROW
BEGIN
	insert into comercio(editado_por, fecha_edicion)
    values(user(), sysdate());
END$$
DELIMITER ;


CREATE TABLE `reciclaje`.`producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificacion del producto \n',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del producto ',
  `descripcion` VARCHAR(45) NOT NULL COMMENT 'Descripción del producto',
  `valor` INT NOT NULL COMMENT 'Cantidad de ecolones correspondiente',
  `foto` BLOB NULL,
  `idComercio` INT NOT NULL COMMENT 'Comercio perteneciente\n',
  `cantidad` INT NOT NULL COMMENT 'Cantidad disponible',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `idAfiliado_idx` (`idComercio` ASC) VISIBLE,
  CONSTRAINT `idAfiliado`
    FOREIGN KEY (`idComercio`)
    REFERENCES `reciclaje`.`comercio` (`idComercio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla para almacenar los productos de cada uno de los comercios';
DROP TRIGGER IF EXISTS `reciclaje`.`Producto_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Producto_BEFORE_INSERT` BEFORE INSERT ON `Producto` FOR EACH ROW
BEGIN
	insert into producto(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;

CREATE TABLE `reciclaje`.`canje` (
  `idCanje` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación del canje',
  `id_producto` INT NOT NULL COMMENT 'Producto solicitado ',
  `id_cliente` INT NOT NULL COMMENT 'Usuario que canjeó los puntos',
  `fecha` DATE NULL COMMENT 'fecha del canje',
  `cantidad` INT NULL COMMENT 'Cantidad de puntos solicitados',
  `totalPuntos` INT NULL COMMENT 'Total de puntos por cantidad',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`idCanje`),
  INDEX `idProduct_idx` (`id_producto` ASC) VISIBLE,
  INDEX `idCliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `idProduct`
    FOREIGN KEY (`id_producto`)
    REFERENCES `reciclaje`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `reciclaje`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla para almacenar los diferetes canjes por produtos';
DROP TRIGGER IF EXISTS `reciclaje`.`Canje_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Canje_BEFORE_INSERT` BEFORE INSERT ON `Canje` FOR EACH ROW
BEGIN
	insert into canje(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;

CREATE TABLE `reciclaje`.`reciclo` (
  `idUsuario` INT NOT NULL COMMENT 'Usuario que recicla ',
  `idAcopio` INT NOT NULL COMMENT 'Centro donde se recicla ',
  `idMaterial` INT NOT NULL COMMENT 'Material reciclado ',
  `fecha` DATE NULL COMMENT 'Fecha de reciclaje',
  `cantidad` DECIMAL(10,5) NOT NULL COMMENT 'Cantidad (en kilogramos) del material reciclado',
  `creado_por` VARCHAR(45) NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`idUsuario`, `idAcopio`),
  INDEX `idCentro_idx` (`idAcopio` ASC) VISIBLE,
  INDEX `idMat_idx` (`idMaterial` ASC) VISIBLE,
  CONSTRAINT `idReciclador`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `reciclaje`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCentro`
    FOREIGN KEY (`idAcopio`)
    REFERENCES `reciclaje`.`centroacopio` (`idCentroAcopio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMat`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `reciclaje`.`material` (`idMaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Tabla para almacenar los reciclajes';
DROP TRIGGER IF EXISTS `reciclaje`.`Reciclo_BEFORE_INSERT`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`Reciclo_BEFORE_INSERT` BEFORE INSERT ON `Reciclo` FOR EACH ROW
BEGIN
	insert into reciclo(creado_por, fecha_creacion)
    values(user(), sysdate());
END$$
DELIMITER ;



---Alters 


ALTER TABLE `reciclaje`.`comercio` 
DROP FOREIGN KEY `idAdmin`;
ALTER TABLE `reciclaje`.`comercio` 
ADD INDEX `idAdmin_idx` (`idAdministrador` ASC) VISIBLE,
DROP INDEX `idAdmin_idx` ;
;
ALTER TABLE `reciclaje`.`comercio` 
ADD CONSTRAINT `idAdmin`
  FOREIGN KEY (`idAdministrador`)
  REFERENCES `reciclaje`.`usuario` (`idUsuario`);


ALTER TABLE `reciclaje`.`centroacopio` 
DROP FOREIGN KEY `idEncargado`;
ALTER TABLE `reciclaje`.`centroacopio` 
ADD INDEX `idEncargado_idx` (`idEncargado` ASC) VISIBLE,
DROP INDEX `idEncargado_idx` ;
;
ALTER TABLE `reciclaje`.`centroacopio` 
ADD CONSTRAINT `idEncargado`
  FOREIGN KEY (`idEncargado`)
  REFERENCES `reciclaje`.`usuario` (`idUsuario`);

ALTER TABLE `reciclaje`.`persona` 
ADD COLUMN `idDistrito` INT NOT NULL COMMENT 'LugarDondeVive' AFTER `telefono`,
ADD INDEX `idDistrict_idx` (`idDistrito` ASC) VISIBLE;
;
ALTER TABLE `reciclaje`.`persona` 
ADD CONSTRAINT `idDistrict`
  FOREIGN KEY (`idDistrito`)
  REFERENCES `reciclaje`.`distrito` (`idDistrito`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `reciclaje`.`usuario` 
ADD COLUMN `fecha_mod` DATE NULL COMMENT 'Fecha de modificacion de la tupla' AFTER `idDedicacion`;
DROP TRIGGER IF EXISTS `reciclaje`.`usuario_BEFORE_UPDATE`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reciclaje`.`usuario_BEFORE_UPDATE` BEFORE UPDATE ON `usuario` FOR EACH ROW
BEGIN
	insert into usuario(fecha_mod)
    values (DATE_FORMAT(sysdate(), "%M %d %Y"));
END$$
DELIMITER ;


