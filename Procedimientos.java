//Coneccion a la BD

Connection conn = null;
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reciclaje?autoReconnect=true&useSSL=false", "reciclo", "reciclo_2018");

//Crear Pais

CallableStatement crearPais = conn.prepareCall("{call reciclaje.crearPais(?)}");
crearPais.setString(1, nombrePais);
crearPais.executeQuery();
crearPais.close();

//Crear Provincia

CallableStatement crearProvincia = conn.prepareCall("{call reciclaje.crearProvincia(?, ?)}");
crearProvincia.setString(1, nombreProvincia);
crearProvincia.setInt(2, idPais);
crearProvincia.executeQuery();
crearProvincia.close();

//Crear Canton

CallableStatement crearCanton = conn.prepareCall("{call reciclaje.crearCanton(?, ?)}");
crearCanton.setString(1, nombreCanton);
crearCanton.setInt(2, idProvincia);
crearCanton.executeQuery();
crearCanton.close();

//Crear Distrito

CallableStatement crearDistrito = conn.prepareCall("{call reciclaje.crearDistrito(?, ?)}");
crearDistrito.setString(1, nombreDistrito);
crearDistrito.setInt(2, idCanton);
crearDistrito.executeQuery();
crearDistrito.close();

//Crear Tipo Comercio

CallableStatement tipoComercio = conn.prepareCall("{call reciclaje.tipoComercio(?)}");
tipoComercio.setString(1, nombreTipo);
tipoComercio.executeQuery();
tipoComercio.close();

//Crear Tipo Material

CallableStatement tipoMaterial = conn.prepareCall("{call reciclaje.tipoMaterial(?)}");
tipoMaterial.setString(1, nombreMaterial);
tipoMaterial.executeQuery();
tipoMaterial.close();

//Crear Dedicacion

CallableStatement crearDedicacion = conn.prepareCall("{call reciclaje.crearDedicacion(?)}");
crearDedicacion.setString(1, nombreDedicacion);
crearDedicacion.executeQuery();
crearDedicacion.close();

//Crear Material

CallableStatement crearMaterial = conn.prepareCall("{call reciclaje.crearMaterial(?, ?, ?)}");
crearMaterial.setString(1, nombreMaterial);
crearMaterial.setInt(2, valor);
crearMaterial.setInt(3, idTipoMaterial);
crearMaterial.executeQuery();
crearMaterial.close();

//Crear Comercio

CallableStatement crearComercio = conn.prepareCall("{call reciclaje.crearComercio(?, ?, ?)}");
crearComercio.setString(1, nombreMaterial);
crearComercio.setInt(2, idTipoComercio);
crearComercio.setInt(3, idAdministrador);
crearComercio.executeQuery();
crearComercio.close();

//Editar Comercio

CallableStatement editarComercio = conn.prepareCall("{call reciclaje.editarComercio(?, ?, ?, ?)}");
editarComercio.setInt(1, idComercio);
editarComercio.setString(2, nombreMaterial);
editarComercio.setInt(3, idTipoComercio);
editarComercio.setInt(4, idAdministrador);
editarComercio.executeQuery();
editarComercio.close();

//Crear Producto

CallableStatement crearProducto = conn.prepareCall("{call reciclaje.crearProducto(?, ?, ?, ?, ?, ?)}");
crearProducto.setString(1, nombreProducto);
crearProducto.setString(2, descripcion);
crearProducto.setInt(3, valor);
//foto a blob
File blob2 = new File(imagenProducto.getAbsolutePath());
FileInputStream in = new FileInputStream(blob2);
crearProducto.setBinaryStream(3, in, (int)blob2.length());
crearProducto.setInt(5, idComercio);
crearProducto.setInt(6, cantidad);
crearProducto.executeQuery();
crearProducto.close();

//Crear Persona

CallableStatement crearPersona = conn.prepareCall("{call reciclaje.crearPersona(?, ?, ?, ?, ?, ?, ?)}");
crearPersona.setString(1, nombrePersona);
crearPersona.setString(2, apellidoPersona);
//Fecha
String input = fechaRegistro.getText();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
java.util.Date dt = null;
dt = sdf.parse(input);
java.sql.Date dtSql = new java.sql.Date(dt.getTime());
crearPersona.setDate(3, dtSql);
crearPersona.setString(4, email);
crearPersona.setInt(5, cedula);
crearPersona.setInt(6, telefono);
crearPersona.setInt(7, idDistrito);
crearPersona.executeQuery();
crearPersona.close();

//Editar Persona

CallableStatement editarPersona = conn.prepareCall("{call reciclaje.editarPersona(?, ?, ?, ?)}");
editarPersona.setInt(1, idPersona);
editarPersona.setString(2, nombrePersona);
editarPersona.setString(3, apellidoPersona);
editarPersona.setString(4, email);
editarPersona.executeQuery();
editarPersona.close();

//Crear Centro de acopio

CallableStatement crearCentroAcopio = conn.prepareCall("{call reciclaje.crearCentroAcopio(?, ?, ?, ?, ?, ?, ?)}");
crearCentroAcopio.setString(1, nombreCentro);
crearCentroAcopio.setString(2, direccion);
crearCentroAcopio.setInt(3, telefono);
crearCentroAcopio.setInt(4, idEncargado);
crearCentroAcopio.setInt(5, idDistrito);
crearCentroAcopio.setString(6, latitud);
crearCentroAcopio.setString(7, longitud);
crearCentroAcopio.executeQuery();
crearCentroAcopio.close();

//Editar Centro de acopio

CallableStatement editarCentroAcopio = conn.prepareCall("{call reciclaje.editarCentroAcopio(?, ?, ?, ?, ?, ?, ?)}");
editarCentroAcopio.setInt(1, idCentroAcopio);
editarCentroAcopio.setString(2, nombreCentro);
editarCentroAcopio.setString(3, direccion);
editarCentroAcopio.setInt(4, telefono);
editarCentroAcopio.setInt(5, idEncargado);
editarCentroAcopio.setInt(6, idDistrito);
editarCentroAcopio.setString(7, latitud);
editarCentroAcopio.setString(8, longitud);
editarCentroAcopio.executeQuery();
editarCentroAcopio.close();

//Linkear Persona Usuario

CallableStatement linkearPersonaUsuario = conn.prepareCall("{call reciclaje.linkearPersonaUsuario(?, ?)}");
linkearPersonaUsuario.setInt(1, idUsuario);
linkearPersonaUsuario.setInt(2, idPersona);
linkearPersonaUsuario.executeQuery();
linkearPersonaUsuario.close();

//Crear Usuario

CallableStatement cambiarConstrasena = conn.prepareCall("{call reciclaje.cambiarConstrasena(?, ?)}");
cambiarConstrasena.setInt(1, idUsuario);
cambiarConstrasena.setString(2, nuevaClave);
cambiarConstrasena.executeQuery();
cambiarConstrasena.close();

//Aumentar puntos

CallableStatement aumentarPuntos = conn.prepareCall("{call reciclaje.aumentarPuntos(?, ?)}");
aumentarPuntos.setInt(1, cantidad);
aumentarPuntos.setInt(2, idUsuario);
aumentarPuntos.executeQuery();
aumentarPuntos.close();

//Crear Reciclo

CallableStatement crearReciclo = conn.prepareCall("{call reciclaje.crearReciclo(?, ?, ?, ?)}");
crearReciclo.setInt(1, idUsuario);
crearReciclo.setInt(2, idCentroAcopio);
crearReciclo.setInt(3, idMaterial);
crearReciclo.setInt(4, cantidad);
crearReciclo.executeQuery();
crearReciclo.close();

//Restar Puntos

CallableStatement restarPuntos = conn.prepareCall("{call reciclaje.restarPuntos(?, ?)}");
restarPuntos.setInt(1, idUsuario);
restarPuntos.setInt(2, cantidad);
restarPuntos.executeQuery();
restarPuntos.close();

//Obtener valor material

CallableStatement crearCanje = conn.prepareCall("{?= call reciclaje.crearCanje(?, ?)}");
crearCanje.setInt(1, idProducto);
crearCanje.setInt(2, idCliente);
crearCanje.setInt(3, cantidad);
crearCanje.registerOutParameter(4, java.sql.Types.INTEGER);
crearCanje.executeQuery();
int confirmacion = crearCanje.getInt(4);
crearCanje.close();


//Utilidades

//info Pais

CallableStatement infoPais = conn.prepareCall("{call reciclaje.infoPais()}");
ResultSet  rs = infoPais.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoPais.close();

//info Provincia

CallableStatement provinciaInfo = conn.prepareCall("{call reciclaje.provinciaInfo()}");
ResultSet  rs = provinciaInfo.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
provinciaInfo.close();

//info Canton

CallableStatement infoCanton = conn.prepareCall("{call reciclaje.infoCanton()}");
ResultSet  rs = infoCanton.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoCanton.close();

//info Distrito

CallableStatement infoDistrito = conn.prepareCall("{call reciclaje.infoDistrito()}");
ResultSet  rs = infoDistrito.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoDistrito.close();

//info Dedicacion

CallableStatement infoDedicacion = conn.prepareCall("{call reciclaje.infoDedicacion()}");
ResultSet  rs = infoDedicacion.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoDedicacion.close();

//info Tipo Material

CallableStatement infotipoMaterial = conn.prepareCall("{call reciclaje.infotipoMaterial()}");
ResultSet  rs = infotipoMaterial.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infotipoMaterial.close();

//info Tipo Comercio

CallableStatement infotipoComercio = conn.prepareCall("{call reciclaje.infotipoComercio()}");
ResultSet  rs = infotipoComercio.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infotipoComercio.close();

//info Producto

CallableStatement infoProducto = conn.prepareCall("{call reciclaje.infoProducto()}");
ResultSet  rs = infoProducto.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoProducto.close();

//info General Producto

CallableStatement infoProductoAll = conn.prepareCall("{call reciclaje.infoProductoAll()}");
ResultSet  rs = infoProductoAll.executeQuery();
while (rs.next()) {
    System.out.println(rs.getString(1)); // nombre
    System.out.println(rs.getString(2)); //descripcion
    System.out.println(rs.getInt(3)); //valor
    //foto
    File image = new File("C:\\Users\\Gabriel\\Documents\\images\\foto.jpg");
    FileOutputStream fos = new FileOutputStream(image);
    byte[] buffer = new byte[1];
    InputStream is = cursor.getBinaryStream(4);
    while (is.read(buffer) > 0) {
      fos.write(buffer);
    }
    fos.close();
    ImageIcon imgThisImg = new ImageIcon("C:\\Users\\Gabriel\\Documents\\images\\foto.jpg");
    Image scaleImage = imgThisImg.getImage().getScaledInstance(390, 310, Image.SCALE_DEFAULT);
    ImageIcon imgThisImg2 = new ImageIcon(scaleImage);
    fotoHortalizas.setSize(390, 310);
    fotoHortalizas.setIcon(imgThisImg2);
    System.out.println(rs.getInt(5)); //idComercio
    System.out.println(rs.getInt(6)); //cantidad
}
infoProductoAll.close();

//info Material

CallableStatement infoMaterial = conn.prepareCall("{call reciclaje.infoMaterial()}");
ResultSet  rs = infoMaterial.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoMaterial.close();

//info Acopio

CallableStatement acopioInfo = conn.prepareCall("{call reciclaje.acopioInfo()}");
ResultSet  rs = acopioInfo.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
acopioInfo.close();

//Latitud y Longitud Comercio

CallableStatement getLatitudLongitud = conn.prepareCall("{call reciclaje.getLatitudLongitud(?)}");
getLatitudLongitud.setInt(1, idComercio);
ResultSet  rs = getLatitudLongitud.executeQuery();
while (rs.next()) {
    System.out.println(rs.getString(1)); // sireccion
    System.out.println(rs.getInt(2)); //latitud
    System.out.println(rs.getInt(2)); //longitud
}
getLatitudLongitud.close();


//info Comercio

CallableStatement infoComercio = conn.prepareCall("{call reciclaje.infoComercio()}");
ResultSet  rs = infoComercio.executeQuery();
while (rs.next()) {
    System.out.println(rs.getInt(1)); // Id
    System.out.println(rs.getString(2)); //nombre
}
infoComercio.close();

//info Persona

CallableStatement infoPersonaUnico = conn.prepareCall("{call reciclaje.infoPersonaUnico(?)}");
infoUsuarioUnico.setInt(1, idPersona);
ResultSet  rs = infoPersonaUnico.executeQuery();
while (rs.next()) {
    System.out.println(rs.getString(1)); // nombre
    System.out.println(rs.getString(2)); //apellido
    System.out.println(rs.getString(3)); //email
    System.out.println(rs.getInt(4)); // cedula
    System.out.println(rs.getInt(5)); // telefono
}
infoPersonaUnico.close();

//Info Usuario

CallableStatement infoUsuarioUnico = conn.prepareCall("{call reciclaje.infoUsuarioUnico(?)}");
infoUsuarioUnico.setInt(1, idUsuario);
ResultSet  rs = infoUsuarioUnico.executeQuery();
System.out.println(rs.getstring(1)); //usuario
System.out.println(rs.getInt(2)); //puntos
System.out.println(rs.getInt(3)); //puntos canjeados
infoUsuarioUnico.close();

//info Materil unico

CallableStatement infoMaterialUnico = conn.prepareCall("{call reciclaje.infoMaterialUnico(?)}");
infoMaterialUnico.setInt(1, idMaterial);
ResultSet  rs = infoMaterialUnico.executeQuery();
System.out.println(rs.getString(1)); //nombre
System.out.println(rs.getInt(2)); //valor
System.out.println(rs.getString(3)); //tipo material
infoMaterialUnico.close();

//info Producto unico

CallableStatement infoProductoUnico = conn.prepareCall("{call reciclaje.infoProductoUnico(?)}");
infoProductoUnico.setInt(1, idComercio);
ResultSet  rs = infoProductoUnico.executeQuery();
System.out.println(rs.getString(1)); //nombre
System.out.println(rs.getString(2)); //descripcion
System.out.println(rs.getInt(3)); //valor
System.out.println(rs.getInt(4)); //cantidad
infoProductoUnico.close();

//Validacion Contraseña

CallableStatement validacionContrasena = conn.prepareCall("{call reciclaje.validacionContrasena(?, ?, ?)}");
infoProductoUnico.setInt(1, idUsuario);
validacionContrasena.setString(2, contraseña);
validacionContrasena.registerOutParameter(3, java.sql.Types.INTEGER);
validacionContrasena.executeQuery();
System.out.println(rs.getInt(3)); //1 = correcta , 0 = incorrecta
validacionContrasena.close();

//ESTADISTICAS\\

/*1. Edades personas */

public void personaIntervalos(){
    try {
        ArrayList<String> datos = new ArrayList();
        ArrayList<Integer> cantidad = new ArrayList();
        String titulo  =  "Personas por edad";
        CallableStatement cstmt;
        String nom;
        nom = "{call reciclaje.mg018personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("0-18");

        nom = "{call reciclaje.mg1830personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("19-30");

        nom = "{call reciclaje.mg3045personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("31-45");

        nom = "{call reciclaje.mg4655personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("46-55");

        nom = "{call reciclaje.mg5565personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("56-65");

        nom = "{call reciclaje.mg6575personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("66-75");

        nom = "{call reciclaje.mg7685personas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("76-85");

        nom = "{call reciclaje.mg85pluspersonas()}";
        cstmt = conn.prepareCall(nom);
        ResultSet  rs = cstmt.executeQuery();
        cantidad.add(rs.getInt(1));
        datos.add("85+");

    	pieChart(titulo,cantidad, datos);
    }
    catch (SQLException ex) {
        Logger.getLogger(principal.class.getName()).log(Level.SEVERE, null, ex);
    }       
}

/* 2. Total de comercios afiliados agrupados por tipo de comercio*/

