import profesionales.*
import universidades.*

class EmpresaServicios {
  const property honorarioDeReferencia
  const property profesionalesContratados = []
  
  method profesionalesContratadosDeUniversidad(
    universidad
  ) = profesionalesContratados.filter(
    { profesional => profesional.universidad() == universidad }
  )
  
  method profesionalesCaros() = profesionalesContratados.filter(
    { profesional => profesional.honorarios() > self.honorarioDeReferencia() }
  )
  
  method universidades() = profesionalesContratados.map(
    { profesional => profesional.universidad() }
  )
  
  method profesionalMasBarato() = profesionalesContratados.min(
    { profesional => profesional.honorarios() }
  )
  
  method esEmpresaDeGenteAcotada() = profesionalesContratados.all(
    { profesional => profesional.provinciasHabilitadas().size() < 3 }
  )
  
  method cantidadDeProfesionalesQueEstudiaronEn(
    universidad
  ) = profesionalesContratados.count(
    { profesional => profesional.universidad() == universidad }
  )
}

const universidadSanMartin = new Universidad(
  provinciasHabilitadas = ["Buenos Aires"],
  honorariosRecomendados = 3500
)

const universidadRosario = new Universidad(
  provinciasHabilitadas = ["Santa Fe"],
  honorariosRecomendados = 2800
)

const universidadCorrientes = new Universidad(
  provinciasHabilitadas = ["Corrientes"],
  honorariosRecomendados = 4200
)

const universidadHurlingham = new Universidad(
  provinciasHabilitadas = ["Buenos Aires"],
  honorariosRecomendados = 8800
)

const Juana = new ProfesionalUniversitario(universidad = universidadRosario)

const Melina = new ProfesionalDeLitoral(universidad = universidadCorrientes)

const Rocio = new ProfesionalLibre(
  provinciasHabilitadas = ["Santa Fe", "Cordoba", "Buenos Aires"],
  honorarios = 5000,
  universidad = universidadHurlingham
)

const Luciana = new ProfesionalLibre(
  provinciasHabilitadas = ["Santa Fe", "Entre Rios"],
  honorarios = 3200,
  universidad = universidadRosario
)

const empresaServicios = new EmpresaServicios(
  honorarioDeReferencia = 4000,
  profesionalesContratados = [Juana, Melina, Rocio, Luciana]
)