let Step = ./step.dhall
in
 < Parallel : List Step.type | Sequential : Step.type >
