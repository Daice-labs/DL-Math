# Symbolic CF assembly and one final EF conversion

Let S be the entire original forest byte length. The original source assignment x is a tuple of propositional variables, never supplied as an enumerated satisfying assignment. Use the directly reviewed CF conclusion for a graded trace whenever available; if a component is furnished as encoded EF, perform its fixed polynomial EF-to-CF conversion once. All conversions/definition packages are included in the ledger.

## EFA1. Exact local sources

A graded leaf proves NOT F_(P_a)(y) by the pinned bridge's modular capacity descent. Its admission is bound to the exact canonical restricted equation source. Rename its internal extension gates with a leaf-specific namespace, then substitute y_j=x_(free[j]) throughout its unconditional CF proof, preserving DAG sharing. These are only original variables; the fixed coordinates occur in the separate guard gamma_a(x). This is a whole-proof syntactic substitution, not a free rule on conditional EF definitions.

The restriction/provenance witnesses from P3/P4 provide a polynomial CF proof of

    gamma_a(x) AND G(x) => F_(P_a)(x_free).

Compose with the substituted leaf proof to obtain NOT(gamma_a AND G). A branch with a constant-one restricted equation gives the same conclusion by its local Boolean evaluation and provenance, without a graded trace. An empty system cannot be a zero branch. Every such proof uses only explicit canonical monomial calculations and bounded-width clause identities; no assertion that a minimizer was chosen or that an external algorithm is correct is inserted as a proof axiom.

## EFA2. Complete coverage of fixed bits

The high-incidence binary tree has one internal case split for each actual prefix, children differing in the next original variable v. For guard gamma, child conclusions are NOT(gamma AND x_v AND G) and NOT(gamma AND NOT x_v AND G). A fixed propositional tautology yields NOT(gamma AND G). Append proofs bottom-up; refer to child conclusions without copying their derivations. At the empty guard obtain NOT G. Guards can be fully stored; their O(N) size per node is already a polynomial overhead. No claim of a single selected path here: the number of preprocessing branches is explicitly T_fix and is included in S. The per-trace capacity descent separately uses one polynomial-length circuit path.

## EFA3. Sparsification coverage and the original conclusion

At each sparsification node append the proved local implication Parent(x)=>A(x) OR B(x), including normalization equivalences. Child refutations give NOT Parent by a fixed tautology. The nodes contain sources on the same N variables, so no auxiliary-variable quantification or width-reduction extension is needed. At the root compose the exact normalization equivalence to derive NOT F(x), the original small CNF formula's negation. An empty-clause or bounded-size decision terminal has its direct Boolean proof and joins identically.

Every intermediate/source circuit has an explicit gate definition package or CF presentation. Names are tagged by type, finite node index and local gate index, disjoint from original variables. Do not concatenate entire ancestor descriptions into names. All chosen extensions have acyclic definitions. Gates in one component are renamed before composition. Indexed labels have O(log of total proof size) bits.

## EFA4. Whole-proof accounting

For leaf a write q_a=p_trace(L_a) and c_a for its explicit source maps/guards/provenance. A fixed polynomial p_sub bounds the whole-proof substitution and source composition in CF. At node v let b_v be its supplied local formulas and witnesses, and p_node the fixed local tautology-construction polynomial. Then

    E <= sum_a p_sub(q_a+c_a+1) + sum_v p_node(b_v+1) + poly_k(S),
    final_EF <= p_CE(E+|F|+1).

There are <=S supplied components, each description <=S, so E<=poly_k(S); construction time is bounded the same way, plus the explicit forest-generation cost. This bound is independent of tree depth. Only child conclusions, not transformed child proofs, are used at parent joins. One final CF-to-EF conversion yields a proof of NOT F, or the conventional refutation from the original clauses with polynomial extra steps.

## EFA5. Scope of verification

A zero-forest verifier can check all local branch coverage/source implications and every graded leaf, hence soundly justify a refutation; it need not verify the deterministic minimizer's history. For positive forests, checking only G=>P and the parity-system counts does NOT establish equality to the original #G. That equality for the forests constructed here is the external E2 completeness result. We claim no arbitrary positive-certificate counting verifier from the one-way provenance checks. This distinction prevents an unproved exact-count assertion from entering the proof system.

The quantified statement is a per-source deterministic construction, with a symbolic assignment x and ground trace/source bytes. It does not require the stronger family in which verifier bytes themselves are symbolic. It does not use, implement or certify an exact PB+RED simulation. CF/EF conversion and the previous bridge are listed dependencies, not newly kernel-checked in this packet.
