let BBPipelineConfig = ./pipelineFileTyping.dhall

let Clone = ./clone.dhall

let Definitions = ./definitions.dhall

let Options = ./options.dhall

let Pipeline = ./pipeline.dhall

let PipelineMap = ./pipelineMap.dhall

let PStep = ./pipelineStep.dhall

let Step = ./step.dhall

let defaultPipeline = [ PStep.Sequential (Step.mkStep "hello world" ["echo hello"]) ] : Pipeline

in  { image = "node 10.15.3"
    , clone = None Clone
    , definitions = None Definitions
    , options = None Options
    , pipelines 
      = { default = Some defaultPipeline
        , branches = None PipelineMap
        , tags = None PipelineMap
        , bookmarks = None PipelineMap
        , pullRequests = None Pipeline
        , custom = None PipelineMap
        }
    } : BBPipelineConfig
