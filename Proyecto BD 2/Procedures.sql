---Procedures 


USE `reciclaje`;
DROP procedure IF EXISTS `crearPais`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearPais` (in paisName varchar(20))
BEGIN
	insert into pais(nombre)
    values(paisName);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearProvincia`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearProvincia` (in nombre varchar(45), in paisId int)
BEGIN
	insert into provincia(nombre, idPais)
    values(nombre,paisId);
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `crearCanton`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearCanton` (in nombre varchar(45),in provinciaId int )
BEGIN
	insert into canton(nombre, idProvincia)
    values(nombre, provinciaId);
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `crearDistrito`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearDistrito` (in nombreCanton varchar(45), in cantonId int)
BEGIN
	insert into distrito(nombre,idCanton)
    values(nombreCanton, cantonId);
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `crearTelefono`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearTelefono` (in telefonoNo int)
BEGIN
	insert into telefono (telefono)
    values (telefonoNo);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `tipoComercio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `tipoComercio` (in nombreTipo varchar(45))
BEGIN
	insert into tipoComercio(nombre)
    values (nombreTipo);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `tipoMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `tipoMaterial` (in tipoNombre varchar(45))
BEGIN
	insert into tipoMaterial(nombre)
    values (tipoMaterial);
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `crearDedicacion`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearDedicacion` (in nombreDed varchar(45))
BEGIN
	insert into dedicacion(nombre)
    values(nombreDed);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearMaterial` (in pnombre varchar(45), in pvalor int, in pidTipo int)
BEGIN
	insert into material(nombre,valor,idTipo)
    values (pnombre,pvalor,pidTipo);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearComercio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearComercio` (in pnombre varchar(45), in pidTipo int , in idAdmin int)
BEGIN
	insert into comercio(nombre, idTipo, idAdministrador)
    values(pnombre, pidTipo, idAdmin); 
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `editarComercio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `editarComercio` (in pidComercio int, in pnombre varchar(45), in pidTipo int, in pidAdmin int )
BEGIN
	update comercio
    set nombre= pnombre,
    idTipo = pidTipo,
	idAdministrador = pidAdmin
    where idComercio = pidComercio;
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `crearProducto`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearProducto` (in pnombre varchar(45), in descripcion varchar(45),in pvalor int, in pfoto int, in idComercio int , in cantidad int )
BEGIN
	insert into producto(nombre, descripcion, valor ,  foto ,  idComercio, cantidad  )
    values(pnombre, descripcion, pvalor ,  pfoto ,  idComercio, cantidad  );
END$$

DELIMITER ;




USE `reciclaje`;
DROP procedure IF EXISTS `crearPersona`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearPersona`(in pnombre varchar(45), in apellido varchar(45),in fechaNac date, in email varchar(45), in cedula int, in ptelefono int, in pidDistrito int)
BEGIN
	insert into persona(nombre ,  apellido , fechaNac ,  email ,  cedula,telefono,idDistrito )
    values(pnombre ,  apellido , fechaNac ,  email ,  cedula ,ptelefono,pidDistrito );
end$$

DELIMITER ;





USE `reciclaje`;
DROP procedure IF EXISTS `editarPersona`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `editarPersona` (in pidPersona int, in pnombre varchar(45), in papellido varchar(45), in pemail varchar(45) )
BEGIN
	update persona
    set nombre = pnombre,
    apellido = papellido,
    email = pemail
    where idPersona = pidPersona;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearCentroAcopio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearCentroAcopio` (in nombre varchar(45), in direccion varchar(45),in telefono int, in idEncargado int, in idDistrito int, 
									  in latitud varchar(45), in longitud varchar(45) )
BEGIN
	insert into centroacopio(nombre, direccion ,telefono , idEncargado , idDistrito ,latitud , longitud)
	values(nombre, direccion ,telefono , idEncargado , idDistrito ,latitud , longitud);

END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `editarCentroAcopio`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `editarCentroAcopio` (in pidCentroAcopio int,in pnombre varchar(45), in pdireccion varchar(45),in ptelefono int, in pidEncargado int, 
										in pidDistrito int, in platitud varchar(45), in plongitud varchar(45) )
BEGIN
	update centroAcopio
    set nombre = pnombre,
    direccion = pdireccion,
    telefono  = ptelefono, 
    idEncargado = pidEncargado , 
    idDistrito = pidDistrito, 
    latitud = platitud ,  
    longitud  = plongitud
    where idCentroAcopio =  pidCentroAcopio;
END$$

DELIMITER ;



USE `reciclaje`;
DROP procedure IF EXISTS `crearBitacora`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearBitacora` (in newPass varchar(200))
BEGIN
	insert into bitacoraUsuario(nuevaClave, viejaClave)
    values (newPass,newPass);

END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `editarBitacora`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `editarBitacora` (in pnuevaClave varchar(200), in pidBit int  )
BEGIN
	update bitacoraUsuario
    set viejaClave =  nuevaClave,
    nuevaClave = pnuevaClave
    where idBitacoraUsuario =  pidBit;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `linkearPersonaUsuario`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `linkearPersonaUsuario` (in pidUsuario int, in pidPersona int)
