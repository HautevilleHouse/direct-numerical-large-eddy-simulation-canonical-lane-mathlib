import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulation

structure ExplicitFiltering where
  filterWidth : ℝ
  gridSpacing : ℝ
  filterWidthPositive : filterWidth > 0
  gridSpacingPositive : gridSpacing > 0
  commutationErrorBound : ℝ
  commutationErrorPositive : commutationErrorBound > 0

def ExplicitFilteringClosed (E : ExplicitFiltering) : Prop :=
  E.filterWidthPositive ∧ E.gridSpacingPositive ∧ E.commutationErrorPositive

theorem explicit_filtering_closed (E : ExplicitFiltering) : ExplicitFilteringClosed E := by
  exact And.intro E.filterWidthPositive (And.intro E.gridSpacingPositive E.commutationErrorPositive)

end DirectNumericalLargeEddySimulation
end HautevilleHouse
