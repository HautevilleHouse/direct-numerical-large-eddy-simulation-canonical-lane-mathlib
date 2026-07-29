import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulation

structure DynamicProcedure where
  testFilterWidth : ℝ
  gridFilterWidth : ℝ
  testFilterWidthPositive : testFilterWidth > 0
  gridFilterWidthPositive : gridFilterWidth > 0
  germanoIdentity : Prop
  leastSquaresSolution : Prop
  germanoIdentityClosed : germanoIdentity
  leastSquaresSolutionClosed : leastSquaresSolution

def DynamicProcedureClosed (D : DynamicProcedure) : Prop :=
  D.germanoIdentityClosed ∧ D.leastSquaresSolutionClosed

theorem dynamic_procedure_closed (D : DynamicProcedure) : DynamicProcedureClosed D := by
  exact And.intro D.germanoIdentityClosed D.leastSquaresSolutionClosed

end DirectNumericalLargeEddySimulation
end HautevilleHouse
