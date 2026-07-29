import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure TurbulenceSpectrumPackage where
  energySpectrum : Type u
  waveNumber : Type v
  inertialRange : Prop
  kMinusFiveThirdsLaw : Prop
  dissipationRange : Prop

structure TurbulenceSpectrumEvidence (T : TurbulenceSpectrumPackage) where
  inertialRangeClosed : T.inertialRange
  kMinusFiveThirdsLawClosed : T.kMinusFiveThirdsLaw
  dissipationRangeClosed : T.dissipationRange

def TurbulenceSpectrumClosed (T : TurbulenceSpectrumPackage) : Prop :=
  T.inertialRange ∧ T.kMinusFiveThirdsLaw ∧ T.dissipationRange

theorem turbulence_spectrum_closed_from_evidence
    (T : TurbulenceSpectrumPackage) (E : TurbulenceSpectrumEvidence T) :
    TurbulenceSpectrumClosed T := by
  exact And.intro E.inertialRangeClosed
    (And.intro E.kMinusFiveThirdsLawClosed E.dissipationRangeClosed)

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse