import canonicalLaneMathlib.AdmissibleClass
import DirectNumericalLargeEddySimulationCanonicalLaneLean.NavierStokesFiltered

/-!
# Smagorinsky Closure Model

This module defines the Smagorinsky-Lilly subgrid-scale closure model
commonly used in Large Eddy Simulation. The closure is expressed as an
admissible evidence package.
-/

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure SmagorinskyPackage where
  smagorinskyConstant : ℝ
  filteredStrainRate : Type u
  eddyViscosity : filteredStrainRate → ℝ
  residualStressModel : Prop
  modelConsistency : Prop

structure SmagorinskyEvidence (S : SmagorinskyPackage) where
  stressModelDefined : S.residualStressModel
  consistencyHolds : S.modelConsistency

def SmagorinskyClosed (S : SmagorinskyPackage) : Prop :=
  S.residualStressModel ∧ S.modelConsistency

theorem smagorinsky_closed_from_evidence
    (S : SmagorinskyPackage) (E : SmagorinskyEvidence S) :
    SmagorinskyClosed S := by
  exact And.intro E.stressModelDefined E.consistencyHolds

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse
