import enemigos.*
import artefactos.* 

object rolando {
 const artefactos = #{}
 var capacidadMaxima= 2
 var castilloActual = castillo
 const historialDeArtefactos = []
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
   historialDeArtefactos.add(artefacto)
   if (artefactos.size() < capacidadMaxima){
   artefactos.add(artefacto)
 }
}
 method capacidad(_capacidad){
    capacidadMaxima= _capacidad
 }
 method llegarAHogar(){ 
   castilloActual.guardarArtefactos(artefactos)
   artefactos.clear()
 }
 method artefactosEnPosecion() {
   return artefactos + castilloActual.artefactos()
 }
 method hayArtefacto(artefacto) {
   return artefactos.contains(artefacto)
 }
 method historialDeArtefactos() {
   return historialDeArtefactos
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
method artefactoMasPoderosoDeLaMorada() {
  return castilloActual.artefactoMasPoderoso(self)
}
method poderDeArtefactoMasPoderoso(personaje){
  return self.artefactoMasPoderosoDeLaMorada().aporteDePoder(personaje)
}
method enemigosQuePuedeVencerEn(tierra) {
  return tierra.enemigosQuePuedeVencer(self)
}

method moradasQuePuedeConquistar(tierra) {
  return self.enemigosQuePuedeVencerEn(tierra).map({enemigo => enemigo.morada()})
}
method esPoderosoEn(tierra) {
  return  tierra.puedeVencerATodos(self)
}
method tieneArtefactoFatalPara(enemigo) {
  return artefactos.any { artefacto => self.esLetal(artefacto,enemigo)}
}
method artefactoMasLetalPara(enemigo) {
  return artefactos.find({artefacto => self.esLetal(artefacto,enemigo)})
}
method esLetal(artefacto,enemigo) {
  return artefacto.aporteDePoder(self) > enemigo.aporteDePoder()
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
