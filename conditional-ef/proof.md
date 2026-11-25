# Conditional subexponential Extended Frege refutations at fixed clause width

For each fixed $k$, the theorem concerns every unsatisfiable $k$-CNF with $N$ original variables and $M$ clauses. Its proof-size and construction-time bound depends on four external premises: disjoint sparsification, sparse parity-test selection, the specified counting and branching bounds, and graded lifting and exact recovery. These premises and their references are set out below. This is a written conditional theorem. Source: v72, §6.10 and S64.

## The theorem and its input parameter

For every fixed k ≥ 2 and every unsatisfiable k-CNF F with N declared Boolean variables and M clauses, the construction supplies an EF refutation with the following size and deterministic construction bit-time bound, conditional on the external results specified in S64.5:

$$
\operatorname{size}_{EF},\ \operatorname{time}_{\mathrm{construct}}\le (N+M+1)^{O_k(1)}2^{O_k\!\left(N(\log\log N)^2/\sqrt{\log N}\right)}.
$$

This is the sufficiently-large-N expression. Finite parameter failures, empty inputs, constants and zero-variable sources have direct bounded fallbacks. One regularized rate is ρ(N) = Nν²/√λ, with λ = max(2, ⌈log₂(max(2,N))⌉) and ν = max(1, ⌈log₂λ⌉). For growing N it agrees with the displayed order. N always denotes the original declared variable count. Restricted asymptotic leaves have n in [N/2,N]; they are not claimed to retain N free variables. The factor polynomial in N + M + 1 is part of the theorem.

The internal result is a polynomial-time translation of the specified graded-trace proof system into EF, together with a bound on constructing sufficiently short accepted traces for all original inputs. It is not a simulation theorem for every execution of an external counting machine. Matching the rate in a separately formalized resource statement [62] does not establish that correspondence or discharge the external premises of this construction. The full paper proof is retained in the source packet; this section gives its mathematical structure and exact scope. Fixed k is part of that scope: converting growing-width CNFs with auxiliary variables requires separate accounting and does not preserve the displayed original-N rate automatically. The executable developments through resume054 are reported in S68.27 without changing the theorem’s premises or rate.

## External premises and internal contribution

The dependency register separates the following external premises from the internal reflection theorem. E1 is deterministic disjoint sparsification with explicit source coverage, from Lemma 6.3 and Appendix A of the external preprint [61]. E2 is sparse parity-test selection and provenance from Lemmas 6.1–6.2 and Section 6.3. E3 comprises the specified design, counting, high-incidence branching and selection results in Definition 3.1, Lemmas 3.2–3.3, Proposition 3.4, Lemmas 4.6–4.8, Section 5.5 and Theorem 2.2. E4 supplies parity lifting, graded truncation and exact recovery/arithmetic bounds from Lemmas 5.1–5.2, Proposition 5.3 and Appendix B.1–B.3. The accepted source text is hash-pinned with the proof packet.

The original register's E5 combines two different things: our internal graded reflection theorem, summarized in S64.3, and standard external circuit-Frege/Extended-Frege conversions and encodings. This exposition separates them. The EF/CF polynomial equivalence and feasible deduction used in assembly are cited explicitly [63], with the circuit/gate-encoding source retained separately [65]. The official counting-machine note [62] concerns its own formally verified resource theorem. It does not by itself certify the E3/E4 formulations or establish a native trace correspondence. The main theorem is conditional on the listed external mathematics; independence of the local paper review does not remove that dependence.

## What the trace must retain

The declared verifier profile V_G decodes an original source and an explicit byte record into a typed graded trace. Its paper-level G0–G8 obligations include source polynomials, complete fibres, correction pairs, measurement tuples, member lists, arithmetic and recovery data. Decoding retains occurrences rather than identifying equal-looking records through a dictionary. Claimed maps must have the required bijectivity. Full Hermite coefficient vectors and actual effective degrees are supplied; an endpoint value alone does not establish the identities used in reflection.

Products retain a formal grade V in the polynomial ring Q[V], truncated before degree ℓ. Grades are summed only after the complete product and recovery. The canonical source factor is linked to the actual input, rather than an arbitrary function asserted to represent it. Every source implication from the original CNF to a selected equation is explicit and charged. One-way provenance suffices when a selected system is proved to have no solution. It does not certify arbitrary positive trace forests as exact counts of the original CNF.

The earlier review found that duplicate-record collapse and an incorrect unit-product treatment could invalidate a proposed admission bridge. The retained repair and re-review are dependencies of the completed theorem. These failures are not erased by the later all-input result. A native parser and verifier, a proof of their correspondence with the typed contract, and an EF emitter are separate implementation obligations.

## Internal reflection by symbolic capacity descent

Let F be the Boolean source circuit on n variables. For n ≥ 1, choose D > 0 and ℓ ≥ n + 1, with the modulus T specified below. The trace supplies polynomial-size integer prefix circuits Iᵢ and derivations of exact splitting, with all integer widths and ranges charged to the complete trace length L:

$$
I_i(z)=I_{i+1}(z,0)+I_{i+1}(z,1).
$$

Their terminal and root bindings are

$$
I_n(z)\equiv D F(z)\pmod T,\qquad I_0\equiv0\pmod T,\qquad T=D2^{\ell},\quad\ell\ge n+1.
$$

Here z is a length-i prefix. For a symbolic assignment x, let δᵢ(x,z) be its prefix-agreement indicator. Define the corrected prefix value, its least nonnegative residue and the remaining capacity by

$$
U_i=I_i-D\delta_iF(x),\qquad r_i=U_i\bmod T,\qquad C_i=D2^{n-i}.
$$

Assume F(x) = 1. At the root, the admitted zero total gives

$$
r_0=T-D>C_0=D2^n\qquad(n\ge1,\ F(x)=1).
$$

If rᵢ exceeds Cᵢ, the two child residues cannot both be at most Cᵢ/2. Otherwise their sum is at most Cᵢ, which is strictly smaller than T, so no modular wrap is possible; exact splitting would force the parent residue to be at most Cᵢ, a contradiction. A comparator circuit chooses an overflowing child. Repeating this symbolic choice reaches depth n while sharing the prefix circuits. The terminal binding makes the last corrected value congruent to D F(z)(1 − δₙ(x,z)), whose least residue is either zero or D. Descent requires it to exceed Cₙ = D, giving a contradiction. This construction follows a linear number of symbolic choices and does not enumerate all assignments.

The strict root inequality is not asserted at n = 0. In that case root and leaf coincide, and the two modular bindings directly force the constant source to be false because 0 < D < T. The invalid zero-variable strict inequality from the later exposition is therefore excluded from the statement. The guard ℓ ≥ n + 1 is essential to the admitted construction: an all-satisfying source at ℓ = n can have its count vanish modulo the chosen modulus. This is a mathematical boundary counterexample, not an executed control.

The proof does not require Hermite weights to be nonnegative. Signed rational recovery is translated into exact integer arithmetic with explicit quotient, remainder, sign and range circuitry. The proof-only denominator scale can have bit length polynomial in L; it need not have polynomial bit length in N. These arithmetic costs are included in the polynomial-in-L reflection bound. The resulting circuit-Frege derivation is converted to EF using a stated standard simulation [63]. This is our internal paper-level reflection argument; it is not one of the imported counting lemmas. No numerical polynomial-overhead exponent is claimed here.

## Complete construction and original-N costs

Normalization and deterministic disjoint sparsification preserve the original variable universe and supply branch coverage. Selected sparse parity tests retain explicit clause provenance. High-incidence branching fixes at most N/√(log N) coordinates in the asymptotic regime, so the remaining leaf dimension lies between N/2 and N. The construction chooses ℓ = N + 1, sufficient for every leaf. Degenerate groups, neutral factors and zero measurement rows are normalized with their source identities preserved. Actual degrees, complete bivariate jets and full Hermite output are serialized explicitly.

In the asymptotic regime, set s = ⌊√λ/ν²⌋ using the parameters defined in S64.1. The accepted cost ledger permits polynomially many factors times 2^(2N/s) for sparsification. The initial candidate had repeated the smaller literal 2^(N/s) allowance. Independent review required the conservative factor two; both expressions remain within an exponential factor with exponent O(ρ(N)). The adverse finding, initial candidate and exact repair remain in the packet.

