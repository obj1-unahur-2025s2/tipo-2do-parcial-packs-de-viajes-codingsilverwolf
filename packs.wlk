class Pack{
  const property duracion
  const property precioBase
  const property beneficiosEspeciales = []
  var property cordinador

  method beneficiosVigentes() = beneficiosEspeciales.filter{b => b.estaVigente()}

  method costoTotal() = precioBase + self.beneficiosVigentes().sum{b => b.costo()}

}

class PackNacional inherits Pack{
  const destino
  const actividades = #{}
}

class PackInternacional inherits Pack{
  const destino
  const escalas
  const esDeInteres
  var property recargoAdicional = 0.2

  override method costoTotal() = super()*(1 + recargoAdicional)
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