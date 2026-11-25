# Excluding four common neighbors inducing a diamond or a cycle

A diamond is the graph obtained by deleting one edge from a complete graph on four vertices. This written theorem and its component proofs are reported in v72, Supplement S60.7.

## Accepted exclusion of common K4−e and C4 under codegree four

**Theorem.** Let G be a finite simple minimal counterexample to τ(G) ≤ 2ν(G) in the subgraph-closed class with maximum degree at most eleven and maximum edge codegree at most four. No edge has four common neighbors inducing K4−e or C4. Minimality may be taken in |V|+|E|; the local lifting uses the equivalent proper-edge induction premise. No selected-edge density tie-break, eleven-regularity or distinct-support hypothesis is needed.

Read the full [diamond proof](diamond.md), [two-sided cycle classification](cycle-sides.md), and [cycle isolate proof](cycle-isolate.md) in that order. The individual notes record the state at submission. The composed chain subsequently passed a separate mathematical review.

## Deriving the actual-link hypotheses

A weak König–Egerváry (WKE) witness in a graph L is a matching M and a vertex set Q such that |Q| ≤ |M| and E(L−Q) ⊆ M. Q may contain matching endpoints. In the actual link at h, pack hxy for xy in M, pay M and the hQ spokes, and delete St(h) ∪ M. Every affected triangle is captured. The component version is valid because component closure fixes every other endpoint of a triangle on its deleted spokes.

Codegree-zero and codegree-one edges give immediate strict reductions, deriving minimum codegree two. Components of order at most four are WKE. Under cap four, the three possible non-WKE five-vertex components K5, K5−e and W4 also reduce: their cone packings use saturation or component closure to control every unpaid deleted edge. The relevant supplied literature proof is reconstructed directly; no degree-ten finite catalogue is imported. Every surviving component therefore has at least six vertices. Degree at most eleven forces a nonempty link to be connected, and WKE lifting makes it non-WKE. This strengthened conclusion uses cap four; it does not upgrade S60.5.2 without that premise.

## Two contacts and the K4−e reduction

The reusable lemma concerns a connected non-WKE link partitioned into a five-vertex core D and at most six private vertices H, with at most two contact edges. Every private vertex has total link degree at least two, and deleting any contacted core vertex leaves a perfect matching in D. If T is the set of contacted private vertices, there exist a matching M in H and Q containing T with

E(H−Q) ⊆ M,                 |Q| ≤ |M|+1.  (T2)

The proof handles orders zero through four directly, then order five and perfect-matchable order six. In the remaining six-vertex matching-number-two case, a free triple with at most one edge supplies Q. If none exists, the free graph is complete minus a matching. The only surviving four-free-vertex configuration constructs a WKE witness for the whole link: combine its free perfect matching, a core perfect matching and one contact edge with a five-vertex cover. This contradicts non-WKE. Thus (T2) follows from the actual graph, not an assumed budget certificate. K4 source §3 contains every small-order and matching choice.

For common core C = {a,b,c,d} inducing K4−ab, let A = N(u)∖N[v] and B = N(v)∖N[u]. Saturation forbids private contacts at c,d and allows at most one at each of a,b on each side. Each side has at most six vertices and its five-vertex core is K5−ab, so (T2) applies. Pack

S0 = {uac, ubd, vad, vbc},       X0 = {ac,ad,bc,bd,cd,uv}.  (T3)

Add hub triangles on M_A and M_B; pay both matchings and the spokes to Q_A,Q_B. With k_A = |M_A| and k_B = |M_B|,

|X| ≤ 6+(2k_A+1)+(2k_B+1) = 2(4+k_A+k_B) = 2|S|.  (T4)

The two private sets are disjoint. The contacts meet Q, residual private edges meet Q or belong to M, and all common-core edges are paid. These cases exhaust endpoint triangles. All off-star packed edges are paid; arbitrary A–B edges and shared outside witnesses introduce no unpaid boundary. Deleting both endpoint stars together with the payment edges strictly reduces G. This proves the common-K4−e exclusion.

## C4 side admission and the isolate remainder

For C = c0c1c2c3c0 the alternating four-triangle core costs five payments. Each actual private side has at most six vertices and at most four contacts, one per common vertex. A matching/cover argument gives private loss |Q|−|M| ≤ 2. The stronger two-contact lemma gives loss at most one when applicable. A specialized six-vertex Gallai–Edmonds argument classifies the matching-number-two, no-isolate cases into a two-cover case, a triangle plus a star center, or two triangles. It is a consequence of the standard theorem, not a new assumed catalogue.

Two explicit alternative cores handle the remaining profile pairs: a triangle on uv with four opposite paid spokes, or the same four spokes without a core triangle. Uniform loss, the at-most-three-contact reduction and the no-isolate profiles exhaust those branches. An isolate with three or four contacts also reduces, using actual common neighborhoods when re-rooting. The remaining case has four contacts on each side and a two-contact isolate on at least one side.

The isolate-side classification treats small rooted-WKE blocks and the five-vertex alternatives explicitly. The accepted I/J/P/T tables include actual exposed-port matchings and residual covers. Combining the permitted anchor sets eliminates one-sided isolates, two isolates on one side, adjacent contact pairs and nonaligned profiles. Only aligned opposite I/I, I/J, J/I and J/J pairs survive this admission, each with one isolate per side. These letters refer to the exact graphs defined and tabulated in the accepted isolate source §4; they are not arbitrary side labels chosen after observing a successful packing.

## Switchable payments and exhaustive outside augmentation

If j sides have type J, the admitted base contains 10+j triangles and 21+2j payments, leaving exactly one unit of deficit. Two opposite anchors have switchable pairs of unused but already-paid spokes. A real cross edge between the two isolates adds one triangle for one payment and closes the deficit; its existence is not presumed.

In the no-cross-edge branch, an anchor c has exactly six known neighbors: u,v, its two cycle neighbors k,l, and the two private isolates p_A,p_B. Thus its actual outside-neighbor set R has at most five vertices. This is not the isolates' potentially eight-vertex support set. Minimum codegree forces both isolates to attach into R, and the existing common-neighbor counts bound all attachment capacities.

Choose a matching M using edges of R and edges from one of the unused spoke pairs into R, with a residual-cover set Q in R. The added triangles are centered at c and use no base-packed spoke. The new deletions are only cR spokes and paid edges; no support vertex or its entire star is removed. Capture follows from the actual anchor neighborhood. The combined deficit is at most

1+|Q|−|M|,  (T5)

so a strict WKE witness or an attached WKE-exposed vertex supplies the missing gain. Exposure is compatible with membership in Q. Because either paid pair can be left unused, the test constrains all four attachment vertices.

The accepted outside-neighborhood argument exhausts disconnected R, leaves, orders three and four, and connected order five. Disconnected cases yield exposed isolates or strict two-vertex witnesses. Leaves and triangles expose a vertex. For order four, C4, diamond and K4 are handled by their actual attachment patterns and whole-link WKE alternatives. At order five, non-WKE R is K5, K5−e or W4: attachment capacities exclude K5; K5−e re-roots to the already proved common-K4−e exclusion; W4 re-roots only to the earlier C4 side-admission result, whose opposite side has no isolate. It does not invoke the final C4 exclusion circularly. The WKE order-five cases split according to whether an attachment lies in a WKE cover; the remaining rooted table leaves only the explicitly treated I and J graphs. Their displayed whole-link witnesses complete the exhaustion.

Every re-root identifies a complete actual common neighborhood and entire private side. WKE alternatives are separate strict reductions, not additions to a possibly colliding base. This closes the previously unresolved double-wheel propagation as part of the whole common-C4 chain. The exact tables, witnesses and acyclic dependency checks remain in the accepted sources and detailed review.
