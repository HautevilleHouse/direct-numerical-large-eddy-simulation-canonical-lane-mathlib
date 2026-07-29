import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulation

structure SubgridModel where
  modelType : String
  eddyViscosity : ℝ → ℝ
  modelParameter : ℝ
  modelTypeDefined : Prop
  eddyViscosityPositive : ∀ x, eddyViscosity x > 0
  modelParameterInRange : modelParameter > 0 ∧ modelParameter < 1

def SubgridModelClosed (S : SubgridModel) : Prop :=
  S.modelTypeDefined ∧ S.eddyViscosityPositive ∧ S.modelParameterInRange.1 ∧ S.modelParameterInRange.2

theorem subgrid_model_closed (S : SubgridModel) : SubgridModelClosed S := by
  exact And.intro S.modelTypeDefined
    (And.intro S.eddyViscosityPositive
      (And.intro S.modelParameterInRange.1 S.modelParameterInRange.2))

end DirectNumericalLargeEddySimulation
end HautevilleHouse
