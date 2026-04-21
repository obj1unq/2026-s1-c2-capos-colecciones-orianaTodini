object rolando {
 const artefactos = #{}
 var capacidadMaxima= 2
 var castilloActual = castilloDePiedra
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
 method castilloActual(_castillo) {
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
method valorDePeleas(){ 
  return  valorBase + artefactos.sum({poderArtefacto => poderArtefacto.aporteDePoder(self)})
}
method pelear() {
  artefactos.forEach({usadoEnLaBatalla => usadoEnLaBatalla.usarEnBatalla(self)})
  valorBase = valorBase + 1 
}
}
object castilloDePiedra {
  const inventario = #{}
  method guardarArtefactos(mochila) {
     inventario.addAll(mochila)
  } 
  method inventario() {
    return inventario 
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
object libroDeHechizos {
}
object collarDivino {
  var vecesUsado= 0 
 method aporteDePoder(personaje) {
    var poder = 3
    if (personaje.poderBase() > 6) {
      poder = poder + vecesUsado
    }
    return poder
  }
    method usarEnBatalla(personaje) {
      vecesUsado = vecesUsado + 1
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