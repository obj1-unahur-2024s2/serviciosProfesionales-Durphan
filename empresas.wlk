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
  
  method universidades() {
    const universidades = []
    profesionalesContratados.forEach({
      profesional => if(!universidades.contains(profesional.universidad())) universidades.add(profesional.universidad())
    })
    return universidades
  }
  
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
