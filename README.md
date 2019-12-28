# Bitbucket Dhall

This is a set of typings and basic library for constructing bitbucket pipelines files.

It's currently in extreme alpha however it will see some road-testing in early 2020

If you encounter any bugs or type errors - please feel free to file an issue


## Usage

see the `example-pipeline.dhall` file for reference. types and functions are available from each module, which can be pulled from github directly.

In short, you have access to the entire library of types and functions by importing `BB.dhall` by URL:

```dhall
let BB = https://raw.githubusercontent.com/Benjmhart/bitbucket-dhall/master/BB.dhall
```

The the entire type of the BitBucket Pipelines specification is found on `BB.BBPipelineFileType`.

For default or Pull Request Pipelines - use `BB.Pipeline`, for branches or tags, use `BB.PipelineMap` - which will map branch names to pipelines.

Each Pipeline is a List of `BB.PipelineStep` , the `PipelineStep` Type has two constructors, `BB.PipelineStep.Parallel` which takes a List of `BB.Step.type`, or `BB.PipelineStep.Sequential` which takes a single `BB.Step.type`

Individual Steps have a simple factory function/smart constructor available as `BB.Step.mkStep` which takes a name and a list of Text which are the individual script commands to be run.

for example:

```dhall
let defaultPipeline 
  = [ BB.PipelineStep.Sequential (BB.Step.mkStep "hello world" ["echo hello", "echo world"]) ] : BB.Pipeline
```

To build your config in a unix-compatible environment, be sure that you have `dhall-yaml` installed and then run the following script:

```bash
cat my-pipeline-config.dhall | dhall-to-yaml-ng > bitbucket-pipelines.yml
```

## Known Issues


## Contributing

PR's are very much welcome - especially to smoothe over the user interface or to improve type safety

## License

This is totally free for anyone to use.
