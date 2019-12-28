let StepType : Type
  = { variables: Optional (List { name: Text })
    , step : Optional 
      { name : Optional Text
      , caches : Optional (List Text)
      , artifact : Optional Text
      , size : Optional Natural
      , deployment : Optional Text
      , image : Optional Text
      , script : List Text
      , after-script : Optional (List Text)
      }
    }

in

StepType
