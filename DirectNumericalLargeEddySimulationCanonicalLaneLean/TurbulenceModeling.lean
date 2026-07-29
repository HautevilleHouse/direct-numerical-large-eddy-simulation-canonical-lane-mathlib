import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure TurbulenceModelPackage where
  navierStokesEquations : Prop
  continuityEquation : Prop
  filteredEquations : Prop
  subgridScaleTensor : Prop
  eddyViscosityModel : Prop

structure TurbulenceModelEvidence (T : TurbulenceModelPackage) where
  navierStokesEquationsClosed : T.navierStokesEquations
  continuityEquationClosed : T.continuityEquation
  filteredEquationsClosed : T.filteredEquations
  subgridScaleTensorClosed : T.subgridScaleTensor
  eddyViscosityModelClosed : T.eddyViscosityModel

def TurbulenceModelClosed (T : TurbulenceModelPackage) : Prop :=
  T.navierStokesEquations ∧ T.continuityEquation ∧ T.filteredEquations ∧
  T.subgridScaleTensor ∧ T.eddyViscosityModel

theorem turbulence_model_closed_from_evidence (T : TurbulenceModelPackage)
    (E : TurbulenceModelEvidence T) : TurbulenceModelClosed T := by
  exact And.intro E.navierStokesEquationsClosed
    (And.intro E.continuityEquationClosed
      (And.intro E.filteredEquationsClosed
        (And.intro E.subgridScaleTensorClosed E.eddyViscosityModelClosed)))

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse