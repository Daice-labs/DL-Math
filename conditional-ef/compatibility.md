# Algorithm records to the exact graded profile

This constructs V_G byte pairs; it does not claim the external program already emits these bytes. Section numbers G0–G8 refer to the pinned profile. For a nonterminal restricted system P on n>=1 free coordinates, the ambient original source has N/2<=n<=N, m<=6N, actual k_a<=k, and ell=N+1. The case where the finite guards fail is handled by P6, not by an invalid design. Write D_des for the design's measurement bound, avoiding confusion with the modular proof's denominator D_scale.

## K1. Construct the actual restricted design

Include neutral factors 1 with scope {v} for every free coordinate only while constructing the design. They ensure total incidence >=n even when variables are unused. Use E3/Lemmas 4.6–4.8 on the actual restricted equation scopes plus these factors, obtaining Q,R,r,tau,D_des, coordinate polynomials, per-point partitions/owners and integer measurements. Here D_des=r^(2Q), not r^2 times Q. The definition gives |S_g|<=2n/r, total measurement rows <=2tau n, row l1 norm <=D_des, and polynomial bit-size data. The selected fixed exponent beta is bounded in terms of k, not N. Full data construction is polynomial in n,D_des and the scope parameters; D_des<=(2n)^(1/128), hence polynomial in N.

At each point normalize the design as follows, before generating fibres or arithmetic records.

1. Delete neutral factors and their incidence forms/owners. Their value is identically 1 in the graded ring and they contribute degree zero. Keep their coordinates in the partition. Equation factors remain unchanged.
2. Remove empty coordinate groups. There is at least one nonempty group because n>=1. Reindex all surviving groups. If an equation's old owner was empty, assign it to the first surviving group. For such an equation every surviving group was foreign in the old design, so the kernel separation condition held on every surviving group. The new condition is a subset of those old conditions. Other owners remain unchanged. The product of factors is identical, and each surviving group still has size <=2n/r (r here stays the pre-normalization bound parameter; the profile has no r field).
3. Delete identically zero measurement rows, including rows on empty groups. Restriction to the surviving coordinate groups preserves each remaining row and its l1 bound. Each nonzero row has a nonempty coordinate map. An empty row list is allowed. Deleting zero rows changes no kernel and can only decrease the number of attainable keys. No empty row map is serialized.
4. For every required foreign incidence solve the rational row-space system P_(i,v)|group(t)=lambda C. The kernel condition over Q implies solvability. Choose a particular solution by fraction-free elimination (free unknowns set zero), and verify all coordinates. With O(n) dimensions and polynomial-bit entries, determinant/minor bounds give polynomial-size lambda numerators/denominators and polynomial bit time. If C has no rows, the kernel condition forces P to vanish on that group; lambda is the empty vector. No lambda on the Taylor-shifted form is asserted.

The removal/reassignment is necessary: simply copying the paper's allowed empty groups would fail G1/G2. It does not require merging groups or enlarging a local cube.

## K2. Exact source, parameter and scalar fields (G0–G4)

Use the ordered, canonical GF(2) source from P4, duplicated exactly in f and meta. Effective k_a=max(1,actual monomial lengths), m=actual retained equation count. Take ell=N+1, and set

    d=k_a R(m+2(ell-1)), q=floor(d/Q), J=q+1.

These are the exact fields demanded by G2. We regenerate the jets at these dimensions; we do not copy the external counter's possibly larger k-bound declarations. Because k_a<=k and m<=6N, d=O_k(nR), J=O_k(nR/Q)+1. Smaller actual degree only decreases the correction universe and does not invalidate the source polynomial degree bound. The original ell is allowed because ell>=n+1 and ell<=2n+1.

Compute the canonical lift e_s by successive monic division of the prescribed p_ell. Encode polynomial coordinates of each actual incidence with finite rational lists of length 1..R+1, including its own coordinate even if some coefficients vanish. Omitted coordinates mean zero; the delta endpoint follows from the design. Coefficients have positive rational denominators, reduced by gcd, written as ordinary decimal integer tokens or unescaped Z/P strings with no exponent compression. Canonical integer/index/map-key and binary member grammar are used throughout. Lift entries are integer tokens. Literal zeros are written even in dense jets. All source lists, coefficient arrays and occurrence lists are materialized, with no decoder deduplication.

Every dimension is at most the resulting original L: Q point records, J rows, ell lift/grade entries, d+1 recovery entries and n actual partition/member coordinates are present. Also R<=d/2 for n>=1, ell>=n+1, and q<J. Nonempty arrays and exact degree bounds establish all G2 guards without padding tricks or relying on compressed notation.

## K3. Complete fibres and correction records (G5–G7)

For each point and surviving group enumerate its full local Boolean cube, compute the integer measurement key, and sort into nonempty fibres; serialize each member once in that point's base fibre table. Key vector dimension matches the retained row list, including the empty key string when there are no rows. Groups still partition all free variables, including unused ones.

Enumerate exactly every U subset E subset [n] with |E|<=min(q,n), once, with sign (-1)^(|E|-|U|). Filter each fibre to E-bit-one members; list every Cartesian tuple of keys having nonempty filtered fibres. In each tuple list every group exactly once and every filtered local member exactly once. The all-one local assignment ensures at least one surviving key in every group. Attach exact inputs/lifted/A/B/product/Z jets of shape J by ell, using the canonical computations in G6. Empty products are one, even for unowned groups. No full assignment is enumerated by expanding a Cartesian key tuple into a tuple of all its members.

The input jet for an owned equation is its own member contribution plus the foreign lambda/measurement contributions plus corr_U. The row-space identities make it equal to the paper's substituted form on any choice of foreign representatives with those measurements. Thus each recorded local sum and tuple product is the exact Lemma 3.2 value. Lemma 3.3 applies coefficientwise in Q[V]/(V^ell): the correction degree in X at Taylor order j is at most j. Therefore the signed sum over all E,U gives exactly H_s(t+Z) modulo Z^J in every grade s. S_ell is never used inside these products.

Cardinality, validity and uniqueness hold because the serializer enumerates precisely the finite sets G5/G7 specify. Acceptance is independent of enumeration order once actual keys are supplied. The raw occurrence bijections of the typed contract are immediate: no duplicates, defaults or deleted records enter decoding.

## K4. Full recovery vectors (G8)

The paper's implementation needs only H_s(0); V_G requires every coefficient through d. This extra output is explicitly constructed. Use the QJ-square Hermite matrix on degrees 0..QJ-1 and all computed Taylor data. For each grade solve the full rational linear system by fraction-free elimination (or compute each Cramer numerator by polynomially many determinant computations). Its unique solution is the true coefficient vector of H_s; coefficients above d are zero by the graded degree theorem. Serialize entries 0..d only, and verify the rectangular G8 equations. This adds a polynomial number of polynomial-bit operations, not a new exponential factor.

At T=0 the incidence forms are the original variables. Each retained grade is an integer polynomial evaluated on Boolean assignments and summed, so every endpoint_s is an integer. Let U=sum_s endpoint_s and write its signed integer token; take its least nonnegative residue modulo 2^ell. Lemmas 5.1–5.2 give

    residue = # {y in {0,1}^n : P(y)=0},

since that count is at most 2^n<2^ell. The independent graded correspondence then extracts the modular descent premises. Zero acceptance follows for each UNSAT branch, not from a sign assumption on U. Negative U is permitted and Euclidean reduction is used.

## K5. Compatibility theorem

Subject to E3–E4, the construction in K1–K4, applied after P4 and outside its finite fallback range, yields bytes accepted by the exact pinned V_G, with source equal to the actual restricted canonical equations and residue equal to their common-zero count. Consequently each nontrivial branch of an UNSAT original source is zero-accepted. P1/P5/P6 cover all terminal and exceptional cases without weakening V_G.

Neither this theorem nor its proof says that the old native checker accepts the graded bytes. It establishes a mathematical serializer into the specified relation. Source-CNF implication is supplied by P3/P4 and composed as in EF_ASSEMBLY.md; it is not inferred from V_G admission alone.
