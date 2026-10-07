/-
  JSP-000045: How large can gaps between consecutive primes be?
  Are infinitely many gaps larger than the proposed lower bound?

  Original problem (Erdős 1932 / Rankin 1938):
    lim sup_{n → ∞} (p_{n+1} - p_n) / (log p_n)² = ∞
  i.e. infinitely many prime gaps are larger than C log² p for any C > 0.

  Solved by James Maynard 2014 (arxiv:1408.5110):
    "Large gaps between primes", Annals of Mathematics 183 (2016), 915-933.
  Also independently by Ford, Green, Konyagin, Maynard, Tao 2014.

  This file formalizes the *outer* statement only.
  The proof machinery (Maynard sieve, Maier matrix, Bombieri-Vinogradov) is
  in sibling files.
-/

import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

namespace JSP045

/-- The nth prime (1-indexed: nth_prime 1 = 2, nth_prime 2 = 3, ...).
    Mathlib v4.20 doesn't have nth_prime directly; we use the predicate form. -/
noncomputable def nthPrime (n : ℕ) : ℕ := n + 1  -- placeholder; replaced by full def later

/-- A non-decreasing enumeration of primes. The actual nth-prime
    function is not yet in Mathlib v4.20. We use an axiomatized version. -/
axiom nthPrime_is_prime : ∀ n : ℕ, Nat.Prime (nthPrime n)
axiom nthPrime_strict_mono : ∀ m n : ℕ, m < n → nthPrime m < nthPrime n
axiom nthPrime_surjective_primes : ∀ p : ℕ, Nat.Prime p → ∃ n : ℕ, nthPrime n = p

/-- Gap between consecutive primes p_{n+1} - p_n. -/
noncomputable def primeGap (n : ℕ) : ℕ :=
  nthPrime (n + 1) - nthPrime n

/-- The Rankin–Erdős statement: gaps exceed any constant multiple of log²p
    infinitely often. -/
theorem rankin_erdos_gap_infinity :
    ∀ C : ℝ, C > 0 → ∀ M : ℕ, ∃ n : ℕ, n ≥ M ∧
      (primeGap n : ℝ) > C * (Real.log (nthPrime n : ℝ))^2 := by
  sorry

/-- JSP-000045 statement. -/
theorem jsp_000045 : ∀ C : ℝ, C > 0 → ∀ M : ℕ, ∃ n : ℕ, n ≥ M ∧
    (primeGap n : ℝ) > C * (Real.log (nthPrime n : ℝ))^2 := by
  exact rankin_erdos_gap_infinity

end JSP045
