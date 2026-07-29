import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure FilteringKernelPackage where
  filterFunction : Type u
  cutoffFrequency : Type v
  commutationWithDerivatives : Prop
  positiveDefiniteness : Prop
  localityInSpace : Prop

structure FilteringKernelEvidence (F : FilteringKernelPackage) where
  commutationWithDerivativesClosed : F.commutationWithDerivatives
  positiveDefinitenessClosed : F.positiveDefiniteness
  localityInSpaceClosed : F.localityInSpace

def FilteringKernelClosed (F : FilteringKernelPackage) : Prop :=
  F.commutationWithDerivatives ∧ F.positiveDefiniteness ∧ F.localityInSpace

theorem filtering_kernel_closed_from_evidence (F : FilteringKernelPackage)
    (E : FilteringKernelEvidence F) : FilteringKernelClosed F := by
  exact And.intro E.commutationWithDerivativesClosed
    (And.intro E.positiveDefinitenessClosed E.localityInSpaceClosed)

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse