object rolando {
 const artefactos = #{}
 var capacidadMaxima= 2
 var hogar = castilloDePiedra

 method artefactos() {
   return artefactos 
 }
 method hogar(_hogar) {
   hogar= _hogar  
 }
 method tamañoMochila() {
   return artefactos.size()
 }
 method encuentraArtefacto(artefacto) {
   self.recolectarArtefacto(artefacto)
 }
method recolectarArtefacto(artefacto) {
   if (artefactos.size() < capacidadMaxima){
   artefactos.add(artefacto)
 } else {
    self.error(" la mochila esta llena ")
 }
}
 method capacidad(_capacidad){
    capacidadMaxima= _capacidad
 }
 method llegarA(hogar) {
   hogar.guardarArtefactos(artefactos)
   artefactos.clear()
 }
 method artefactosEnPosecion() {
   return artefactos + hogar.artefactos()
 }
 method hayArtefacto(artefacto) {
   return artefactos.find(artefacto)
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
}
object libroDeHechizos {
}
object collarDivino {
}

object armaduraDeAceroValyrio {

}