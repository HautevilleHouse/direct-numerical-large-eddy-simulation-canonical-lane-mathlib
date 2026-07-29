import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure SmagorinskyPackage where
  eddyViscosity : Type u
  smagorinskyConstant : Float
  strainRateTensor : Type v
  residualStressClosedForm : Prop
  dissipationConsistent : Prop

structure SmagorinskyEvidence (S : SmagorinskyPackage) where
  residualStressClosedFormClosed : S.residualStressClosedForm
  dissipationConsistentClosed : S.dissipationConsistent

def SmagorinskyClosed (S : SmagorinskyPackage) : Prop :=
  S.residualStressClosedForm ∧ S.dissipationConsistent

theorem smagorinsky_closed_from_evidence (S : SmagorinskyPackage) (E : SmagorinskyEvidence S) : SmagorinskyClosed S := by
  exact And.intro E.residualStressClosedFormClosed E.dissipationConsistentClosed

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse