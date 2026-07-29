import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure SpectralCutoff where
  cutoffWavenumber : ℕ
  fourierSpace : Type u
  resolvedScales : Prop
  subfilterScales : Prop

structure SpectralCutoffEvidence (S : SpectralCutoff) where
  resolvedScalesClosed : S.resolvedScales
  subfilterScalesClosed : S.subfilterScales

def SpectralCutoffClosed (S : SpectralCutoff) : Prop :=
  S.resolvedScales ∧ S.subfilterScales

theorem spectral_cutoff_closed_from_evidence (S : SpectralCutoff)
    (E : SpectralCutoffEvidence S) : SpectralCutoffClosed S := by
  exact And.intro E.resolvedScalesClosed E.subfilterScalesClosed

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse