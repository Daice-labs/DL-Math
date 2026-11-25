# Component counting and reciprocal rank symmetry for odd-prime sources

The counting theorem reconstructs original solutions from compatible support pairs in the canonical odd-prime source. The reciprocal involution transports ranks between labeled computations. At $p=73$, 6,050 nonempty obligations form 3,065 orbits, including 80 fixed cases. Source: v72, §6.8 and Supplement S68.14, S68.20–21.

The geometric index field is $\mathbb F_p$ for odd prime $p$. Matrix coefficients and variable values are binary. Counts and alternating sums use ordinary integers.

## Abstract representation and coupling

Suppose a checked source reduction has the following data. Its remaining factors
lie in a product of fields J = product_(i=1..k) F_(2^d_i), in fixed binary bases.
Write u=(u_i), v=(v_i), d=sum_i d_i, and d_S=sum_(i in S) d_i. Its source solutions
are exactly the lifts

    x = (G u, H v, K M(G u,H v) + D_tail tau),   tau in F_2^f,
    u_i v_i = 0 in F_(2^d_i) for every i,
    u^T A v = 1.                                             (1)

G and H are injective coordinate maps; M is bilinear; D_tail has independent
columns. The source-to-lift equivalence, not just the displayed arithmetic, is
a hypothesis here. Sections 6–9 prove it for an existing family of actual sources.

Construct the whole binary d by d matrix once:

    A_(i,a),(j,b) = E(M(G e_(i,a), H e_(j,b))).                (2)

E is the functional derived from the actual source after eliminating tails.
The field-product constraints restrict the factors' supports; they do NOT assert
that E is componentwise. In particular A_ij for i != j need not vanish. The one
equation couples all occupied components by their combined binary sum. Diagonal
blocks never contribute on admissible supports, and may be omitted only with
that justification. No individual rank or zero-pattern assumption is made.

Define exact supports S={i:u_i != 0} and T={i:v_i != 0}. Fields have no zero
divisors, so the product constraints are equivalent to S intersect T empty.
The target one makes both supports nonempty. Every component is uniquely assigned
to S, T, or neither. There are 3^k - 2*2^k + 1 possible nonempty disjoint ordered
support pairs before testing E. Each occupied component must contain a nonzero
field element. These cases are complete and mutually disjoint; no orientation
or case multiplicity is supplied by a known answer.

For fixed S,T the remaining equation is u_S^T A_(S,T) v_T=1, with every selected
component nonzero. Reconstruction in (1) is injective: its first two coordinates
recover u,v through G,H, and the tail difference recovers tau through D_tail.
Surjectivity is exactly the checked source reduction. Thus (S,T,u_S,v_T,tau)
is a complete nonoverlapping parameterization, including unused components.

## Eliminate second-support enumeration

Partition instead by the exact first support S and put C=[k] minus S. Set v_S=0
and let v_C range over the FULL binary space of dimension d_C. This is the disjoint
union of all permitted exact second supports T subset C. The equation with
right-hand side one excludes v=0 automatically. There is no need to enforce a
nonzero restriction separately on components of v that were not selected.

For u with exact support S, set r(u)=u_S^T A_(S,C). If r(u)=0 there is no v_C.
Otherwise a nonzero binary linear functional has exactly 2^(d_C-1) preimages of
one. This is the sharing step: every admissible exact second-support case for
that u is counted together by a single linear equation.

Let

    P(S) = product_(i in S) (2^d_i - 1),
    K(S) = sum_(U subset S) (-1)^(|S|-|U|)
                           2^(d_U - rank A_(U,C)).           (3)

K(S) is precisely the number of exact-support u_S in the kernel of A_(S,C)^T.
Proof: first count all kernel vectors supported in U (components outside U are
zero). Rank-nullity gives 2^(d_U-rank A_(U,C)). Inclusion–exclusion of the events
u_i=0, i in S, gives (3). The empty matrix has rank zero and its vector space
contains one vector. The alternating integer sum, including that empty term,
is essential. It is not the nullity of the unrestricted matrix.

Consequently the total original solution count is

    N = 2^f * sum_(empty != S strictly contained in [k])
                  2^(d_C-1) * [ P(S) - K(S) ], C=[k]\S.     (4)

All terms count disjoint solutions. The empty and full S contribute zero and are
omitted, so (4) never uses a negative exponent. If k=1 the sum is empty and N=0.
If A is zero every P(S)-K(S) is zero. The tail multiplier is applied exactly once.

As a consistency specialization, for k=2 only the two singleton first supports
remain. Formula (4) becomes

    2^f * [ 2^(d_2-1)(2^d_1 - 2^(d_1-rank A_12))
           +2^(d_1-1)(2^d_2 - 2^(d_2-rank A_21)) ].          (5)

For d_1=d_2=3, f=4 this is the earlier two-matrix formula. This is an algebraic
specialization, not a new p=7 execution or verification batch.

A minimal warning example: with S containing two one-bit components and C a
third one-bit component, the columns (1,0)^T and (1,1)^T both have rank one.
The only exact-support u is (1,1). Its product with the first column is one,
but with the second is zero. The restricted counts are therefore one and zero.
Replacing (3) by an unrestricted rank formula would conflate them.

