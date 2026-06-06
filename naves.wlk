import combustible.*
class Nave {
  var property velocidad
  var property direccion
  var property combustible
  
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
    combustible =+ cuanto
  }

  method descargarCombustible(cuanto) {
    combustible =- cuanto
  }
  
}

class NaveBaliza inherits Nave {
  var colorDeBaliza
  
  method colorDeBaliza() = colorDeBaliza
  
  method cambiarColorDeBaliza(nuevoColor) {
    colorDeBaliza = nuevoColor
  }

  override method prepararViaje() {
    super();
    self.cambiarColorDeBaliza("Verde")
    self.ponerseParaleloAlSol()
  }
}

class NaveDePasajeros inherits Nave {
  var cantidadDePasajeros
  var cantidadDeRacionesDeComida = 0
  var cantidadDeRacionesDeBebida = 0
  
  method cantidadDePasajeros() = cantidadDePasajeros
  
  method cargarPasajeros(cantidad) {
    cantidadDePasajeros += cantidad
  }
  
  method cargarRacionesDeComida(cantidad) {
    cantidadDeRacionesDeComida += cantidad
  }
  
  method cargarRacionesDeBebida(cantidad) {
    cantidadDeRacionesDeBebida += cantidad
  }
  
  method descargarRacionesDeComida(cantidad) {
    cantidadDeRacionesDeComida = 0.max(cantidadDeRacionesDeComida - cantidad)
  }
  
  method descargarRacionesDeBebida(cantidad) {
    cantidadDeRacionesDeBebida = 0.max(cantidadDeRacionesDeBebida - cantidad)
  }

  override method prepararViaje() {
    super();
    self.cargarRacionesDeComida(4 * cantidadDePasajeros)
    self.cargarRacionesDeBebida(6 * cantidadDePasajeros)
    self.acercarseUnPocoAlSol()
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

  method mensajesEmitidos() {
    return listaDeMensajes
  }

  method primerMensajeEmitido() {
    return listaDeMensajes.first()
  }

  method ultimoMensajeEmitido() {
    return listaDeMensajes.last()
  }

  method esEscueta() {
    return listaDeMensajes.any({mensaje => not mensaje.length() <= 30})
  }

  method emitioMensaje(mensaje) {
    return listaDeMensajes.contains({mensaje => mensaje == mensaje})
  }

  override method prepararViaje() {
    self.ponerseInvisible()
    self.replegarMisiles()
    self.acelerar(5000)
    self.acelerar(15000)
    self.emitioMensaje("Saliendo en misión")
  }
}
