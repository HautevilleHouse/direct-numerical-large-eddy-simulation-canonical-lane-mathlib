import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure DNSResolutionCriteriaPackage where
  gridSpacing : ℝ
  kolmogorovScale : ℝ
  reynoldsNumber : ℝ
  gridSpacingResolved : Prop
  timeStepCFL : Prop
  resolutionSufficient : Prop

structure DNSResolutionCriteriaEvidence (C : DNSResolutionCriteriaPackage) where
  gridSpacingResolvedClosed : C.gridSpacingResolved
  timeStepCFLClosed : C.timeStepCFL
  resolutionSufficientClosed : C.resolutionSufficient

def DNSResolutionCriteriaClosed (C : DNSResolutionCriteriaPackage) : Prop :=
  C.gridSpacingResolved ∧ C.timeStepCFL ∧ C.resolutionSufficient

theorem dns_resolution_criteria_closed_from_evidence
    (C : DNSResolutionCriteriaPackage) (E : DNSResolutionCriteriaEvidence C) :
    DNSResolutionCriteriaClosed C := by
  exact And.intro E.gridSpacingResolvedClosed
    (And.intro E.timeStepCFLClosed E.resolutionSufficientClosed)

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse