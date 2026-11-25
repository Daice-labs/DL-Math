# Cancellation on inactive Taylor variables and necessary negative recovery weights

Two results govern exact counting from Taylor data. Variables absent from positive-degree corrections permit paired cancellations. Exact recovery at zero from positive nodes requires a negative weight even with derivative data. Source: v72, §6.6 and Supplements S56, S62 and S67.

## Exact recovery argument for accepted counting traces

Let H(T) be the canonical source polynomial, with the checked zero specialization H(0) equal to the original CNF's number of satisfying assignments. Its declared degree bound is d. At every recorded sample i, source-variable and clause-occurrence bijections prove that the local design computes the same H, even though its partition and clause ownership may differ. Arithmetic and separation checks then identify the recorded value vᵢ with the Taylor coefficient [Z^jᵢ]H(tᵢ + Z).

The recovery weights wᵢ are checked against every monomial Tᵏ through degree d. With a zero entry when jᵢ > k, the required identities are

$$
Σᵢ wᵢ binom(k,jᵢ)tᵢ^(k−jᵢ) = 1 if k = 0, and 0 otherwise.
$$

Expand H(T) = Σₖ hₖTᵏ. Substituting the checked jet values and exchanging the two finite sums gives Σᵢwᵢvᵢ = Σₖhₖδₖ,₀ = H(0). The accepted source-at-zero binding turns this recovered value into the exact count. This is the algebraic proof in MovingAccepted.lean: Point.checked_jet establishes common-source jet identity, checked_degree supplies the finite range, recovered_from_jets performs the recovery, and source_at_zero closes the count statement.

The proof requires the coefficient identities, full source binding and actual local checks; recording a plausible recovered number is insufficient. The sparse variant substitutes the theorem in S67 for the full Taylor computation and then uses this same recovery argument. File-level admission still requires the combined runtime checker and typed-field binder specified in S56.3.

## Proof by cancellation over inactive correction variables

Let B be the original finite variable universe and S a subset supporting every positive-degree correction. For a fixed block E, write f_E(U) for the coefficient of the restricted polynomial sum indexed by U ⊆ E. CircuitSupported S c implies f_E(U ∪ {a}) = f_E(U) whenever a is outside S. This follows structurally: constant leaves do not change, an unsupported correction is zero, and addition, multiplication and negation preserve the equality.

The full block is the alternating finite difference

$$
Δ_E f_E = Σ_{U ⊆ E} (−1)^(|E|−|U|) f_E(U).
$$

If E is not contained in S, choose a in E outside S. Partition its subsets into U not containing a and U ∪ {a}. The two terms have equal values and opposite signs, so the entire block is zero. This does not say either restricted sum is zero: the retained 55/4 pair is an explicit control. Removing all these zero blocks leaves exactly the blocks E ⊆ S, with every U ⊆ E still included. The already-proved full finite-difference formula then identifies the remaining sum with the required Taylor coefficient, for k ≤ q.

The assignment sum remains over B. Only the outer correction-support enumeration shrinks. This distinction prevents deleting inactive variables from the original count. In the formal chain, eval_insert_outside and difference_cancel prove the pair cancellation; restricted_difference_zero applies it to the source circuit; trace_reduce removes the zero blocks; sparse_entry_taylor identifies the coefficient. checked_sparse_taylor and SparseMoving.Trace.accepted_and_counted compose this refinement with the source-count theorem.

## Proof of the sign obstruction

Suppose a recovery rule has weights wᵢ,ⱼ for Taylor coefficient j at sample tᵢ>0. Exact recovery of the constant polynomial forces Σᵢwᵢ,₀=1. Exact recovery of T forces Σᵢ(tᵢwᵢ,₀+wᵢ,₁)=0, with absent derivative weights set to zero. If every weight were nonnegative, at least one order-zero weight would be positive and all tᵢ are positive, so the latter sum would be strictly positive. This contradiction proves that some weight is negative. Higher-order coefficients of a linear polynomial vanish, so adding them cannot avoid the argument.

ReflectionComponents.lean connects these two moments to the actual Taylor matrix before deriving exact_recovery_requires_negative_weight. The theorem blocks a particular order-preserving inference from jets to the endpoint. It does not block exact signed interpolation, the counting theorem in S56, or the graded EF construction in S64.

In the eight-variable worked example, all 38 required Taylor values give a count of 44 using 18 restricted sums in place of 13,122. The factor of 729 measures restricted sums. See [Lean proof sources](lean-sources.zip).
