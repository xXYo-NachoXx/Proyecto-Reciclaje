

USE `reciclaje`;
DROP procedure IF EXISTS `totalPuntosCanjeados`;

DELIMITER $$
USE `reciclaje`$$
CREATE PROCEDURE `totalPuntosCanjeados` (in pidComercio int)
BEGIN
 select ifo.tp
    from (
  select info.cm, sum(totalPuntos) tp
  from(
   select can.pr, pt.idComercio cm, can.totalPuntos
   from(
     select id_producto pr, totalPuntos
     from canje 
   ) can 
   inner join producto pt 
   on pt.idProducto =  can.pr
  ) info 
  group by info.cm
 ) ifo
    where ifo.cm = pidComercio; 
END$$

DELIMITER ;



						USE `reciclaje`;
						DROP procedure IF EXISTS `totalPuntosCanjeados`;

						DELIMITER $$
						USE `reciclaje`$$
						CREATE PROCEDURE `totalPuntosCanjeados` (in pidComercio int)
						BEGIN
						 select ifo.tp
						    from (
						  select info.cm, sum(totalPuntos) tp
						  from(
						   select can.pr, pt.idComercio cm, can.totalPuntos
						   from(
						     select id_producto pr, totalPuntos
						     from canje 
						   ) can 
						   inner join producto pt 
						   on pt.idProducto =  can.pr
						  ) info 
						  group by info.cm
						 ) ifo
						    where ifo.cm = pidComercio; 
						END$$

						DELIMITER ;
