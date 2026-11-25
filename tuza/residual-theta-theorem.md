# A uniform cover theorem for residual theta components

## The theorem

**Theorem.** Let G be a finite simple graph and let P be a maximum edge-disjoint triangle packing, m=|P|. Suppose:

1. Every member of P has an empty private family relative to the entire graph G and P.
2. Every vertex v has packing load k(v)>=2.
3. Every connected component of the residual graph R=E(G)\E(P) is a tree (including an isolated vertex), a simple cycle, or a theta graph.

Then there is a cut of G whose physical complement X has |X|<=2m. In particular tau(G)<=2nu(G).

For theta components, all triples of positive path lengths are allowed that give a simple triangle-free graph: at most one length is one, and every pair of lengths sums to at least four. There is no upper bound on the lengths or number of components, and packed edges may join different residual components arbitrarily.

The maximum-degree-eleven hypothesis requested in the assignment is **not needed** for this theorem. No connected-link condition, global codegree cap, private-support uniqueness, finite outside envelope or minimal-counterexample assumption is used. Load at least two remains an explicit hypothesis; its derivation in an all-empty-private minimal counterexample uses the previously accepted Lemma 7.3 only within that setting.

## 2. Physical partition and the assembly lemma

Write E_P for the union of the 3m distinct physical packing edges. For a residual component C, put:

    n_C = |V(C)|, r_C = |R[C]|,
    p_C = |E_P[C]|, K_C = sum_{v in C} k(v).

Let p_cross be the number of packed edges joining different residual components. Every residual edge is internal to its component, and

    sum_C p_C + p_cross = 3m,
    sum_C K_C = 3m,
    K_C >= 2n_C.

The graph H_C=G[V(C)] contains ALL actual internal packed edges, as well as the residual component. For n_C>1 it is connected because the residual component is connected. A singleton H_C has no internal edges.

**Assembly lemma.** Suppose for each C there is a distribution on cuts of H_C with

    E[uncut edges in H_C] <= p_C/2 + K_C/6.

Independently sample these cuts, and independently flip all signs in each component with a fair coin. Flips do not change any internal edge's cut status. The endpoints of a cross-component edge have zero correlation after these independent flips, regardless of the internally chosen cuts. Thus each such edge is uncut with probability exactly 1/2. Summing one physical edge count gives

    E|X| <= (sum_C p_C + p_cross)/2 + (sum_C K_C)/6
           = 3m/2 + m/2 = 2m.

Some complete cut has complement size at most 2m. Every triangle of G has two vertices on the same side, so this complement hits EVERY actual triangle, including triangles spread across two or three residual components. No boundary triangle is dropped, no edges are deleted during the argument, and no separate cover savings are added incompatibly.

It suffices below to establish the stronger local bound p_C/2+n_C/3, because n_C/3<=K_C/6.

## 3. A connected-cut bound handles arbitrary large components

The classical Edwards–Erdos theorem states that a connected simple graph on n vertices and e edges has a cut of size at least e/2+(n-1)/4. Consequently it has at most

    floor(e/2-(n-1)/4)

uncut edges in a suitable cut. See Crowston, Jones and Mnich, *Max-Cut Parameterized Above the Edwards–Erdos Bound*, arXiv:1112.3506v3, page 2, equation (1), https://arxiv.org/pdf/1112.3506 . This is an established theorem, not a new claim or an algorithm run in this packet.

Apply it to the ACTUAL H_C, with e=p_C+r_C. This application is permitted even when those packed edges substantially change the induced graph: all of them are included in e and H_C. Fix one of the guaranteed cuts and add the fair global flip required by Section 2.

For a tree r_C=n_C-1, its uncut count is at most

    p_C/2+(n_C-1)/4 <= p_C/2+n_C/3.

For a simple cycle r_C=n_C, it is at most

    p_C/2+(n_C+1)/4 <= p_C/2+n_C/3,

because n_C>=3 (indeed >=4 under triangle-free residuality). Isolated vertices contribute zero. These cuts need not be the earlier correlated-cut distributions; they are compatible with the same component-flip assembly.

A theta with lengths l1,l2,l3 has

    r_C = l1+l2+l3,   n_C=l1+l2+l3-1,   r_C=n_C+1.

For n_C>=9 the guaranteed uncut count is at most

    p_C/2+(n_C+3)/4 <= p_C/2+n_C/3.

This proves the required bound for EVERY admissible theta of order at least nine, regardless of parity, short paths, packed-degree choices or path lengths. No checking of a finite initial range is used to infer this step.

## 4. Integer rounding removes orders six and eight

Let p=p_C, an arbitrary nonnegative integer counting the actual internal packed edges.

If n_C=6, the Edwards–Erdos uncut bound is floor(p/2+9/4). For p even its excess over p/2 is 2; for p odd it is 3/2. Both are at most n_C/3=2.

If n_C=8, the bound is floor(p/2+11/4). For p even its excess is 2; for p odd it is 5/2. Both are at most n_C/3=8/3.

These arguments hold for every actual internal edge set and every admissible path triple at those orders. They neither impose parity on p nor assume that internal packing edges are independent choices.

## 5. Completeness of the small-order split

A simple triangle-free theta has at least five vertices. Indeed, if a path has length one, both others have length at least three, so the sum of lengths is at least seven. If none has length one, every length is at least two and the sum is at least six.

At n_C=5 the sum is six, so the only sorted triple is (2,2,2), giving K2,3. Every pair of distinct vertices is at residual distance one or two. A packed edge cannot be residual and cannot join the endpoints of a residual two-edge path: the latter would form a private triangle with its packed member. Thus p_C=0, H_C=K2,3, and its bipartition cuts every edge. Its uncut count is zero, satisfying the budget.

The only remaining order is seven, where the sum of lengths is eight. Sort l1<=l2<=l3. If l1=1, triangle-freeness forces l2>=3 and the only solution is (1,3,4). If l1>=2, the only solutions are (2,2,4) and (2,3,3). Larger minimum length would make the sum at least nine.

This establishes exhaustive coverage by Sections 3–4 and the four small cases in this section. The three calculations below are a derived finite boundary, not a catalogue purporting to represent arbitrary long paths.

## 6. Joint theta distribution: normalization and all correlations

Derive the requested distribution for an arbitrary admissible theta before using it on the seven-vertex cases. Let q=-1/2. Give each residual edge an independent multiplier with probability 3/4 of -1 and 1/4 of +1. Let Y_i be the product on path i, so the three Y_i are independent with means z_i=q^{l_i}.

Consistency requires Y_1=Y_2=Y_3, not two independently imposed cycle marginals. Its indicator is

    1_{Y1=Y2=Y3} = (1+Y1Y2+Y1Y3+Y2Y3)/4.

Therefore the conditioning probability is D/4, where

    D=1+z1*z2+z1*z3+z2*z3 > 0.

Strict positivity follows also because every consistent edge-sign assignment has positive probability. Condition once on this joint event and choose a fair root sign. The two cycle conditions are sufficient for consistent vertex signs on the entire theta, whose cycle-space dimension is two. The resulting vertex distribution is exactly proportional to 3 raised to the number of cut residual edges. It need not optimize the cut of H_C.

For a path Q between two vertices, their sign product is the product of multipliers on Q. Let the four even subgraphs be the empty set and the three cycles formed by pairs of theta paths. Multiplication of sign products takes symmetric difference of physical edges. Consequently

    rho(u,v) = [sum_{A in {empty,C12,C13,C23}} q^{|Q symmetric_difference A|}]/D.

This is independent of the chosen path Q, because another choice permutes the four even-subgraph terms. It is the joint, not single-cycle, correlation formula.

In particular the branch-vertex correlation is

    (z1+z2+z3+z1*z2*z3)/D.

For two vertices on path i separated by d edges, with other paths j,k,

    rho = [q^d(1+z_j*z_k)+q^(l_i-d)(z_j+z_k)]/D.

For internal vertices on distinct paths i,j at distances x,y from the same branch vertex, with third path k,

    rho = [q^(x+y) + q^(l_i+l_j-x-y)
           + q^(l_i+l_k-x+y) + q^(l_j+l_k+x-y)]/D.

These formulas include the branch cases through the same-path expression and exhaust every correlation used below. Setting d=1 gives the same residual-edge correlation along any fixed path. The expected number of uncut residual edges is

    Rcost = L/4 - [3/(4D)] sum_{i<j}(l_i+l_j)z_i*z_j,
    L=l1+l2+l3.

This follows by subtracting q from each edge correlation, using q^{-1}-q=-3/2, and collecting each pair of paths once. It is not the sum of separately conditioned cycle costs.

