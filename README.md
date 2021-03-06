# Bitbucket Dhall

This is a set of typings and basic library for constructing bitbucket pipelines files.

It's currently in extreme alpha however it will see some road-testing in early 2020

If you encounter any bugs or type errors - please feel free to file an issue

## Usage

Install the `dhall-yaml` package from https://github.com/dhall-lang/dhall-haskell/releases

See the `example-pipeline.dhall` file for reference. 

In short, you have access to the entire library of types and functions by importing `BB.dhall` by URL:

```dhall
let BB = https://raw.githubusercontent.com/Benjmhart/bitbucket-dhall/master/BB.dhall
```

The the entire type of the BitBucket Pipelines specification is found on `BB.BBPipelineFileType`.

For default or Pull Request Pipelines - use `BB.Pipeline`, for branches or tags, use `BB.PipelineMap` - which will map branch names to pipelines.

Each Pipeline is a List of `BB.PipelineStep` , the `PipelineStep` Type has two constructors, `BB.PipelineStep.Parallel` which takes a List of `BB.Step`, or `BB.PipelineStep.Sequential` which takes a single `BB.Step`

Individual Steps have a simple factory function/smart constructor available in the `BB.utils` module which takes simple arguments to construct a valid step. Alternatively you can build up a step manually for something more complex.

for example:

```dhall
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
```

To build your config in a unix-compatible environment, be sure that you have the `dhall-yaml` package installed and then run the following script:

```bash
cat my-pipeline-config.dhall | dhall-to-yaml-ng > bitbucket-pipelines.yml
```

## Contributing

PR's are very much welcome - especially to smoothe over the user interface or to improve type safety

## License

This is totally free for anyone to use.
