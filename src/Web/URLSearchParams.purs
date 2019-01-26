module Web.URLSearchParams
  ( URLSearchParams, Key, Value, new, new', new_
  , append, set, delete, get, getAll, has, entries, keys, values, sort, toString
  ) where

import Prelude (Unit, (<$>), (<<<), class Show)
import Data.Tuple.Native (T2)
import Data.Nullable (Nullable, toMaybe)
import Data.Maybe (Maybe)
import Data.Iterable (Iterator)
import Foreign.Object (Object)
import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3, mkEffectFn2)


foreign import data URLSearchParams :: Type

instance showURLSearchParams :: Show URLSearchParams where
  show = unsafePerformEffect <<< toString

type Key = String
type Value = String

foreign import newImpl :: forall a. EffectFn1 a URLSearchParams

new :: String -> Effect URLSearchParams
new = runEffectFn1 newImpl

new' :: Array (T2 Key Value) -> Effect URLSearchParams
new' = runEffectFn1 newImpl

new_ :: Object Value -> Effect URLSearchParams
new_ = runEffectFn1 newImpl


foreign import appendImpl :: EffectFn3 URLSearchParams Key Value Unit
foreign import setImpl :: EffectFn3 URLSearchParams Key Value Unit
foreign import deleteImpl :: EffectFn2 URLSearchParams Key Unit
foreign import getImpl :: EffectFn2 URLSearchParams Key (Nullable Value)
foreign import getAllImpl :: EffectFn2 URLSearchParams Key (Array Value)
foreign import hasImpl :: EffectFn2 URLSearchParams Key Boolean
foreign import entriesImpl :: EffectFn1 URLSearchParams (Iterator (T2 Key Value))
foreign import keysImpl :: EffectFn1 URLSearchParams (Iterator Key)
foreign import valuesImpl :: EffectFn1 URLSearchParams (Iterator Value)
foreign import sortImpl :: EffectFn1 URLSearchParams Unit
foreign import toStringImpl :: EffectFn1 URLSearchParams String
foreign import forEachImpl :: EffectFn2 URLSearchParams (EffectFn2 Key Value Unit) Unit

append :: URLSearchParams -> Key -> Value -> Effect Unit
append = runEffectFn3 appendImpl
set :: URLSearchParams -> Key -> Value -> Effect Unit
set = runEffectFn3 setImpl
delete :: URLSearchParams -> Key -> Effect Unit
delete = runEffectFn2 deleteImpl
get :: URLSearchParams -> Key -> Effect (Maybe Value)
get h k = toMaybe <$> runEffectFn2 getImpl h k
getAll :: URLSearchParams -> Key -> Effect (Array Value)
getAll = runEffectFn2 getAllImpl
has :: URLSearchParams -> Key -> Effect Boolean
has = runEffectFn2 hasImpl
entries :: URLSearchParams -> Effect (Iterator (T2 Key Value))
entries = runEffectFn1 entriesImpl
keys :: URLSearchParams -> Effect (Iterator Key)
keys = runEffectFn1 keysImpl
values :: URLSearchParams -> Effect (Iterator Value)
values = runEffectFn1 valuesImpl
sort :: URLSearchParams -> Effect Unit
sort = runEffectFn1 sortImpl
toString :: URLSearchParams -> Effect String
toString = runEffectFn1 toStringImpl
traverse_ :: URLSearchParams -> (Key -> Value -> Effect Unit) -> Effect Unit
traverse_ x f = runEffectFn2 forEachImpl x (mkEffectFn2 f)
