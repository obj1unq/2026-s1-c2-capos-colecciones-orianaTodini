import capos.* 
import artefactos.* 


object erethia { 
    const enemigos = #{caterina, archibaldo, astra}
    method enemigos() {
      return enemigos
    }
}
object caterina{
    method aporteDePelea() {
      return 28 
    }
    method morada(){
        return fortalezaDeAcero 
    }
    method puedeSerVencidoPor(personaje) {
    return self.aporteDePelea() < personaje.valorDePelea()
  
  }
}


object archibaldo{ 
    method aporteDePelea() {
      return 16 
    }
    method morada(){
        return palacioDeMarmol
    }
    method puedeSerVencidoPor(personaje) {
    return self.aporteDePelea() < personaje.valorDePelea()                 
  }

}
object astra  {
  method aporteDePelea() {
    return 14 
  }
  method morada () {
    return torreDeMarfil
  }
  method puedeSerVencidoPor(personaje) {
    return self.aporteDePelea() < personaje.valorDePelea()
  }
}

object fortalezaDeAcero {
  
}

object palacioDeMarmol  {
  
}

object torreDeMarfil {
  
}