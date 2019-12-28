let PipelineStep = ./types/pipelineStep.dhall

let PipelineMap = ./types/pipelineMap.dhall

let Pipeline = ./types/pipeline.dhall

let Step = ./types/step.dhall

let mkStep =
        λ(name : Text)
      → λ(scriptList : List Text)
      →   { variables = None (List { name : Text })
          , step =
              Some
                { name = Some name
                , caches = None (List Text)
                , artifact = None Text
                , size = None Natural
                , deployment = None Text
                , image = None Text
                , script = scriptList
                , after-script = None (List Text)
                }
          }
        : Step

let mkPipelineMapItem =
      λ(key : Text) → λ(val : Pipeline) → { mapKey = key, mapValue = val }

let mkSequential =
        λ(name : Text)
      → λ(scripts : List Text)
      → PipelineStep.Sequential (mkStep name scripts) : PipelineStep

in  { mkPipelineMapItem = mkPipelineMapItem
    , mkSequential = mkSequential
    , mkStep = mkStep
    }
