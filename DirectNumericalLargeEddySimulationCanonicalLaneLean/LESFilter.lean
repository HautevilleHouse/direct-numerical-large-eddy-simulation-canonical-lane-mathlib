import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure LESFilterPackage where
  filterType : Type u
  filterWidth : ℝ
  transferFunction : Type v
  filterCommutatorError : Prop
  scaleSeparation : Prop

structure LESFilterEvidence (F : LESFilterPackage) where
  filterCommutatorErrorClosed : F.filterCommutatorError
  scaleSeparationClosed : F.scaleSeparation

def LESFilterClosed (F : LESFilterPackage) : Prop :=
  F.filterCommutatorError ∧ F.scaleSeparation

theorem les_filter_closed_from_evidence
    (F : LESFilterPackage) (E : LESFilterEvidence F) :
    LESFilterClosed F := by
  exact And.intro E.filterCommutatorErrorClosed E.scaleSeparationClosed

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse