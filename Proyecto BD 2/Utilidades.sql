

/*Procedimientos*/

----Locacion

USE `reciclaje`;
DROP procedure IF EXISTS `infoPais`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoPais` ()
BEGIN
	select idPais , nombre
    from pais;
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `provinciaInfo`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `provinciaInfo` ()
BEGIN
	select idProvincia, nombre
	from provincia;
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `infoCanton`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoCanton` ()
BEGIN
	select idCanton, nombre
	from canton;
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `infoDistrito`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoDistrito` ()
BEGIN
	select idDistrito, nombre
	from distrito;
END$$

DELIMITER ;



------------------

USE `reciclaje`;
DROP procedure IF EXISTS `infoDedicacion`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoDedicacion` ()
BEGIN
	select idDedicacion, nombre
    from dedicacion;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `infotipoMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infotipoMaterial` ()
BEGIN
	select idTipo, nombre 
    from tipoMaterial;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `infotipoComercio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infotipoComercio` ()
BEGIN
	select idTipo, nombre
    from tipoComercio;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `infoProducto`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoProducto` ()
BEGIN
	select idProducto, nombre
    from producto;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `infoProductoAll`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoProductoAll` ()
BEGIN
	select nombre,descripcion,valor, foto, idComercio, cantidad
    from producto;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `infoMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoMaterial` ()
BEGIN
	select idMaterial, nombre
    from material;
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `infoMaterialAll`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoMaterialAll` ()
BEGIN
	select idMaterial,nombre,valor
    from material;
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `acopioInfo`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `acopioInfo` ()
BEGIN
	select  idAcopio,nombre 
    from centroacopio;
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `getLatitudLongitud`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `getLatitudLongitud` ( in comer int)
BEGIN
	select direccion,latitud,longitud
    from comercio 
    where idComercio =  comer;
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `infoComercio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoComercio` ()
BEGIN
	select idComercio,nombre
    from comercio;
END$$
DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `infoPersona`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoPersona` ()
BEGIN
	select idPersona, nombre,apellido,cedula
    from persona;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `infoUsuario`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoUsuario` ()
BEGIN
	select idUsuario, usuario,puntos,puntosCanjeados
    from usuario ;
END$$

DELIMITER ;




-----transacciones 

USE `reciclaje`;
DROP procedure IF EXISTS `infoReciclaje`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoReciclaje` ()
BEGIN
	select idPersona, idAcopio,idMaterial,fecha,cantidad
    from reciclo ;
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `infoCanje`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoCanje` ()
BEGIN
	select idCanje,idProducto,idCliente,fecha,cantidad,totalPuntos
    from canje;
END$$

DELIMITER ;





































