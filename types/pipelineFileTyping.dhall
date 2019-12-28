let Clone = ./clone.dhall

let Definitions = ./definitions.dhall

let Options = ./options.dhall

let Pipeline = ./pipeline.dhall

let PipelineMap = ./pipelineMap.dhall

in

{ image : Text
, clone : Optional Clone
, definitions : Optional Definitions
, options: Optional Options 
, pipelines: 
  { default: Optional Pipeline
  , branches:
    Optional PipelineMap
  , tags: Optional PipelineMap
  , bookmarks: Optional PipelineMap
  , `pull requests`: Optional Pipeline
  , custom: Optional PipelineMap
  }
}


