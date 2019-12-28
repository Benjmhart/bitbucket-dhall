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

let mkStep = \(name: Text) 
             -> \(scriptList: List Text) 
                -> { variables = None (List { name: Text })
                   , step = Some { name = Some name
                                 , caches = None (List Text)
                                 , artifact = None Text
                                 , size = None Natural
                                 , deployment = None Text
                                 , image = None Text
                                 , script = scriptList
                                 , after-script = None (List Text)
                                 }
                   } : StepType

in

{ type = StepType
, mkStep = mkStep
}
