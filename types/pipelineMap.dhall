let Pipeline = ./pipeline.dhall

let PipelineMapType : Type
  = List { mapKey: Text, mapValue: Pipeline }

in PipelineMapType
