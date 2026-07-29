import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure DynamicModelPackage where
  germanoIdentity : Prop
  testFilter : Prop
  leastSquaresProcedure : Prop
  dynamicSmagorinskyConstant : Prop
  clippingProcedure : Prop

structure DynamicModelEvidence (D : DynamicModelPackage) where
  germanoIdentityClosed : D.germanoIdentity
  testFilterClosed : D.testFilter
  leastSquaresProcedureClosed : D.leastSquaresProcedure
  dynamicSmagorinskyConstantClosed : D.dynamicSmagorinskyConstant
  clippingProcedureClosed : D.clippingProcedure

def DynamicModelClosed (D : DynamicModelPackage) : Prop :=
  D.germanoIdentity ∧ D.testFilter ∧ D.leastSquaresProcedure ∧
  D.dynamicSmagorinskyConstant ∧ D.clippingProcedure

theorem dynamic_model_closed_from_evidence (D : DynamicModelPackage)
    (E : DynamicModelEvidence D) : DynamicModelClosed D := by
  exact And.intro E.germanoIdentityClosed
    (And.intro E.testFilterClosed
      (And.intro E.leastSquaresProcedureClosed
        (And.intro E.dynamicSmagorinskyConstantClosed E.clippingProcedureClosed)))

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse