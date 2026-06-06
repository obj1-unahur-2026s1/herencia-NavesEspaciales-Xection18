class Nave {
  var velocidad
  var direccion
  var combustible
  
  method estadoDeDireccion() {
    if (direccion == 0) {
      console.println("Paralelo al sol")
    } else {
      if ((direccion > (-10)) and (direccion < 0)) {
        console.println("Escapando del sol")
      } else {
        if ((direccion < 10) and (direccion > 0)) console.println(
            "Yendo hacia el sol"
          )
      }
    }
  }
  
  method acelerar(cuanto) {
    velocidad = 100000.min(velocidad + cuanto)
  }
  
  method velocidad() = velocidad
  
  method direccion() = direccion
  
  method combustible() = combustible
  
  method desacelerar(cuanto) {
    velocidad = 0.max(velocidad - cuanto)
  }
  
  method irHaciaElSol() {
    direccion = 10
  }
  
  method escaparDelSol() {
    direccion = -10
  }
  
  method ponerseParaleloAlSol() {
    direccion = 0
  }
  
  method acercarseUnPocoAlSol() {
    direccion = 10.min(direccion + 1)
  }
  
  method alejarseUnPocoDelSol() {
    direccion = (direccion - 1).max(-10)
  }
  
  method prepararViaje() {
    self.cargarCombustible(30000)
    self.acelerar(5000)
  }
  
  method cargarCombustible(cuanto) {
    combustible = +cuanto
  }
  
  method descargarCombustible(cuanto) {
    combustible = -cuanto
  }
  
  method estaTranquila() {
    return ((combustible >= 4000) and (velocidad <= 1200))
  }
  
  method recibirAmenaza() {
    
  }

  method tenerPocaActividad() {

  }

  method estaDeRelajo() {

  }
}

class NaveBaliza inherits Nave {
  var colorDeBaliza
  var cambioDeColor = false
  
  method colorDeBaliza() = colorDeBaliza
  
  method cambiarColorDeBaliza(nuevoColor) {
    colorDeBaliza = nuevoColor
    cambioDeColor = true
  }
  
  override method prepararViaje() {
    super()
    self.cambiarColorDeBaliza("Verde")
    self.ponerseParaleloAlSol()
  }
  
  override method estaTranquila() = ((combustible >= 4000) and (velocidad <= 1200)) and (self.colorDeBaliza() != "Rojo")
  
  override method recibirAmenaza() {
    self.irHaciaElSol()
    self.cambiarColorDeBaliza("Rojo")
  }

  override method tenerPocaActividad() {
    return not cambioDeColor
  }

  override method estaDeRelajo() {
    return self.estaTranquila() and self.estaDeRelajo()
  }
}

class NaveDePasajeros inherits Nave {
  var cantidadDePasajeros
  var cantidadDeRacionesDeComida = 0
  var cantidadDeRacionesDeBebida = 0
  var cantidadDeRacionesServidas = 0
  
  method cantidadDePasajeros() = cantidadDePasajeros
  
  method cargarPasajeros(cantidad) {
    cantidadDePasajeros += cantidad
  }
  
  method cargarRacionesDeComida(cantidad) {
    cantidadDeRacionesDeComida += cantidad
    cantidadDeRacionesServidas += cantidad
  }
  
  method cargarRacionesDeBebida(cantidad) {
    cantidadDeRacionesDeBebida += cantidad
    cantidadDeRacionesServidas += cantidad
  }
  
  method descargarRacionesDeComida(cantidad) {
    cantidadDeRacionesDeComida = 0.max(cantidadDeRacionesDeComida - cantidad)
  }
  
  method descargarRacionesDeBebida(cantidad) {
    cantidadDeRacionesDeBebida = 0.max(cantidadDeRacionesDeBebida - cantidad)
  }
  
  method darRacionesDeComida(cuanto) {
    self.descargarRacionesDeComida(cuanto)
  }
  
  method darRacionesDeBebida(cuanto) {
    self.descargarRacionesDeBebida(cuanto)
  }
  
  override method prepararViaje() {
    super()
    self.cargarRacionesDeComida(4 * cantidadDePasajeros)
    self.cargarRacionesDeBebida(6 * cantidadDePasajeros)
    self.acercarseUnPocoAlSol()
  }
  
  override method recibirAmenaza() {
    self.acelerar(self.velocidad() * 2)
    self.darRacionesDeComida(cantidadDePasajeros * 1)
    self.darRacionesDeBebida(cantidadDePasajeros * 2)
  }

  override method tenerPocaActividad() {
    return cantidadDeRacionesServidas < 50
  }

  override method estaDeRelajo() {
    return self.estaTranquila() and self.estaDeRelajo()
  }
}

class NaveDeCombate inherits Nave {
  var estaInvisible = false
  var misilesDesplegados = false
  const listaDeMensajes = []
  
  method agregarMensajeALaLista(mensaje) {
    listaDeMensajes.add(mensaje)
  }
  
  method ponerseVisible() {
    estaInvisible = false
  }
  
  method ponerseInvisible() {
    estaInvisible = true
  }
  
  method estaInvisible() = estaInvisible
  
  method desplegarMisiles() {
    misilesDesplegados = true
  }
  
  method replegarMisiles() {
    misilesDesplegados = false
  }
  
  method misilesDesplegados() = misilesDesplegados
  
  method emitirMensaje(mensaje) {
    console.println(mensaje)
    self.agregarMensajeALaLista(mensaje)
  }
  
  method mensajesEmitidos() = listaDeMensajes
  
  method primerMensajeEmitido() = listaDeMensajes.first()
  
  method ultimoMensajeEmitido() = listaDeMensajes.last()
  
  method esEscueta() = listaDeMensajes.any(
    { mensaje => (not mensaje.length()) <= 30 }
  )
  
  method emitioMensaje(mensaje) = listaDeMensajes.contains(
    { mensaje => mensaje == mensaje }
  )
  
  override method prepararViaje() {
    self.ponerseInvisible()
    self.replegarMisiles()
    self.acelerar(5000)
    self.acelerar(15000)
    self.emitioMensaje("Saliendo en misión")
  }
  
  override method estaTranquila() = ((combustible >= 4000) and (velocidad <= 1200)) and self.misilesDesplegados()
  
  override method recibirAmenaza() {
    self.acercarseUnPocoAlSol()
    self.acercarseUnPocoAlSol()
    self.emitioMensaje("Amenaza recibida")
  }
}

class NaveHospital inherits NaveDePasajeros {
  var tienePreparadoLosQuirofanos
  
  method tienePreparadosLosQuirofanos() = tienePreparadoLosQuirofanos
  
  method prepararQuirofanos() {
    tienePreparadoLosQuirofanos = true
  }
  
  override method estaTranquila() = ((combustible >= 4000) and (velocidad <= 1200)) and (not self.tienePreparadosLosQuirofanos())

  override method recibirAmenaza() {
    super();
    self.prepararQuirofanos()
  }
}

class NaveDeCombateSigilosa inherits NaveDeCombate {
  override method estaTranquila() = (((combustible >= 4000) and (velocidad <= 1200)) and self.misilesDesplegados()) and (not self.estaInvisible())

  override method recibirAmenaza() {
    super();
    self.desplegarMisiles()
    self.ponerseInvisible()
  }
}