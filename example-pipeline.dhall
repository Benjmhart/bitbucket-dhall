
let BB = ./BB.dhall

let defaultPipeline 
  = [ BB.utils.mkSequential "hello world" ["echo hello"] ] : BB.Pipeline

let masterPipeline 
  = [ BB.utils.mkSequential 
      "master" 
      [ "echo 'I run when you push to master'" 
      , "echo 'I test your code or deploy'"
      ] 
    ]

let branchPipeline 
  = [ BB.utils.mkPipelineMapItem "master" masterPipeline ] : BB.PipelineMap

in  { image = "node:10.15.3"
    , clone = None BB.Clone
    , definitions = None BB.Definitions
    , options = None BB.Options
    , pipelines 
      = { default = Some defaultPipeline
        , branches = Some branchPipeline
        , tags = None BB.PipelineMap
        , bookmarks = None BB.PipelineMap
        , `pull requests` = None BB.Pipeline
        , custom = None BB.PipelineMap
        }
    } : BB.BBPipelineFileType
