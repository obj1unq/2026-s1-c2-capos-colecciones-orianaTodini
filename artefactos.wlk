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
    const poder = 3
    if (personaje.poderBase() > 6) {
     return poder + self.vecesUsado()
    }
     return poder 
  }
    method usarEnBatalla(personaje) {
      vecesUsado = vecesUsado + 1
    }
    method vecesUsado() {
      return vecesUsado
    }
  }


object armaduraDeAceroValyrio {
  method aporteDePoder(personaje) {
    return  6 
  }
  method usarEnBatalla(personaje) {
    return true 
  }

}

object libroDeHechizos {
  const hechizos = []
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
    return personaje.castilloActual().artefactoMasPoderoso(personaje).aporteDePoder(personaje)
  }
}