## What is shared, and what still varies

Source identification and checking, the tail quotient, the CRT bases and inverse
maps, E and the global A are computed once. Each rank in (3) concerns a submatrix
of this SAME A, in its same labeled coordinates; no fresh source reduction or
guard-conditioned nonlinear solve occurs. Ranks are indexed by disjoint U,C:
every component belongs to U, to C, or to neither. There are at most 3^k such
indices. With C fixed, inclusion–exclusion aggregates the first support
S=[k]\C. Restrict to the relevant nonempty C and proper S when implementing.

This establishes an O(3^k d^3) conservative binary-operation bound for naive
submatrix elimination. It does not assume that neighboring submatrices have the
same rank or that arbitrary elimination states can be reused. An implementation
may safely cache exact indexed submatrices or elimination states, but must account
for the cache and prove any stronger claimed sharing. The guaranteed advance is
shared source algebra and aggregation of all second supports, not an unproved
sub-exponential rank algorithm.

The count can stream over S and U, retaining A and a scalar accumulator rather
than all support cases. A full rank table is optional; it costs O(3^k log(d+1))
bits before container overhead. Integer terms have O(n+k) bits for n original
variables, and at most O(3^k) signed additions and power-of-two operations are
needed, costing O(3^k(n+k)) elementary bit operations. A checker may recompute
every rank instead of trusting or receiving a rank table. Compact evidence does
not eliminate its exponential replay work.

## Constructive witness recovery

If (4) is positive, choose a support S with P(S)-K(S)>0. A compatible u can be
found without enumerating its 2^d_S values. Maintain a prefix of fixed binary
coordinates of u_S. For each U subset S impose u_(S\U)=0 and the prefix. Count
solutions of this affine system by consistency and rank. Use inclusion–exclusion
over U to count exact-support completions of the prefix, calling this B(prefix).
Repeat with the additional homogeneous equations A_(S,C)^T u_S=0, giving
Z(prefix). The difference B(prefix)-Z(prefix) counts exactly the completions
with a nonzero row r(u). It is a nonnegative integer.

At each bit try zero: if this difference is positive keep it, otherwise keep one.
At least one choice remains because the two prefixes partition the previous
positive set. After d_S bits, u has exact support S and r(u) is nonzero. Solve
r(u)v_C=1, put v_S=0, choose any tau, and apply (1). This proves existence and
supplies an algorithm for an original-coordinate witness; it never guesses
which components of v should be nonzero. Their actual support is read afterward.

With naive affine elimination, prefix work costs O(d*2^k*d^3) binary operations
after finding S, plus reconstruction. Choosing and exporting further witnesses
must charge their work and output. The total count theorem does not license
enumerating an enormous witness list at negligible cost.

## Conditioned counts and distinct projections

Query semantics here are binary linear conditions Px=b on original coordinates,
and binary linear projections Qx. Coordinate conditions/projections are special
cases. Arbitrary nonlinear queries are outside this query contract, not false.

A general exact fallback is to enumerate u in F_2^d, recovering its support S,
and discard empty/full S or zero r(u). For each remaining u the solutions of
r(u)v_C=1 form an affine space. Together with tau, (1) is affine, because g=Gu is
now fixed and M is bilinear. Construct

    x = o_u + W_u w,     w in F_2^b_u,
    b_u = d_C - 1 + f.                                  (6)

W_u has full column rank: the h coordinates distinguish the independent v
parameters and the tails then distinguish tau. Blocks for different u are
disjoint in original coordinates. Thus (6) is a complete affine block cover.
It is unnecessary to enumerate tau or v to obtain a conditioned count.

Solve P W_u w=b+P o_u. Inconsistent blocks contribute zero; a consistent block
contributes 2^(b_u-rank(P W_u)). Sum over all u. A particular affine solution
recovers a conditioned witness. Empty, repeated or contradictory query rows use
the same rule. A complete g assignment fixes at most one u; a partial g query
can intersect many supports. Tail queries must include the translated K and
D_tail columns; multiplying by 2^f indiscriminately is wrong.

For projection, first apply any conditioning and obtain a reduced injective
block x=o'_u+W'_u w. Its image is Q o'_u + im(Q W'_u). Each image value has
multiplicity 2^(number_of_columns(W'_u)-rank(Q W'_u)). Enumerate each distinct
value within that image once, then use exact projected bit strings as keys to
form the union across blocks. Add multiplicities where images overlap. The key
count is the distinct projected-answer count; accumulated values are original
solution fibre counts. Counting block image sizes without taking the union is
incorrect. This handles projection overlaps explicitly, including an empty
projection, whose sole value has multiplicity N when N>0.

This fallback visits at most 2^d possible u values. Per block, construction and
affine query work are polynomial in n and query length. Projection additionally
visits sum_u 2^(rank(Q W'_u)) image values, stores their union, and pays exact
key comparison and output costs. These bounds can be exponential in d or n,
even with small k. Formula (4)'s component-count dependence is a guarantee for
TOTAL counting and the witness algorithm in section 4, not for arbitrary queries.
Efficient general conditioned or union counting is a separate research target.

## Actual source family and exact tail quotient

The incoming authoritative Arm B generator focused_checks.py defines
original(p, extra=1). Its source variables are

    g_a = x_(0,a), h_r = x_(1,r),
    z_t(v) = x_(t,v), t=2,...,p-1; n=p^2.

The p^2 main equations are, for a,c in F_p,

    M(a,c) = g_a h_(a+c) = sum_(t=2..p-1) z_t(a+ct).       (7)

Let T denote the tail matrix. For any array M define Q_a=sum_c M(a,c),
R_r=sum_(a+c=r) M(a,c), C_c=sum_a M(a,c). Let L list each Q_a+Q_0, R_r+R_0,
C_c+C_0 for nonzero indices. Define

    K(M)_t(v) = sum_(a+ct=v) M(a,c).                      (8)

Necessity of LM=0 for Tz=M: each retained direction t differs from 0 and 1,
so its tail row contributes its full row sum to each Q,R,C line. These sums
are constant within each of the three omitted parallel classes.

Sufficiency: in the affine plane over F_p, there are p+1 lines through a point.
Summing their line sums counts the point p+1 times (zero in F_2) and every other
point once. The result is M(point)+the global sum of M. If LM=0, each omitted
direction has constant line sum equal to the global sum, since p is odd. The
three omitted lines through the point therefore sum to the global sum. Removing
them leaves TKM=M. Hence im(T)=ker(L), with the explicit common section (8).

If Tz=0, summing along a retained line a+ct=v gives

    z_t(v) + sum_(s != t) sum_w z_s(w) = 0.

It follows that each row z_t is a constant kappa_t. Conversely such constants
are in the kernel exactly when sum_t kappa_t=0. There are p-2 row constants and
one independent condition, so f=p-3 and rank(T)=p(p-2)-(p-3)=p^2-3p+3.
Choose any p-3 of the constants freely and set the last to their sum; this is
the explicit injective D_tail. At p=3 it has zero columns and the sole constant
is zero. For every admissible M the lift z=KM+D_tail tau is unique in tau.

For completeness rank(L)=3(p-1): in one parallel class, the p line indicators
are independent and their even-coefficient subspace has dimension p-1. Its dot
product is nondegenerate because p is odd: the all-ones vector, the perpendicular
of the even subspace in coefficient space, is not even. Different directions
intersect in one point, so two even combinations from different classes have
dot product zero. Their three nondegenerate spaces form a direct sum. This
also agrees with the rank of T derived independently from its kernel.

These statements prove the tail quotient for every odd prime, without importing
the p=7 kernel dimension or consulting a saved solution list.

## Replacement constraints and exclusion of omitted cases

Allow one extra normalized equation of the syntactic form

    <lambda,M> + <mu,z> = 1,                         (9)
    mu D_tail=0, E=lambda+K^T mu, E(1)=0.           (10)

Lambda has p^2 coefficients; mu has p(p-2). The first condition in (10) is
equivalent to all row parities sum_v mu_t(v) being equal, because the annihilator
of sum kappa=0 is the span of the all-ones row. Substitution of the unique lift
turns (9) into exactly E(M)=1, independent of tau.

Write G0=sum_a g_a and H0=sum_r h_r. Product arrays satisfy Q_a=g_a H0 and
R_r=G0 h_r. If G0=1 then constant R forces h constant. If h=0, M=0. If h=1,
odd p gives H0=1, constant Q forces g constant, and G0=1 gives g=1, so M=1.
The same argument with the factors interchanged covers H0=1. Zero factors also
give M=0. Linearity E(0)=0 and hypothesis E(1)=0 exclude all these cases at
target one. Every surviving solution therefore has nonzero even g,h.

For even factors Q=R=0. If C is constant, summing it gives G0 H0=0, and odd p
forces that constant to be zero. Conversely C=0 and evenness imply LM=0.
Thus the remaining main-row requirement is exactly zero cyclic correlation.

The hypotheses are sufficient for the claimed representation, not universal
conditions for all possible counting methods. If mu D_tail !=0, only half of
each main fibre satisfies (9); the f directions are no longer all free. If
E(1)=1 while mu D_tail=0, the constant-one product supplies an additional 2^f
solutions excluded by (1). Unsupported cases must be reported as such, never
declared UNSAT merely because this rule does not cover them.

## CRT, source-derived coupling and inverse reconstruction

In R=F_2[X]/(X^p-1), use inverse indexing for the first factor:

    ghat = sum_a g_a X^(-a),  hhat = sum_r h_r X^r.

Their product has coefficients C_c. The derivative of X^p-1 is X^(p-1) in F_2,
coprime to X^p-1, so the polynomial is squarefree. Factor it exactly as

    X^p-1 = (X+1) * product_(i=1..k) f_i,
    f_i distinct irreducible, degree d_i, sum d_i=p-1.      (11)

The CRT map is injective by divisibility by the full product and bijective by
equal binary dimensions. Even polynomials have zero component at X+1, so their
ideal J is the product of the k indicated fields. Choose a binary basis U_i for
each embedded component, derive G by inverse-indexing its polynomial coefficients,
and H by ordinary indexing. These maps are injective and cover all even vectors.
In particular a valid inverse always takes CRT coordinates of ghat, not g in
ordinary index order.

Fieldwise multiplication zero is precisely disjoint support. Derive every
off-diagonal block of A from the source functional E using (2). Then (7)–(10)
are equivalent to (1), with f=p-3 and d=p-1. Inversion reads g,h, computes CRT
coordinates of ghat,hhat, and recovers tau from z-KM. All directions, both zero
and nonzero components, and all tail solutions have now been covered. This
proves the hypotheses of the abstract theorem for the whole source class.

Cross-component coupling is real, not a conditional artifact. Permute M(a,c)
to outer-product coordinates (a,r=a+c). The subspaces G_i tensor H_j are a
direct sum over all ordered i,j, since the G_i and H_j each form independent
direct sums. A linear functional can prescribe arbitrary binary blocks on all
off-diagonal spaces. The constant-one outer product is outside the full even
tensor space: summing over either axis sends every even tensor to zero, but
does not send the all-ones product to zero for odd p. Thus the functional can
also be prescribed zero there, and extended to the full array space. Taking
mu=0 realizes any off-diagonal block collection in (9)–(10). This argument
establishes realizability; it does not claim a sparse original extra row produces
arbitrary blocks or that these sources are all inequivalent under relabeling.

If a Boolean encoding is supplied, verify every product definition and all
source/encoded rows. An original assignment then has one unique auxiliary
extension, preserving the total count. The original witness is primary; auxiliary
values are evaluated from it, not multiplied into the answer. The syntactic
adapter here needs only g_a h_r products, so its auxiliary coordinates are also
affine within each fixed-g block. Any broader encoding needs its own checked
query translation.

## Demonstrated application to the existing larger family

The generator's ACTUAL extra row is obtained from v_t=t^2:

    M(0,1) + sum_(t=2..p-1) z_t(t^2) = 1.                 (12)

Here lambda selects M(0,1) and mu selects exactly one coordinate in each tail
row. Its row parities are all one, so mu D_tail=0. For the constant array 1,
each retained line has odd length p, so K(1) is the all-ones tail array. Hence
E(1)=1+(p-2)=0 in F_2. This proves that original(p, extra=1) belongs to the class
for EVERY odd prime p. It is an existing research-source family, not a fixture
invented to satisfy the abstract hypotheses. The incoming generator and original
definition are hashed in this packet; no previous answer supplies A or a rank.

For an explicit larger ring, p=31 has

    (X^31+1)/(X+1) = product of polynomials with bit masks
                      37, 41, 47, 55, 59, 61.

Each has degree five, constant term one, and is divisible by neither X+1 nor
X^2+X+1. A reducible degree-five polynomial has a factor of degree at most two,
so these tests prove irreducibility (X is excluded by the constant term).
Direct multiplication proves the displayed factorization. Thus this actual
source-family member has k=6, d=30, f=28 and n=961. Formula (4), with its A derived
from (12), applies. These parameter and polynomial facts establish applicability to a larger member. The original proof packet preceded its implementation; the subsequent source-derived p = 31 count and replay are reported separately in S68.15. When k=1, (4) instead recovers the earlier irreducible-even-ring
UNSAT subclass as an algebraic consequence.

## Construction, recognition and costs

Given canonical labeled source rows, complete matching to (7) and (9), and (10),
is polynomial in input length. An arbitrary unlabeled source requires an actual
recognition procedure. This theorem does not generalize the installed p=7
recognizer for free. A complete, very loose finite fallback enumerates bijections
from its n original variables to the n labeled positions and verifies every row;
at most n! labelings, each polynomial work. Failed candidates and interruptions
must be reported and charged. A practical larger recognizer is separate work.
A supplied candidate labeling is acceptable only after complete source checking;
it proves applicability, not automatic efficient recognition.

Factorization need not be an unspecified oracle. For squarefree Phi_p of degree
d, build the binary linear map b -> b^2 modulo Phi_p and find its fixed space.
On each irreducible field component the only fixed elements are 0 and 1, so
this space has dimension k. Use a binary basis of it to split current factors
by gcd(q,b) and gcd(q,b+1), keeping nonconstant parts. Any two irreducible factors
are separated by some basis vector: otherwise all linear combinations would
agree on them, contrary to the component indicator in the fixed space. After
the basis is processed, the remaining parts are irreducible. Modular polynomial
arithmetic, Gaussian elimination and these gcds give a conservative O(d^4)
binary-operation bound with elementary dense arithmetic. A checker can verify
the product and coprimality and independently verify irreducibility by Frobenius
and gcd tests; supplied factors are not trusted solely on their degrees.

For n=p^2, explicitly constructing T,L,K,D_tail and checking their linear
identities/ranks costs at most O(n^3) binary operations and O(n^2) bits of dense
workspace. CRT bases/inverses and factoring fit a polynomial bound; constructing
E and all A entries naively costs O(p^4). These loose bounds favor transparent
accounting rather than a claimed optimized implementation. Source parsing,
normalization, query parsing and any unique-extension adapter cost must also be
included in their actual serialized input/output sizes, denoted s.

After recognition, a conservative total-count bound is

    poly(s,n) + O(3^k*d^3 + 3^k*(n+k)),

with polynomial streaming workspace excluding serialized evidence/output. One
unconditioned witness adds O(2^k*d^4 + poly(n)). Arbitrary conditioned queries
use the section 5 bound O(2^d*poly(n,query_length)), and distinct projections add
image enumeration, exact union storage and output costs. Recognition adds its
entire actual cost (up to the loose factorial fallback above). These stages must
not be hidden inside the term 'rank calculation'.

An economical certificate can contain source/query bindings, the verified maps
and bases, factors, E,A, claimed totals and answers. Recompute ranks in the
checker; a rank transcript is optional and charged when present. Core data is
polynomial in source size, but query evidence, rank transcripts or witness lists
may be exponential. The separate checker redoes source matching, coefficient
derivation, quotient/CRT checks and every count/query it certifies. Its time,
serialization and any duplicated stored evidence are real costs. No measured
speed, memory or certificate-size improvement follows from these upper bounds.

The new trusted mathematics is the general quotient, excluded-case argument,
CRT support bijection, inclusion–exclusion count, witness search and projection
union semantics. This packet proves them at source level and supplies small
diagnostics; an installed checker and separately reviewed implementation are reported for the canonical total-count profile in S68.15. The broader replacement and query contracts are not thereby implemented. Recognition failure is NOT_RECOGNIZED, interruption is
INCOMPLETE, and only a verified applicable formula with N=0 establishes UNSAT.

## Scope and one construction

The canonical source admits a factor-exchange involution. It supplies a source-derived explanation of *paired* rank deficiencies and an exact orbit reduction of elimination work. It does not classify every numerical deficiency. The saved rank table is corroborating evidence; the proof below derives the relation from source equations and CRT maps.

Let p be an odd prime, with canonical original(p,extra=1) equations

 M(a,c)=g_a h_(a+c)=sum_(t≠0,1) z_t(a+ct),
 g_0 h_1 + sum_(t≠0,1) z_t(t²)=1.

Geometric indices are modulo p; values and matrix coefficients are in F₂, while counts and alternating sums are ordinary integers. We use the existing checked tail/CRT theorem, including exclusions, unique original reconstruction, fields of degrees d_i, d=sum d_i, free-tail dimension f=p−3, and the canonical source-derived functional E. Its total-count rule remains unchanged.

The new construction pairs rank obligations using an explicit invertible coordinate transport. It applies to this canonical source, or another admitted source for which the same full coupling identity is separately established. Factor reciprocity alone is insufficient for arbitrary replacement constraints. It does not invoke the unimplemented root-aggregation recurrence or transfer its p31 obstruction.

## An exact original-variable involution

Define F by

 g'_a=h_(a+1),   h'_r=g_(r−1),
 z'_t(v)=z_(1−t)(v+1−2t).

This is a permutation of original bits, not an affine relaxation. t↦1−t permutes the retained directions. Applying F twice cancels all shifts, so F²=id.

The new main product is

 M'(a,c)=h_(a+1) g_(a+c−1)=M(a+c−1,2−c).

The transformed tail sum is the same source row after s=1−t:

 sum_t z'_t(a+ct)
 =sum_s z_s(a+c−1+(2−c)s).

The map (a,c)↦(a+c−1,2−c) is an involution of all main rows. The extra product g'_0 h'_1=h_1 g_0 is fixed; its selected tail coordinates satisfy t²+1−2t=(1−t)². Thus the entire extra equation is fixed. Every original solution maps to a unique original solution, with no missing cases and no multiplicity change. These statements are polynomial identities on arbitrary assignments, not consequences inferred from the saved answer.

## Nonlinear geometric origin of the coupling

Write r=a+c. In outer-product coordinates the coefficient of g_a h_r in E is

 W(a,r)=[a=0 and r=1] + sum_(t≠0,1) [t²−(r−a)t−a=0],

with brackets in F₂. Over the odd prime field, a quadratic has an odd number of roots exactly when its discriminant vanishes. Therefore

 W(a,r)=[(r−a)²+4a=0]+[a=0]+[r=1]+[a=0 and r=1].

For even g,h, the two full row/column terms vanish, giving

 E(M(g,h))=sum_t g_(−t²) h_(2t−t²)+g_0 h_1.

The conic's repeated-root parameter t is unique: a=−t², r=2t−t². After b=r−1 the conic is symmetric in a,b; t↦1−t exchanges the two evaluations. This exhibits actual nonlinear source structure behind the transpose relation. The conic-only expression is used only on the even-factor space; W including row/column terms is the all-factor expression. This does not by itself prove that any particular block has rank 6,7,8 or9, or explain every 32–36 whole-cut rank.

There is also a full-array proof of invariance, avoiding any even-space caveat. Let P M(a,c)=M(a+c−1,2−c). The canonical section obeys

 K(PM)_t(v)=K(M)_(1−t)(v+1−2t).

Its selected t² positions permute, while PM(0,1)=M(0,1). Consequently E(PM)=E(M) for every array M. This full identity licenses the exact coupling relation below, including diagonal blocks; no unchecked diagonal deletion is required for it.

## CRT transport from the actual supplied bases

Use the existing conventions

 ghat(X)=sum_a g_a X^(−a),   hhat(X)=sum_r h_r X^r.

Under F,

 ghat'=X hhat(X^(−1)),   hhat'=X ghat(X^(−1)).

On the even ideal J define Q₀(q)=X q(X^(−1)) modulo X^p−1. Q₀²=id, and it preserves J. If f_i is an irreducible factor, inversion sends its component to the reciprocal factor f_i*(X)=X^(deg f_i) f_i(X^(−1)); multiplication by X is a unit within that component. Let π be the resulting component involution. It preserves degrees.

Given the actual checked embedded CRT basis H, construct binary Q columnwise by the unique equations H Q e_j = Q₀(H e_j). Verify every equation, Q²=I, and that each block Q_i maps component i invertibly to π(i). No saved rank class or solution list enters this construction. In the checked factor coordinates, (u',v')=(Qv,Qu).

Since E is invariant for all products, the complete source-derived matrix satisfies

 A = Q^T A^T Q.

For disjoint component sets U,C, put P=π(C), R=π(U). Restricting the identity gives

 A_(U,C) = Q_U^T [A_(P,R)]^T Q_C,

where Q_U:U→π(U) and Q_C:C→π(C) are the corresponding invertible restricted maps; the transpose's row domain is π(U) and column domain π(C). Therefore

 rank A_(U,C) = rank A_(π(C),π(U)).

This is rank equality derived from explicit invertible equivalence, not equality used to conjecture equivalence. Degree preservation also preserves rectangular rank deficiency. It explains which labeled deficiencies must occur together; deficiencies in different orbits remain a genuine unresolved classification problem.

## Exactly what is paired

The total rule asks ranks for C≠∅ proper and U⊆[k]\C. Empty U contributes rank zero immediately. Nonempty U and C are disjoint, with every other component unused. Their number is

 3^k−2·2^k+1.

Define σ(U,C)=(π(C),π(U)). This is an involution of these nonempty disjoint cases. One representative suffices for a rank computation; the partner's rank is transported to its own labeled obligation. A fixed obligation has multiplicity one; a two-element orbit has multiplicity two only when summing equal fully weighted rank terms. This is NOT a division of solution counts by a symmetry-group size. No assumption about fixed solutions is made.

For p73, ord_73(2)=9 is odd, so −1 is not in the subgroup generated by 2. No nontrivial factor is self-reciprocal. The eight degree-nine components form four reciprocal pairs. A fixed nonempty case has U=π(C); on each reciprocal pair choose neither, or one endpoint in U and its partner in C (two orientations). Hence there are 3^4−1=80 fixed cases. The 6,050 nonempty obligations form

 (6050+80)/2 = 3065 rank orbits.

There are additionally 254 known empty-U zeros. Thus a transport-aware producer/checker can replace 6,050 nonempty eliminations by 3,065, while still satisfying every one of the 6,304 indexed obligations. This is a factor below two, not a change of exponential base or elimination of case generation.

## Generate orbit representatives before elimination

Do not generate all complete (U,C) cases and then group by observed ranks. Order the four reciprocal pairs deterministically from the admitted factor order. A pair's local word (s,t) is in {unused,U,C}². σ sends it to (swap(t),swap(s)), with swap exchanging U,C and fixing unused. There are three fixed local words and three pairs of nonfixed local words.

Use a fixed lexicographic local order. The recursion carries a flag EQUAL or LESS comparing the prefix with its σ-image. While EQUAL, permit the three fixed words (remain EQUAL) and the lesser member of each nonfixed pair (become LESS); reject greater words immediately. After LESS, permit all nine words. At a terminal leaf reject U-empty or C-empty; otherwise emit its case and orbit size 1 if still EQUAL, else 2. The first differing local word proves uniqueness and completeness of this canonical selection. The involution acts within each ordered reciprocal pair, so later assignments cannot reverse an earlier comparison.

For q reciprocal pairs, canonical leaves before nonempty filtering obey c₀=1 and c_q=3c_(q−1)+3·9^(q−1), hence c_q=(9^q+3^q)/2. For q=4 this is 3,321. Exactly 256 canonical leaves have U or C empty (including both empty), leaving 3,065. This was an exact generator specification in the proof batch; its subsequent implementation and separate checker are reported in S68.20.12. The finite applicability diagnostic may inspect the already saved rank records but must not be represented as having implemented this generator.

## Counting coefficients, multiplicities and output coverage

Retain the existing formula, S=[k]\C:

 N = 2^f sum_(C nonempty proper) 2^(d_C−1) [P(S)−K(S)],
 P(S)=product_(i∈S)(2^d_i−1),
 K(S)=sum_(U⊆S) (−1)^(k−|C|−|U|) 2^(d_U−rank A_(U,C)).

The rank-dependent contribution to TOTAL N, including the subtraction of K, is

 w(U,C)=(−1)^(k−|C|−|U|+1) 2^(f+d_C+d_U−1−rank A_(U,C)).

Its sign, exponent and rank are invariant under σ. Thus total-only accumulation may add one or two copies of w for each rank orbit, while handling the P terms and empty-U terms exactly as specified. The exponents are nonnegative for the admitted nonempty cases. All integer signs and multiplicities remain explicit; no rounded or clamped kernel counts are allowed.

For the full support decomposition, do not double a single support's kernel term. The paired case usually belongs to a different complement C and hence a different first support. Emit the transported rank into each labeled (U,C) slot, apply that slot's own K(S) coefficient, and retain all 254 support totals. Those per-support unweighted terms need not agree even though the fully weighted total terms do. A complete table still contains 6,304 indexed values, including254 zeros. The first-product terms may be evaluated once per support; no closed-form simplification of them is required by this construction.

## Witnesses, reconstruction and conditioned scope

The rank-sharing algorithm's guaranteed scope is exact TOTAL counting, and optionally the existing complete first-support table. The unchanged positive-prefix witness method may be retained on the original A and chosen support, with every prefix count/affine solve charged. This proof does not reduce prefix costs automatically and never reads a witness from an integer signed-cancellation path.

For optional witness transport, F is an original-coordinate permutation carrying every original equation to the same source. Apply it to a verified original witness and raw-check the result if exported. Component coordinates become (Qv,Qu), and actual first support becomes π(support(v)), not necessarily the complement C used in the aggregate counting case. Tail coordinates may be transformed directly by F. If using free-tail parameters, derive the unique R with D R=F_tail D; F_tail permutes row constants and R²=I. Do not assume tau remains unchanged. Original recovery stays bijective and tail multiplicity stays 2^f.

For an original-linear query Px=b, F gives a bijection to the transformed query P F x=b. This is a valid *query-transport theorem*, not a conditioned rank-sharing algorithm. A fixed query can use the source symmetry unchanged only after checking invariance/equivalence of its augmented equations. General normalized conditioned states contain affine right sides, linear terms, phases, nonzero restrictions and prefix data that this total-rank orbit does not preserve automatically. No merging of such states, no free conditioned-count improvement and no distinct-projection claim are licensed. These would require a separately proved interface.

## Hypotheses and source-derived coupling

Let p be an odd prime. Use the canonical original(p,extra=1) source, its checked even factor spaces g,h in J={x in F₂^p: Σ x=0}, and actual source-derived extra functional E after the established tail quotient. Coordinates a,c,t are ∈ Fₚ, coefficients are binary. Write r=a+c. The established conic identity is

 E(g,h)=Σ_(t∈Fₚ) g_(−t²) h_(2t−t²) + g_0 h_1.

It follows directly from the parity of roots of t²−ct−a and vanishing row/column terms on even g,h. It is not asserted on arbitrary non-even factors. We retain all hypotheses and exclusions of the existing canonical counting theorem; this proof does not change the source or tail reconstruction.

Set Q={t²:t ∈ Fₚ}, including 0, m=|Q|=(p+1)/2, q₀=m−1. Define left evaluations l_q=g_(−q), right evaluations r_q=h_(1−q), for q ∈ Q. Define the m by m binary matrix B by edges

 (q_left,q_right)=(t²,(t−1)²) for every t, plus (0,0).

Then E(g,h)=lᵀ B r. Thus the extra nonlinear constraint is a bilinear coupling on a source-derived graph, rather than an arbitrary dense matrix.

## The graph is one cycle, not just a rank observation

Distinct t cannot give the same edge: equality of both squares would imply t'=−t and t'=2−t, impossible for odd p. Every nonzero-square vertex has two incident conic edges. The left 0 vertex has only t=0, and the right 0 vertex only t=1. The conic graph is connected: moving between edges sharing a left vertex acts by t↦−t, and sharing a right vertex by t↦2−t. Their compositions generate translations by 2, which act transitively on Fₚ. Fixed edge moves at t=0 or 1 do not affect this connectivity argument.

There are p+1 vertices and p conic edges, two degree-one endpoints and all other degrees 2. Consequently the conic graph is a single spanning path. The extra corner (0,0), not already present, closes it into the cycle C_(p+1).

Over F₂ each row/column of B has even sum. Equations Bv=0 force equality of adjacent right values along the connected cycle, so ker B=span{1}. Similarly ker Bᵀ=span{1}. Therefore rank B=m−1=q₀. This proof determines the rank from connectivity, not a saved table.

## A perfect q₀-dimensional quotient pairing

Define N:F₂^Q→F₂^(Q\{0}) by (Ny)_q=y_q+y_0. Let T insert a zero coordinate at 0. Then y=TNy+y_0*1. Since B annihilates constants on both sides,

 lᵀ B r=(Nl)^T K(Nr),  K=Tᵀ B T.

K is invertible: if Kz=0, B(Tz) pairs to zero with the section and also with constants; hence B(Tz)=0, so Tz is constant and its 0 coordinate forces z=0.

Even J restricts surjectively to the m evaluation coordinates: choose arbitrary values there and use any one unused original coordinate to satisfy parity. There is at least one unused coordinate for odd p≥3. Thus both normalized evaluation maps J→F₂^q₀ are surjective. Their perfect K pairing proves that the FULL even-factor coupling has rank exactly q₀=(p−1)/2. At p 73, full rank is 36, not 72. The two factor radicals each have dimension 36. This source-specific bottleneck is independent of CRT labels and reciprocal pairing.

## Actual CRT maps and cut factorization

Let G,H be the admitted original-coordinate columns for g,h, with the existing inverse indexing for g and ordinary indexing for h. Do not replace either by a guessed polynomial basis. For each component index set I, define columns

 L_I(e_j)_q = G_j(−q)+G_j(0),
 R_I(e_j)_q = H_j(1−q)+H_j(1),     q ∈ Q\{0}.

These maps are source-derived evaluations, not reductions fitted to saved ranks. In the original supplied CRT coordinates,

 A_(U,C)=L_Uᵀ K R_C.

This identity proves every entry including its labeling. If U,C are disjoint, it applies to the actual indexed counting obligation. No equivalence of different cases is asserted.

Let d_C be the right domain dimension, W_U=im L_U and W_C=im R_C. Define

 Z_(U,C)={w in W_C : lᵀ K w=0 for every l in W_U}.

There is an exact sequence

 0 → ker R_C → ker(A_(U,C)) → Z_(U,C) → 0,

where the right map sends v to R_C v. Surjectivity follows by taking a preimage of w; the kernel is exactly ker R_C. Consequently

 nullity_right A_(U,C)=a_C+z_(U,C),
 a_C=d_C−dim W_C,   z_(U,C)=dim Z_(U,C).

For a balanced p 73 cut, d_U=d_C=q₀=36, so rank A=36−a_C−z. Left nullity has the analogous decomposition with L and the transposed pairing. This is an exact source-derived criterion for nullity on every admitted cut, and a constructive parameterization, not a lookup classification of the numbers 32–36. Computing a_C and z still requires algebra; no arithmetic formula solely in component labels has been established.

## Internal dependencies versus cross-component cancellation

For each right component i let R_i:E_i→W_i. Let κ_i=dim ker R_i. The kernel of the direct-sum evaluation R_C decomposes by a second exact sequence:

 0 → ⊕_i ker R_i → ker R_C → ker[⊕_i W_i → Σ_i W_i] → 0,

with the latter map adding the images. Hence

 a_C = Σ_i κ_i + (Σ_i dim W_i − dim W_C).

The first term is invisible freedom within an individual component. The second is cancellation between component images (including equality modulo the removed constant evaluation). The additional z term is a nonzero evaluated combination that annihilates the opposite side under the cycle pairing. These are distinct mechanisms. An isolated off-diagonal 9-by-9 block deficiency does not itself establish an internal component radical.

The saved indexed evidence reports full rank for every one-/two-component restriction into a disjoint four-component side. That challenges explanations based only on isolated block deficiencies. The selected-cut diagnostic in S68.21.9 checks these restrictions constructively; the whole saved histogram is not promoted to a new theorem. If each two-component restriction is injective, no nonzero coupling-kernel vector can be supported in one or two of that cut's components. This does not exclude three-/four-component cancellations.

## Constructive bases and coverage

Compute a basis J_C of ker R_C. Compute bases for W_C and for the solutions of L_Uᵀ K w=0 restricted to W_C. Keep coordinate preimages v_j with R_C v_j=w_j for a basis w_j of Z. Then

 {J_C columns} ∪ {v_j}

is a basis of the coupling kernel. Independence follows by applying R_C, then using independence of J_C. Every kernel vector is expressed uniquely by its Z coordinates and its residual J_C coordinates. Thus there are exactly 2^(a_C+z) right annihilators, with no omissions, duplicated parameter choices, signed arithmetic or orbit division. Repeat with transposed pairing if left annihilators are requested.

Carry coefficients in original CRT coordinates throughout. Actual original factor vectors are H v (or G u); reconstruction of these factor vectors is exact and injective. These annihilators are NOT automatically source solutions or witnesses. In fact the fixed-pair bilinear value is 0 against the entire selected opposite subspace, whereas the canonical extra constraint requires 1. Nonzero-component restrictions may further remove annihilators from an exact-support sector. The diagnostic exports kernel generators as factor-coordinate evidence only, not valid full-source assignments.

## Counting and sharing boundaries

The existing support formula remains unchanged. For unrestricted first-factor domain U, rank of A_(U,C) gives 2^(d_U−rank) annihilating first vectors in the inclusion–exclusion kernel sum. This theorem provides a source-derived representation of that rank and its kernel. The balanced whole-cut term alone does not determine an entire exact-support count; proper submask obligations and their original signs remain necessary. No count was evaluated in this cycle study.

No two cases are merged by equal rank, cardinality, cycle rank or isomorphic unlabeled graphs. No new elimination/state-sharing operation is proposed here. Accordingly there is no claim of fewer cases, transported signs/multiplicities or new original-witness recovery. Evaluating the criterion could change the linear algebra within one case, but even that is not an established cost saving: the 36-by-36 selected cut already has quotient dimension 36. This proof is a structural explanation and kernel representation, not an installed solver improvement.
