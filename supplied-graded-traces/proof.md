# Capacity descent and polynomial construction from a supplied graded counting trace

The input includes the source, trace, CNF and provenance. For the stated schedule and provenance language, the output length and constructor bit time are polynomial in their combined byte length. The abstract capacity argument, the written cost proof and native checks on finite examples have different assurance. Source: v72, §6.11 and Supplement S72. See also the [conditional all-input theorem](../conditional-ef/proof.md).

## Result and assurance contract

M1 is closed at its declared supplied-trace implementation scope. The 2 November 2026 separate-context, same-model review returned PASS on the original-L cost composition after checking all 62 pinned constructor source files against the integration originals. The cost proof is a reviewed paper/source argument, not a Lean implementation-refinement theorem. Native acceptance remains finite execution evidence; the abstract finite-domain descent theorem has its own retained Lean record. The earlier closeout and self-review reports retain their historical open or provisional statuses; the later review supersedes only the cost-gate disposition.

Let L denote the exact original source, trace, CNF and provenance bytes, and N = L + 2 in the resource argument below. This N is a local size abbreviation, not the original Boolean-variable count used by the separate all-input EF theorem in S64. The fixed admitted, supported constructor schedule has polynomial output-size and construction-bit-time bounds in L. The theorem does not assert native acceptance of every admitted trace, a checker-runtime bound or an automatic short-trace constructor. Local refusal guards and unsupported outcomes remain part of the interface.

## Executable interface and retained measurements

Admission checks the specified graded trace, dimensions, complete local fibres, tuples and corrections, coefficient vectors, recovered values and source implications. Provenance uses the restricted canonical GF(2) clause-falsifier language, not arbitrary implication proofs. The executable route builds exact rational and modular words, proves the required identities, attaches them to symbolic splitting, singleton and root bindings, and emits native structural reflection and a contradiction bound to the original CNF. The fixed two-variable fixtures also use enumerated assignments as integration controls; that control is not the production symbolic proof-construction procedure.

## Abstract capacity descent theorem and proof

Let depth and T be natural numbers, and let r(p) and cap(p) be natural-valued functions of Boolean prefixes. Assume, for every prefix p shorter than depth, exact modular splitting r(p) = (r(p0) + r(p1)) mod T, additive capacity cap(p) = cap(p0) + cap(p1), and cap(p) < T. At each prefix of length depth assume r(p) ≤ cap(p). Then r(p) ≤ cap(p) at every prefix of length at most depth. In particular cap(empty) < r(empty) is impossible.

Proof. Induct on the remaining depth. At a leaf the result is the leaf hypothesis. At an internal prefix both child values are bounded by their capacities by induction. Their sum is at most cap(p), which is strictly below T, so modular reduction leaves that sum unchanged. Exact splitting therefore gives r(p) ≤ cap(p). Equivalently, whenever the parent violates capacity, at least one child must violate capacity: if both children were bounded, the same calculation contradicts the parent violation. This is the violating_child lemma used to justify a selected symbolic descent; the induction proves bounded_tree and root_contradiction.

For an arbitrary symbolic source assignment x, apply the argument pointwise to r(x,p) and cap(x,p). If source satisfaction implies a root violation, no such assignment satisfies the source. L4.symbolic_zero_reflection states this consequence without an assignment-enumeration premise. L4.positive_nonvacuity supplies a depth-one example with positive root count 2 and modulus 8 satisfying the noncontradictory splitting, capacity, range and leaf premises. The abstract theorem assumes those identities; concrete native proofs establish the identities for the accepted executions. The retained CapacityDescent.lean source and prior final log have no claimed correspondence theorem for the entire Python implementation.

## Reviewed original-input width and count proof

The following resource derivation reproduces the reviewed WIDTH_AND_COUNT_PROOF.md body, with section labels mapped into this supplement. The source file predates its independent review and therefore retains the historical self-review qualification in its original conclusion. The later PASS recorded in S72.1 supersedes that review-status sentence only. Its proof premises and excluded claims are unchanged. Constants depend on the fixed implementation, not on the supplied instance; conservative exponents are not practical predictions.

## Separating the three layers

The constructor has three layers whose bounds must not be circular:

1. Rational arithmetic values: coefficient/jet arrays, masked group values, ordered products, source-factor powers, modular quotients and recovered values.
2. Lowering these values into named Boolean bits, and proving identities using those bits. Arithmetic words are materialized from layer-1 expressions; bit-mask loops create named conjunctions, not recursively larger arithmetic values.
3. Exact elimination and native row combinations. LinearDeriver works over the accumulated integer word definitions. Its elimination coefficients are used as proof multipliers, not fed back as coefficients of a newly materialized arithmetic word.

The last assertion is important and source-specific: full_endpoint.derive uses its returned equalities in Kernel.combine; the final LinearDeriver attachment in Descent.finish is used in the modular singleton equality and descent rows. Neither calls materialize on a combination containing elimination coefficients. LinearDeriver.__init__ adds integer gate equalities but no arithmetic-word construction. Thus the potentially larger layer-3 coefficient bound is not an input to layer 1.

## Counting the arithmetic skeleton before bit lowering

An arithmetic-skeleton operation is a constant, addition, scalar multiplication, product, mask, or rational materialization, before iterating over its Boolean bits. Array convolutions count every scalar product. Reusing a cached operation can only reduce this count.

Every ordinary list is written in the input and has at most N entries. Constructed coefficient arrays have at most N^2 cells. Recorded correction supports/instances have at most N entries individually. Scalar convolutions inspect at most N^4 pairs when both retained indices are present. Source factors use sequential products of written monomials and sequential powers through ell; they do not recursively expand a source polynomial in x.

The following deliberately multiplied envelope covers the whole fixed call schedule, including loops that are actually sequential or belong to disjoint phases:

| Iteration families | Overcount |
|---|---:|
| Selected level, point, record, tuple, group, member | N^6 |
| Equation, source monomial, literal, lift grade, integer-value case | N^5 |
| Two-index coefficient-pair iteration | N^4 |
| Recorded E/U/support-pair/instance iteration | N^4 |
| Point/Taylor/grade attachment targets | N^3 |
| Constant overhead and remaining array/record traversal | O(N^2) |

Their product gives A=O(N^24) arithmetic-skeleton operations and bounds the arithmetic-word dependency depth by A. This is an upper envelope, not a measured count or a claim that all these loops are nested.

Source justification: PrefixCounts.count/relation supplies the first family; Guarded.factor, source_grades, SourcePolynomial.factor, ModularEndpoint.factor/build supply the second; their times/mul methods supply the coefficient iterations; Supports and Tuples supply recorded-support iterations; full_endpoint supplies the attachment targets. Arithmetic-template loops over bit vectors/linear forms and Gaussian elimination are excluded here and charged below.

The only variable-depth enumeration in the selector layer is over explicitly admitted local members or explicitly complete tuple records. A trie has at most its depth times its number of leaves, and completeness is checked before construction. Its leaves are therefore charged to written members/tuples, not to an unrecorded 2^n assignment space. Local PB case analysis has at most three inputs. The n=0 branch emits the already source-bound direct contradiction and does not enter this schedule.

## Ground arithmetic and denominator pool

Written integer/rational bit lengths are O(N). Ground binomial and sample-power entries have O(N log N) bits. The canonical lift is a finite sequence of polynomial coefficient additions/multiplications with degree O(ell); its coefficients have polynomial bit length (the sequential coefficient redistribution adds at most O(ell^2) bits to the initial binomial bounds).

The Hermite matrix has at most N rows and N^2 columns. Row-clearing plus the determinant argument in the retained PRIOR_PARTIAL_PROOF.md (supporting lemmas in S72.5) bounds its rational coefficients polynomially in N. There are at most N^2 output weights. Products/lcms of the written denominators, those weights, point-alignment denominators and explicit grade powers have polynomial bit length. Ground integer-value cases use i<=N and sequential powers of degree O(ell), also polynomial bit length.

A convenient common overbound is B0=O(N^10) for the bit length of the product of the relevant ground numerators/denominators and alignment constants. This pool excludes elimination coefficients: they belong to layer 3. Powers generated from a ground pool element are tracked by multiplicity, not incorrectly added to the pool as unit-cost constants.

## Multiplicative weight, including proof-only values

Assign independent selector bits magnitude at most one and denominator one. A ground arithmetic leaf has weight one; a sum takes the maximum child weight; a product adds child weights; masks preserve weight. Ground scaling is charged as multiplication by its scalar leaf. This weight concerns the arithmetic expression, not the degree of its Boolean expansion.

For a written source equation, a monomial has at most N leaves, and summing monomials takes the maximum weight. The sole squaring-like step is p(p-1). The lift uses power <- power*h, not power <- power*power, for at most ell iterations. A factor consequently has O(N^2) weight. The ordered product of at most N factors has O(N^3) weight.

Prefix products multiply at most N written group sums and then take linear recovery combinations. Taylor/coefficient and correction-support convolutions partition/recombine the same parent products. They do not multiply two whole historical proofs. Their arithmetic products carry the sum of the two parent weights. Dividing off recorded powers of two in the modular quotient construction does not increase weight; its recurrence combines the prior partial product with the next factor, never squares that prior partial product.

Proof-only words must also be covered:

- Kernel.congruence creates the two corresponding parent products; the equality lifts themselves do not materialize their row multipliers.
- Kernel.distribute creates products of the supplied summands and their sum. In the pinned callers these summands are coefficient/grade/support pieces of the same two operands, or their modular Boolean/quotient decomposition. Each such product has at most the corresponding parent weight, with the explicit ground scalars charged.
- Words.masked_product and mux_product introduce masked copies and products with the same common factor. Their local commutativity bridges create conjunction gates, not a new recursively squared rational word.
- Guarded.mul carries the same product on its word and ground-value sides.
- The root binding constructs corresponding ground products through the same ordered groups.
- Hermite recovery, correction cancellation and final attachment targets are linear combinations. Elimination witnesses are never materialized as arithmetic words.

These observations give the uniform overbound d=O(N^4) on multiplication weight, and on the exponent with which any ground-pool denominator is used along an arithmetic value. Mask/selection gates do not reset or hide an existing denominator. In particular, a polynomial DAG-size argument alone would be insufficient; this source-specific sequential-product invariant excludes repeated squaring of an accumulated value.

## Width induction

Use the exact syntactic-norm lemma from the retained PRIOR_PARTIAL_PROOF.md (supporting lemmas in S72.5): materializing integral E produces a signed-offset word with norm at most 3||E||_1. Its width is at most the bit length of the independent-bit span; cancellation on satisfying assignments is not used. A complemented mask costs a factor at most 6, a product at most 3 times the product of input normalized norms, and a weighted sum at most 3 times the sum of the weighted input norms.

Let h<=A and let f be the maximum rational-summation fan-in; the written arrays and their pair iterations give f=O(N^4). The resulting induction bounds normalized log magnitude by

    O(d [B0+h(log(f+2)+3)]).

Denominator exponents add at products and take the maximum at lcm-based sums. Their bit length is at most O(d B0). Unreduced product denominators are included in this rule. Thus both numerator/offset sizes and denominator sizes are bounded by the explicit polynomial

    W = O(N^4 [N^10+N^24 log N]) = O(N^30).

W bounds all layer-1 words, not merely those visited by the local support/Taylor guards. The bit-level residual loop inside materialize does not cause a circular depth term: it introduces bits and subtracts their weights from the same bounded linear form; it does not recursively materialize a larger arithmetic argument for each bit. The same distinction holds for the quotient/remainder bit loop, whose number of steps is bounded by the input range bit length. Capacities 2^n have n+1 bits.

## Bit lowering, attachment inputs and constructor counts

A named arithmetic word has O(W+1) bit occurrences. A scalar convolution/recovery sum has polynomially many such operands, and a local product has O((W+1)^2) bit pairs. Complements and the fixed-depth mask commutativity bridges add at most polynomially many entries. An intentionally loose envelope for the linear-form support passed to these templates is

    S = O(N^8 (W+1)^4).

This applies to proof-only template inputs as well as output words: intermediate combinations range over the same written coefficient/support lists, and the product/commutation templates operate on individual bounded words and linear rows. They do not recursively substitute every prior word definition. Elimination is handled separately and may use all columns.

The primitive bit layer consists of materialization, AND definitions, bounded-arity cases, linear lifts, weighted combinations, and the fixed compositions in masked_product/mux_product. Their loops range over form entries, bits, or pairs of these; constant-depth compositions are bounded by O((S+W+1)^6) commands/variables per arithmetic-skeleton operation. This envelope also charges dictionary/form copies rather than treating them as pointer operations.

Set

    G = O((A+1)(S+W+1)^6).

G bounds the pre-elimination gate/word-definition/row population. An attachment database has H,v=O(G+A+1) entries/columns, with integer input-entry bit length O(W+log(G+2)); its target combines bounded source/recovered words. There are at most O(A+1) databases/queries. Building an attachment can add simple integer gate equalities, but does not introduce new arithmetic words or feed its rational coefficients into the width recurrence.

The exact-elimination result from the retained PRIOR_PARTIAL_PROOF.md (supporting lemmas in S72.5) now gives, conservatively,

    C = O((G+A+1)^3 (W+log(G+2)+1))

bits for stored elimination and witness coefficients. Exact rational elimination and its provenance vectors have polynomial bit-time and space in these explicit parameters. The witness vector has at most H coordinates; it is not a recursively inlined proof tree.

An envelope for total native command count after attachments and descent is

    P = O((A+1)(G+W+1)^4).

All A,W,S,G,C,P are polynomials in original N. Their constants are implementation-specific. No tight numerical exponent or performance interpretation is assigned to these conservative envelopes.

## Proof coefficient growth, including zero equalities

Proof row coefficients need a separate bound from arithmetic words. LinearDeriver's output is emitted by combining at most H integer definitions. Clearing its witness denominators requires at most O(HC) bits. PB.pol writes label references and integer multipliers; it does not paste the referenced derivations.

Outside elimination, equality expressions are sums and scalar/word lifts of those bounded forms. Their scalar inputs have bit length bounded by C+W+B0, and their straight-line dependence depth and number of source scalar factors are bounded by P. Exact Fraction reduction and lcm/divisibility operations are charged in bits. A conservative polynomial envelope R for their reduced expression coefficients is

    R = O((P+1)^2 (G+1)(C+W+B0+1)).

Kernel.combine's gcd normalization resets a NONZERO equality to primitive integer content, whose scale is bounded by the expression's reduced coefficients and column count. A zero equality has no such reset: common=0. It must retain its propagated scale. This is covered by tracking prime valuations: lcm takes coordinatewise maxima, and multiplication/division by an existing ground scalar adds/subtracts its valuations. Along a P-step path valuations accumulate at most P times the bounded contribution; the union of factors across P nodes adds another polynomial factor. No fresh coefficient of unbounded height is introduced by zero normalization.

An envelope covering scales, integer multipliers, divisors, row offsets and transient exact arithmetic is therefore

    Bp = O((P+1)^2 (G+1)(R+C+W+B0+1)).

This is deliberately larger than the elimination-only bound. It does not assume every equality is nonzero or that a gcd always reduces its scale. These larger proof multipliers stay in layer 3, so they do not enlarge W or invalidate the gate/command counts.

## Copies, serialization and bit time

A native line has at most O(G+A+1) literal/reference occurrences, coefficient spelling O(Bp+1), and identifier spelling O(log(P+G+A+2)). Consequently the complete log length is bounded by

    Z = O(P(G+A+1)(Bp+log(P+G+A+2)+1)).

This counts signs, scopes, repeated references, names and decimal digits. Arithmetic templates copy finite forms and emit their own lines; these occurrences are already charged in P and the form-size factors. The driver makes a constant number of complete structural/reflection/final strings. That costs O(Z) per copy, not a proof-tree expansion at each source variable.

Exact addition/multiplication/division, reduced rational arithmetic, sorting and decimal conversion all have polynomial bit cost in the displayed bounds. For example, charging a cubic bit bound per exact arithmetic operation and an additional polynomial form-copy factor gives a conservative constructor-time envelope

    O((A+P+1)^3 (G+W+1)^8 (Bp+1)^4),

plus bounded admission/input reading and O(Z) output writing, already dominated after enlarging the fixed constant. This includes attachment elimination; it is not a native-checker runtime bound. Cache reuse is a different path and is not used to establish this fresh-constructor bound.

## M1 consequence and limitations

The earlier gap was the substitution of original L into the width/count parameters. Sections S72.4.2–S72.4.6 supply that substitution for the pinned source schedule; Sections S72.4.7–S72.4.8 include proof-only scales, copies and serialization. Together with the preserved fixed acceptance evidence and finite-domain Lean theorem, this discharges the original M1 cost-ledger gate at paper/source-audit level.

M1 may be marked CLOSED at its declared supplied-trace, finite-acceptance implementation scope. This does not establish universal native acceptance of every admitted trace, a Lean theorem about the Python emitter, a native-checker runtime theorem, automatic trace construction, practical SAT performance, or a formally verified resource proof. The subsequent separate-context review accepts this paper/source resource argument, as recorded in S72.1. The local refusal guards remain unchanged. The prior failed/incomplete cost arguments remain preserved and are superseded only on the original-L accounting conclusion.

## Supporting syntactic-width and elimination lemmas

These retained derivations supply the local bounds used in S72.4. Their historical conditional limitations are discharged only where the later composition supplies the required original-L bounds.

## Word widths: an explicit majorant

For an integral linear form E=c+sum a_i z_i, define S(E)=|c|+sum |a_i|. Its independent-bit interval has span U=sum |a_i| and lower endpoint c+sum min(0,a_i). In Words.materialize:

* the ordinary branch uses at most bitlength(U) bits, with total binary weight less than 2U when U>0;
* the absolute signed offset is at most S(E);
* therefore the resulting word V satisfies S(V)<=3 S(E);
* the single-variable branch satisfies the stronger bound S(V)<=2 S(E), and the constant case satisfies S(V)=S(E).

Repeated occurrences of the same bit in the single-variable representation do not change this argument: their positive weights sum to |a_i|. Cache hits reuse such a representation and cannot enlarge these bounds. Width is controlled by the syntactic coefficient norm, not the value on satisfying assignments.

For Rat(V,d), d>0, use R=S(V)/d. Masks multiply R by at most 6, including materialization and a complemented selector. Multiplication multiplies input R values and introduces at most a factor 3; this follows directly from product_expression's signed offset plus its positive bit weights. A rational summation has R_out <= 3 sum |c_i| R_i. These estimates retain every signed offset and permit cancellation only to improve a bound.

Let D0 be the lcm of the denominators of all ground scalar leaves used by a particular arithmetic DAG. Assign each leaf a denominator exponent e with denominator dividing D0^e. Multiplication adds exponents; a weighted sum takes the maximum of its input-plus-weight exponents; masking preserves exponents. The reduced fractions in summation divide that lcm, so materialization does not introduce new denominator primes. Consequently log2(d) <= e log2(D0). This also covers unreduced product denominators in Kernel.mul, provided their exponent is propagated additively rather than reset from semantic cancellation.

For a DAG of depth h, addition fan-in at most f, and ground magnitudes at most 2^b, assign unfolding weight d=1 at leaves, max at additions, and sum at products. The norm recurrences above give a bound of the form

    log2 max(1,R) <= d [b + h(log2 max(2,f)+3)].

Combining this with the denominator bound gives an explicit bound on materialized widths. This is a conditional bound in DAG parameters. A polynomial node count alone does not bound d: successive squaring of 2 has linear DAG size but exponentially many output bits. That example is a counterexample to that shortcut, NOT an admitted L4 trace counterexample.

## Exact elimination, including witness coefficients

Let H be the number of equations installed in one LinearDeriver, v the number of coordinate columns including the constant, and B a bound on the numerator/denominator bit lengths of its input entries (including any target row being reduced). Let r<=min(H,v) be the rank.

Clear denominators separately in each input row. A row denominator is a product of at most v denominators, with at most vB bits; resulting integer entries have O((v+1)B) bits. Augment the matrix with the identity columns recording original-row provenance. This exactly models LinearDeriver's dictionary of coefficients: plus combines coefficients with the same original index and removes zeros, rather than copying a derivation tree.

For any chosen pivot rows/columns, exact Gaussian elimination entries and the corresponding provenance coordinates are ratios of minors of this augmented, row-cleared matrix, with the row-clearing factors restored where necessary. This follows by solving the pivot subsystem using the determinant formula and substituting into the remaining rows. The code's largest-column pivot order changes which nonsingular minor is used, not the bound. Dependent rows do not enlarge the rank.

A k-by-k integer minor with entry magnitude at most 2^b has magnitude at most k! 2^(kb), by its determinant expansion. Thus its bit length is at most k(b+log2 max(2,k))+1. All reduced stored fractions and provenance entries therefore have

    C = O((r+1)((v+1)B + log(H+v+2)))

bits. A single multiply/divide/subtract operation before Fraction reduction has O(C) bits as well; intermediate numerators and denominators multiply only a constant number of these bounded operands. This argument is about exact reduced rationals, not floating-point numerical conditioning.

A conservative dense operation count for construction plus K target reductions is O((H+K)(r+1)(v+H+1)). Charging polynomial exact-integer arithmetic, for example O((C+1)^3) per rational operation, yields a polynomial bit-time bound in H,v,B,K. Sparse dictionaries can improve it; they are not needed for this upper bound. Sorting/index operations are additionally polynomial in these dimensions and identifier lengths.

This closes the question whether elimination witnesses inherently expand into an exponential tree: they do not in this representation. It does not yet bound H,v,B,K in original L.
