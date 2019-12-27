let BB = ./BB.dhall

let defaultPipeline 
  = [ BB.PipelineStep.Sequential (BB.Step.mkStep "hello world" ["echo hello"]) ] : BB.Pipeline

in  { image = "node 10.15.3"
    , clone = None BB.Clone
    , definitions = None BB.Definitions
    , options = None BB.Options
    , pipelines 
      = { default = Some defaultPipeline
        , branches = None BB.PipelineMap
        , tags = None BB.PipelineMap
        , bookmarks = None BB.PipelineMap
        , pullRequests = None BB.Pipeline
        , custom = None BB.PipelineMap
        }
    } : BB.BBPipelineFileType
