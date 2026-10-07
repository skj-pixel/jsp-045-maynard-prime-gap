# JSP-000045 — Maynard Prime Gap Lean Formalization

> **Problem**: Erdős–Rankin large prime gap conjecture (1938)
> **Statement**: lim sup (p_{n+1} - p_n) / (log p_n)² = ∞
> **Solver**: James Maynard (2014, arxiv:1408.5110)
> **JSP bounty**: USD $10,000
> **Current status**: Solved, Lean proof: No, Eligible: No

## Structure

```
JSP045.lean              -- Outer statement: lim sup of gap/(log p)² = ∞
MaynardWeights.lean      -- Maynard's key weight selection
MaierMatrix.lean         -- Maier matrix method
BombieriVinogradov.lean  -- Bombieri-Vinogradov theorem on primes in AP
LargeSievePrime.lean     -- Large sieve specialized for primes
```

## Build

```sh
lake build
```

Lean 4.20.0 + Mathlib v4.20.0.

## Attribution

Original Lean code by `skj-pixel`. Reference: Maynard (2014)
"Large gaps between primes" arXiv:1408.5110. We do **not** mirror
Axiom Math's PrimeGapsLib (which addresses the bounded-gap JSP-000041,
not the unbounded JSP-000045).

## Plan

1. ✅ Project scaffold + outer statement
2. (TODO) Maynard weights: explicit formula + Selberg optimization
3. (TODO) Maier matrix: rank estimate on diagonal
4. (TODO) Bombieri-Vinogradov: average over q
5. (TODO) Combine: gap > C log² p occurs infinitely often
