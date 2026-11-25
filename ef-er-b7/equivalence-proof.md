# Complete B7–ER/EF supplied-proof equivalence argument

18 October 2026. Written mathematical/source proof; not machine formalization.

The original source cut, exact function anchors, generated finite evidence, corrections and status ledger are part of the same archive. The chapters below are concatenated without changing their mathematical content. Relative paths in an individual chapter refer to its original `proofs/` location.


---

## File: 00_DEFINITIONS_AND_THEOREM.md

# A source-bound polynomial equivalence for complete B7, signed ER and finite-basis EF

**Date:** 18 October 2026. **Status:** completed written mathematical proof in this review, subject to independent scrutiny; not a Lean formalization or universal execution certificate. The proof consists of this statement and the four numbered proof chapters and the presentation appendix beside it. Earlier submitted claims are not premises. Every constructor used below is justified in those chapters. The exact historical source cut is `f245b7e2adff17eaa273e402811c6f77d513a5a6`; the complete file hashes and symbol ranges are in `../SOURCE_ANCHORS.md`.

## 0.1 Encoding conventions

An instance is a natural number D and a finite ordered list F=(C_1,...,C_r). Each C_i is an ordered list of nonzero signed integer literal identifiers l with |l|<=D. Identical literals and identical clause occurrences are allowed. No iteration through all D possible names is part of an algorithm. For an assignment a, l denotes a(|l|) when positive and 1-a(|l|) when negative.

The Boolean clause `cl(C)` is the literal-occurrence-preserving left fold starting at false: `or(...or(or(false,l_1),l_2)...,l_t)`. Original variable v is named `x` followed by its decimal identifier. The ordered hypothesis list cl(F) retains every occurrence. Empty clauses denote false.

The PB clause `pb(C)` is constructed differently: first contract identical signed literals, give each distinct signed literal coefficient one and degree one, then apply the canonical normalization below. This is exactly `def_calculus.clause`, not a multiplicity-weighted sum of the original occurrences. Complementary literals may make a tautology. There is still one PB row for every original clause occurrence, in the same order. No clause occurrence is deleted.

A canonical PB row R=( ((a_1,l_1),...,(a_t,l_t)),b ) has positive integer coefficients, distinct absolute variable identifiers, terms ordered by increasing absolute identifier, and integer degree b. It asserts sum a_i*l_i >= b. A row may retain terms when b<=0 or b>A=sum a_i; its Boolean encoding is respectively true or false. A degree-zero literal operand asserts l>=0, not l>=1.

Raw nonnegative terms are canonicalized by collecting positive and negative coefficients P_v,N_v for each variable. Put K=sum_v min(P_v,N_v). Keep |P_v-N_v| on the prevailing signed literal and replace b by b-K. In particular,

    sum(raw terms) = K + sum(canonical terms).

All integers use finite positional spellings. Decimal JSON spellings, canonical binary spellings and binary strings with separators are mutually polynomially interconvertible; their bit lengths differ by constant factors apart from separators. S denotes at least two plus the length of the complete serialized instance and supplied proof, including D, all integer digits, names, rows, references, witnesses, local certificates and metadata that belongs to that proof format. We use deterministic bit operations and unbounded but finite storage, not unit-cost arithmetic or a fixed-host Python guarantee.

## 0.2 The exact B7 system

B7 here means `ER_EF_02_COMPLETE_B7_OBLIGATION_IR_v1`, accepted by `er_ef_wire_v2/validate.py:12–84`. A proof contains `declared`, `originals`, `steps`, `conclusion`, and the exact schema tag. It has originals exactly pb(F), not arbitrary equisatisfiable replacements.

The database is append-only, with contiguous row IDs. A step may reserve a sorted set of genuinely fresh PB variables above D. Original IDs at most D are available without needing an array of length D. All references are backward and bound to the current database.

**POL.** The supplied postfix program pushes an earlier row or the literal lower bound l>=0; adds two rows; scales by a strictly positive integer; divides by a strictly positive integer, rounding every coefficient and the degree upward; or saturates a positive-degree row by replacing every coefficient a by min(a,b). For nonpositive degree saturation returns the specified constant-true row. Every intermediate uses exact canonical row arithmetic. The explicitly supplied final row must match that computation. Zero multiplication in an auxiliary historical helper is not an admitted POL rule.

**RUP.** The declared distinct premise IDs, together with the exact PB negation of the candidate, must yield a conflict under the specified slack propagation. If S_R=sum a_i*l_i, the negated constraint is sum a_i*(1-l_i)>=A-b+1, then canonicalized. Under a partial assignment the slack is the maximum achievable left side minus b. Negative slack is a conflict; an unassigned literal with coefficient greater than slack is forced true. Each nonterminal propagation adds one assignment.

**RED.** Let the current database be Delta, candidate C, and witness omega a simultaneous substitution of specified available variables by signed available literals or Boolean constants. Its local goals are exactly C|omega and R|omega for every R in Delta. For each goal G the input includes a local POL/RUP refutation from

    Delta, not_PB(C), not_PB(G).

The full goal-key set is required. The local namespace is a copy augmented with the explicitly occurring local literals. Local-only fresh variables, local candidate/goal negations and local helper rows do not become global rows or global reservations. No local RED recursion is admitted. The next global database is Delta followed by C. The scope tag is exactly `leq-no-order-no-objective`.

The final `UNSAT` claim names a stored row with degree greater than total coefficient mass. `NO_REFUTATION_CLAIM` is a different result and is not an input to the refutation theorem.

This is a complete *obligation object*: every certificate required by the rule is present. It is not every directive accepted by a native PB checker, nor an automatic procedure deciding which arbitrary RED goals have short certificates.

## 0.3 ER and the discovered presentation discrepancy

The intended strict source grammar `ER_SIGNED_BINARY_v1` contains F; fresh signed-input binary AND/OR definitions (and constants); ordinary resolution; weakening; syntactic tautologies; and a named empty-clause conclusion. Each fresh extension variable y is greater than D and has not been used previously; every raw nonconstant input literal must already be available before y is reserved. Extension introduces the usual clauses for y iff the gate. The full original F occurrence lists remain recorded, although resolution computes clauses as sets.

**The unchanged validator accepts a slightly larger grammar than that prose.** In `translate_er_to_def.py:46–50`, normalization precedes the freshness check. The raw inputs (y,-y) can disappear into a constant, so `y iff (y or not y)` and `y iff (y and not y)` are accepted. All other undeclared inputs are rejected by either the threshold check or the subsequent raw gate-clause binding. This is a genuine conventional-syntax discrepancy, not a soundness counterexample: the two accepted cases are exactly y=true and y=false.

We keep two names in this proof: ER_strict and ER_legacy. No submitted bytes are overwritten. The one-line patch in `patches/strict_er_raw_freshness.patch` gives the intended strict grammar. The new `code/legacy_er_to_strict.py` replaces each legacy self-complement gate by its constant definition and the two tautological clauses with the same historical clause identifiers. This is linear-size, preserves all later row references, and introduces no new hypotheses. Chapter 3 proves both claims. Accordingly, the mathematical equivalence below holds for both grammars, but their exact accepted syntax is not silently identified.

Signed AND/OR and constant gates are a conventional ER presentation. AND is replaced by an OR gate on complemented inputs with complemented output. Constants can use p or not p and p and not p for any variable p occurring in F; if F contains no variable, an unsatisfiable F already supplies an empty clause. Weakening and tautology are polynomially removable from refutations by the subclause induction in Chapter 3.

## 0.4 EF and intermediate formats

EF_prefix is `EF_FINITE_AXIOM_MP_PREFIX_v1`, with explicit flat-prefix *occurrence* formulas. Lines use one of the fixed 38 axiom schemata in `er_ef_frege_v13/schemata.py`, modus ponens, a listed original hypothesis, or a fresh definitional extension. Implication is `or(not A,B)`. Extension y iff B requires y absent from earlier use and B over available names. No semantic entailment test is an inference rule. The conclusion is literal false.

The 38 schemata are fixed independently of the input. They contain the local truth cases for the five Boolean operators/constants and the structural, equivalence, context and classical-case rules needed below. They are sound by their finite Boolean tables. They are implicationally complete: under a complete assignment derive the appropriate signed value of each formula by the local cases, derive the consequence or use a contradicted premise, then eliminate the assignment using the classical-case schema, K, S and context conjunction. This argument establishes logical completeness, not a polynomial tautology-search algorithm.

The actual B7-to-EF route is:

    v12 complete B7 -> classical ND/DAG
       -> v14 original-CNF graft
       -> v13 Stage A finite-schema deduction
       -> v14 named prefix occurrences.

The ND/DAG and finite-schema DAG are *intermediate objects*, not the endpoint. In particular, v13 `tree.py` Stage B is not the route proved here. The target's original hypothesis formulas are literally cl(F), including repeated literals and clauses. No unproved PB predicate, gate equation masquerading as a hypothesis, or changed original-variable name is permitted.

## 0.5 The theorem

There are fixed deterministic algorithms T_EB, T_BE and T_FE and fixed polynomials p_EB,p_BE,p_FE,q_EB,q_BE,q_FE with the following properties for every finite (D,F):

1. For every ER_strict refutation pi of F, T_EB(D,F,pi) is a B7 refutation with originals exactly pb(F). The same statement holds for every accepted ER_legacy refutation. T_EB is the submitted compact-ER -> wire -> complete-decoder route, not a replacement abstract inference system.
2. For every accepted complete B7 refutation pi with originals pb(F), T_BE(D,F,pi) is an EF_prefix refutation with hypothesis list exactly cl(F), the original variable names unchanged and final conclusion literal false. T_BE is the exact submitted v12/v14/v13A/v14 composition.
3. For every EF_prefix refutation pi with hypotheses cl(F), T_FE(D,F,pi) is an ER_strict refutation of F. Additional free declarations not occurring in F are simultaneously replaced by false before they are represented; this does not change F. T_FE is the new supplied constructor `code/finite_ef_to_er.py`.
4. If the encoded source length is S, the output length is at most the corresponding p(S), and generation plus target checking costs at most q(S) bit operations. Invalid source strings can be rejected in polynomial time before proof construction; source validation errors are rejection, not accepted proofs.

One conservative set of bounds established in Chapter 4 is:

| Edge | Output bits | Generation and checking bit work |
|---|---:|---:|
| ER -> complete B7 | O((S+1)^4) | O((S+1)^24) |
| complete B7 -> same-CNF EF_prefix | O((S+1)^60) | O((S+1)^360) |
| EF_prefix -> strict ER | O((S+1)^3) | O((S+1)^18) |

These deliberately loose bounds are solved recurrences, not efficiency predictions. The third time bound is widened from the immediate constructor-loop estimate to include all independent source/target validation and serialization; it is not a fitted exponent. Composition gives all reverse directions. In particular B7, ER_strict, ER_legacy and EF_prefix are polynomially equivalent as supplied-refutation systems on these original CNFs.

The phrase *conventional EF* is justified, rather than stipulated, in Chapter 3: the fixed sound complete basis is a Frege basis; arbitrary fixed Frege-basis changes are polynomially compiled, with naming before connective expansion. The reference is Cook–Reckhow's Theorems 2.3 and 4.5, and the relevant fixed-rule argument is given here. The new EF_prefix -> ER constructor also supplies the otherwise missing explicit ER connection for these presentations.

## 0.6 Proof dependency map (no circular use of equivalence)

- N1: numeric row normalization and binary encoder.
- N2: fixed-arity formal-template expansion and exact assumption-ID discipline.
- N3: bit recurrences, comparator/adder invariants and range/width transport.
- N4: `normalize_sum`, exact output identities, then `normalize_predicate` and generalized projection.
- A1–A6: addition, scaling, rounded division, saturation, PB negation, POL/RUP.
- R1–R3: simultaneous substitution, local RED discharge, global mux-state invariant.
- E1–E3: original-occurrence CNF graft, simultaneous-context deduction, prefix naming.
- F1: actual ER compact/wire/complete construction; its automatic closure is proved for the generated fragment only.
- B1: new conventional EF-to-ER bridge, independent of N1–E3.
- P1–P5: input-only magnitude, primitive entries, whole intermediate objects, prefix occurrences and bit work.
- Final assembly: F1 and N1–E3 give the first two translations; B1 gives the third; ordinary composition gives equivalence.

No arrow relies on EF being able to simulate every polynomial-time verifier. No arrow relies on the giant interrupted construction or on a closed-obligation label. Finite diagnostics check implementations and specific formal transition tables; they do not replace the parameterized inductions.

## 0.7 Scope and assurance

The theorem is a written, source-level mathematical result for the precisely specified *complete* B7 IR. It does not classify the whole native proof dialect, prove fixed-width arithmetic faithful, establish finite-host totality, or prove the historical gigantic execution completed. It is not yet machine-checked as a universal translation theorem. It does not imply polynomial-size refutations for every unsatisfiable formula or polynomial-time proof discovery; in particular it does not settle P versus NP or NP versus coNP.

Native fidelity N01 and universal machine formalization are separate unestablished claims, not additional premises secretly needed for the mathematical proof above. The giant run and its incomplete evidence keep their historical status. The code's old status strings are likewise preserved; current review status is in the additive obligation ledger.


---

## File: 01_NORMALIZER_AND_TEMPLATE_PROOF.md

# 1. Universal normalizer and proof-compiler contract

This chapter proves the first load-bearing constructor, including its helper requirements. Source abbreviations refer to the execution directory in `../SOURCE_ANCHORS.md`. The proof does not assume that a successful runtime guard establishes an invariant. Each guard is a consequence of the invariants below.

## N1. Row arithmetic and the exact Boolean encoder

### Numeric normalization

For every finite raw list of nonnegative coefficient/literal pairs and integer degree d, collect P_v and N_v for every absolute variable identifier v. For a Boolean X,

    P_v X + N_v(1-X)
      = min(P_v,N_v) + |P_v-N_v| L_v,

where L_v is X or 1-X according to the prevailing sign; omit it if the difference is zero. This identity follows by the two cases P_v>=N_v and P_v<N_v. Summing it proves the normalizer's arithmetic contract, without requiring different variables to denote independent Boolean values.

Let A be the raw total, K the removed constant and T the canonical total. Then A=T+2K and the new degree e=d-K. Sorting terms changes no sum. Zero coefficients change neither side. Consequently raw and canonical inequalities are equivalent for every assignment, including states in which different variables denote identical, complementary, constant, or overlapping formulas.

The exact canonical output is determined by (P_v,N_v,d), with one surviving signed term per v and increasing v order. This proves equality to the numeric `normalize` result, not merely logical equivalence to some row.

### Binary row encoder

For a nonconstant canonical row, `pb_boolean_encoding.py:53–78` chooses w=max(1,bit_length(T)). Thus T<2^w, including when T is a power of two: that case receives one more bit than log2(T). A weighted literal aL is encoded by putting the opaque handle L at positions where a has a one bit and false elsewhere. Negative literals use the builder's named NOT gate, not a different atom.

The ripple full adder satisfies, for Boolean inputs u,v,c and outputs s,c',

    u+v+c = s+2c'.                         (1.1)

This follows immediately by the eight Boolean cases or by XOR/majority arithmetic. Summing 2^j times (1.1) gives the low-word sum modulo 2^w and its final carry. The left fold starts at the all-false word. Every partial numerical sum is between zero and T, so there is no discarded overflow in the actual row encoder. This is a mathematical range fact; it is proved inside the target derivation when a later constructor needs it.

The encoder's descending comparison keeps `equal` and `greater` for the already visited high bits against the fixed degree. At each position greater becomes true exactly if the higher prefix was equal and the operand bit is one while the degree bit is zero, or if it was already greater. Equal remains true exactly when this next bit agrees. At termination `greater or equal` is precisely unsigned sum>=degree. Constant rows return literal true or false with no arithmetic gates. This proves the encoder's Boolean correctness for all rows.

## N2. A valid builder and explicit formal templates

A **valid builder prefix** consists of a uniquely interned, acyclic formula-node list; fixed true/false handles; an exact inverse `index`; a list of valid ND lines with backward references and exact open-assumption ID sets; unchanged original hypotheses and input names; and consistent extension/body/equation metadata. Every extension is a fresh atom defined from already available formulas. A state maps every variable used by the call (including zero-coefficient raw terms) to an existing opaque formula handle. Its formulas need not be independent. Every caller-supplied premise is an earlier ND line proving the *exact* required handle.

`Builder.gate` scans the occupied input and formula-atom names, finds a fresh suffix if needed, records a fresh extension, and interns by the body. A repeat call with the same body returns the same atom. Thus it preserves the valid prefix. Numeric node IDs used in generated names are charged by their spellings. No inference trusts the name itself or a hash collision.

A formal template is an acyclic occurrence DAG with r named slots, constants, Boolean connective nodes and named-gate nodes. It has formal premise roots and one conclusion. Its certification enumerates its r **formal** Boolean slots. For the production arithmetic r<=9; the generic authoring API with arbitrary r is not claimed polynomial.

### Template expansion theorem

Suppose the formal premises imply the formal conclusion under all 2^r valuations; the actual substitution maps every slot to an existing handle; and the supplied premise lines and expected target are exactly the template's instantiated roots. Then `template_lemma` appends a valid proof of that exact target, with no new undischarged assumption, and preserves the builder prefix.

**Proof.** Instantiate formal nodes in topological order. Plain nodes use interning; gate nodes introduce or reuse their exact defining atom/equation. At each complete slot valuation, introduce the corresponding signed slot assumptions. Induct over *formal node IDs*: a slot's proof is its own assumption line; a constant has the relevant nullary local truth rule; a connective follows from its children's signed values by the fixed local rule; a gate additionally transfers its body's signed value through its defining equivalence. Formal IDs, not actual handle equality, index these signed proofs.

If a formal premise is false, its signed negative proof contradicts the given earlier premise and explosion proves the desired target. Otherwise the conclusion is true by the formal implication, and its signed proof is already a proof of the target. Eliminate the last slot's two branches using their exact distinct assumption line IDs, and continue outward. Left branches were constructed before right assumptions existed. Right branches use only their own slot assumptions and the original earlier premises, never left-branch assumptions. The cross-branch guard therefore holds, even when different slots have equal or complementary formulas. All new slot assumptions are discharged.

This is an emitted syntactic proof, not a semantic-entailment instruction to the EF checker. The only truth tables concern a fixed number of formal slots. Arbitrary original support is never enumerated. ∎

If the template has t formal nodes and p premise occurrences, the expansion has at most O(2^r(t+p+r+1)) entries, plus gate declarations. Substitution does not copy the circuits behind the opaque handles. Growing plans must still be charged by t; a width-w loop repeatedly freezing the same growing plan is not O(w) for free.

### Completeness of the local formal obligations used here

There are three kinds, not an arbitrary tautology oracle:

1. Fixed propositional rearrangements in `prop` and one/two-gate congruence. Their finitely many Boolean tables are provided and checked. The submitted source has 53 literal `prop` sites of arity at most six.
2. Width-independent adder/comparator transitions of at most nine slots, proved below. `analysis/WORD_TRANSITION_CERTIFICATES.json` contains an independent exhaustive check of the 512 common-addend transitions, 64 final-carry cases, and 128 associativity carry cases.
3. Growing zero- or one-slot word plans, such as one variable's coefficient collection. Their formal validity follows from (1.1) and the two values of that one slot, for *every* word width and coefficient. They are not certified by testing a finite selection of widths.

The local truth tables alone are not the theorem. They discharge fixed base transitions used in the following inductions.

## N3. Word identities, order and exact handles

Write `[u]_w=sum_{j<w} 2^j u_j`. Let Add_w(u,v) be the low ripple sum; when used for order, retain its final carry. Let G_w(u,v) be the low-to-high comparator obtained from G_0=true and

    g(a,b,p)=(a and not b) or ((a iff b) and p).

An induction on w gives G_w(u,v) iff [u]_w >= [v]_w: a new unequal most significant bit decides the comparison; equal bits preserve the lower comparison.

### Low-bit syntactic compatibility

For every j<=w, computing the first j ripple sum outputs at width w calls exactly the same interned gates as computing at width j on the corresponding low input words. Higher bits are never an input to a lower gate. Induction over bits and over the left-fold operands proves equality of the low *handle lists*, not just their values. This remains true if unrelated nodes were appended between the two calls because body interning is consistent.

### Addition zero, commutation, association and congruence

Addition by zero is proved by induction on the false carry. Commutation couples the two carries, uses the four-slot full-adder symmetry step, and returns an equality proof for each low bit and the final carry. Congruence transports each gate through exact child equivalences; an induction gives word equality, not an unproved replacement of a word.

For associativity compare `(u+v)+z` and `u+(v+z)`. There are two carries on either side. At each bit the invariant is that the sums of those carry bits agree. Applying (1.1) twice gives equal total entering mass; equality of its parity gives equal output bits, and equality after removing that output gives equal sums of the two new carries. The two-bit redundant encoding of a carry sum is equivalently fixed by XOR and AND, which is the source's seven-slot invariant. The independent 128-case transition table verifies its exact Boolean form. Both sides start with zero carry sum. Induction proves each low output bit equal for every width; retained carry sums are also equal where needed.

`concatenate` converts a left fold of two operand lists into the sum of their separate folds by this associativity induction. `replace_segment` composes that identity with the supplied segment equality and suffix transport. Its endpoints are the folds of the actual old and new operand lists. `swap_adjacent` is the special case using commutation, surrounded by the same prefix/suffix transport. These constructors never identify differently ordered folds without a proof.

### Common-addend order, including overflow

For low prefixes let A,B be the unshifted words, K the common word, U,V their low sums, and c_A,c_B the carries. The integer identity is

    U - V = A - B - 2^j(c_A-c_B).        (1.2)

Because -2^j < U-V < 2^j, if c_A>c_B then A>B and U<V; the reverse holds if c_A<c_B. If carries agree, the two comparisons agree. The source records the following Boolean disjunction:

- c_A=1,c_B=0, A>B, U<V;
- c_A=0,c_B=1, A<B, U>V;
- c_A=c_B, both oriented comparisons coincide and A>=B or B>=A.

The all-zero-width state satisfies it. At a new bit two full-adder steps and four comparator steps preserve it; this is the nine-slot transition with all 512 cases checked independently. With the final carry as a new high bit, both full-sum comparisons agree with the original comparisons. This proves `addition_preserves_order` for *all* widths without incorrectly dropping an overflow bit.

Comparator totality, congruence and transitivity are proved similarly by one-bit induction. At unequal high bits transitivity follows from the Boolean order; at equal high bits it reduces to the previous comparison. Transitivity's finite transition has three operand bits and the previous comparisons; its source template contains only these fixed slots. Monotonicity of two different addends composes two common-addend instances, commutation, congruence and transitivity. Hence no integer-arithmetic oracle is added to the target calculus.

### Bounds and removal of high bits

A term word aL is between zero and a for either value of its one opaque literal. `term_upper` proves precisely that comparison. If u<=U and v<=V with U+V<2^w, the full-carry order theorem and the constant word U+V show that the sum's carry is false and its low word is <=U+V. `upper_add` returns both facts. Repeating yields `upper_sum`, whose exact bits are the left fold in the row encoder. Lower-bound addition uses the same full sum, then this independently established no-carry fact.

If u<=T<2^h, every bit of u at position at least h is false. `narrow_from_upper` proves this from the comparator's recurrence, descending through those positions whose bound bits are zero; the returned word is the same low h handles followed by literal false. `strip_zero_heads` proves that padding both words with false high bits preserves their comparison. These steps justify narrowing. They do not infer high-bit values merely from an intended numerical range.

`known_bits` reifies only syntactically closed constant arithmetic DAGs used at the call site; by induction on their Boolean gates it proves each bit's actual constant value. The full-adder and comparator recurrence then identifies the requested integer. The source does not call this routine to evaluate an arbitrary state-dependent formula or to solve a propositional tautology.

### Actual threshold versus word comparison

`threshold_correspondence` compares the actual descending greater/equal encoder with G_w against the constant degree word. At each descending stage,

    G_w(sum,degree) iff greater_prefix or
                            (equal_prefix and G_remaining(low,low_degree)).

The two choices of the next degree bit and the current operand bit prove the update; the final empty low comparison is true. The final greater/equal handle is exactly `actual_threshold`, with its specified gate order. Thus the result is an explicit equivalence to the *actual* encoder, not a substitution of a more convenient arithmetic predicate.

## N4. `normalize_sum`: exact record, termination and preservation

Source: `er_ef_normalize_templates_v9/normalize.py:23–103`.

Let w=max(1,bit_length(A)) or an explicitly larger width. The constructor initially records each raw term as its exact w-bit word and builds their left fold. Every subsequent `install` preserves this invariant:

> `current` is the exact fold of the current `operands`; `equality` proves each bit of the immutable original fold equivalent to the corresponding current bit; the items record precisely those operands and their arithmetic meanings.

The first stable bubble sort groups by absolute variable. Each adjacent exchange uses `swap_adjacent`; strict key inversions decrease, and the loop bounds are finite even if no swap is needed.

For one group on v, compute P_v,N_v,K_v. Its one-slot formal plan proves the raw group word equal modulo 2^w to the constant K_v plus the surviving signed term. For slot value zero or one the two integer sums are identical by N1, and the word induction N3 therefore proves all bit equivalences. This is a universal coefficient/width argument. `replace_segment` transports the group result through the whole fold. The cursor advances past the one or two new items; it never treats an inserted constant as another original variable group. Every original group is processed once.

The second sort moves constants to the front without disturbing the order of the surviving distinct canonical variables. The constants' sum is K. Closed arithmetic proves their fold equal to the one constant word K, including the empty-raw-list case, where an explicit zero word is inserted. The remaining operand list is literally `[const(K)] + canonical_term_words`. The numeric normalizer has the same group totals and order. Hence the final correspondence guard succeeds.

Concatenation followed by the equality between the one-element constant fold and const(K) gives:

- `raw_bits`: exact original raw fold;
- `canonical_bits`: exact fold of canonical terms at w;
- `constant_bits`: exact const(K,w);
- `normalized_with_constant_bits`: exact Add_w(const(K),canonical_bits);
- `equations`: exact bit equivalences between the first and fourth lists;
- `row`: numeric normalized row with degree d-K;
- `raw_total`: A, `removed_constant`: K, `width`: w.

K+T<=A<2^w; A=T+2K. No overlarge coefficient is passed to a w-bit term word. Newly appended proofs are closed except for pre-existing caller assumptions explicitly supplied to a helper; this constructor's identities require none. Validity and metadata preservation follow from N2/N3. All loops range over list positions or binary widths. This proves termination and the exact record contract.

## N5. The universal `normalize_predicate` theorem

Source: `predicate.py:51–115`.

**Preconditions.** A valid builder prefix; a finite list of nonnegative raw terms; integer d; an existing state handle for every raw variable, including zero coefficients; and, if present, `expected_row` equal to the numeric normalized row. There is no assumed truth of that row and no assumed independence of state images.

**Postconditions.** Let Raw be literal true if d<=0, literal false if d>A, and otherwise the exact actual-threshold circuit over the raw w-bit fold. Let R=normalize(raw,d) and E=b.row(R,state). The constructor returns exactly R, Raw and E, and an earlier-reference ND proof of `iff(Raw,E)`. The builder's originals, old node/line prefixes and maps are unchanged; new extensions are fresh; no new assumption remains open. Output counts are polynomial as derived in Chapter 4.

**Proof by exhaustive branches.** It first applies N4 and obtains E by the actual row encoder.

1. **Raw constant.** If d<=0 then e=d-K<=0, so E=true. If d>A then e=d-K>A-K=T+K>=T, so E=false. Raw and E are the same handle, including A=0 and any sign of d. Return reflexivity. The unbounded digits of d are read and compared, not expanded into a word.
2. **Nonconstant raw, canonical true.** Now 1<=d<=A and e<=0, hence d<=K. The canonical word is nonnegative. `shift_comparison` at v=0 proves raw>=K iff canonical>=0. Transitivity with the closed constant K>=d yields raw>=d. Transport through the actual-threshold equivalence and a fixed propositional template yields Raw iff true.
3. **Nonconstant raw, canonical false.** Now e>T, hence d>K+T. The independently proved canonical bound and no-carry addition give raw<=K+T. If raw>=d, comparator transitivity would assert the false closed comparison K+T>=d. Its closed negative proof gives contradiction. Transfer to the actual threshold and obtain Raw iff false. This covers a zero canonical total with positive residual degree.
4. **Both nonconstant.** Now 1<=e<=T, so T>0. `shift_comparison` at v=e gives G(raw,d) iff G(canonical,e). The canonical upper proof justifies zero high bits beyond h=max(1,bit_length(T)). The low-bit compatibility lemma shows its low h handles are *literally* the natural-width fold used by b.row(R,state). Comparator congruence, zero-head stripping and the natural-width actual-threshold correspondence give Raw iff E. Every intermediate equivalence is connected by fixed propositional transitivity in the indicated orientation.

### Why `shift_comparison` itself is total here

For any 0<=v<=T, v+K<=T+K<=A<2^w. Apply common-addend order to canonical versus const(v), adding const(K), **with final carries retained**. Commutation identifies its left low sum with the normalization record's const(K)+canonical word. That sum has carry false by `upper_add`; its counterpart const(v)+const(K) has carry false and exact constant bits by closed computation. Raw is equivalent to the first low sum by N4. Comparator congruence transports these two full words; zero-head stripping removes the now-proved false carries. The result's raw side is exactly G(raw,const(K+v)); its canonical side is exactly G(canonical,const(v)). All claimed handles follow from the same ripple recurrence and interning, not equality of interpreted integers alone. ∎

### Explicit guard map

The direct source guards discharge as follows; their names are preserved for reproducibility.

| Guard | Reason it succeeds under the contract |
|---|---|
| `NORMALIZATION_EXPECTED_ROW_MISMATCH` | Expected row is the exact numeric normalizer output by the precondition, not merely an equivalent row. |
| `TRIVIAL_NORMALIZATION_CORRESPONDENCE` | N5 branch 1's degree arithmetic; encoder constant convention. |
| `CANONICAL_RANGE_CORRESPONDENCE` | `upper_sum` and N4 use identical ordered terms and identical width/fold recurrence. |
| `REMOVED_CONSTANT_RANGE_CORRESPONDENCE` | Same const(K), canonical list, ripple add and false starting carry. |
| `SHIFT_BOUND_DOMAIN` | v=0 or v=e with 0<=v<=T. |
| `SHIFT_SUM_CORRESPONDENCE` | N3 commutation uses the same opposite-order add as the normalization record; its retained carry is the `upper_add` carry. |
| `SHIFT_CONSTANT_CORRESPONDENCE` | v+K<2^w; full constant addition is const(v+K,w) followed by false. |
| `SHIFT_COMPARISON_CORRESPONDENCE` | Comparator congruence on the exact two full add outputs. |
| `TRUE_ROW_COMPARISON_CORRESPONDENCE` | Endpoints raw>=K, K>=d, raw>=d use the identical G recurrence. |
| `FALSE_ROW_UPPER_CORRESPONDENCE` | The bound constant is K+T, exactly the degree returned by the range addition. |
| `FALSE_ROW_TRANSITIVITY_CORRESPONDENCE` | Endpoints K+T>=raw and raw>=d have the same middle word. |
| `SHIFT_RAW_BOUND_CORRESPONDENCE` | K+e=d. |
| `CANONICAL_LOW_BIT_CORRESPONDENCE` | N3's syntactic low-prefix induction. |
| `ACTUAL_CANONICAL_ENCODER_CORRESPONDENCE` | Natural-width ordered term fold and descending comparator are exactly b.row, not a semantically substituted circuit. |

The subsidiary term, width, equality-list and state-map guards are the preconditions/outputs of N1–N4. No guard requires an oracle for truth or an input-dependent number of original-variable truth assignments.

## N6. Generalized normalization projection for substitution

`er_ef_red_templates_v12/projection.py:19–85` uses the same threshold proof after a different record constructor. Its necessary record contract is:

- raw total A and width covering A;
- exact raw bits and canonical bits;
- bitwise proof raw = const(K)+canonical;
- K>=0 and K+T<=A;
- degree e=d-K;
- exact natural-width canonical row and state.

The stronger equality A=T+2K is **not needed** in N5, except as an easy way to prove K+T<=A for signed normalization. All four branches use only the displayed inequalities and degree identity. Thus the same proof establishes exact projection for simultaneous substitution, including constants that remove coefficient mass. Chapter 2 proves that the substitution constructor supplies this record. This avoids a circular appeal to `normalize_predicate` on a mismatched raw input.

## N7. What has and has not been checked by execution

The universal result above rests on the recurrences and inductions, with finite truth tables only for fixed Boolean transition lemmas. The new source diagnostics cover zero terms, cancellation, narrow widths, aliases, compound state images and every main branch. They check actual formula identities and formal-slot implications with a lightweight diagnostic builder; they are **not emitted EF proofs**. One tiny normalizer was also fully expanded through the production ND checker. Two further expansions hit the deliberately small diagnostic line budget and remain recorded as resource-limited checks, not false claims or universal evidence. See the reproduction ledger for exact outcomes.


---

## File: 02_ARITHMETIC_RED_AND_SOURCE_COMPOSITION.md

# 2. Arithmetic composition, explicit RUP and complete RED

Throughout, E(R,sigma) means the exact `Builder.row` handle under the current mapping sigma, not merely an equivalent predicate. The builder contract is N2. Each arithmetic constructor returns the exact numeric target row and a proof of its exact E handle from the supplied exact earlier E premises, with no additional open assumptions. Local obligations retain precisely their caller assumptions. All facts about formulas are compiled using Chapter 1's explicit templates and existing ND rules.

## A0. Range and actual-row correspondence at a chosen width

`er_ef_rule_templates_v10/rows.py` constructs the ordered term words of a canonical row at any width covering its total. `row_range` proves their fold lies between zero and the row total. `row_encoding` uses high-bit zero proofs and the actual-threshold/comparator bridge to relate this wide representation to E(R,sigma), whose encoder uses its own natural width. The bit-prefix lemma proves the required low handles identical. Constants follow the exact encoder convention; no artificial zero-width word is used.

When adding lower bounds, a row of nonpositive degree supplies the independently proved lower bound zero. A positive, nonconstant degree supplies its numeric degree via the actual-encoder equivalence. Every resulting effective lower bound lies between zero and the corresponding total.

Two further word lemmas are used repeatedly:

- **Coefficient domination.** For the same ordered signed literals, a_i<=c_i implies sum a_i L_i <= sum c_i L_i. Each term inequality is a one-slot Boolean fact (value zero or its coefficient), compiled at the common adequate width; repeated addition monotonicity gives the aggregate comparison. Canonical signs/order are identical in the constructor calls.
- **Predecessor complement.** For 0<q<2^w, G(word,q) iff not G(q-1,word). At a low prefix where q mod 2^j=0, both local tests (word>=0 and 2^j-1>=word) are true. At every other prefix the q and q-1 tests complement. The source advances this exact invariant one bit at a time. Since q is positive and strictly below 2^w, the final prefix is in the complement case. No enumeration through q is involved.

These prove the executable premise and endpoint contracts of `predecessor.py:16–37`, `order.py`, and the range/scaling helpers used below.

## A1. Addition, including negative degrees and cancellation

Source: `er_ef_composition_v11/rows.py:33–70`.

The numeric result is N(R+S), with concatenated term lists and degree b_R+b_S. If the target is true, return its truth proof. If either source is false, return that false proof or explode into the exact target. In the remaining branch neither source is false and the target is not true. Thus

    0 < b_R+b_S <= A_R+A_S.

Choose width covering A_R+A_S. Set c_R=max(b_R,0) and c_S=max(b_S,0). The exact source proofs and A0 yield lower bounds c_R,c_S. Their sum fits because c_R<=A_R and c_S<=A_S. `add_lower` gives the sum word >=c_R+c_S with no carry. Concatenation gives the equivalent raw ordered fold. The closed inequality c_R+c_S>=b_R+b_S weakens the bound through comparator transitivity. N5 then transports the raw threshold to exactly E(N(R+S),sigma). This includes cases where complement cancellation turns the target false although neither source row alone is false. The resulting proof is then literal false, rather than an omitted branch.

No field of a supplied predecessor proof is copied as an assumption. The returned `row` agrees with numeric addition and the POL checker subsequently checks that exact agreement at the token's recorded intermediate row.

## A2. Positive scaling and binary flattening

Source: `er_ef_rule_templates_v10/scaling.py:18–79`; `shift.py`, `order.py` and A0.

Let f>0. Numeric scaling multiplies each coefficient and the degree by f. Identity f=1 and constant-row cases are handled directly. In the nonconstant branch choose w=bit_length(fA). Write f=sum_{j in J}2^j over its set-bit positions. For each j, the width w-j covers A because 2^j A<=fA<2^w. Shift the word by j places, prove its relationship to the original word bitwise, and transport the source lower bound to 2^j b. Low zero bits are explicit; they are not inferred from a shifted numeric label.

Add the finitely many shifted groups. Their totals sum to fA and the degree lower bounds sum to fb; every partial sum is nonnegative and no greater than fA, so each no-overflow premise is justified. Repeated concatenation/associativity turns these groups into a raw list containing one term 2^j a_i L_i per i and j. Numeric normalization of that list yields exactly fR, because sum_j 2^j a_i=f a_i and no new opposite polarity is introduced. Apply N5 for the exact threshold endpoint.

The number of groups is at most bit_length(f), not f. Flattening creates at most V*bit_length(f) raw terms. The comparator upper-bound variant uses the same shifts and additions with an upper premise. In its calls from division the supplied upper bound lies between zero and the rounded row total, so every range guard succeeds. The legacy helper's f=0 branch is harmless but outside the admitted POL contract.

## A3. Upward-rounded division

Source: `er_ef_rule_templates_v10/rounding.py:15–70`.

For d>0 define a'_i=ceil(a_i/d) and q=ceil(b/d). The target is R'=(a'_i,L_i,q), canonicalized. A source with nonpositive degree remains true; a false source permits explosion; d=1 is identity. Otherwise 1<=b<=A and

    1 <= q <= sum_i a'_i,
    d(q-1) < b <= dq.                    (2.1)

The right inequality follows from the definition of ceiling; the bound q<=sum a'_i follows from b<=sum a_i<=d sum a'_i and integrality. Thus the target is genuinely nonconstant, as its guard requires.

Let A'=sum a'_i and choose width covering dA'. Since a_i<=d a'_i, it also covers A and both row encodings. Assume the exact logical negation of E(R',sigma). A0's predecessor lemma gives sum a'_i L_i<=q-1. Binary scaling of this upper bound gives

    sum_i d a'_i L_i <= d(q-1).

Coefficient domination gives sum_i a_i L_i <= sum_i d a'_i L_i, while the original premise gives sum_i a_i L_i>=b. Together they assert d(q-1)>=b, a false closed comparison by (2.1). The source explicitly constructs these comparator-transitivity steps, proves the negative of that constant comparison, and obtains false. A positive/negative target case split discharges the exact new assumption IDs and proves E(R',sigma).

`scale_row_upper` and `coefficient_domination` use the same lifted coefficients, literal order, state and width, so their `bits` lists are identical. This proves `ROUNDING_WEIGHTED_SUM_CORRESPONDENCE`. The other exact guards compare the same ordered comparator operands and q-word. Nondivisible coefficients are the intended case; no coefficient-divisibility assumption is silently inserted.

## A4. Saturation

Source: `er_ef_rule_templates_v10/saturation.py:58–72` and its one-literal helper.

For b>0 replace a coefficient a>b by b. Split on that literal L. If L=true, the replacement term alone reaches b; all other terms are nonnegative. If L=false, the old and new terms are both zero, and one-slot term equalities transported through the ordered fold identify the sums. Thus the old row implies the capped row. The exact source performs these cases with a fresh assumption-line pair and proves the target encoder in both branches. Cap at most one term per iteration. The numeric target remains canonical, with the same literal order, and the sequence ends after at most V iterations.

A nonpositive degree is already true; the emitted constant-true convention is used. If b>A, no coefficient can exceed b, so the false source is unchanged. The case of a single literal is covered: a>=b>0 simply forces L, and replacing a by b preserves that condition. No implicit multiplicative rule with a Boolean value is used.

## A5. Logical negation to exact PB negation

Source: `er_ef_composition_v11/rows.py:73–122`.

Let R have total A and degree b. If R is false, its negation row is true. If R is true, an assumed logical negation contradicts the independently derived truth line and proves the false negation row. Otherwise 1<=b<=A, and Rbar is the canonical row on complemented literals with degree A-b+1 and total A.

Under not E(R,sigma), the predecessor lemma gives S<=b-1. Temporarily assume not E(Rbar,sigma); it gives Sbar<=A-b. Add these upper bounds to obtain S+Sbar<=A-1. Numeric signed normalization of the concatenated term lists has no remaining literal terms and removed constant exactly A. N4 proves the actual word sum equals const(A), at width covering 2A. Congruence therefore produces the false comparison A-1>=A. Its closed negative gives false. Case discharge proves exactly E(Rbar,sigma), retaining only the caller's not-E(R) assumption.

The use of 2A in the width avoids losing the sum's high bit. The proof has an exact syntactic PB-candidate-negation assumption; it does not replace a PB constraint by the conjunction or disjunction of its individual negated literals.

## A6. All POL and RUP commands

### POL stack induction

`compile_pol` first performs the exact admitted arithmetic validation and obtains the canonical intermediate row at every token. Maintain a stack of pairs (R,p), where p is an earlier proof of E(R,sigma) from the selected original premise proofs and their existing dependencies.

A row reference copies such a pair. A literal operand pushes the canonical row l>=0 and its literal-true encoding proof. Addition, scaling, division and saturation invoke A1–A4. Each output row is compared to the validator's recorded intermediate, and each proof handle to E of that row. Those comparisons succeed by the exact constructor contracts. The numeric validator guarantees stack arities and strictly positive scalars. At the end exactly one pair remains, with the requested final canonical row. This establishes the executable correspondence for every valid token program, not only a semantic simulation of its abstract rule names.

### Explicit RUP-to-POL reconstruction

Source: `er_ef_v1/rup_to_cp.py` and `er_ef_composition_v11/rup.py:12–39`.

The accepted propagation trace contains at most V distinct variable assignments, followed by a conflict. Let a reason row force literal L of coefficient a and have slack sigma>=0 with a>sigma. Eliminate every other term from that row as follows. If a literal M is already false, add its previously proved complement unit `(1-M)>=1` scaled by its coefficient c. Canonical cancellation removes cM and keeps the reduced degree consistent with M=0. For a remaining unassigned or true literal, add the nonnegativity bound `(1-M)>=0` scaled by c; cancellation removes cM and decreases the degree by c, corresponding to its upper bound c. The resulting row is

    a L >= a-sigma.

Because 0<a-sigma<=a, dividing by a gives L>=1 exactly. Literal axioms are used as lower bounds zero, never as units without proof. When a conflict row is reached, eliminate all its terms in the same manner; the result is `0>=-sigma` with -sigma>0. The computation uses only original reason rows and earlier derived units.

The actual elaborator uses the trace's declared premise database, appends exactly the candidate's PB negation at its new local row ID, and emits explicit POL steps checked by the numeric validator. `compile_rup` compiles those steps through the stack induction, obtains literal false, and discharges the assumed not-E(candidate). It returns only a proof of the candidate. Its temporary rows remain local; the global row numbering does not jump over them.

Propagation itself terminates: any nonconflicting productive iteration assigns a previously unassigned variable. The reconstruction has O(V) rows and O(V^2) tokens with the source's per-term elimination convention; conservative counts charging the whole declared premise list are still polynomial. No search through Boolean assignments is used.

## R1. Simultaneous substitution and its exact projected encoder

Source: `er_ef_red_templates_v12/substitution.py:20–111`.

Every witness image is read from the immutable **before** state. For v mapped to signed l, changed[v] is before[|l|] or its named NOT. For a constant it is literal false or true. Swaps and cycles in the witness are therefore well-defined simultaneously; iterating dictionary updates into the newly changed values would be wrong, and is not what the code does.

For each source term aL:

- a constant image contributes either 0 or a;
- a signed image contributes a times the composed signed literal, with double negation eliminated by a one-slot proof, not by assuming two different handles equal.

The source builds bit equivalences for those replacements, then add-congruence composes them through the entire original fold. Stable adjacent swaps move constants to the front while preserving the mapped term order. If C is the sum of true constant contributions, normalizing the remaining mapped terms removes an additional constant K. The final offset is O=C+K. The exact arithmetic identities are

    raw_sum = O + canonical_sum,
    new_degree = old_degree-O,
    O>=0,  O+canonical_total<=old_total.     (2.2)

The final inequality is valid even when many constants are false or witness images alias. N1 proves it termwise. In general it is **not** the signed-only identity old_total=new_total+2O.

The implementation's concatenation, associativity, closed constant collection and N4 proofs give the precise normalization record in N6 with raw bits computed in changed and canonical bits computed in before. N6 then proves

    E(R,changed) iff E(R|omega,before).     (2.3)

For a constant source row, substitution cannot change its truth: a tautology remains tautological and an impossible row remains impossible because all assignments after substitution are still Boolean assignments. Equation (2.2) proves the numeric classification too. The code returns the common constant handle in this branch. Every exact record/endpoint guard in `substitution_equivalence` is now justified by the displayed identities and the identical term/fold construction. No hidden sequential substitution is present.

## R2. Local RED goals and assumption discharge

Let Delta contain rows 1,...,r, each with an existing proof of its exact encoder under before. For a candidate C and a required canonical goal G, `check_goal` checks the supplied local refutation from Delta, not_PB(C) at r+1, and not_PB(G) at r+2. Every later local row has a backward reference and every local command is POL or RUP.

`compile_goal` receives an exact ND assumption not E(C,before). A5 produces the first PB-negation premise. It introduces a fresh yes/no pair for E(G,before), uses A5 for the second PB-negation premise under the no branch, then applies A6 to each supplied local step. The selected contradiction row's encoder is literal false. Explosion and cases return E(G,before), discharging the G pair while retaining the C-negative assumption and only the earlier original-premise dependencies.

The validator's union of explicitly used local literal names is used in a copied namespace. Original variables first encountered there are prepared as their actual x_v atoms *before* the guarded callback; local-only fresh variables are set to false in the copied state. This is a legitimate substitution instance of a universally valid local certificate, not an extra assumption about original variables. No local-only name occurs in G, C or an old global row unless already globally available. Therefore E(G,local_state) is literally E(G,before); extra irrelevant map entries do not change the row's gates.

The complete IR supplies every goal certificate. The theorem does not assume that an automatic search finds missing certificates. The finite local proof is the input whose length is charged.

## R3. General RED without pretending it is ordinary entailment

For one global RED step set s=E(C,before), tau=omega(before), and define for every witness-domain variable

    after[v] = (s and before[v]) or (not s and tau[v]).

All others remain literally before[v]. These are fresh shared Boolean gates over the existing state. Under any original assignment, after equals before if C already holds, and equals its supplied witness image otherwise.

The invariant to maintain is:

> For the current PB database Delta and one common state sigma, the builder contains a closed derivation of E(R,sigma) for every R in Delta, from exactly the initial PB hypotheses and conservative extensions.

For each R in Delta and for C itself, `conditional_revalidate` performs the following construction. Under s, the new state agrees with before; the old proof of R, or the s assumption for C, transports through exact row congruence. Under not s, R2 gives its required canonical witness goal; (2.3) transports it to E(R,tau). The mux branch equations transport this to E(R,after). Cases discharges exactly the s/not-s assumption pair. The same interned selector and mux bodies are reused for every row, and the immutable before dictionary is the same. Hence all returned `state` dictionaries are identical, as `RED_SINGLE_SIMULTANEOUS_STATE` requires.

This proves preservation of the invariant for Delta,C. It does **not** assert Delta entails C in the old variables. For example, Delta=(x1 or x2), C=x1, omega swapping x1 and x2 is a legitimate non-entailed model-transforming step with appropriate local obligations. The review diagnostics exercise that case, including cyclic simultaneous substitution.

### Prefix and callback preservation is proved for the actual callback

The negative callback consists only of `compile_goal`, `substitution_equivalence` and a fixed propositional transport. All preserve old hypotheses, input names, nodes, lines and extension metadata by N2 and A1–R2. Any necessary original-name preparation happened beforehand. They add no global PB rows or reservations. Every new gate has its recorded extension equation and exact index entry. Thus the callback snapshot guards hold; they are not assumed merely because the source checks them.

The `finally` guard detects contamination rather than restoring and pretending it never happened. On valid mathematical calls no such contamination is produced by the proved callback. Output inventories contain references and current records, not recursive copies of the whole predecessor inventory.

### Global induction

At initialization each original PB predicate is expanded to an original-variable-only circuit and listed as an input. A proved definition-expansion equivalence recovers E of the row. This establishes the invariant with sigma[v]=x_v.

For every step, names are prepared as follows: an original v<=D is its actual input atom; a genuinely new global PB variable has no initial constraint and may begin as false. POL and RUP preserve sigma and add their proved row by A6. RED changes sigma for **all** retained rows by R3. Thus the invariant holds after every step.

The final source `UNSAT` row is identically false, independent of sigma, so its exact encoder is literal false. Its ND proof has no open local assumptions. This completes the mathematical/source proof of `er_ef_red_templates_v12/translate.py:17–61`. The old metadata string `global_equivalence=NOT_ESTABLISHED` is historical source text, not a mathematical premise or a newly edited success flag.

The hypotheses at this intermediate stage are still the expanded PB input predicates. Chapter 3 removes that last encoding difference explicitly.


---

## File: 03_ORIGINAL_CNF_AND_CONVENTIONAL_PRESENTATIONS.md

# 3. Both endpoints and the conventional ER/EF connection

## E1. Derive each PB input from its exact original clause occurrence

Sources: `er_ef_cnf_bridge_v14/clauses.py`, `graft.py:13–80`.

`check_cnf` compares every original row with `clause(C_i)` in order. Repeated clause occurrences remain separate entries. The bridge never deduces F from some substituted formula and calls it the original input.

For a clause C, maintain its exact bottom-starting OR fold. If its canonical PB row is true, the predicate has a closed truth proof. If C is empty, its original hypothesis is false and gives the required target directly. Otherwise the contracted PB row is `sum distinct l >= 1`, with no complementary pair. Assume the negation of its encoded predicate. The exact PB negation is `sum distinct not l >= t`, where t is the distinct literal count. Slack propagation forces each not l as a unit. A6 compiles those unit consequences; an explicit one-literal encoder bridge obtains the logical signed facts on the original atoms. Proceed along the **original occurrence list**, including duplicates, proving each OR prefix false from the previous false prefix and the current false literal. At the end the original cl(C) input and its proved negation contradict. Case discharge yields the PB predicate from precisely that occurrence of cl(C).

Expanding the predicate's fresh gate definitions by memoized DAG traversal gives an original-variable-only formula and a proof of equivalence. Its DAG constructor is the same one used by the v12 initial-input expansion. Thus `expanded_predicate == source.inputs[i]` holds as an exact interned handle. It is not just a claim that the two formulas have the same truth table.

The graft copies the entire old formula-node prefix before constructing these bridges. Its gate allocator avoids **all** old atom names, including atoms whose definitions occur only later in the replayed proof. New bridge equations cannot capture an old extension. It then copies each non-input old line, remapping both ordinary reference IDs and the separate `cases` assumption IDs. Each old input line is replaced by its closed derived bridge proof, with the identical formula handle. Induction over replayed lines preserves all rule premises and exact dependency sets. Existing original variables keep their names. The resulting ND proof has hypothesis list exactly cl(F) and concludes false.

The whole old node prefix remains byte-for-byte identical as a list. Introducing new input atoms for literals occurring only in tautological original clauses is safe: these have original IDs within D and could not previously have been a PB fresh variable. The bridge explicitly checks absence of any conflicting old atom role.

## E2. Simultaneous assumption-context deduction, not repeated proof copying

Sources: `er_ef_frege_v13/translate.py:55–192`, `schemata.py`, `checker.py`.

For every ND line i let H_i be its exact set of open *assumption line IDs*. Let Gamma(H) be the sorted-ID left conjunction beginning with true. Identical formulas under different IDs remain different positions in Gamma; there is no formula-equality discharge shortcut.

Stage A constructs a Frege proof of

    Gamma(H_i) -> A_i.                   (3.1)

An original input or conservative extension has H_i empty and is lifted by K under true. An assumption with its singleton ID follows by conjunction projection. For an ordinary ND step, each referenced derivation is weakened to the union H of the reference dependency sets; the appropriate fixed curried axiom is then applied under Gamma(H) using S.

This covers every admitted rule:

| ND rule | Finite-basis realization |
|---|---|
| nullary/connective `local` | The fixed truth-case schema for true, false, NOT, AND, OR or IFF, with the actual signed children. |
| `equivalence` | Positive or negative transport from A iff B and the signed B premise. |
| `contradiction` | A and not A imply false; reverse the two premise roles when necessary. |
| `explosion` | false implies the exact target. |
| `cases` | Curry each branch under Gamma(H) and its own assumption, then apply classical cases. |

For `cases` with positive assumption ID p and negative ID q,

    H=(H_left minus {p}) union (H_right minus {q}).

The ND checker excludes q from the left dependency set and p from the right. Consequently neither p nor q lies in H. Each branch embeds its required context into `Gamma(H) and branch_atom`, composes with its already translated derivation, and curries. `classical-cases` discharges these two implications under the common Gamma(H). This proves (3.1) with the precise remaining IDs. It works even when branch formulas alias other assumptions.

Context projections and embeddings are explicit derivations from `identity`, `and-left`, `and-right`, `and-intro`, `compose`, `K`, `S` and `curry`. No ambient context inclusion is treated as an inference rule. A projection descends through the suffix of the exact conjunction; an embedding conjoins the necessary projected assumptions in the target sorted order, starting with truth. The selected final source line has H empty, so MP with the truth axiom produces its exact false formula.

### Correct cost, including the earlier cold-embedding error

A previously uncomputed projection from a context of at most N assumptions can require O(N) lines. A cold embedding requesting N such projections can therefore cost O(N^2), not O(N). The source caches projections by `(exact ID-context, assumption ID)`. There are at most O(N) current source contexts, each with at most N members, so all first projection computations cost O(N^3). After projections are available, all embedding/conjoining/currying overhead over the N source steps is at most O(N^2). Source formula nodes are preserved and named references are shared. Thus Stage A has O(N^3+M) added line/node records for N ND lines and M source formula nodes. This amortized argument is the one used in Chapter 4; the false local linear-cost sentence is not a premise.

In particular, there is no recurrence L_{j+1}=2L_j for nested case discharges. Each source line is translated once into (3.1), and a later use references that proof.

## E3. From a finite-basis DAG to full occurrence formulas

Sources: `er_ef_cnf_bridge_v14/prefix.py:61–196` and its `check_transport`.

Give every non-atomic source formula node a fresh target name. Original atoms remain unchanged. Source auxiliary atoms are renamed injectively into a separate namespace; original input names and all previously allocated names are excluded. `ensure` traverses the needed as-yet-undefined connective nodes, collects a set and processes it in topological ID order. For each it declares a fresh extension equating its name to its fixed-arity body on already named children. Shared nodes receive only one definition.

**Original hypotheses are the exception to abbreviation at the boundary.** They remain the actual bottom-starting OR folds. `clause_nodes` checks this occurrence-linear syntax, rather than accepting arbitrary exponentially unfolding circuit inputs. `unfold_inputs` proves each named original prefix equivalent to its literal original prefix by one connective congruence and equivalence transitivity, from the leaves upward. The input line itself is exactly cl(C_i), not a named replacement. Each later source-input use follows via that proved equivalence.

For a fixed-schema axiom, substitute named handles for its slots, instantiate the same fixed axiom, and recursively bridge only the finitely many connective positions of that schema. Slots are opaque: their potentially huge circuits are not unfolded. An MP step similarly opens only the fixed implication shape. A source extension first ensures its right-hand body names are defined, introduces the renamed source auxiliary atom equal to that name, then relates this declaration to the named source IFF formula. A source atom not yet defined cannot appear in a valid prior proof line, so freshness and extension order are preserved.

Every target line is then flattened to actual prefix occurrences. All ordinary bridge patterns have fixed size over named atoms. The only longer formulas are original clause prefixes and their proved equivalences, whose length is bounded by the explicit original clause length. No whole RED state, arithmetic circuit or context conjunction is recursively expanded. The final false node is a literal constant, not an auxiliary name for false.

The independent transport checker verifies original inputs, original names, each required extension, mapped line/formula identities, and the selected conclusion. Its scans are charged in Chapter 4. This proves the actual v14 -> v13 Stage A -> v14 route; no claim about v13 Stage B is used.

## F1. The actual forward ER -> compact -> wire -> complete B7 route

Sources: `er_ef_v1/translate_er_to_def.py:17–92`; `def_calculus.py` definitions; `er_ef_wire_v2/translate.py`, `wire.py`, `decode.py`, `automatic.py`.

### Definitions and their complete RED obligations

Let the canonical threshold be U>=b, total coefficient A. If b<=0 or b>A it is a constant, represented by the appropriate unit on fresh y. Otherwise 1<=b<=A. Put t=A-b+1 and define

    D0: U + b(1-y) >= b,
    D1: (A-U) + t y >= t.                (3.2)

For y=0, D0 is automatic and D1 is exactly U<=b-1; for y=1, D1 is automatic and D0 is exactly U>=b. Thus every assignment to the old variables has a unique extension satisfying both rows, with y equal to the threshold value. Binary AND/OR thresholds, repeated/complementary inputs and constants are covered after exact normalization.

The first row has witness y=0, making its candidate goal true. Every earlier row is independent of fresh y and remains unchanged. The second has witness y=1. Its candidate becomes true; all older rows except D0 remain unchanged; D0's substituted goal is G:U>=b. Crucially, the preceding context includes D0. This is not a proof that each row separately is an ordinary consequence without its fresh definition.

The wire encoder emits these RED lines and the decoder constructs all required local obligations. The submitted argument discussed a fixed-point residual identity for the nontrivial second-row goal. A stronger fact closes the actual route earlier:

    not_PB(D1) = U + t(1-y) >= A+1.

For the code's `strong_implies(source,G)`, the initial degree cost is b-(A+1)=-t; deleting the extra term t(1-y) adds t; the U coefficients already agree. The final cost is zero and every prefix cost is nonpositive. **Therefore `automatic.close` always finds this strong syntactic implication in its first scan, unless an earlier contradiction or propagation conflict already closed the goal.** No fixed-point fallback is required for any forward-generated definition obligation.

For unchanged goals the corresponding old row strongly implies itself with zero cost. For true goals the installed PB negation is already a contradiction. Constant definitions are the same trivial pattern. These cover every generated goal, so the complete decoder cannot reach `AUTOMATIC_GOAL_NOT_CLOSED_BY_ADMITTED_CONSTRUCTORS` on the forward-produced fragment.

This is a proof of the unchanged algorithm's behavior, not a substituted abstract closure routine. The new bounded check also exercises the D1 obligation with a **consistent** preceding context, avoiding the vacuity of testing only an already contradictory F.

### Soundness and totality of the strong-implication constructor used above

The syntactic test begins with target_degree-source_degree. For each source coefficient it charges removal of a literal absent from the target, or removal of excess over a target coefficient smaller than the target degree. It succeeds only if this accumulated cost is nonpositive.

The emitted POL program makes exactly those removals by adding scaled complementary literal **zero** bounds. Canonical cancellation reduces the degree by the same amount. Thus its intermediate degree is still at least the target degree. Any extra degree is lowered using the explicit identity `(x>=0)+((1-x)>=0)`, whose canonical row is `0>=-1`, scaled by the necessary slack. A nonconstant target guarantees an available literal when this operation is needed. Saturation at the now exact target degree cannot exceed a desired coefficient: any coefficient above a desired value less than that degree was already trimmed, and coefficients with desired value at least that degree are safely capped. Finally add positive literal zero bounds for missing coefficient mass. The resulting canonical row is exactly the goal. Constant source/target cases close directly.

Adding the goal and its installed PB negation gives a constant contradiction. These are explicit legal POL/RUP steps. No theorem is inferred merely from the word `implies` in the source.

### From gate clauses and ER inferences to RUP

For a normalized binary OR or AND definition, negating any of its usual gate clauses forces the unique incompatible local assignment; (3.2) conflicts. This is direct slack propagation on at most three variables. Aliases and complementary inputs reduce this to the repeated-input or constant gate cases; contradictory negated clauses close immediately. Thus the emitted gate clauses are RUP from the definition rows.

For resolution, a negated resolvent sets every nonpivot literal in the two premise clauses false. Either a premise is already false or they force opposite pivot values. If the resolvent is tautological its negation itself is false. This proves the emitted RUP step even with tautological parents. Weakening is RUP from its source clause; a syntactic tautology is RUP with no premises. Distinct original clause IDs are preserved by the row map.

Compact global rows are serialized in the same order. Wire local certificates and helper rows have their own scope and do not shift subsequent global row addresses. The decoder's global map therefore preserves the compact conclusion row and every later referenced gate clause. It supplies an exact canonical copy of each original pb(F) row. The complete validator checks the supplied local programs; the preceding proofs show they succeed universally for this generated fragment.

### The legacy raw-input discrepancy and its repair

Before the threshold is normalized, the strict grammar must check its **raw** binary inputs against the old namespace. The supplied code did not. A still-undeclared input z survives into a gate clause and is rejected after the definition except when z=y has just been reserved; a surviving y in the threshold is rejected before reservation. With only two unit coefficients, y disappears exactly for inputs (y,-y), producing a constant. These are all additional accepted cases.

For OR, one of its gate clauses is the unit y and the other two are syntactic tautologies. For AND, one is the unit not y and the other two are tautologies. Replacing the step by the corresponding constant extension followed by those tautologies preserves every old clause identifier and every later resolution antecedent. This proves a linear-time presentation translation ER_legacy -> ER_strict. The reverse inclusion is identity. The supplied one-line patch rejects the two legacy cases before normalization and leaves valid strict translations unchanged.

The repair changes the **grammar**, not B7, proof soundness, original hypotheses, or the global polynomial equivalence. Both the original and patched versions are retained.

## B1. An explicit EF_prefix -> ER constructor

New source: `../code/finite_ef_to_er.py`. This construction supplies the presentation connection instead of treating “classical ER/EF equivalence” as an unanalyzed final arrow.

### Encoding formulas by extension literals

First check the actual finite-basis prefix proof and its original ordered hypothesis folds. Map original x_v to literal v. Any free input name not occurring in F is uniformly substituted by false; original F is unaffected, and sound schema/MP/extension steps remain valid under this substitution. Introduced EF names remain distinct and become new ER variables.

Process the formula occurrence DAG topologically with memoization. NOT changes a literal's sign. AND and OR use their standard two-input ER definitions. Constants use constant definitions. IFF(A,B) is represented by the three-gate circuit `(not A or B) and (not B or A)`. Every gate is fresh and uses available literals. A source extension name e iff B is represented by a fresh e defined as `or(lit(B),lit(B))`, then its equivalence formula is proved from these clauses. No source auxiliary may be used before its defining source line.

### Conditional unit-resolution lemma

Let H=(h_1,...,h_r) be a list of temporary signed cut assumptions and delta be the clause of their negations. Suppose ordinary unit propagation from gate clauses and specified earlier premise clauses together with H derives target literal t or a conflict. There is an explicit resolution/weakening/tautology derivation of delta or t **without adding H as hypotheses**.

Represent an assumed unit h_i by the tautology delta or h_i. For each propagated reason clause, resolve away its already false literals using their previously obtained conditional unit clauses. The result is a subset of delta or the new unit; weakening gives the exact conditional unit. At a conflict the same process yields a subset of delta; weaken to delta or t. If the cut assumptions themselves contain complementary literals, delta is tautological and closes directly. Every emitted resolution has a genuine pivot and every weakening is set inclusion. This is an induction on the finite propagation trace.

### Fixed-schema axioms, including aliases

The largest source axiom has four formal slots. Split on the literal representing each slot, at most 16 valuations. For a valuation, gate clauses of the **fixed axiom pattern** propagate all its internal truth values. A slot's possibly enormous circuit is opaque. If slot aliases make the valuation inconsistent, conditional unit resolution derives its tautological/conflicting branch. Constant slot literals have their defining units available. Otherwise the sound Boolean axiom evaluates true and its root unit propagates. The preceding lemma yields delta or the root.

Resolve the two last-slot clauses and work outward. Each resolution removes that split's positive/negative literal; weakening restores the exact remaining delta if aliases contracted a clause. The final result is the axiom root unit. This procedure never enumerates the original variables or the variables hidden in slot formulas.

### Inputs, MP, source extensions and the endpoint

For an original clause fold, temporarily negate its encoded root. Its OR-definition clauses propagate falsity through the fold to every original literal, contradicting that original clause. Conditional unit resolution discharges the negative root and gives its positive unit, from exactly the existing original input row. Repeated literal occurrences are parsed and checked against F before any contraction in ER. An originally empty clause immediately supplies an ER refutation after validating the source proof.

An MP step uses the encoded implication unit and antecedent unit. Negating the target and the fixed OR/NOT implication definitions yields a propagation conflict. Conditional resolution derives the target unit. A source extension's truth follows by at most four two-slot cases from its fresh copy-gate definition and IFF encoding. Finally, the source conclusion is literal false; its represented positive unit resolves with the defining negative unit of the false gate to yield the empty clause.

Inducting over every source line proves the complete exact translation. Freshness, backward references and original hypotheses are checked by a separately written strict ER checker. Its finite test results support the code correspondence but do not replace this induction. The newly included extra-free-name test verifies the conservative substitution boundary, not an additional restriction on conventional EF proofs.

### From signed binary ER to the usual austere ER presentations

OR-only versus AND-only gates differ by complementing the new gate literal and De Morgan duality. Replace each IFF or higher fixed Boolean connective by a constant-size gate circuit. Constants are definable using a literal p occurring in F and its complement. If F contains no variable and is unsatisfiable, F already contains an empty clause, so return it. Original IDs and clause occurrences remain unchanged.

Weakening and tautology can be removed for refutations by the following subclause induction. Maintain, for each non-tautological old clause, a derived subclause using no weakening or tautology axiom. For a weakening reuse the predecessor subclause. In a resolution step, if either available subclause lacks its designated pivot, it is already a subclause of the new resolvent; otherwise resolve the two subclauses. A tautological parent can yield a non-tautological resolvent only when its sole surviving complementary pair is the pivot pair; that resolvent contains the other parent, whose subclause suffices. A final empty clause has no proper subclause. Tautological gate clauses may be retained as harmless definition clauses or omitted by the same analysis. This is polynomial and changes no original hypothesis. Thus ER_strict is a conventional presentation, not a new oracle system.

## B2. Connection to arbitrary fixed conventional Frege bases

A fixed sound complete set of Boolean schemata plus MP and fresh extensions is, by definition, an extended Frege presentation. For a different fixed complete basis on the same Boolean language, take for each of the present 38 schemata a finite derivation in that basis. Conversely, our basis derives each schema/rule of the other fixed system by its implicational completeness, established in Chapter 0. These finitely many fixed derivations are constants of the translation; uniform substitution and line-reference remapping simulate an arbitrary supplied proof.

For a different connective set, first name every compound source node by an extension atom. Each source connective has a fixed Boolean representation in the target complete basis; use that fixed representation on the children's names. Congruence/definition bridges then use only fixed patterns. Do not recursively expand a connective representation through an entire shared circuit. Reconstruct the original hypothesis/conclusion syntax only at the boundary, whose occurrence size is already charged. This proves polynomial supplied-proof translation with finite explicit output formulas.

Primary background: Cook and Reckhow, *The Relative Efficiency of Propositional Proof Systems*, JSL 44(1), 1979, Definition 1.5, Theorem 2.3 and the defining-set construction used for Theorems 4.5–4.6, pp. 38–40, 44–49; author-hosted text `https://www.cs.toronto.edu/~sacook/homepage/cook_reckhow.pdf`. Their Theorem 4.5 is stated in terms of proof-length/line bounds; the fixed-rule and defining-set arguments above state the constructive translation needed here. We do not cite that theorem as a direct proof of the package's B7 rules, its original-CNF graft or an automatically polynomial simulation of every verifier.

## B3. The complete equivalence, without an assumed ER/EF arrow

F1 proves ER -> B7. Chapters 1–2 and E1–E3 prove B7 -> EF_prefix. B1 proves EF_prefix -> ER. These algorithms are independent in the required directions: B1 uses only the target's fixed schema semantics and ER clauses, not B7's asserted strength. Chapter 4 proves all their costs. Composition therefore supplies B7 -> ER and EF_prefix -> B7 as well. B2 identifies EF_prefix with conventional fixed-basis extended Frege. There is no remaining circular appeal to the equivalence being proved.


---

## File: 04_INPUT_BIT_BOUNDS.md

# 4. Input-bit polynomial bounds and complete composition

This chapter supplies explicit recurrences for the algorithms, including their intermediate representation and output occurrences. A large exponent is a consequence of these recurrences, not evidence by itself. All O constants depend only on the fixed programs and schema basis. They are not claimed small or optimal.

## P1. Input size, sparse names and numeric magnitudes

Let S>=2 be the full input bit length defined in Chapter 0. Let V be the number of distinct PB variables appearing anywhere in the supplied global proof or local certificates. Let L be the number of written source rows/tokens/goal records, with every list element counted. Then V,L<=cS for a fixed encoding constant. D may be exponentially large in S; **V is not D**. The algorithms use finite maps/sets of written names. Allocation, binding and freshness do not scan 1,...,D.

For a canonical row define W(R)=1+|b|+sum a. The following bounds follow from the exact numeric operations:

- normalization does not increase 1+|raw_degree|+raw_total;
- addition has W(R+Q)<=W(R)+W(Q);
- scaling by f>=1 has W(fR)<=f W(R);
- positive division and saturation do not increase W;
- simultaneous substitution does not increase W;
- PB negation has W(not R)<=2W(R).

For normalization, subtracting K reduces total by 2K and increases |degree| by at most K. For substitution, true constant mass C and cancellation K reduce total by at least C+2K and increase |degree| by at most C+K. These give the first and fifth bounds, including nonpositive degrees.

Along a path through a supplied POL DAG, every addition contributes at most one doubling to a maximum norm. Each scaling contributes its explicitly written factor. The sum of factor bit lengths along a path is no larger than the sum over all scalar occurrences in the input, O(S); there are O(S) operations. Initial encoded rows have O(S)-bit values. Thus every numeric source/intermediate row has W<=2^{cS}. Sharing a row twice in an addition adds one doubling; it does not multiply its norm by itself. There is no row-times-row scalar rule. Local certificate rows obey the same bound with their explicit tokens included in S. A constant number of local negations only changes c.

RUP reconstruction uses reason coefficients and already derived units. Eliminating V terms introduces coefficients bounded by the reason-row coefficients and total, times at most a polynomial factor in V. Units have coefficient one. It does not repeatedly square the previous elimination's coefficients. Consequently its generated numeric rows and scalars also have O(S)-bit values.

### Auxiliary arithmetic: an explicit call-chain argument

It is insufficient to say “fixed-depth auxiliary arithmetic” without examining the constructors. The following are the actual magnitude-producing calls. Let M bound the source/RUP row mass and the explicit scalar values at the current primitive invocation, and put V<=cS.

| Constructor/call chain | All new numeric masses are bounded by |
|---|---|
| row range/encoding -> constant words | M |
| addition -> concatenation -> signed normalization | 2M, with degree at most 2M in magnitude |
| PB negation -> complementary sum normalization | 2M+1 |
| scale -> set-bit groups -> shifted row folds -> flattened normalization | f*A+|f*b|+O(1) <= O(M^2); every group/prefix is bounded by that full sum |
| rounded division -> lifted coefficients d*ceil(a_i/d) | A+Vd <= (V+1)M |
| rounded division -> predecessor -> scale-upper | d(q-1)<b<=M for the degree; the lifted total is still <=(V+1)M |
| coefficient domination / saturation | no total larger than the displayed dominating/later row |
| witness substitution -> constants -> signed normalization -> projection | original total M; offset plus final total <=M |
| comparator/adder proofs / narrowing / exact constant reification | words, carries and masks at the already selected widths; no new recursively squared coefficient |

The loops in binary scaling range over bit positions, not scalar magnitude. `normalize_predicate` does not invoke scaling or division. `project_normalization` invokes the same range/word routines, not RED. `scale_row_upper` invokes shifts, term/range and addition helpers, not a recursively larger division. Saturation iterates over the original V coefficients. These paths form an acyclic primitive-constructor call hierarchy.

Across consecutive source commands, the returned numeric row is again the independently bounded validator row. The O(M^2) auxiliary envelope is **reset at each primitive invocation**; its exponent is not iterated down the whole source proof. All retained numeric fields therefore have O(S+log(V+1))=O(S) bits. We may take H=c'(S+1) as a uniform bit-width bound for a sufficiently large fixed c'. This explicitly closes the input-only-width obligation.

## P2. Local entry recurrences

An entry means a scalar, name, node, line, term, reference, list element, template node/premise/substitution entry, or bounded-key record field. A list of Q terms costs Q entries, not one record. Earlier proof/formula dependencies are references, not expanded proof trees. Integer/name lengths are charged separately after entry counts.

Let Q be a raw operand count, possibly greater than V because scaling repeats a literal at different bit shifts. N2 gives O(2^r(t+p+r+1)) entries for a t-node/p-premise formal template. The production arities are bounded by nine independently of V, H and S. Generic authoring calls with growing r are excluded, not silently called constant-size.

The following recurrences count repeated `Step.prove` freezes and repeated closed-DAG reification. They are bounds on appended material, not constant-time map lookup assumptions.

1. Let W(H) count a fixed-transition word proof: W(H)<=c(H+1). Each bit appends a fixed formal template of bounded arity and size; there is a fixed final-carry step.
2. A term bound or constant-word bit equivalence can prove H bits by freezing/reifying an O(H)-node plan H times. Thus T(H)<=c(H+1)^2.
3. A Q-term range fold uses Q term bounds and Q word additions, followed by comparisons/narrowing: R(Q,H)<=c(Q+1)(H+1)^2.
4. A segment replacement or adjacent exchange transports through at most Q prefixes/suffixes, with O(H) entries each: C(Q,H)<=c(Q+1)(H+1). If the call additionally rebuilds constant-word proofs, their O(QH^2) charge is accounted in the next row.
5. Signed normalization has at most O(Q^2) exchanges, each with cost C(Q,H). A group of q terms builds an O(qH)-node one-slot plan and freezes it at most H times; summing q over groups is Q. Constant collection has the same O(QH^2) conservative charge. Therefore

       N(Q,H) <= c[(Q+1)^3(H+1) + (Q+1)^2(H+1)
                    + (Q+1)(H+1)^2].                  (4.1)

   Trace records and any copied operand/equality lists are covered by these factors. Projection adds R(Q,H)+O(H^2), hence N plus projection is O((Q+H+1)^4).

For the arithmetic wrappers, set X=V+H+1:

| Wrapper | Derived entry bound |
|---|---:|
| Addition / PB negation | N(2V,H)+O(VH^2) = O(X^4) |
| Positive scaling / scale-upper | O(VH^3)+N(VH,H) = O(V^3H^4+V^2H^3+VH^3) <=O(X^7) |
| Saturation | At most V caps, each O(VH^2): O(V^2H^2+VH^2) |
| Division | A constant number of row/range/order passes plus **one** scale-upper: O(X^8) |
| Substitution / row-mux transport, excluding local certificate | N(V,H)+O(V^2H+VH^2): O(X^4) |

O(X^8) is a common conservative primitive bound, allowing their own returned inventories. No wrapper repeatedly embeds the full proof prefix into an emitted mathematical derivation. Callback snapshots are transient copies and are charged separately as computation.

Closed-expression reification cannot invalidate (4.1): the relevant calls operate on the locally constructed constant sums/comparisons or a constant-only segment. They do not expand the circuit substituted for an arbitrary state slot. A zero/one-slot plan may grow with QH; its full size is explicitly multiplied by every freeze.

## P3. Complete B7 intermediate size

There are O(S) written source POL tokens and local proof steps. One accepted RUP step expands to O(V) unit/conflict rows and O(V^2) POL tokens. Thus O(S^3) primitive invocations cover every global command and supplied local goal certificate, counting all RUP reconstruction. General RED revalidation contributes at most O(S^2) further row transports and O(S^3) map/list entries, even without exploiting that the full goal list itself is charged in S.

With V,H=O(S), P2 gives O(S^8) entries per primitive. Hence the complete intermediate proof and retained constructor inventories contain O(S^11) entries. The source stores each constructor's own current normalization records, helper programs, equations and IDs. `compile_pol` stores its token's row and proof handle, **not** its predecessor's whole constructor tree. `compile_rup` stores the finite elaborated local CP program and that program's token inventories. `compile_red` stores its finitely many local certificates/transports and new proof-ID map; its result does not recursively contain every earlier global result. This fixed nesting and the explicit goal/token count justify adding their sizes rather than an uncontrolled recurrence P_{i+1}=2P_i.

Every original identifier/name has at most O(S) bits. Numeric fields have O(S) bits by P1. Formula/line IDs are bounded by the proved polynomial number of entries, so use O(log S) bits; extension-name collision counters are bounded by the number of occupied written names, not by D. Thus original-to-ND proof **plus retained constructor data** has bit size

       P(S) = O(S^12).                                  (4.2)

The submitted O(S^20) envelope also follows immediately; it is looser, not refuted. The tighter envelope here uses the independently proved linear H bound instead of retaining H=O(S^2).

For original-CNF bridging, at most K<=S original literal occurrences require a unit-RUP bridge. Each is bounded by O(S^2) reconstructed arithmetic tokens and the same O(S^8) primitive envelope. This gives O(S^11) entries or O(S^12) bits, including the occurrence folds and memoized input definition expansion. The latter expands each reachable node once **within a call**; repeated calls are included in this deliberately loose count.

Put G=2+S+P(S)+B_bridge(S)=O(S^12). This parameter bounds actual intermediate bits, not an independent external parameter.

## P4. Deduction and explicit prefix occurrence size

Let N,M be the grafted ND line and formula-node counts. N+M<=O(G). E2's cached-context recurrence gives O(N^3+M)=O(G^3) Stage-A line/node entries. The per-source ID/dependency record lists contribute O(N^2), not a new exponential. Charging a generous O(G) bits per entry gives

       D_A = O(G^4).                                    (4.3)

For naming, there are O(M_A+N_A+K) output lines/nodes: one definition per source connective, bounded-pattern bridges per source line and input-prefix bridges. `ensure` uses a visited/missing set; a shared subgraph is not traversed as an exponentially large occurrence tree. Each ordinary output formula is a fixed pattern over names. A raw original clause prefix has at most O(K+1) occurrences. The axiom-substitution metadata is likewise named rather than an expanded circuit. Thus all serialized occurrences number at most

       O((M_A+N_A+K)(K+1)).

With M_A+N_A=O(G^3), K<=G and O(G) bits per name/reference,

       R_EF = O(G^5) = O(S^60).                         (4.4)

This bounds the actual prefix-serialized formulas and their substitution data, not just node count. Every invocation of the final `flatten` walks material covered by this occurrence count. The source does not call the problematic v13 Stage-B expansion on the composed ND result.

## P5. Generation and checking in a bit model

Output length alone is insufficient. The following loop bounds also charge source checking, snapshots and validations. For an explicit object-size envelope Z, finite dictionaries may be implemented by deterministic linear search; schoolbook integer multiplication/division costs O(Z^2) bit work under the deliberately coarse convention that any stored operand has at most Z bits.

### Intermediate construction

- P2/P3 already count each local bit/operand/plan visit, including repeated freezes and reification. There are at most O(G) appended entries.
- Gate-name searches, exact interning lookups and metadata updates can inspect O(G) written entries per append. Each comparison is on bounded-arity keys or at most G-bit names. A conservative O(G^4) bit bound covers these visits with linear data structures.
- At most O(S^2) RED callbacks snapshot/check the existing prefixes. Each traverses at most O(G) retained entries, with at most an additional O(G) lookup factor and O(G) bits per compared field; O(G^5) safely covers the total because S<=G. Snapshots are not appended recursively to constructor results.
- Numeric source validation/propagation has explicit token, row, term and assignment loops. Each assignment is new and each local certificate is explicitly counted. The corresponding loops are bounded by polynomially many visits already no greater than the generous O(G^3) entry-visit envelope, with O(G^2) arithmetic cost per visit.
- An ND check scans nodes/lines and forms finite variable-support and assumption-ID sets. At most O(G) sets each of size O(G) are needed; even linear membership/union with long IDs fits O(G^4) bit work. Source and whole-pass validations/copies are invoked at most O(G) times in this coarse envelope.

Together O(G^6) bounds the first phase with margin for serialization, hashing and transient set storage. This count does not assume randomized hash-table O(1) behavior or constant-time arbitrary integers.

### Stage A and naming

Let Z'=2+D_A+R_EF=O(G^5). The cached projection construction has the explicit O(N^3) count from E2; each generated record is included in D_A. A later embedding scans at most N context members and reuses projections, so the total number of remaining visits is at most O((Z')^2). Naming allocates once per source connective. Its recursive axiom bridges follow a fixed schema, not the substituted DAG. Original clause unfolding is occurrence-bounded. The transport checker may scan the target extension lines for each source extension; this is a quadratic cross-scan in the explicit records, still at most O((Z')^2) visits. Interning, parsing and flattening are bounded by the explicit input/output bits.

The finite-basis checker only pattern-matches one fixed schema, checks MP or freshness, and forms finite support sets. It does not search for a substitution or ask a SAT solver. As above, linear set implementations, repeated checks, long IDs, copying and exact integer work are covered by O((Z')^6).

Therefore

       Time_BE + Check_EF
          <= O(G^6 + (D_A+R_EF+2)^6)
          = O(G^30) = O(S^360).                         (4.5)

This is a recurrence composition. The old S^300 claim has not been established or refuted here. The submitted S^600 alternative is also implied by (4.5). Neither exponent is a practical performance claim.

## P6. Forward ER-to-complete-B7 cost

Let U be the full ER input bits. There are O(U) original literal occurrences, inference records and names. Binary gate translation adds a fixed number of global rows; resolution and weakening each add one. Compact/wire global row count is O(U). Original row lengths may be O(U); binary threshold rows have only a fixed number of literals.

Every generated RED has at most O(U) old-row obligations, for at most O(U^2) goals total. F1 proves that each `automatic.close` ends before its fixed-point fallback: an existing contradiction, a propagation conflict, or the first strong-implication scan closes it. The propagation-conflict case emits one RUP with O(U) premise references. The strong-implication case emits O(U) tokens and a fixed number of rows of at most O(U) terms. All such helper rows are local to that goal; the next goal does not inherit a recursive copy of them.

A goal certificate therefore has O(U) entries up to constant multiple fields; charging the deliberately maximal O(U) bits per variable/reference/degree gives O(U^2) bits. There are O(U^2) goals, so

       R_B7 = O(U^4).

Wire records, global/local ID maps and decoder validation summaries fit the same conservative envelope. A propagation scan loops over at most O(U) assignments and O(U) rows/terms per iteration; a slower implementation scanning every term of every row still has a fixed polynomial bound. The strong-implication construction has only term loops. Using Z=2+U+R_B7 and the explicit validation/scan/copy bound O(Z^6) gives O(U^24) generation/checking. No numeric-magnitude search or arbitrary RED-goal proof search is present.

## P7. New EF-to-ER presentation compiler

Let L be the explicit EF prefix input bits. Parsing occurrences and interning gives O(L) nodes and lines. Each named connective requires at most three ER primitive gates; each source fresh extension adds a copy gate. Variable IDs are at most D+O(L) after preallocation and have O(L) bits because the original D spelling is charged.

A fixed axiom has at most four slots and a fixed number of connective gates. At most 16 branches are explored, each with a fixed-size pattern-local unit-propagation proof; opaque slot circuits are not traversed. MP and extension bridges likewise have bounded cut/pattern size. Aliases cannot increase the number of formal branches. The only nonconstant pattern is an original clause fold, whose total length is already in L. Its conditional unit-resolution proof uses O(q) propagated prefix/literal facts and O(q^2) conservative clause occurrences for a q-literal input.

Thus O(L^2) emitted clause occurrences/records suffice, and O(L) bits per identifier/name gives O(L^3) output bits. The code scans only the explicitly selected pattern gate clauses for fixed-schema steps. Its input-clause scans, formal case trees and original-node memoization terminate by their displayed finite bounds. Independent source/target validation, set operations and serialization fit the generic sixth-power envelope in input plus output bits, yielding the conservative O(L^18) bit-work bound. A direct tighter analysis is possible but unnecessary.

After composition, for example B7 -> EF -> ER has output O(S^180) and a conservative construction/checking bound O(S^1080). These enormous exponents are only loose universal envelopes. All directions are uniform polynomial supplied-proof translations; none implies efficient proof discovery.

## P8. Invalid inputs and concrete machines

Before a constructor runs, validate the finite schemas, literal types, references, scopes and numeric rows. A malformed token program's arithmetic still obeys P1 until rejection because it has only the allowed scalar operations; an unsupported token/type is rejected before applying a rule. Type/key exceptions can be mapped to REJECT in the mathematical algorithm. RUP propagation either assigns a new variable, conflicts or stops. Explicit complete RED local certificates are validated separately. Arbitrary executable callbacks and arbitrary-arity author-supplied templates are not source-proof inputs.

These bounds are for exact-integer algorithms with extensible finite storage. Python recursion limits, default decimal-digit conversion limits, RAM/disk limits and a bounded native verifier are not universal mathematical guarantees. Replacing recursion by explicit stacks or configuring a suitable machine preserves the described algorithmic semantics but needs separate concrete implementation assurance. We have not restarted the stopped workload to try to infer any such assurance from a large example.

## Conclusion of the cost audit

The normalizer contract, primitive arithmetic, RED state transformation and exact conventional endpoint compose with proved input-only bounds. The usual p-simulation claim is therefore closed at the written mathematical level for the precisely stated complete IR. Separate native fidelity, universal formalization and fixed-host execution remain outside that theorem. The earlier local cold-context linearity claim is false; the corrected amortized recurrence, not a guessed exponent, is what establishes the relevant global polynomial bound.


---

## File: 05_PRESENTATION_AND_ASSURANCE_APPENDIX.md

# 5. Presentation and assurance appendix

## 5.1 Refutational soundness and completeness

The theorem concerns refutation systems for the same finite CNFs, with the explicit pb/cl bridges stated in Chapter 0. EF_prefix is sound: every fixed schema is a Boolean tautology, MP preserves truth, and each fresh extension has a unique Boolean extension of every prior satisfying assignment. The final literal false therefore excludes a satisfying assignment of the original hypotheses. Chapter 2's state induction separately proves B7 soundness; it does not need to infer soundness from finite executions or a native verifier.

For completeness, every unsatisfiable finite CNF has a resolution refutation with weakening. Let v_1,...,v_t be the variables actually occurring in F. Each of the 2^t assignments falsifies some original clause. Weaken that clause to the full clause blocking the assignment. Pair the blocking clauses differing only in v_t, resolve on v_t, and repeat upwards until the empty clause is reached. All clauses and inference references are finite and have the specified syntax. The construction may be exponential in t; it establishes completeness, not efficient proof discovery. It is available inside ER_strict. The proved ER-to-B7 and B7-to-EF transformations therefore also establish completeness of those presentations. Invalid encodings can be rejected in polynomial time, or mapped to a fixed trivial refutation when a total Cook–Reckhow function convention is desired.

The new EF-to-ER constructor is a *refutation* translation. It is not a claim that ordinary resolution can simulate Frege without extension, or that implication assertions are automatically resolution clauses. Each compound formula is encoded by conservative gate clauses, and each inference's encoded unit has an explicit derived justification.

## 5.2 Exact finite basis

The complete basis is fixed by `er_ef_frege_v13/schemata.py`, whose source hash appears in SOURCE_ANCHORS.md. The following rendering is only for reading; the executable tuple syntax and its 38 Boolean checks are retained separately in `analysis/FIXED_BASIS_RENDERED.json`.

- K, S, identity, composition;
- conjunction introduction and its two projections;
- currying and classical cases;
- contradiction and explosion;
- positive/negative equivalence transport;
- truth;
- reflexivity, symmetry and transitivity of equivalence, plus its other elimination direction;
- congruence for NOT, AND, OR and IFF;
- every local truth case for true, false, NOT, AND, OR and IFF.

There are 22 structural/congruence schemata and 16 local schemata, 38 in total. Maximum formal slot arity is four. Every tuple is rendered, its slots listed, and its Boolean implication checked in the retained basis record. These fixed truth checks are a complete proof of the corresponding finite schematic tautologies; they do not prove normalizer correctness across widths without the separate induction.

## 5.3 Conservative first-class status distinctions

1. **Written mathematical theorem:** the proof in Chapters 0–4 supplies all quantified invariants and recurrences for the stated complete B7, signed ER and EF_prefix systems. It is an AI-authored mathematical/source proof subject to further scrutiny, not a proof-assistant judgment.
2. **Code repairs and new implementation:** the strict raw-input namespace check and the explicit EF_prefix-to-ER bridge are supplied with their source hashes, finite checks and universal arguments. They have not been silently patched into the frozen input tree or deployed in a live repository.
3. **Diagnostic execution:** small examples exercise exact handle identities, arithmetic, scopes and final formats. ProbeBuilder records are expressly not EF proofs. Two production expansions stopped at the diagnostic line limit and remain UNKNOWN.
4. **Machine formalization:** no universal translation theorem has been compiled or kernel checked here. Earlier OP-01 graph theorems and core POL lemmas do not automatically establish the present translator theorem.
5. **Native implementation:** no assertion is made that every proof accepted by the installed native parser/checker faithfully elaborates into the complete IR. Its arbitrary RED elaboration, arithmetic variants and fixed-width behavior remain a separate boundary.
6. **Stopped historical execution:** no complete acceptance of the stopped giant case is inferred, and nothing in this review authorizes restarting it, transfers, monitors or paid work.

The mathematical result is not weakened to a tested finite subclass. Its scope is the exact complete IR specified by the assignment, including general witnessed RED and supplied local certificates. The exclusions above concern different propositions, not missing premises of that mathematical equivalence.

## 5.4 Independent final self-review in this return

The following potential failure points were explicitly revisited after the first proof draft:

- The source's clause encoder contracts repeated *signed literals* before normalization, whereas its final clause hypotheses retain occurrences. Chapter E1 preserves that difference.
- General RED does not imply its candidate in the old state. R3 proves every retained row in a single new mux state, including original rows, and R1 reads witness images from the immutable old state.
- A local-only fresh variable may be assigned false because the checked local proof is valid for every Boolean assignment; original variables remain original atoms. No fresh local assumption becomes a new original hypothesis.
- `normalize_sum` can insert one zero-constant item per group. The item count remains at most twice the raw count plus one, and the cursor skips inserted items. N4 and the polynomial count include them.
- `expand_definitions` uses an explicit memoized DAG traversal, not tree substitution. The later occurrence serializer names these nodes; no whole expanded PB predicate is copied as a final input.
- The graft reserves all old atom names before adding its own gates, including unused future extension names. It re-proves the exact expanded input formulas, then remaps assumption IDs as well as ordinary refs.
- The template compiler keys proofs by formal node IDs; aliased/complementary substitutions cannot merge assumption IDs.
- The forward definition's second obligation has a directly strong-implying negated-candidate row. The fixed-point fallback need not be assumed complete and is unreachable on that fragment unless an earlier safe closure has already returned.
- New EF-to-ER splitting is over fixed schema slots, not their original-variable supports. Free names outside F are conservatively fixed to false; auxiliary source names are still introduced fresh and in source order.
- Binary arithmetic magnitude resets to an input-bounded numerical row at each primitive source operation. Auxiliary multiplication does not recursively square the previous auxiliary magnitude across the proof.
- Stage A caches context projections and translates each source line once. Its cold embedding cost is quadratic, while the global first-projection total is cubic.
- The sixth-power checking envelopes in P5 are applied only after the explicit output/visit recurrences. They are not an appeal that every polynomial-time verifier has a feasible EF simulation.

No further mathematical/source counterexample was found in this pass. This is not a warranty against an undiscovered mistake; independent verification of the universal arguments is the appropriate next assurance step, not a larger experimental instance.
