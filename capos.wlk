object rolando {
 const artefactos = [] 
 var capacidadMaxima= 2
 method mochila() {
   return artefactos 
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

}
