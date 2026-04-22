object rolando {
 const artefactos = #{}
 var capacidadMaxima= 2
 var castilloActual = castillo
 const mochila = []
 var valorBase = 5
 method valorBase(_valor) {
   valorBase= _valor 
 }
 method artefactos() {
   return artefactos 
 }
 method capacidadActual() {
   return capacidadMaxima
 }
 method castillo(_castillo) {
   castilloActual= _castillo  
 }
 method castilloActual() {
   return castilloActual
 }
 method tamañoMochila() {
   return artefactos.size()
 }
 method encuentraArtefacto(artefacto) {
   self.recolectarArtefacto(artefacto)
 }
method recolectarArtefacto(artefacto) {
   mochila.add(artefacto)
   if (artefactos.size() < capacidadMaxima){
   artefactos.add(artefacto)
 } else {
    self.error(" la mochila esta llena ")
 }
}
 method capacidad(_capacidad){
    capacidadMaxima= _capacidad
 }
 method llegarA(){ 
   castilloActual.guardarArtefactos(artefactos)
   artefactos.clear()
 }
 method artefactosEnPosecion() {
   return artefactos + castilloActual.artefactos()
 }
 method hayArtefacto(artefacto) {
   return artefactos.find(artefacto)
 }
 method historialDeArtefactos() {
   return mochila
 }
method poderBase() {
  return valorBase
}
method valorDePelea(){ 
  return  valorBase + artefactos.sum({poderArtefacto => poderArtefacto.aporteDePoder(self)})
}
method pelear() {
  self.usarArtefactos()
  self.actualizarValorBase()
}
method actualizarValorBase() {
  valorBase = valorBase + 1
}

method usarArtefactos() {
   artefactos.forEach({usadoEnLaBatalla => usadoEnLaBatalla.usarEnBatalla(self)})
}
method artefactosMasPoderosoDeLaMorada() {
  return castilloActual.artefactoMasPoderoso(self)
}
}
object castillo {
  const inventario = #{}
  method guardarArtefactos(mochila) {
     inventario.addAll(mochila)
  } 
  method inventario() {
    return inventario 
  }
  method artefactoMasPoderoso(personaje) {
  return inventario.max({artefactoActual => artefactoActual.aporteDePoder(personaje)})
}
}

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