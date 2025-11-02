class Pack{
  const property duracion
  const property precioBase
  const property beneficiosEspeciales = []
  var property coordinador

  method beneficiosVigentes() = beneficiosEspeciales.filter{b => b.estaVigente()}

  method costoTotal() = precioBase + self.beneficiosVigentes().sum{b => b.costo()}

  method esPremium()

}

class PackNacional inherits Pack{
  const destino
  const actividades = #{}

  override method esPremium() = duracion > 10 and coordinador.esAltamenteCalificado()
}

class PackInternacional inherits Pack{
  const destino
  const escalas
  const esDeInteres
  var property recargoAdicional = 0.2

  override method costoTotal() = super()*(1 + recargoAdicional)

  override method esPremium() = esDeInteres and duracion > 20 and escalas == 0
}


class Coordinador{
  const viajes
  var property estaMotivado
  var property aniosDeExperiencia
  var rol
  const rolesValidos = #{guia, asistenteLogistico, acompaniante}

  method cambiarRol(unRol){
    if (not rolesValidos.contains(unRol)){
      self.error("Rol inválido")
    } 
    else{
      rol = unRol
    }    
  }

  // El rol sabe responder la condición adicional sobre el coordinador
  method esAltamenteCalificado() = viajes > 20 and rol.condicionAdicional(self)
}

object guia{

  method condicionAdicional(coordinador) = coordinador.estaMotivado()

}

object asistenteLogistico{

  method condicionAdicional(coordinador) = coordinador.aniosDeExperiencia() >= 3
  
}

object acompaniante{

  // Debemos pasarle true porque en esAltamenteCalificado() hay un and
  method condicionAdicional(coordinador) = true

}

class Beneficio{
  const tipo
  const property costo
  const property estaVigente
}


/*
class PackProvincial inherits PackNacional{
  const cantidadDeCiudades

  override 
}

*/