public void tipoCentro(){
    try {
    	ArrayList<String> datos = new ArrayList();
        ArrayList<Integer> cantidad = new ArrayList();
        String titulo  =  "Total de comercios afiliados agrupados por tipo de comercio";
		CallableStatement mgtipoCentro = conn.prepareCall("{call reciclaje.mgtipoCentro()}");
		ResultSet  rs = mgtipoCentro.executeQuery();
		while (rs.next()) {
		    datos.add(rs.getString(1));
		    cantidad.add(rs.getInt(2));
		}
		mgtipoCentro.close();
catch (SQLException ex) {
        Logger.getLogger(principal.class.getName()).log(Level.SEVERE, null, ex);
    }       
}

/* 3. Total de productos canjeados*/

public void totalProductos(){
    try {
    	ArrayList<String> datos = new ArrayList();
        ArrayList<Integer> cantidad = new ArrayList();
        String titulo  =  "Total de productos canjeados";
		CallableStatement mgproductosCanjeados = conn.prepareCall("{call reciclaje.mgproductosCanjeados(?, ?)}");
		mgproductosCanjeados.setInt(1, año);
		mgproductosCanjeados.setInt(2, mes);
		ResultSet  rs = mgproductosCanjeados.executeQuery();
		while (rs.next()) {
		    datos.add(rs.getString(1));
		    cantidad.add(rs.getInt(2));
		}
		mgproductosCanjeados.close();
catch (SQLException ex) {
        Logger.getLogger(principal.class.getName()).log(Level.SEVERE, null, ex);
    }       
}

/*4. Top 5 usuarios*/

public void top5Usuarios(){
    try {
    	ArrayList<String> datos = new ArrayList();
        ArrayList<Integer> cantidad = new ArrayList();
        String titulo  =  "Total de comercios afiliados agrupados por tipo de comercio";
		CallableStatement mgtop5usuarios = conn.prepareCall("{call reciclaje.mgtop5usuarios()}");
		ResultSet  rs = mgtop5usuarios.executeQuery();
		while (rs.next()) {
		    datos.add(rs.getString(1));
		    cantidad.add(rs.getInt(2));
		}
		mgtop5usuarios.close();
catch (SQLException ex) {
        Logger.getLogger(principal.class.getName()).log(Level.SEVERE, null, ex);
    }       
}


//Consultas\\

//SuperUsuario\\

//Comercios Afiliados

CallableStatement comerciosAfiliados = conn.prepareCall("{call reciclaje.comerciosAfiliados(?, ?, ?)}");
comerciosAfiliados.setString(1, nombreComercio);
comerciosAfiliados.setInt(2, idEncargado);
comerciosAfiliados.setInt(3, idTipoComercio);
ResultSet  rs = comerciosAfiliados.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + rs.getString(2) + rs.getString(3) + "\n\n");
}
comerciosAfiliados.close();

//Listado de usuarios

CallableStatement listadoUsuarios = conn.prepareCall("{call reciclaje.listadoUsuarios(?, ?, ?, ?, ?)}");
listadoUsuarios.setString(1, nombrePersona);
listadoUsuarios.setInt(2, cedula);
listadoUsuarios.setInt(3, idProvincia);
listadoUsuarios.setInt(4, idCanton);
listadoUsuarios.setInt(5, idDistrito);
ResultSet  rs = listadoUsuarios.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + rs.getString(2) + String.valueOf(rs.getInt(3)) + rs.getString(4) + rs.getString(5) + rs.getString(6) + "\n\n");
}
listadoUsuarios.close();

//Cambios de contraseña

CallableStatement cambiarContrasenas = conn.prepareCall("{call reciclaje.cambiarContrasenas(?, ?, ?, ?, ?)}");
cambiarContrasenas.setString(1, nombrePersona);
cambiarContrasenas.setString(2, apellido);
cambiarContrasenas.setInt(3, cedula);
cambiarContrasenas.setString(4, usuario);
//fechaInicial
String input = fechaRegistro.getText();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
java.util.Date dt = null;
dt = sdf.parse(input);
java.sql.Date dtSql = new java.sql.Date(dt.getTime());
cambiarContrasenas.setDate(5, dtSql);
//fechaFinal
String input = fechaRegistro.getText();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
java.util.Date dt = null;
dt = sdf.parse(input);
java.sql.Date dtSql = new java.sql.Date(dt.getTime());
cambiarContrasenas.setDate(6, dtSql);
ResultSet  rs = cambiarContrasenas.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + rs.getString(2) + String.valueOf(rs.getInt(3)) + rs.getString(4) + "\n\n");
}
cambiarContrasenas.close();	

//Productos Canje

CallableStatement productosCanje = conn.prepareCall("{call reciclaje.productosCanje()}");
ResultSet  rs = productosCanje.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + String.valueOf(rs.getInt(2)) + rs.getString(3) + "\n\n");
}
productosCanje.close();

//Usuarios Puntos

CallableStatement usuarioPuntos = conn.prepareCall("{call reciclaje.usuarioPuntos(?, ?)}");
//fechaInicial
String input = fechaRegistro.getText();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
java.util.Date dt = null;
dt = sdf.parse(input);
java.sql.Date dtSql = new java.sql.Date(dt.getTime());
cambiarContrasenas.setDate(1, dtSql);
//fechaFinal
String input = fechaRegistro.getText();
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
java.util.Date dt = null;
dt = sdf.parse(input);
java.sql.Date dtSql = new java.sql.Date(dt.getTime());
cambiarContrasenas.setDate(2, dtSql);
ResultSet  rs = usuarioPuntos.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + String.valueOf(rs.getInt(2)) + String.valueOf(rs.getInt(3)) + String.valueOf(rs.getInt(4)) + "\n\n");
}
usuarioPuntos.close();

//Centros de Acopio\\

//Listado Productos

CallableStatement listadoProductos = conn.prepareCall("{call reciclaje.listadoProductos(?)}");
listadoProductos.setInt(1, idComercio);
ResultSet  rs = listadoProductos.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + rs.getString(2) + String.valueOf(rs.getInt(3)) + String.valueOf(rs.getInt(4)) + "\n\n");
}
listadoProductos.close();

//Top Productos Canjeados

CallableStatement topProductosCanjeados = conn.prepareCall("{call reciclaje.topProductosCanjeados(?)}");
topProductosCanjeados.setInt(1, idComercio);
ResultSet  rs = topProductosCanjeados.executeQuery();
int cont = 0;
while (rs.next()) {
	cont++;
    textArea.setText(String.valueOf(cont) + ". " + rs.getString(1)+ "\n");
}
topProductosCanjeados.close();

//Total Puntos Canjeados

CallableStatement totalPuntosCanjeados = conn.prepareCall("{call reciclaje.totalPuntosCanjeados(?)}");
totalPuntosCanjeados.setInt(1, idComercio);
ResultSet  rs = totalPuntosCanjeados.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1)`+ rs.getInt(2) + "\n");
}
totalPuntosCanjeados.close();

/*Modulo de consultas para centros de acopio*/

//Materiales Reciclados

CallableStatement materialesReciclados = conn.prepareCall("{call reciclaje.materialesReciclados(?, ?, ?)}");
materialesReciclados.setInt(1, idCentroAcopio);
materialesReciclados.setInt(1, año);
materialesReciclados.setInt(1, mes);
ResultSet  rs = materialesReciclados.executeQuery();
while (rs.next()) {
    textArea.setText(String.valueOf(rs.getInt(1)) + rs.getString(2) + String.valueOf(rs.getInt(3)) + "\n\n");
}
materialesReciclados.close();

//Top 5 reciclajes

CallableStatement materialesReciclados = conn.prepareCall("{call reciclaje.materialesReciclados(?)}");
materialesReciclados.setInt(1, idCentroAcopio);
ResultSet  rs = materialesReciclados.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + String.valueOf(rs.getInt(2)) + "\n");
}
materialesReciclados.close();

//Puntos Obtenidos Usuario

CallableStatement puntosObtenidosUsuario = conn.prepareCall("{call reciclaje.puntosObtenidosUsuario(?, ?)}");
puntosObtenidosUsuario.setInt(1, idUsuario);
puntosObtenidosUsuario.setInt(2, idCentroAcopio);
ResultSet  rs = puntosObtenidosUsuario.executeQuery();
while (rs.next()) {
    textArea.setText(rs.getString(1) + String.valueOf(rs.getInt(2)) + "\n");
}
puntosObtenidosUsuario.close();