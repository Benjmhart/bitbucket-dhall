let PipelineStep = ./pipelineStep.dhall

let Pipeline : Type
  = List (PipelineStep) 


in
Pipeline
