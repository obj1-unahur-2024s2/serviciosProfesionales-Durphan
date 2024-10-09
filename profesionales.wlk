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

class ProfesionalesLibres inherits Profesional {
  const provinciasHabilitadas
  const honorarios
  
  override method provinciasHabilitadas() = provinciasHabilitadas
  
  override method honorarios() = honorarios
}