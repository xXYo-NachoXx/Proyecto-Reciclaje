

/*Job*/

SET GLOBAL event_scheduler = ON;


/*Tabla*/
CREATE TABLE `reciclaje`.`reciclajediario` (
  `idReciclajeDiario` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificación de la tupla ',
  `usuario` VARCHAR(45) NULL COMMENT 'Persona que más reciclo durante el día',
  `centroAcopio` VARCHAR(45) NULL COMMENT 'Centro donde más recicló',
  `fecha` DATE NULL COMMENT 'Día en el que más se reciclo \n',
  PRIMARY KEY (`idReciclajeDiario`))
COMMENT = 'Tabla para almacenar las personas con mayor reciclaje todos los días';


/*Query de inserción*/

select us.usuario, ct.nombre, info.cantidad
	from (
		select idUsuario , idAcopio ,sum(cantidad) cantidad
		from reciclo 
		where DATE_FORMAT(fecha, "%M %d %Y") = DATE_FORMAT(sysdate(), "%M %d %Y")
		group by idUsuario, idAcopio 
        order by cantidad asc
	)info
    inner join usuario us
    on us.idUsuario =  info.idUsuario
    inner join centroAcopio ct
    on ct.idCentroAcopio  =  info.idAcopio
    limit 1;


CREATE EVENT `usuarioReciclaje` ON SCHEDULE EVERY 1 DAY 
STARTS '2018-06-04 22:00:00.000000' ENDS '2018-12-31 00:00:00.000000' 
ON COMPLETION NOT PRESERVE ENABLE DO 
insert into reciclajediario(usuario,centroacopio,fecha) 
select us.usuario, ct.nombre, info.cantidad
	from (
		select idUsuario , idAcopio ,sum(cantidad) cantidad
		from reciclo 
		where DATE_FORMAT(fecha, "%M %d %Y") = DATE_FORMAT(sysdate(), "%M %d %Y")
		group by idUsuario, idAcopio 
        order by cantidad desc
	)info
    inner join usuario us
    on us.idUsuario =  info.idUsuario
    inner join centroAcopio ct
    on ct.idCentroAcopio  =  info.idAcopio
limit 1;