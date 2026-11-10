# OEIS A060841: $1/\det(M)$ is an integer exactly for $n \leq 34$, $n = 36$ and $n = 38$

[![CI](https://github.com/veljjanoski/oeis60841-palomar/actions/workflows/ci.yml/badge.svg)](https://github.com/veljjanoski/oeis60841-palomar/actions/workflows/ci.yml)

A Lean 4 proof of the conjecture in [OEIS A060841](https://oeis.org/A060841), prepared for the
[Palomar](https://palomar-registry.org/) registry (submission form:
<https://submit.palomar-registry.org/>).

Let $M$ be the $n \times n$ matrix with entries $1/\mathrm{lcm}(i,j)$. The sequence
A060841 lists the numerators of $1/\det(M)$, and R. G. Wilson v conjectured in 2015 that
$1/\det(M)$ is an integer only for $n = 1, \ldots, 34$, $36$ and $38$.

- `OeisA60841.conjecture1`: for every $n \geq 1$, the denominator of $1/\det(M)$ is $1$ if and
  only if $n \in \lbrace 1, \ldots, 34 \rbrace \cup \lbrace 36, 38 \rbrace$.

The definitions `lcmMatrix` and `integerDetN` and the statement in `Challenge.lean` are copied
verbatim from [formal-conjectures](https://github.com/google-deepmind/formal-conjectures)
(`FormalConjectures/OEIS/60841.lean` at commit `feacabbcf6ed2e7b622663c3e1c0f61038183392`),
where the statement is stated with `sorry`.

The proof in `Solution.lean`: since $1/\mathrm{lcm}(i,j) = \gcd(i,j)/(ij)$ and
$\sum_{d \mid m} \varphi(d) = m$, the gcd matrix factors as
$E \cdot \mathrm{diag}(\varphi) \cdot E^{\mathsf T}$ with $E$ the unitriangular
divisibility matrix $E_{id} = [d \mid i]$ (Smith's determinant), so
$1/\det(M) = (n!)^2 / \prod_{k \leq n} \varphi(k)$. For $n \in \lbrace 1, \ldots, 34, 36, 38 \rbrace$ the
divisibility is decided by computation (`decide`). For every other $n$ the obstruction is
$2$-adic: the odd primes up to $97$ and the powers of $2$ from $4$ to $128$ give
$v_2\big(\prod_{k \leq n} \varphi(k)\big) \geq c(n)$
with $c(n) = \sum_p v_2(p-1) \lfloor n/p \rfloor + \sum_{j=2}^{7} \lfloor n/2^j \rfloor$,
while $v_2((n!)^2) = 2 \sum_{j \geq 1} \lfloor n/2^j \rfloor$. For $n = 35, 37$ and
$39 \leq n < 100$ the inequality $c(n) > 2 v_2(n!)$ is checked case by case, and for
$n \geq 100$ it follows from $\lfloor n/m \rfloor \geq (n + 1 - m)/m$ and $v_2(n!) \leq n$.

## Repository map

- `Challenge.lean`: the statement (with `sorry`) a reader audits.
- `Solution.lean`: the same declaration with a proof.
- `comparator.json`: the declarations `lake comparator` checks.
- `formalization.yaml`: provenance, authorship, automation and review metadata.
- `scripts/`, `test/`, `Gemfile*` and `.github/workflows/ci.yml` come from
  [PalomarTemplate](https://github.com/PalomarRegistry/PalomarTemplate).

Build with `lake exe cache get && lake build`; check with `scripts/verify-comparator.sh` (Linux,
needs `bwrap`).

## Licence

Apache License 2.0, see `LICENSE`. The definitions and statement copied from formal-conjectures
are also under Apache-2.0.

AI-usage disclosure: Claude (Anthropic) was used as assistant.
