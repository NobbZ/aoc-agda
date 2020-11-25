module aoc-agda where

open import Function using (_∘_; _$_)
open import IO

import Y2015.D01 as Y1501 using (runA; runB)

main = run do
  putStrLn Y1501.runB
