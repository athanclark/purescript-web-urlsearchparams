module Test.Main where

import Web.URLSearchParams (new', entries, Key, Value)

import Prelude
import Data.Tuple (Tuple (..))
import Data.Tuple.Native (t2, prj)
import Data.Typelevel.Num (d0, d1)
import Data.Iterable (toArray) as Iter
import Data.String.Gen (genAlphaString)
import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import Effect.Console (log)
import Foreign.Object as O
import Test.QuickCheck (Result, (===), quickCheckGen)
import Test.QuickCheck.Gen (Gen, suchThat, arrayOf)

main :: Effect Unit
main = do
  log "Running tests..."
  quickCheckGen urlSearchParamsIso



urlSearchParamsIso :: Gen Result
urlSearchParamsIso = do
  let a' = genAlphaString `suchThat` (\x -> x /= "")
  xs <- arrayOf (Tuple <$> a' <*> a')
  pure $ unsafePerformEffect do
    let xs' = (\(Tuple k v) -> t2 k v) <$> xs
        xs_ = O.fromFoldable xs
    urlSPs <- new' xs'
    ys' <- entries urlSPs >>= Iter.toArray
    let ys = (\y -> Tuple (prj d0 y) (prj d1 y)) <$> ys'
        ys_ = O.fromFoldable ys
    pure (xs_ === ys_)
