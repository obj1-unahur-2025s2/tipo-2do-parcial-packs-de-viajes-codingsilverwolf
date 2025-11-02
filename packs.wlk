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
  var estaMotivado
  var aniosDeExperiencia
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
}

object guia{

}

object asistenteLogistico{
  
}

object acompaniante{

}

class Beneficio{
  const tipo
  const property costo
  const property estaVigente
}