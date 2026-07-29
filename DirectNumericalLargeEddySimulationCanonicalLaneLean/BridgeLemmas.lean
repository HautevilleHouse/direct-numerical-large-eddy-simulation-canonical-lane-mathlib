import DirectNumericalLargeEddySimulationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DNLESWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse
