module aoc-agda where

open import Function using (_∘_; _$_)
open import IO

import Y2015.D01 as Y1501 using (runA)

main = run ∘ putStrLn $ Y1501.runA
