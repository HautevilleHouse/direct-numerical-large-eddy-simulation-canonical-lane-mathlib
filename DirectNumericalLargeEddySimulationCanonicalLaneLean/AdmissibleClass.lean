import DirectNumericalLargeEddySimulationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure AdmissibleClass where
  object : DNLESAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DNLESWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse
