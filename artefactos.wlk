import capos.* 
import enemigos.* 


object espadaDelDestino {
  var esUsada = false

  method usarEnBatalla(personaje) {
    esUsada= true
  }

  method aporteDePoder(personaje) {
    if (!esUsada) {
      return personaje.poderBase()
    } else {
      return personaje.poderBase() / 2
    }
  }
  
}
object collarDivino {
  var vecesUsado= 0 
 method aporteDePoder(personaje) {
   if (personaje.poderBase() > 6) {
      return self.poder() + self.vecesUsado()
    }
      return self.poder() 
  }
    method usarEnBatalla(personaje) {
      vecesUsado = vecesUsado + 1
    }
    method vecesUsado() {
      return vecesUsado
    }
    method poder(){
      return 3
    }
  }


object armaduraDeAceroValyrio {
  method aporteDePoder(personaje) {
    return  6 
  }
  method usarEnBatalla(personaje) {
    // no hace nada porque no se gasta 
  }

}

object libroDeHechizos {
  const hechizos = [bendicion,invisibilidad,invocacion] // Los hechizos están ordenados y se utilizan en ese orden. Por esta oracion se da a entender que los hechizos ya estan inicializados?
  method coleccionDeHechizos(hechizo) {
    hechizos.add(hechizo)
  }
  method aporteDePoder(personaje) {
   if (!hechizos.isEmpty()){
   return hechizos.first().poderPelea(personaje)
  } else { 
    return 0 }
  }
  method usarEnBatalla(personaje) {
    if (!hechizos.isEmpty()){
      hechizos.remove(hechizos.first())
    }

  }
  method listaDeHechizos() {
    return hechizos
  }
}

object bendicion {
  method poderPelea(personaje){
    return 4
  }
}

object invisibilidad {
  method poderPelea(personaje) {
    return personaje.poderBase()
  }
}

object invocacion {
  method poderPelea(personaje) {
    return personaje.poderDeArtefactoMasPoderoso(personaje)
  }
  }
