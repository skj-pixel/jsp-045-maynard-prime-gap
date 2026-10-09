/-
  JSP-000045: How large can gaps between consecutive primes be?
  Are infinitely many gaps larger than the proposed lower bound?

  Original problem (Erdős 1932 / Rankin 1938):
    lim sup_{n → ∞} (p_{n+1} - p_n) / (log p_n)² = ∞
  i.e. infinitely many prime gaps are larger than C log² p for any C > 0.

  Solved by James Maynard 2014 (arxiv:1408.5110):
    "Large gaps between primes", Annals of Mathematics 183 (2016), 915-933.
  Also independently by Ford, Green, Konyagin, Maynard, Tao 2014.

  This file formalizes the *outer* statement only. The proof machinery
  (Maynard sieve, Maier matrix, Bombieri-Vinogradov) is in sibling files.

  We use `Nat.nth` from Mathlib (4.20+) which is fully defined, not
  axiomatized. This is a structural improvement over the earlier scaffold.
-/

import Mathlib.Data.Nat.Prime.Nth
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

namespace JSP045

/-- The nth prime (0-indexed: nthPrime 0 = 2, nthPrime 1 = 3, ...).
    Delegates to Mathlib's `Nat.nth`. -/
noncomputable def nthPrime (n : ℕ) : ℕ := Nat.nth Nat.Prime n

/-- Sanity check: nthPrime 0 = 2 (the first prime). -/
example : nthPrime 0 = 2 := Nat.nth_prime_zero_eq_two

/-- Sanity check: nthPrime 1 = 3 (the second prime). -/
example : nthPrime 1 = 3 := Nat.nth_prime_one_eq_three

/-- Sanity check: nthPrime 2 = 5 (the third prime). -/
example : nthPrime 2 = 5 := Nat.nth_prime_two_eq_five

/-- Sanity check: nthPrime 3 = 7 (the fourth prime). -/
example : nthPrime 3 = 7 := Nat.nth_prime_three_eq_seven

/-- Sanity check: nthPrime 4 = 11 (the fifth prime). -/
example : nthPrime 4 = 11 := Nat.nth_prime_four_eq_eleven

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