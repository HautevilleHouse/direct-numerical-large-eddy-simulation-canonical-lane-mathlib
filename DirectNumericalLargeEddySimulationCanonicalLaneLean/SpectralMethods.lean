import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure SpectralMethodPackage where
  wavenumberSpace : Type u
  fourierTransform : Type v
  dealiasingRule : Prop
  spectralCutoff : Prop
  nonlinearTermEvaluation : Prop

structure SpectralMethodEvidence (Sp : SpectralMethodPackage) where
  dealiasingRuleClosed : Sp.dealiasingRule
  spectralCutoffClosed : Sp.spectralCutoff
  nonlinearTermEvaluationClosed : Sp.nonlinearTermEvaluation

def SpectralMethodClosed (Sp : SpectralMethodPackage) : Prop :=
  Sp.dealiasingRule ∧ Sp.spectralCutoff ∧ Sp.nonlinearTermEvaluation

theorem spectral_method_closed_from_evidence (Sp : SpectralMethodPackage) (E : SpectralMethodEvidence Sp) : SpectralMethodClosed Sp := by
  exact And.intro E.dealiasingRuleClosed (And.intro E.spectralCutoffClosed E.nonlinearTermEvaluationClosed)

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse