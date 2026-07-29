import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulation

structure FourierFilteringPackage where
  cutoffWavenumber : Nat
  spectralSpace : Type u
  filteredField : spectralSpace → ℝ
  cutoffWavenumberAdmissible : Prop
  filteredFieldDefined : Prop
  spectralSpaceTopological : TopologicalSpace spectralSpace

structure FourierFilteringEvidence (F : FourierFilteringPackage) where
  cutoffWavenumberAdmissibleClosed : F.cutoffWavenumberAdmissible
  filteredFieldDefinedClosed : F.filteredFieldDefined

def FourierFilteringClosed (F : FourierFilteringPackage) : Prop :=
  F.cutoffWavenumberAdmissible ∧ F.filteredFieldDefined

theorem fourier_filtering_closed_from_evidence (F : FourierFilteringPackage)
    (E : FourierFilteringEvidence F) : FourierFilteringClosed F := by
  exact And.intro E.cutoffWavenumberAdmissibleClosed E.filteredFieldDefinedClosed

end DirectNumericalLargeEddySimulation
end HautevilleHouse
