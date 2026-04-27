import enemigos.*
import artefactos.* 

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
method enemigosQuePuedeVencerEn(tierra) {
  return tierra.enemigos().filter({enemigo => enemigo.puedeSerVencidoPor(self)})
}

method moradasQuePuedeConquistar(tierra) {
  return self.enemigosQuePuedeVencerEn(tierra).map({enemigo => enemigo.morada()})
}
method esPoderosoEn(tierra) {
  return self.enemigosQuePuedeVencerEn(tierra).size() == 3
}
method tieneArtefactoFatalPara(enemigo) {
  return artefactos.any { artefacto => self.esLetal(artefacto,enemigo)}
}
method artefactoMasLetalPara(enemigo) {
  return artefactos.find({artefacto => self.esLetal(artefacto,enemigo)})
}
method esLetal(artefacto,enemigo) {
  return artefacto.aporteDePoder(self) > enemigo.aporteDePelea()
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
