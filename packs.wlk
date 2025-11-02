import coordinadores.*
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



class Beneficio{
  const tipo
  const property costo
  const property estaVigente
}





class PackProvincial inherits PackNacional{
  const cantidadDeCiudades
  var recargoPremium = 0.05

  override method esPremium() = super() and actividades.size() >= 4 and cantidadDeCiudades >= 5 and self.beneficiosVigentes().size() >= 3

  override method costoTotal(){
    if (self.esPremium()){
      return super()*(1+ recargoPremium)
    }
    else{
      return super()
    }
  }
}
