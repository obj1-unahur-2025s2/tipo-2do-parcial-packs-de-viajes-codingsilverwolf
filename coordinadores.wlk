
class Coordinador{
  // cantidadDeViajes mejor que viajes
  const cantidadDeViajes
  // el var property acá no corresponde porque el setter le queda muy grande a algo que sólo puede ser true o false. O ponemos const property o lo dejamos en var y definimos los setters aparte.
  var estaMotivado
  var property aniosDeExperiencia
  var rol
  const rolesValidos = #{guia, asistenteLogistico, acompaniante}

  // podría más adelante definir un setter particular
  method estaMotivado() = estaMotivado

  method cambiarRol(unRol){
    if (not rolesValidos.contains(unRol)){
      self.error("Rol inválido")
    } 
    else{
      rol = unRol
    }    
  }

  // El rol sabe responder la condición adicional sobre el coordinador
  method esAltamenteCalificado() = cantidadDeViajes > 20 and rol.condicionAdicional(self)
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