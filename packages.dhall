let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20220725/packages.dhall
        sha256:e56fbdf33a5afd2a610c81f8b940b413a638931edb41532164e641bb2a9ec29c

let overrides =
      { iterable =
          { dependencies =
              [ "aff"
              , "arrays"
              , "effect"
              , "foreign"
              , "maybe"
              , "prelude"
              , "refs"
              , "spec"
              , "tailrec"
              ]
          , repo = "https://github.com/dstevenson1/purescript-iterable.git"
          , version = "c321620a009463accce6e3b17a26d1a21a869d10"
          }
      , tuples-native =
          { dependencies =
              [ "prelude"
              , "psci-support"
              , "typelevel"
              , "unsafe-coerce"
              , "functions"
              ]
          , repo = "https://github.com/dstevenson1/purescript-tuples-native.git"
          , version = "e1faf3ec6ab402237d89aa3bcb350702987de597"
          }
      }

in  upstream // overrides
