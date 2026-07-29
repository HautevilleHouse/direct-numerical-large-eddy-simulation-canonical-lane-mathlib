import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure LESConvergencePackage where
  gridSpacing : Prop
  filterWidth : Prop
  resolutionCriterion : Prop
  errorBounds : Prop
  convergenceRate : Prop

structure LESConvergenceEvidence (L : LESConvergencePackage) where
  gridSpacingClosed : L.gridSpacing
  filterWidthClosed : L.filterWidth
  resolutionCriterionClosed : L.resolutionCriterion
  errorBoundsClosed : L.errorBounds
  convergenceRateClosed : L.convergenceRate

def LESConvergenceClosed (L : LESConvergencePackage) : Prop :=
  L.gridSpacing ∧ L.filterWidth ∧ L.resolutionCriterion ∧ L.errorBounds ∧ L.convergenceRate

theorem les_convergence_closed_from_evidence (L : LESConvergencePackage)
    (E : LESConvergenceEvidence L) : LESConvergenceClosed L := by
  exact And.intro E.gridSpacingClosed
    (And.intro E.filterWidthClosed
      (And.intro E.resolutionCriterionClosed
        (And.intro E.errorBoundsClosed E.convergenceRateClosed)))

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse