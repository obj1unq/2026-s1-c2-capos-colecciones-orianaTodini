import capos.* 
import artefactos.* 


object erethia { 
    const enemigos = #{caterina, archibaldo, astra}
    method enemigos() {
      return enemigos
    }
      method enemigosQuePuedeVencer(personaje){
      return enemigos.filter({enemigo => enemigo.aporteDePoder() < personaje.valorDePelea()})
    }
    method puedeVencerATodos(personaje){
      return enemigos.all({enemigo => personaje.valorDePelea() > enemigo.aporteDePoder()})
}
    }

object caterina{
    method aporteDePoder() {
      return 28 
    }
    method morada(){
        return fortalezaDeAcero 
    }
    method puedeSerVencidoPor(personaje) {
    return self.aporteDePoder() < personaje.valorDePelea()
  }
}


object archibaldo{ 
    method aporteDePoder() {
      return 16 
    }
    method morada(){
        return palacioDeMarmol
    }
    method puedeSerVencidoPor(personaje) {
    return self.aporteDePoder() < personaje.valorDePelea()                 
  }

}
object astra  {
  method aporteDePoder() {
    return 14 
  }
  method morada () {
    return torreDeMarfil
  }
  method puedeSerVencidoPor(personaje) {
    return self.aporteDePoder() < personaje.valorDePelea()
  }
}

object fortalezaDeAcero {
  
}

object palacioDeMarmol  {
  
}

object torreDeMarfil {
  
}