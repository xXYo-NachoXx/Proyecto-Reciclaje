

/* Primera consulta */
	select com.nom Comercio, store.nombre Tipo, us.usuario Administrador
    from (	
		select nombre nom, idTipo tip,idAdministrador ad
		from comercio
	) com
    inner join tipoComercio store 
    on store.idtipoComercio = com.tip
    inner join usuario us
    on us.idUsuario =  com.ad
	

	    
/*Segunda consulta*/
    select inf.nomb, inf.ap, inf.cel, inf.dis, inf.can, pro.nombre pro
    from (
		select info.nomb, info.ap, info.cel, info.dis, ct.nombre can, ct.idProvincia prv
		from(
			select per.nom nomb, per.app ap, per.cel cel,dt.nombre dis, dt.idCanton cant
			from (
				select nombre nom, apellido app, cedula cel, idDistrito dis
				from persona
			) per 
			inner join distrito dt
			on dt.idDistrito =  per.dis
		) info 
		inner join canton ct
		on ct.idCanton = info.cant
	) inf
    inner join provincia pro
    on pro.idProvincia =  inf.prv;


/*Tercera consulta*/
select cont.nombre, cont.apellido, cont.usuario, bitU.fecha_creacion
from (
	select per.nombre, per.apellido, us.usuario, us.idBitacora
    from(
		select idPersona idper, idUsuario iduser
		from persona_x_usuario
	) info 
    inner join persona per
    on per.idPersona = info.idper
    inner join usuario us
    on us.idUsuario = info.iduser
) cont
inner join bitacorausuario bitU
on bitU.idBitacoraUsuario = cont.idBitacora;
/*fecha*/



/*Cuarta consulta*/
select comer.nombre, comer.cant, cm.nombre
	from (
		select pr.nombre, info.cant,pr.idComercio shop
		from(
			select id_producto pro, count(id_producto) cant
			from canje
			group by id_producto
			order by cant asc
		) info 
		inner join producto pr 
		on pr.idProducto =  info.pro
	) comer 
    inner join comercio cm
    on cm.idComercio =  comer.shop



/*Quinta consulta*/

select usuario, puntos, puntosCanjeados, abs(puntos-puntosCanjeados) diferencia
    from usuario;
    /*fecha   - - - -- - - - - -fecha mod lista solo para el where*/



---------------Modulo de consultas para usuarios

-----Nota se puede agregar con las anteriores
	select nombre, descripcion,valor,cantidad,foto 
    from producto
    where idComercio = 1;/*Parametro del comercio*/

-------------------------------------------------------
	
	----Modulo de consultas para comercios 
	
	/*Primera consulta*/
	select nombre, descripcion,valor,cantidad,foto 
    from producto
    where idComercio = 1;/*Parametro del comercio*/

	
    /*Segunda Consulta*/

    select comer.nombre
	from (
		select pr.nombre, info.cant
		from(
			select id_producto pro, count(id_producto) cant
			from canje
			group by id_producto
			order by cant asc
		) info 
		inner join producto pr 
		on pr.idProducto =  info.pro
	) comer 
    inner join comercio cm
    on cm.idComercio =  comer.shop

/*Tercera consulta*/   

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
    where ifo.cm = 1; /*Cambiar numero por parametro*/
    
    
-------Modulo de consultas para centros de acopio
	
	/*Primera consulta*/
	select  tp.idtipoMaterial idm ,tp.nombre nom, sum(inf.cnt)
    from (
		select mtl.nombre, mtl.id_tipo, info.cnt
		from (
					select idMaterial mt, cantidad cnt
					from reciclo 
					where idAcopio = 1 /*y la fecha*/
		)info 
		inner join material mtl
		on mtl.idMaterial =  info.mt
    ) inf
    inner join tipoMaterial tp 
    on tp.idtipoMaterial =  inf.id_tipo
    group by idm;
    
	/*Segunda consulta*/
	 select us.usuario, info.cnt
		from (
			select idUsuario, sum(cantidad) cnt
			from reciclo
			where idAcopio = 1  /*cambiar*/
			group by idUsuario
			order by cnt asc 
		) info 
	    inner join usuario us
	    on us.idUsuario = info.idUsuario
	    limit 5;
	
	/*Tercera consulta*/

 select userg.nombre, (cantidad * mts.valor) cnt
    from(
		select idUsuario us, cantidad, idMaterial
		from reciclo
    )info 
    inner join material mts
    on mts.idMaterial =  info.idMaterial
    inner join usuario userg
    on userg.idUsuario =  info.us