BEGIN
	insert into persona_x_usuario(idPersona, idUsuario)
    values(pidUsuario ,  pidPersona);
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearUsuario`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuario`(in username varchar(75), in pclave varchar(200), in pidDedicacion int)
BEGIN
	call crearBitacora(pclave);
	insert into usuario(usuario, clave, idBitacora, puntos, puntosCanjeados, idDedicacion)
    values(username,pclave,LAST_INSERT_ID(),0,0,pidDedicacion);    
END$$
DELIMITER ;




USE `reciclaje`;
DROP procedure IF EXISTS `cambiarConstrasena`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `cambiarConstrasena` (in pidUsuario int,in newPass varchar(200))
BEGIN
	update usuario 
    set contrasena =  newPass
    where idUsuario = pidUsuario;
    call editarBitacora(pidUsuario,newPass);

END$$

DELIMITER ;

------------------Reciclo--------------------------


USE `reciclaje`;
DROP function IF EXISTS `getTotalValorMaterial`;

DELIMITER $$
USE `reciclaje`$$
CREATE FUNCTION `getTotalValorMaterial` (cantidad int  ,pidMat int)
RETURNS INTEGER
BEGIN
declare prueba int;
    select valor
    into prueba
    from material
    where idMaterial =  pidMat;
RETURN prueba*cantidad;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `aumentarPuntos`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `aumentarPuntos` (in pcantidad int, in pidUsuario int)
BEGIN
	update usuario
    set puntos = puntos + pcantidad
    where idUsuario = pidUsuario;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `crearReciclo`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `crearReciclo` (in pidUser int , in pidAcopio int , in idMat int, in pcantidad int )
BEGIN
	declare total int ; 
	insert into reciclo(idUsuario, idAcopio, idMaterial, fecha, cantidad)
    values (pidUser,pidAcopio,idMat,DATE_FORMAT(sysdate(), "%M %d %Y"),pcantidad);
    set total=getTotalValorMaterial(pcantidad,idMat);
    call aumentarPuntos(total, pidUser);
END$$

DELIMITER ;



-----------------------------------------------------------------------

----Canje 



USE `reciclaje`;
DROP function IF EXISTS `getTotalPuntosProducto`;

DELIMITER $$
USE `reciclaje`$$
CREATE FUNCTION `getTotalPuntosProducto` (cantidad int, idProduct int ) RETURNS INTEGER
BEGIN
	declare prueba int;
	select valor
    into prueba
    from producto
    where idProducto =  idProduct;
RETURN prueba*cantidad;
END$$

DELIMITER ;


USE `reciclaje`;
DROP function IF EXISTS `getPuntosUser`;

DELIMITER $$
USE `reciclaje`$$
CREATE FUNCTION `getPuntosUser` (idUser int ) RETURNS INTEGER
BEGIN
	declare prueba int;
    select puntos
    into prueba
    from usuario
    where idUsuario =  idUser;
RETURN prueba;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `restarPuntos`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `restarPuntos` (in pidUser int , in cantidad int)
BEGIN
	update usuario 
    set puntos =  puntos -cantidad,
    puntosCanjeados = puntosCanjeados + cantidad
    where idUsuario =  pidUser;
END$$

DELIMITER ;



USE `reciclaje`;
DROP function IF EXISTS `crearReciclo`;

DELIMITER $$
USE `reciclaje`$$
CREATE FUNCTION `crearReciclo` (pidProducto int, pidCliente int, cantidad int) RETURNS INTEGER
BEGIN
	declare totalPuntos int;
    declare puntosUser int;
    set totalPuntos  = getTotalPuntosProducto(cantidad, pidProducto);
    set puntosUser =  getPuntosUser(pidCliente);
    if totalPuntos<puntosUser then 
		call restarPuntos(pidCliente,cantidad);
        insert into canje(id_producto, id_cliente,fecha,cantidad,totalPuntos)
        values(pidProducto,pidCliente,DATE_FORMAT(sysdate(), "%M %d %Y"),cantidad,totalPuntos);
		return 1;
    end if;
    return 0;
END$$

DELIMITER ;



/*Alters*/

USE `reciclaje`;
DROP procedure IF EXISTS `crearUsuario`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearUsuario`(in username varchar(75), in pclave varchar(200), in pidDedicacion int)
BEGIN
    call crearBitacora(pclave);
    insert into usuario(usuario, clave, idBitacora, puntos, puntosCanjeados, idDedicacion, fechaMod)
    values(username,pclave,LAST_INSERT_ID(),0,0,pidDedicacion,sysdate());    
END$$

DELIMITER ;

USE `reciclaje`;
DROP procedure IF EXISTS `aumentarPuntos`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `aumentarPuntos`(in pcantidad int, in pidUsuario int)
BEGIN
    update usuario
    set puntos = puntos + pcantidad,
    fechaMod =  sysdate()
    where idUsuario = pidUsuario;
END$$

DELIMITER ;


USE `reciclaje`;
DROP procedure IF EXISTS `restarPuntos`;

DELIMITER $$
USE `reciclaje`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `restarPuntos`(in pidUser int , in cantidad int)
BEGIN
    update usuario 
    set puntos =  puntos -cantidad,
    puntosCanjeados = puntosCanjeados + cantidad,
    fechaMod  =  sysdate()
    where idUsuario =  pidUser;
END$$

DELIMITER ;

