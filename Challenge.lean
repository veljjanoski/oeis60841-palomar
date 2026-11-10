module

public import Mathlib

/-!
# OEIS A060841: when is $1/\det(M)$ an integer, for $M[i,j] = 1/\operatorname{lcm}(i,j)$?

The conjecture `OeisA60841.conjecture1` of
[formal-conjectures](https://github.com/google-deepmind/formal-conjectures) (Apache-2.0), file
`FormalConjectures/OEIS/60841.lean` at commit `feacabbcf6ed2e7b622663c3e1c0f61038183392`: the
definitions `lcmMatrix` and `integerDetN` and the statement are copied verbatim, with the same
names, from that file, where the statement is stated with `sorry`. The sequence
[A060841](https://oeis.org/A060841) lists the numerators of $1/\det(M)$ for the $n \times n$
matrix $M$ with entries $1/\operatorname{lcm}(i,j)$; R. G. Wilson v conjectured in 2015 that
$1/\det(M)$ is an integer only for $n \leq 34$, $n = 36$ and $n = 38$.

*References:*
- [A060841](https://oeis.org/A060841)
- T. Adamczewski, "OEIS Open: How many conjectures can language models turn into theorems?",
  [arXiv:2608.11941](https://arxiv.org/abs/2608.11941) [cs.AI], 2026.
-/

@[expose] public section

namespace OeisA60841

/-- The $n \times n$ matrix with entry $(i,j)$ equal to
$1/\operatorname{lcm}(i+1, j+1)$ over $\mathbb{Q}$. -/
def lcmMatrix (n : ℕ) : Matrix (Fin n) (Fin n) ℚ :=
  Matrix.of fun i j : Fin n ↦ 1 / ((Nat.lcm (i.val + 1) (j.val + 1) : ℚ))

/-- The exceptional values of $n$ where $1/\det(M)$ is conjectured to be an integer. -/
def integerDetN : Set ℕ :=
  Set.Icc 1 34 ∪ {36, 38}

/--
"Conjecture: $1/\det(M)$ is an integer only for n: 1 to 34, 36 and 38." - _Robert G. Wilson v_,
Aug 02 2015
-/
theorem conjecture1 :
    ∀ n : ℕ, 1 ≤ n → (((lcmMatrix n).det)⁻¹.den = 1 ↔ n ∈ integerDetN) := by
  sorry

end OeisA60841
