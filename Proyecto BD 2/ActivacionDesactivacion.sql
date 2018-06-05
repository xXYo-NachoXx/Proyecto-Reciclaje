

/*Solicitudes para beses de datos*/

/*Procediminetos especificos*/

USE `reciclaje`;
DROP procedure IF EXISTS `infoUsuarioUnico`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoUsuarioUnico` (in piduser int)
BEGIN
	select  usuario , puntos ,puntosCanjeados
    from usuario
    where  idUsuario = piduser ;

END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `infoPersonaUnico`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoPersonaUnico` (in pidpersona int)
BEGIN
	select nombre,apellido,email,cedula,telefono
    from persona;
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `infoMaterialUnico`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoMaterialUnico` (in pidMat int)
BEGIN
	select info.nombre, info.valor, tm.nombre
    from (
		select nombre,valor,id_tipo tipo
		from material 
		where idMaterial = pidMat
	) info 
    inner join tipoMaterial tm
    on tm.idtipoMaterial =  info.tipo;
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `infoProductoUnico`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `infoProductoUnico` (in idComercioUnico int)
BEGIN
	select nombre,descripcion,valor,cantidad
    from producto 
    where idComercio =idComercioUnico;
END$$

DELIMITER ;




/*Validacion contrasena*/

USE `reciclaje`;
DROP procedure IF EXISTS `validacionContrasena`;

DELIMITER $$
USE `reciclaje`$$
CREATE  PROCEDURE `validacionContrasena`(in idUser int, in contra varchar(200), out res int )
BEGIN
	declare prueba varchar(200);
    select clave
    into prueba
    from usuario
    where idUsuario =  idUser;
    set res = 0;
    if prueba = contra then 
		set res = 1;
    end if;
END$$

DELIMITER ;



/*Activo y desactivo*/

ALTER TABLE `reciclaje`.`producto` 
ADD COLUMN `activo` INT NULL AFTER `fecha_creacion`;

ALTER TABLE `reciclaje`.`material` 
ADD COLUMN `activo` INT NULL AFTER `fecha_creacion`;


USE `reciclaje`;
DROP procedure IF EXISTS `crearMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearMaterial`(in pnombre varchar(45), in pvalor int, in pidTipo int)
BEGIN
	insert into material(nombre,valor,idTipo,activo)
    values (pnombre,pvalor,pidTipo,1);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearProducto`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearProducto`(in pnombre varchar(45), in descripcion varchar(45),in pvalor int, in pfoto int, in idComercio int , in cantidad int )
BEGIN
	insert into producto(nombre, descripcion, valor ,  foto ,  idComercio, cantidad,activo  )
    values(pnombre, descripcion, pvalor ,  pfoto ,  idComercio, cantidad,1  );
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `activacionProducto`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `activacionProducto` (in pidProducto int, in estado int)
BEGIN
	update producto
    set activo =  estado 
    where idProducto = pidProducto;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `activacionMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `activacionMaterial` (in pidMat int, in estado int)
BEGIN
	update material 
    set activo =  estado 
    where idMaterial  = pidMat;
END$$

DELIMITER ;











































