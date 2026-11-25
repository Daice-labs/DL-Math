# Original-input coverage and provenance

References E1–E5 are listed in EXTERNAL_DEPENDENCIES.md. This is a deterministic paper algorithm, not an executed search. All asymptotic constants below depend only on fixed k. N is always the original declared coordinate count.

## P1. Normalize without adding or deleting coordinates

Bind the root to the exact original list of signed literals and declared N. On each clause remove repeated literals; delete tautologies, duplicate clauses and clauses containing a retained subclause. Store each deletion's witness (literal repetition, opposite pair, duplicate index, or subclause inclusion). These give polynomial-size Boolean equivalence proofs and polynomial construction time in N+M for fixed k. Retain all N variables, including unused ones. An empty clause is a direct zero terminal. An empty formula has count 2^N and cannot occur in a zero forest. N=0 is evaluated directly. Small N is handled by P6.

No OR-gate width reduction, occurrence copying, or auxiliary Boolean variables enter this route. Polynomial GF(2) equations of degree <=k are permitted by V_G; there is no requirement that the normalized source be a 3-CNF.

## P2. Quantitative disjoint sparsification

For sufficiently large N put lambda=ceil(log2 N), nu=ceil(log2 lambda), s=floor(sqrt(lambda)/nu^2), and sigma=1/s. Compute s by integer comparison. If s<2 use P6. Apply E1 (Lemma 6.3 / Appendix A) with this exact rational sigma. The tree has at most poly_k(N,s)2^(2N/s) nodes, polynomial-in-(N,s) depth, and occurrence bound

    B=O_k((s log(2s))^(k-1))=(log N)^O_k(1).

We deliberately use the conservative factor 2 in the exponent: the displayed Appendix A node estimate and stop rule directly give 2^(2 sigma N), even though Lemma 6.3 states the smaller allowance. No sharpened binomial estimate is needed here; 2N/s=O(rho(N)) suffices. This is an accounting precision correction, not a counterexample to sparsification.

Every node keeps N declared coordinates; each leaf G has at most BN nonempty clauses. N/s=O(rho(N)). Store every node formula, chosen shared literal set H, selected clauses H union P_j, raw children, normalization witnesses and edges. An internal split is

    Parent=G0 AND AND_j(H OR P_j),
    A=G0 AND H,
    Bchild=G0 AND AND_j P_j AND AND_(l in H) NOT l.

The two children are disjoint and cover Parent: split on the value of the short clause H. Petals need not be disjoint. The Boolean proof uses the displayed clauses and then their exact normalization witnesses. Quantitative branch-priority/resource facts are cited from E1; the instance-level coverage tautology is proved directly. Every node description has poly_k(N) bits after normalization (at most O_k(N^k) clauses), including indexes. The original input remains charged by poly_k(N+M+1). No theorem about sparsification correctness is inserted as an EF axiom.

## P3. Deterministically select sparse parity tests on the same N coordinates

For a nonterminal sparse leaf G with m_G>=1 clauses, define violation v_e(x) as the product of (1+x_v) for a positive literal and x_v for a negative literal, over GF(2). Each polynomial has at most 2^k monomials and degree <=k. A row gamma is an explicit list of (clause-index,bit), with repetitions and zero bits retained in provenance; parity-cancel the list to obtain its clause support. The resulting equation is P_gamma=sum_e a_e v_e=0. Canonicalize by squarefree support and cancellation modulo two, sorting monomials. This is exactly the equation grammar G0. Keep row order, including repeated equation rows, and the full map to G.

Use E2 (Lemmas 6.1–6.2): mu=floor(log2 m_G)+1, P=20000 B^2 mu^2, D0=320000 B^2 mu^3. Initial tests have at most 3N rows, each of support <=D0. Append 3N rows of list length P, selecting at each round the first candidate that minimizes its exact common-zero count. There are at most 3N(2m_G)^P counter queries, plus one final query. Every intermediate system has <=6N equations and <=2^k max(D0,P) monomials per equation, so E3 applies with one fixed c=c(k), for all candidates and all sufficiently large N. Finite exceptional sizes go to P6.

Existence and completeness are not inferred from random testing: E2 proves deterministically that the final P_A has exactly the satisfying assignments of G. Its proof uses N(A)=#G+D(A), average residual shrinkage <=3/4, and (3/4)^(3N)2^N<1. This guarantees that if G is UNSAT then the final system P_A is UNSAT.

**The proof object needs only the easy direction.** For every selected row, construct a Boolean/CF proof G(x)=>Even(L_gamma(x)) from the listed clause implications v_e(x)=0. Expansion of each violation uses at most 2^k local terms; parity associativity/cancellation and x_v^2=x_v relate that expression to the stored canonical equation. Sorting/cancellation proofs are polynomial in the explicit row list and clause data. Summing these proofs yields G(x)=>F_(P_A)(x), with x symbolic. Completeness of selected tests is an external construction theorem, not a free EF premise. Arbitrary accepted zero traces would still suffice for refutation when this easy implication is proved.

Discarded candidate counts/search states are charged in construction time (COST_LEDGER.md); they need not be in the final refutation forest, because its verification and proof never assert optimality of a selected row. No paid service or oracle is used: E3 is the cited deterministic counting algorithm. We do not execute it in this batch.

## P4. Fix high-incidence variables without variable inflation

For the final system remove zero equations (retain their deletion/provenance witness); a constant-one equation is a direct contradiction terminal with a polynomial proof. An empty remaining system has count 2^N and is positive. Otherwise add neutral scope factors 1 on each declared coordinate for design construction only, as in E3. Let I be the total incidence count including these N neutral factors; I=N(log N)^O_k(1). With lambda=ceil(log2 N) set

    b0=ceil(I/N) ceil(sqrt(lambda)),
    H={variables belonging to more than b0 scopes}.

Then |H|<=I/b0<=N/sqrt(lambda). Branch over every a in {0,1}^H using an explicit complete binary tree. Each branch has n=N-|H|>=N/2 for N>=20, and a fixed increasing bijection j -> free original coordinate. Keep unused free variables.

Substitute a, squarefree-reduce and parity-cancel each equation. Keep every nonzero nonconstant resulting equation in order; record which zeros were removed and any constant-one contradiction. The resulting system P_a has m<=6N<=12n and per-equation sparsity no greater than before. Under guard gamma_a(x) and with y_j=x_(free[j]), canonical Boolean identities give

    gamma_a(x) AND F_(P_A)(x) => F_(P_a)(y).

Constant-one branches give a direct contradiction under the same guard. Each normalized polynomial has degree <=k; its V_G effective k_a=max(1,actual monomial degrees) may be smaller. The counting/design construction MUST use this effective degree for the trace's exact deg/q/J fields, not copy an overestimated declaration. See COMPATIBILITY.md.

The branch masks cover all assignments, with polynomial Boolean proofs per internal split on the next original variable. No arbitrary assignment x is fixed globally. A satisfying assignment of P_A restricts uniquely to a satisfying assignment of exactly one P_a, and each such branch assignment extends uniquely by a. If P_A is UNSAT, all branches are UNSAT; empty-system positive branches cannot then occur. The branch count multiplication is at most 2^(N/sqrt(lambda)), and each dimension is n in [N/2,N], not BN or a polynomial in M.

## P5. Forest and count bindings

Store the normalized sparsification tree, final selected row provenance/system at each sparse leaf, the high-incidence variable list, its full binary branch tree, original-to-free maps and canonical restriction witnesses. Attach an exactly bound external-source/trace pair (f_a,pi_a) for each nontrivial branch. Source equality means the full decoded equation list and n agree, not just a digest.

Terminal kinds are: empty-clause contradiction; constant-one equation contradiction; N=0 Boolean evaluation; bounded-size exhaustive branch evaluation; and positive empty-formula/system count. Other leaves use V_G. Counts are nonnegative integers, exact branch sums, and exactly equal to the attached trace residue; residues are <2^ell and actually <=2^n by the construction's correctness. For the constructed forest, both branch types preserve exact counts, using E2 for the selected-system equality. Local checking of one-way provenance alone does not certify equality of arbitrary positive counts to the original CNF; it is sufficient for zero-refutation soundness (EF_ASSEMBLY.md EFA5). Store those integers with O(N+1) bits and verify additions/terminal values. On an UNSAT input every leaf count is zero; a positive terminal prevents zero-root admission.

The forest is a new explicit mathematical wrapper, not an undocumented extension of V_G or the existing executable. Only its local coverage/source equations and leaf translations are used by the final CF proof. A poly(S)-time constructor can check the displayed forest locally without replaying candidate-minimization searches. Design and all-input completeness are used to establish existence of such a forest, not as assumptions inside its EF refutation.

## P6. Degenerate and finite fallback cases

Take a fixed N0(k) covering s<2, the fixed sparsity-c parameter threshold, all E3 eventual design checks (uniformly over the bounded beta values), and N<20. The source proofs establish that this cutoff is finite; it is not an input-dependent stopping excuse. The algorithm performs the stated exact guards. For N<N0(k), or if those guards fail, enumerate the original 2^N assignments and store the complete binary decision tree with local Boolean evaluation proofs. Failure of the exact guards cannot occur for N>=N0(k), by E1–E3. Thus every fallback costs at most 2^N0(k) poly_k(N+M+1), absorbed only into a k-dependent constant. No large-N truth table is allowed as a fallback.

For a nontrivial small restricted source one may alternatively use a literal V_G trace: one group of all n variables, Q=1,R=deg=q=0,J=1, ell=n+1, constant identity forms, no measurements/lambdas, complete local cube, the sole E=U=empty record, and constant recovery. This is finite and correct; its 2^n members are charged, never called polynomial for arbitrary n. Direct terminals avoid such enumeration for large-n constant contradictions. N=0 uses V_G's constant kind if a graded-leaf format is desired.
