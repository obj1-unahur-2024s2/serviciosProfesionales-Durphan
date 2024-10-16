class Profesional {
  const property universidad
  
  method provinciasHabilitadas()
  
  method honorarios()
  
  method esProfesionalCaro(
    honorariosDeReferencia
  ) = self.honorarios() > honorariosDeReferencia
}

class ProfesionalUniversitario inherits Profesional {
  override method provinciasHabilitadas() = universidad.provinciasHabilitadas()
  
  override method honorarios() = universidad.honorariosRecomendados()
}

class ProfesionalDeLitoral inherits Profesional {
  override method provinciasHabilitadas() = [
    "Corrientes",
    "Entre Ríos",
    "Misiones",
    "Santa Fe"
  ]
  
  override method honorarios() = 3000
}

class ProfesionalLibre inherits Profesional {
  const provinciasHabilitadas
  const honorarios
  
  override method provinciasHabilitadas() = provinciasHabilitadas
  
  override method honorarios() = honorarios
}


class Solicitantes {
  method puedeSerAtendidoPor(profesional)
}

class SolicitantesPersona inherits Solicitantes {
  const property provincia

  override  method puedeSerAtendidoPor(profesional) = profesional.provinciasHabilitadas().contains(provincia)
}

class SolicitantesInstitucion inherits Solicitantes{
  const property universidadesReconocidas

 override method puedeSerAtendidoPor(profesional) = universidadesReconocidas.any({universidad => universidad == profesional.universidad()})
}

class SolicitantesClub inherits Solicitantes {
const property provinciasPresente

override method puedeSerAtendidoPor(profesional) = provinciasPresente.any({provincia => profesional.universidad() == provincia})
}