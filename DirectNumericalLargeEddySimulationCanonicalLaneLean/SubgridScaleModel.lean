import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationCanonicalLaneLean.NavierStokesFiltered

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure SubgridScaleModelPackage {F : FilteredNavierStokesPackage} where
  modelType : Type u
  eddyViscosity : Type v
  smagorinskyCoeff : ℝ
  residualStressClosure : Prop
  energyTransferConsistent : Prop

structure SubgridScaleModelEvidence {F : FilteredNavierStokesPackage}
    (S : SubgridScaleModelPackage F) where
  residualStressClosureClosed : S.residualStressClosure
  energyTransferConsistentClosed : S.energyTransferConsistent

def SubgridScaleModelClosed {F : FilteredNavierStokesPackage}
    (S : SubgridScaleModelPackage F) : Prop :=
  S.residualStressClosure ∧ S.energyTransferConsistent

theorem subgrid_scale_model_closed_from_evidence
    {F : FilteredNavierStokesPackage} (S : SubgridScaleModelPackage F)
    (E : SubgridScaleModelEvidence S) : SubgridScaleModelClosed S := by
  exact And.intro E.residualStressClosureClosed E.energyTransferConsistentClosed

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse