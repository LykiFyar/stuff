module Ficha7 where

import Cp
import Nat

-- EX 1

cata g = g . (id -|- (cata g)) . outNat

rep a = cata (either nil (a:))

f = p2 . aux
    where aux = for (split (succ . p1) mul) (1,1)

-- EX 2