The total accounting counts repeated fibres, correction pairs, key tuples, local member terms, coefficient bits and recovery records at each retained occurrence. Polynomial working space alone is not used as evidence of a short trace. Deterministic selection calls, including discarded counter queries, are included in construction time. If S is the complete original source-and-forest bit length, the accepted estimates give

$$
S,\ \operatorname{time}_{\mathrm{forest}}\le (N+M+1)^{O_k(1)}2^{O_k(\rho(N))}.
$$

Each leaf reflection has cost polynomial in its explicit trace size. Fresh extension variables keep the local derivations compatible. Source implications and branch conclusions are assembled bottom-up into one circuit-Frege proof; a single global CF-to-EF conversion then has size and time polynomial in S. This avoids repeatedly expanding translated child proofs. The polynomial composition preserves the stated exponent as a function of original N, including the cost of preprocessing and the input's M clauses.

## Consequences with their parameter restrictions

For fixed k and M bounded by a fixed polynomial in N, the conditional theorem gives uniformly constructible EF refutations of size 2^o(N) and rules out a 2^Omega(N) EF size lower bound for those input families under its premises. Without that clause-count condition, the polynomial factor in M must remain. The result does not give polynomial-size proofs or settle P versus NP. Bounds of the form 2^(N^delta), for any fixed 0 < delta < 1, remain asymptotically below this upper bound and are not excluded by it.

For a precisely scoped comparison with algebraic systems, Ben-Sasson and Impagliazzo [64] define random k-CNFs by drawing Delta N clauses independently and uniformly with replacement from the 2^k binomial(N,k) possible clauses. Their Theorem 1.2 assumes fixed k ≥ 3 and Delta > 0 and gives linear polynomial-calculus refutation degree with high probability over fields of characteristic greater than two. If unsatisfiability with high probability is also wanted, a fixed Delta > 2^k ln 2 is a sufficient first-moment choice. Their characteristic-two comparison is attributed to a separate result, not covered by that theorem. This comparison concerns different proof systems; it is not an EF lower bound, a k = 2 hardness claim or a practical speed comparison.

## Detailed arguments

[Preprocessing](preprocessing.md) · [Trace compatibility](compatibility.md) · [Bit costs](bit-costs.md) · [EF assembly](assembly.md) · [Supplied-trace companion](../supplied-graded-traces/proof.md)

## References

[61] OpenAI (2026). The Exponential Time Hypothesis is False. Preprint, 25 October 2026. The particular external premises used here are enumerated in S64.5 and pinned to the retained source text. https://github.com/openai/math/blob/main/preprints/The-Exponential-Time-Hypothesis-is-False-October-25-2026/paper.pdf

[62] OpenAI (2026). Formal counting-machine resource statement, lean/docs/378.md. Consulted 31 October 2026. This source concerns its own certified machine and the squared-log-log rate; it is not a trace-correspondence theorem for the present construction. https://github.com/openai/math/blob/main/lean/docs/378.md

[63] Jerabek E. Substitution Frege and extended Frege proof systems in non-classical logics. Author manuscript, 24 November 2008. Proposition 3.3 (EF/CF polynomial equivalence) and Proposition 3.6 (feasible deduction). https://users.math.cas.cz/~jerabek/papers/sfef.pdf

[64] Ben-Sasson E, Impagliazzo R (2010). Random CNF's are Hard for the Polynomial Calculus. Computational Complexity 19, 501–519. doi:10.1007/s00037-010-0293-1. Definition 1.1 and Theorem 1.2; fixed k ≥ 3 and fields of characteristic greater than two. https://www.ias.edu/sites/default/files/math/csdm/10-11/ebensasson_random_cnfs_are_hard.pdf

[65] Jerabek E (2023). On the proof complexity of logics of bounded branching. Annals of Pure and Applied Logic 174(1), 103181. doi:10.1016/j.apal.2022.103181. Author manuscript arXiv:2004.11282v2. Circuit/gate-encoding source retained by the accepted dependency register. https://arxiv.org/abs/2004.11282
