let Step = ./step.dhall

let PipelineStepType
  = < Parallel : List Step | Sequential : Step >

in
PipelineStepType

