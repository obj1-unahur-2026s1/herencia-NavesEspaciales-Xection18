class Nave {
  var property velocidad
  var property direccion
  
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
}

class NaveBaliza inherits Nave {
  var colorDeBaliza
  
  method colorDeBaliza() = colorDeBaliza
  
  method cambiarColorDeBaliza(nuevoColor) {
    colorDeBaliza = nuevoColor
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
}

class NaveDeCombate inherits Nave {
  var estaInvisible = false
  var misilesDesplegados = false
  
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
}