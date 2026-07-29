import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationCanonicalLaneLean

structure ChannelFlowPackage where
  reynoldsNumber : Prop
  frictionReynoldsNumber : Prop
  meanVelocityProfile : Prop
  turbulenceIntensities : Prop
  shearStressDistribution : Prop

structure ChannelFlowEvidence (C : ChannelFlowPackage) where
  reynoldsNumberClosed : C.reynoldsNumber
  frictionReynoldsNumberClosed : C.frictionReynoldsNumber
  meanVelocityProfileClosed : C.meanVelocityProfile
  turbulenceIntensitiesClosed : C.turbulenceIntensities
  shearStressDistributionClosed : C.shearStressDistribution

def ChannelFlowClosed (C : ChannelFlowPackage) : Prop :=
  C.reynoldsNumber ∧ C.frictionReynoldsNumber ∧ C.meanVelocityProfile ∧
  C.turbulenceIntensities ∧ C.shearStressDistribution

theorem channel_flow_closed_from_evidence (C : ChannelFlowPackage)
    (E : ChannelFlowEvidence C) : ChannelFlowClosed C := by
  exact And.intro E.reynoldsNumberClosed
    (And.intro E.frictionReynoldsNumberClosed
      (And.intro E.meanVelocityProfileClosed
        (And.intro E.turbulenceIntensitiesClosed E.shearStressDistributionClosed)))

end DirectNumericalLargeEddySimulationCanonicalLaneLean
end HautevilleHouse