## 7. All seven-vertex boundary cases

An eligible internal packing edge is a vertex pair which is neither a residual edge nor the endpoints of ANY residual two-edge path. Restricting to pairs at distance at least three is thus necessary for the actual graph. The following lists contain ALL eligible pairs, not a chosen favorable subset. More restrictions from actual packing may remove some; they cannot worsen the upper bound.

Name the branch vertices u,v. Internal vertices of each named path are listed in order from u to v.

### (1,3,4)

Paths: uv; u-x1-x2-v; u-y1-y2-y3-v.

Eligible pairs and correlations:

    x1-y2, x2-y2: -4/131;
    x1-y3, x2-y1: -22/131.

Every other nonedge has a residual two-edge path. With z=(-1/2,-1/8,1/16), D=131/128, and the pair-length sum in Section 6 equal to 5/128,

    Rcost=2-15/524=1033/524 < 7/3.

### (2,2,4)

Paths: u-x-v; u-y-v; u-z1-z2-z3-v.

Eligible pairs and correlations:

    u-z3, v-z1: -7/20;
    x-z2, y-z2: -2/7.

Here z=(1/4,1/4,1/16), D=35/32, and the pair-length sum is 7/16. Hence

    Rcost=2-3/10=17/10 < 7/3.

### (2,3,3)

Paths: u-x-v; u-y1-y2-v; u-z1-z2-v.

The only eligible pairs are y1-z2 and y2-z1; both correlations are -11/61. Here z=(1/4,-1/8,-1/8), D=61/64, and the pair-length sum is -7/32. Hence

    Rcost=2+21/122=265/122 < 7/3.

In all three cases EVERY eligible correlation is negative. Whichever subset is actually in E_P[C], its expected uncut cost is at most p_C/2. Therefore the whole induced graph H_C has expected uncut count at most p_C/2+Rcost < p_C/2+7/3. Equivalently, the assignment's positive-part budget B(C) is bounded by the displayed Rcost, which is below K_C/6 since K_C>=14.

The exact relaxed slacks relative to 7/3 are respectively 569/1572, 19/30 and 59/366. These are exact substitutions into the universal formulas, not claims of packing realizability for the relaxed pairs. Studio independently summed the 128 vertex sign assignments in each of these three fixed graphs and obtained exactly the same normalization and every pair correlation. The proof and complete pair lists make these finite arithmetic entries inspectable without a solver.

## 8. Whole-graph conclusion and the mechanism distinction

For every residual component, Sections 3–7 supply a valid distribution with expected uncut cost at most p_C/2+n_C/3<=p_C/2+K_C/6. Use the assembly lemma to obtain one whole-graph cut with |X|<=2m. This proves the theorem for arbitrary admissible lengths and mixtures of components.

The proposed fixed q=-1/2 positive-part budget has been proved here for the three short theta cases. It has NOT been proved for all long theta components. It need not be: the complete theorem uses a different, permitted distribution there, namely a guaranteed cut of the ACTUAL H_C followed by a fair global flip. This is a mechanism change, not an assertion that the unproved Ising inequality follows from the desired result. All cross-component packed edges are still counted at exactly one-half in expectation.

No maximum packing or maximum cut algorithm was executed. The existence of a guaranteed internal cut follows from the cited classical theorem; no running-time or efficient extraction claim is made for a supplied packing representation.

## 9. A separate sufficient criterion exposed by the proof

For ANY connected residual component, let beta=r_C-n_C+1 be its cycle rank. The same connected-cut bound gives excess over p_C/2 at most

    (n_C-1+2beta)/4.

Thus a sufficient actual-load condition for this component is

    3(n_C-1)+6beta <= 2K_C.

Using K_C>=2n_C, the simpler sufficient condition is n_C>=6beta-3. This algebraic corollary includes some other residual structures, but not all attached-tree, multicycle or higher-rank components. It is recorded as a precise optional criterion, not an exhaustive new classification.

Under the all-empty-private minimal-counterexample load lemma, if every component satisfies that criterion or is one of the explicitly treated small theta cases, a counterexample is impossible. Hence a remaining counterexample packing must contain a component failing the general criterion and not covered by the small exceptions. This necessary condition does not establish that such a component is realizable, nor does it eliminate mixed private families.



The connected-cut bound used in §3 is the Edwards–Erdős theorem.
