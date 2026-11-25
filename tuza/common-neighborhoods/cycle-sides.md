# Common C4: a structural checkpoint on the full two-side problem

Date: 2026-11-01. Status: new paper derivation, independent acceptance pending. No Lean claim, enumeration claim, or claim that the entire common-C4 class is closed.
1. Result and exact remaining domain
Work in a hypothetical minimal counterexample to Tuza's inequality with maximum degree at most eleven and maximum edge codegree four. Use the inherited low-incidence, WKE, small-component and strict-lifting facts. Use the supplied common-K4-minus-edge theorem only as a paper input pending independent acceptance.

Let uv be any edge whose four common neighbors induce C=c0c1c2c3c0. Put A=N(u)\N[v] and B=N(v)\N[u]. No selection or tie-breaking assumption is needed for the reductions proved below.
Structural theorem obtained
The following cases are excluded:
1. Either private side has at most three contact edges to C.
2. Neither private graph has an isolated vertex.
3. An isolated private vertex has three or four contacts to C.
Consequently every surviving common-C4 edge must have four contact edges on each side and an isolated private vertex with exactly two contacts on at least one side. On a side containing such an isolate, the contact multiplicities are (2,2) or (2,1,1). All statements concern the actual private graphs and actual contacts.

In particular, the theorem excludes all wheel/wheel, wheel/B6, and B6/B6 pairs, every contact bijection, and all other pairs with four distinct contact vertices on both sides. Here B6 is the supplied K3,3-plus-edge graph. It also excludes the repeated-contact cases when both private graphs have no isolates; the named examples are not used as an exhaustive list.

The entire common-C4 class remains open. The remaining domain is the quantified isolate domain above, with arbitrary permitted private edges, A–B edges and outside supports. Section 9 gives a concrete simultaneous pattern in that domain and an additional reduction when one particular A–B edge is present. It is not asserted to exhaust the domain or to extend to a minimal counterexample.
2. Inputs, notation and the actual reduction contract
Every actual edge has codegree at least two: an edge in no triangle can be deleted, and an edge in a unique triangle reduces by packing that triangle and paying its other two edges. The global cap is four.

Every actual link is connected and non-WKE. The connectivity deduction uses the existing exclusion of WKE components of order at most four and of five-vertex components under cap four. Thus surviving components have at least six vertices, and a link on at most eleven vertices cannot have two. This does not assert eleven-regularity or import the degree-ten selected degree table. See Puleo, Definition 4.1, Lemmas 4.3–4.4 and Corollary 4.9; Kandasamy, Lemmas 2.3 and 3.4.

For one endpoint h, write D={k}∪C for the five-vertex wheel in its link, H for its entire private graph, and T for the set of private vertices with contacts. Write s=|E(C,H)| and t=|T|. Every rim vertex has at most one H-contact: edge hc already has k and both cycle neighbors as common neighbors. Therefore s≤4 and |H|≤6. For each p∈H,
2 ≤ d_H(p)+|N(p)∩C| ≤ 4.                         (2.1)
In particular, a contact-free private vertex has internal degree at least two; a vertex with exactly one contact is not isolated; a vertex with three contacts has internal degree at most one; and a vertex with four contacts is isolated.

A WKE witness in L is a matching M and a vertex set Q with |Q|≤|M| and E(L−Q)⊆M. We use this definition literally, including when Q contains endpoints of M.

For a two-endpoint reduction let F be the union of the actual stars at u and v. Construct an edge-disjoint triangle packing S and one actual edge set X satisfying:
|X|≤2|S|;   E(S)\F⊆X;   every triangle using F meets X.       (2.2)
Then G'=G−(F∪X) has fewer edges, every packed edge is absent from G', and
ν(G)≥ν(G')+|S|,     τ(G)≤τ(G')+|X|.
Strict induction gives the contradiction. All constructions below delete only the endpoint stars, except when invoking an existing WKE reduction. Every packed private, contact or internal-triangle edge outside the stars is explicitly paid. A–B edges lie in no triangle through u or v. Extra outside triangles using a paid edge are already hit by that edge. No outside support is charged independently, and support identities may coincide.

The inherited two-contact lemma is the lemma in the supplied K4-minus-edge paper input, not a Lean declaration. Its hypotheses are: D has five vertices; H has at most six; at most two contacts; every H-vertex has total link degree at least two; D−α has a perfect matching for each contact anchor α; and the whole link is connected and non-WKE. Its conclusion is a matching M in H and Q⊇T with
E(H−Q)⊆M,       |Q|−|M|≤1.                       (2.3)
It applies to D=W4 as well as to the D used in that paper. We do not repeat its proof here.
3. Shared constructions and two matching facts
3.1 The original four-triangle construction
Take
S0={u c0 c1, u c2 c3, v c1 c2, v c3 c0},
X0=E(C)∪{uv}.
For each side use a matching M_H and Q_H⊇T_H with E(H−Q_H)⊆M_H. Pack the hub triangles on M_H; pay M_H and the spokes to Q_H. The private loss is |Q_H|−|M_H|. This reduces whenever the two losses sum to at most three.

We also allow an explicitly specified private packing containing internal triangles. Its loss means |X_H|−2|S_H|, with every contact covered by a private spoke. The same sum-at-most-three test remains valid.
3.2 A different core: one triangle on uv
Choose c0, rotating the cycle if necessary. Pack uv c0 and pay
Y={u c0,u c2,v c1,v c3}.                          (3.1)
These four spokes cover all triangles on uv and all cycle triangles at either endpoint. The side at u is called the unrequired side at c0: its contact at c0 is already covered. The side at v is the required side at c0: its contact at c0 must be covered by the private payments. Private packings must avoid the two used spokes u c0,v c0.

If each side has a packing and payments with benefit 2|S_H|−|X_H|≥1, the two side benefits pay the core deficit 4−2=2. This is a concrete assembly rule; admission to it is proved below.
3.3 A core without a triangle on uv
Pay the same four opposite spokes, but pack no core triangle. If both sides supply benefit at least two, the four core payments are affordable. All contact triangles may now be used, provided their hub spokes are distinct.
3.4 Completion inside the five-vertex wheel
Let D=W4 have center k and rim C. For any anchor α∈C and any set R⊆C of size at most two, there is a perfect matching M_D of D−α and a three-element set Q_D containing R with E(D−Q_D)⊆M_D.

If α∈R, choose any perfect matching of D−α, and let Q_D be α together with the endpoints of its edge containing the other required anchor. If R={β,γ} avoids α and βγ is a cycle edge, let δ be the remaining rim vertex and use M_D={kδ,βγ}, Q_D={α,β,γ}. If β and γ are opposite, use Q_D={k,β,γ}; the two remaining rim vertices are independent, so any perfect matching of D−α works. Sets R of smaller size can be enlarged.

We also use the following version for three anchors. Three rim vertices induce a path. If α is an endpoint of that path, a perfect matching of D−α consists of k joined to the missing rim vertex and the edge between the other two contacted vertices. Taking Q_D to be the three anchors gives the required residual matching.
3.5 Six vertices, no isolates, matching number two
Such a graph H has at least one of the following descriptions:
- It has a vertex cover of size two.
- It has a triangle R and a vertex z outside R such that every other edge is incident with z.
- It is two disjoint triangles.
This is a direct Gallai–Edmonds consequence, not a new classification theorem. Let D_GE be the vertices exposed by some maximum matching, A_GE their external neighborhood, and R_GE the remainder. Deficiency two gives q(D_GE)=|A_GE|+2. Since H has six vertices, |A_GE|≤2. If |A_GE|=2, all four D_GE-components are singletons and A_GE covers the graph. If |A_GE|=1, either there are three singleton components and a two-vertex perfect remainder (giving a cover of size two), or a triangle and two singleton components (giving the triangle-and-star description). If |A_GE|=0, the no-isolate condition leaves two triangles. The standard theorem and its use in this literature are recorded in Kandasamy, Lemma 3.6 and reference [5].
4. A uniform two-unit bound for any actual private side
Lemma 4.1
Under (2.1), s≤4, |H|≤6 and a connected non-WKE whole link D∪H, there are M,Q with Q⊇T, E(H−Q)⊆M and |Q|−|M|≤2.

Proof. At order at most three, take all vertices in Q and one edge in M when the order is three. An edgeless three-vertex H would require at least six contacts. Orders zero, one and two are immediate.

At order four, a two-edge matching and Q=V(H) work. If the matching number is one and t≤3, take Q of size three containing T. The only remaining possibility is a three-leaf star with all four vertices singly contacted. This makes the whole link WKE: put the star center in Q_H, match it to a leaf, and cross-match a different leaf whose anchor is an endpoint of the three-anchor path formed by the leaf anchors. Let Q_D be those three anchors; the core matching consists of the center of D joined to the star-center anchor and the edge between the two remaining leaf anchors. The resulting matching and cover both have size four. The cross leaf can be chosen first, and the star matching uses a different leaf.

At order five with matching number two, leave any contact-free vertex outside Q, giving |Q|=4. Such a vertex exists because t≤4. Matching number one forces either a four-leaf star using all four contacts on the leaves, or a triangle with two isolates. The latter has an uncontacted triangle component, contradicting link connectivity. For the star, let Q_H be its center and Q_D consist of the wheel center and two opposite rim vertices. Cross-match the other two rim vertices to their leaves, match the private center to one remaining leaf, and match the core center to a retained rim vertex. This is WKE with matching and cover of size four. Other stars with isolates require more than four contacts.

At order six the matching number is at least two: a star with five leaves violates the private degree/contact bounds, and triangle-plus-isolate possibilities require too many contacts. A perfect matching works with Q of size five, omitting any contact-free vertex.

Suppose the matching number is two. We seek two contact-free vertices W such that H[W] is empty or is an edge contained in a two-edge matching; then Q=V(H)\W has size four. A nonadjacent free pair works. If the free set is a clique of order at least four, two disjoint free edges work. If it is a triangle, an edge incident with a contact vertex is disjoint from some free edge; such an edge exists because three isolated contact vertices would require six contacts.

The only remaining obstruction has exactly two free vertices f,g, with fg an edge that cannot occur in a two-edge matching. The four contact vertices are independent, each is singly contacted, and each is adjacent to f or g. Each of f,g has at most three contact-vertex neighbors, by (2.1).

If some opposite pair of rim anchors corresponds to private vertices matchable to f,g, use those two private matching edges, cross-match the other opposite pair, and use one core edge from its center to a retained anchor. Take Q_H={f,g} and Q_D equal to the core center plus the retained opposite pair. This gives matching and cover of size five.

Otherwise each opposite pair of contact vertices has the same unique free neighbor. The two pairs must use different free neighbors, since four neighbors together with fg would violate (2.1). Label the rim cyclically 1,2,3,4, with t1,t3 adjacent only to f and t2,t4 only to g. A WKE witness is
M={g t4, f t3, c1 t1, k c2, c3 c4},
Q={f,t2,c1,c3,c4}.
All five matching edges are disjoint, and the only edges left outside Q are among those displayed. This contradiction finishes the proof. ∎
5. Three or fewer contacts cannot survive
Lemma 5.1
If either actual private side has at most three contacts, the common-C4 edge is reducible or an actual link is WKE.

For at most two contacts, use (2.3), Lemma 4.1 on the other side and the original core construction. We give the additional three-contact proof, including its exceptions.

Call a matching witness with loss at most one affordable. Put F_H=V(H)\T.
5.1 Orders at most four
If t≤2, choose Q containing T of size at most two and leave a free pair outside Q at order four; use its edge if present. At order three leave a free vertex outside Q. The degree condition ensures the necessary edge exists. If t=3 and |H|=4, a perfect matching gives Q of size three and an affordable witness. Without a perfect matching, the only nontrivial possibility is a three-leaf star, singly contacted on its leaves. Take Q_H equal to its center, a star edge in M_H, and cross-match a different leaf at an endpoint of the contacted three-rim path. The core matching from §3.4 gives WKE with |M|=|Q|=4.

At order three with t=3, H is a path or triangle. For a path, put its center in Q_H and expose a leaf whose anchor is an endpoint of the contacted three-rim path; at least one of its two leaf anchors is such an endpoint. For a triangle, expose any desired contact vertex and put that vertex in Q_H. Add one cross edge and the core matching. These again give WKE. A triangle plus an isolated private vertex at order four, when compatible with three contacts and connectivity, has two contacts at the isolate and one at a triangle vertex; it is affordable by putting the isolate and that triangle vertex in Q and using the opposite triangle edge.
5.2 Order five
The matching number is two. With t≤2, the same free-pair argument as in the supplied two-contact lemma works: a nonadjacent pair is immediate; a free clique of order at least four supplies disjoint edges; for a free triangle some edge incident with a contact vertex extends an edge of that triangle. Two isolated contact vertices would require four contacts.

If t=3, all contacts are single and there are two free vertices. A nonedge between them, or a free edge in a two-edge matching, is affordable. Otherwise the free vertices are adjacent and the three contact vertices are independent. Take Q_H to be the two free vertices. A maximum matching exposes at least two different contact vertices: exchanging an edge along a contact from an exposed vertex exposes another. Hence some exposed contact has an endpoint anchor in the three-rim path. Cross it to that anchor and complete in D. The resulting matching and cover have size five, so the whole link is WKE.
5.3 Order six with a perfect matching
With at most two contact vertices, some matching edge is free–free; leave its endpoints outside Q to obtain loss one. With three contacts, leave a nonadjacent free pair outside Q, or an edge of a perfect matching lying in the three free vertices.

If neither is possible, the three free vertices form a triangle and no free edge occurs in a perfect matching. Every perfect matching therefore matches all three free vertices to T. Also T is independent: an edge between two vertices of T, the matching edge at the third, and the remaining free edge would give a forbidden perfect matching using a free edge.

Use the three hub triangles from a perfect cross matching and the internal free triangle. Pay their six off-hub edges and the three spokes to T. This is four packed triangles and nine payments, hence private loss one. All contacts are captured by those three spokes. It combines with Lemma 4.1 on the other side.
5.4 Order six with matching number two
If three free vertices induce at most one edge, leave that triple outside Q. If there is one edge, its third vertex has an edge disjoint from it because its internal degree is at least two. Thus this is affordable.

Otherwise the missing edges on the free set form a matching. A free set of size at least five would force the sole contact vertex to be isolated and disconnect the uncontacted free block from D. With four free vertices, write the contact vertices p,q.

If both have private neighbors, the argument from the supplied two-contact lemma gives a perfect matching M_F on the four free vertices and a two-set Q_H of free vertices with E(H−Q_H)⊆M_F. For completeness: pq is absent; if N_H(p)=N_H(q)={f}, take for Q_H the endpoints of the matching edge containing f. Otherwise distinct r∈N_H(p), s∈N_H(q) must have a nonadjacent complementary free pair, and the complement-matching condition forces N_H(p)∪N_H(q)⊆{r,s}; take Q_H={r,s}. Both p and q are exposed by M_F. Choose an endpoint among the three contacted rim anchors, cross its private vertex, and take Q_D to be all three anchors. This gives WKE of size five.

If p is isolated, it has two contacts, and q has the third. The other five private vertices form a connected graph K. If K is WKE, use its witness (matching size two, cover size at most two), cross p at one of its two anchors, and complete D with Q_D equal to all three contact anchors. Choose the p-anchor so that the other two anchors are adjacent; one of its two anchors is an endpoint of the three-anchor path. This is a whole-link WKE witness.

If K is not WKE, the existing connected five-vertex classification gives K5, K5−e or W4. K5 violates the spoke cap at q. K5−e produces a common-K4-minus-edge edge at u and a universal vertex of K; this is where the supplied paper K4-minus-edge theorem is used. For W4, q is a rim vertex, since its center already has internal degree four. Re-root at the edge from u to that center. Its common graph is the private rim C4, and its private set at u is the old D together with p. There is only one contact from this new private set to the new common cycle, namely the old contact at q. The two-contact lemma supplies loss at most one; the other new private side has loss at most two by Lemma 4.1. This is an actual new endpoint reduction, with no selection comparison or assumption on overlapping supports.

It remains to consider three free and three singly contacted vertices. H has no isolates, so apply §3.5.
- If a two-vertex cover consists of two free vertices, the third free vertex is adjacent to both. Match the cover to that free vertex and one contact vertex, exposing any chosen other contact vertex. Choose its anchor at an endpoint of the three-anchor path, cross it, and use Q_D equal to all three anchors.
- If the cover consists of one free and one contact vertex, match it to the other two free vertices. The other two contact vertices are exposed. Cross either one and use §3.4 for their at most two required anchors.
- A cover consisting of two contact vertices would have to meet all three free vertices at each of its vertices, exhausting their allowed internal degree and leaving the third contact vertex isolated. This is impossible.
- In the triangle-and-star form, its two vertices outside the triangle and star center are leaves, hence contact vertices. Put the center and a suitable triangle vertex in Q_H, choosing the third contact vertex when it lies in the triangle. Match the opposite triangle edge and the center to one leaf; cross the other leaf. At most two contact anchors remain to be included in Q_D.
- For two disjoint triangles, connectivity gives a contact in each. Choose one such vertex from each triangle for Q_H and use the opposite edges for M_H. Cross one of the exposed chosen vertices and use §3.4.
Every case gives an affordable private construction or a WKE whole link. Combining with Lemma 4.1 proves Lemma 5.1. ∎
6. All pairs without isolated private vertices
We now prove actual admission for every pair with no isolated vertex in either private graph. By Lemma 5.1 assume s=4 on each side. Distinguish s (four edges) from t (one to four vertices).

We use five outcomes for an actual side. These are constructions proved below, not assumptions imposed on an abstract side.
Outcome	Construction supplied
Affordable	Private loss at most one in §3.1, including the internal-free-triangle variant.
Strong	A four-distinct-contact construction of benefit at least two with no core triangle. It also gives an unrequired UV-side construction at every anchor.
Three-anchor	A required and unrequired UV-side construction of benefit at least one on at least three of the four anchors.
Universal	A required and unrequired UV-side construction of benefit at least one at every anchor.
Doubled-port	Three contact vertices p,q,r, p doubly contacted; a required/unrequired UV construction at both p-anchors, plus the no-core-triangle construction specified below.


An affordable side combines with any other side by Lemma 4.1. A WKE link is already a contradiction.
6.1 Four distinct contact vertices
Write them a0,a1,a2,a3 according to their distinct anchors.

Private order four. At anchor c0 omit its contact triangle and pack the other three. If H−a0 is not a triangle, cover it with at most one vertex, and pay the hub spokes at a0 and that cover. This gives three triangles and at most five payments. If H−a0 is a triangle, also pack and pay that internal triangle, and pay the spoke at a0: four triangles, seven payments. Both required and unrequired constructions work at every anchor.

Private order five. Let f be the unique free vertex. It has degree at least two. If N_H(f)={x,y}, let the other contact vertices be z,w. Put Q_H={x,y}. If zw is an edge, use M_H={zw,fx}; otherwise z has a neighbor among x,y, say x, and use M_H={zx,fy}. In both cases f is matched, one contact vertex is exposed, and E(H−Q_H)⊆M_H. Cross the exposed contact and apply §3.4 to the anchors of z,w. This gives a WKE witness with matching and cover of size five.

Otherwise f has at least three neighbors. Every anchor of a neighbor a0 is good in both UV orientations. Pack the other three contact triangles and hfa0. If H−a0 is not K4, take a vertex cover of that graph of size at most two and add a0 to it. Paying those at most three spokes and fa0 gives four triangles and at most seven payments. If H−a0=K4, the other three contact vertices already have internal degree three, so a0 has only f as a private neighbor. Pack their internal triangle as well, pay its three edges, and use the two spokes hf,ha0. This gives five triangles and nine payments. Hence this is a three-anchor side.

Private order six. There are two free vertices f,g. If a perfect matching exists and either fg is absent or it belongs to a perfect matching, take Q=T and obtain loss at most one.

If the matching number is two, apply §3.5. Pack all four contact triangles. A vertex cover of size two gives benefit at least two by paying its spokes. A triangle with all other edges incident with z gives benefit two by additionally packing/paying that internal triangle and paying hz. Two disjoint triangles give benefit two by packing/paying both internally. These are strong constructions.

If there is a perfect matching but fg belongs to none, the graph on T has matching number at most one. If it is a star with possible isolates, pack all four contacts and hfg; pay fg and the spokes at f,g and the star center. There are five triangles and at most eight payments. If it is a triangle and isolate, also pack/pay the internal triangle and pay only hf,hg: six triangles and ten payments. Again these are strong constructions.

A strong construction uses four contact triangles. Dropping the triangle at any chosen c0 and its contact-edge payment reduces the benefit by exactly one. On the unrequired side the missing contact is already covered by hc0 in (3.1). This supplies the promised unrequired construction at every anchor.
6.2 Three contact vertices: multiplicities (2,1,1)
Let p be the double-contact vertex and q,r the single-contact vertices.

At order three H is a path or triangle. For a triangle, put p in Q_H, use the opposite edge as M_H, and cross p; the two other anchors are handled by §3.4. For a path with center p, put its center in Q_H, match it to one leaf and cross the other, again with at most two required anchors. If p is a leaf, expose it, put the center in Q_H, and cross p at an endpoint of the three-anchor path consisting of all leaf anchors. These are WKE witnesses.

At order four, a perfect matching is affordable with Q=T. If the matching number is one, the no-isolate condition forces a three-leaf star. Its leaves are the three contact vertices. Choose an opposite pair of rim anchors contacting distinct leaves; such a pair exists because there are three contact vertices. Cross-match those two leaves, match the star center to the third, and match the core center to a retained rim vertex. With Q_H the star center and Q_D the core center plus the retained opposite pair, this is WKE of size four.

At order five, let f,g be free. A nonedge fg, or fg in a two-edge matching, is affordable with Q=T. Otherwise fg is present and H[T] is independent. This is the doubled-port outcome: all remaining private edges run from {f,g} to {p,q,r}.

At an anchor c0 of p, pack the contact at its other anchor and the contacts at q,r, together with hfg. Pay the three contact edges, fg and hf,hg. This gives four triangles and six payments. On the required side add hp, giving seven payments; on the unrequired side hc0 already covers the missing contact. Both have benefit at least one.

There is also a construction with no core triangle. If the pair of paid core spokes on this side contains at least one p-anchor, leave that contact unpacked and pack the other three contacts plus hfg. Pay their four off-hub edges and hf,hg. Benefit is two.

At order six with a perfect matching, the free-pair argument in §5.3 works unchanged. In its exceptional case the free triangle and a perfect matching to T give the same four-triangle, nine-payment affordable construction. The doubled contact is covered by its one paid private spoke.

At order six with matching number two, use §3.5. In the two-free-vertex-cover case, the third free vertex is adjacent to both cover vertices. Choose an opposite pair of rim anchors contacting different private vertices; such a pair exists. Cross those vertices and match the free cover to the third free vertex and the remaining contact vertex. Put the free cover in Q_H, and put the core center and retained opposite pair in Q_D. Add one core matching edge. This gives WKE of size five.

If the cover is one free vertex and one contact vertex, match it to the other two free vertices. Both other contacts are exposed. If the doubled vertex is in Q_H, at most two anchors require core coverage and §3.4 applies. Otherwise the three anchors outside Q_H form a path; cross an exposed vertex at an endpoint anchor and use the three-anchor version of §3.4. A two-contact-vertex cover is impossible: either it contains p and exceeds p's allowed internal degree, or the two single-contact cover vertices are saturated by their three free neighbors and leave p isolated.

For the triangle-and-star form, the two leaves are contact vertices. If p is the star center or is in the triangle, choose Q_H to contain p and the star center, using a suitable triangle vertex in the former case. At most two anchors remain. If p is a leaf, match the star center to the other leaf and expose p; choose its cross anchor at an endpoint of the three-anchor path formed by the leaf contacts. Choose the triangle vertex for Q_H to contain the third contact when needed. For two disjoint triangles, choose Q_H to contain p and a contact in the other triangle; take the two opposite triangle edges and cross an exposed chosen contact. These are again whole-link WKE witnesses. Thus no additional outcome occurs.
6.3 At most two contact vertices, with no private isolates
A vertex with four contacts would be isolated, so t≥2. At orders at most five, the free-pair argument from §5.1–5.2 is affordable. At order six a perfect matching is affordable because it contains a free–free edge. If the matching number is two, a free triple with at most one edge is affordable; otherwise the four free vertices induce K4 with a matching removed.

The private contacts p,q have private neighbors. The construction in §5.4 supplies a perfect matching M_F and a free two-set Q_H with E(H−Q_H)⊆M_F. If an opposite pair of rim anchors contacts distinct vertices p,q, cross those two contacts, use M_F and one core matching edge, and take Q_D to be the core center plus the retained opposite pair. This is WKE of size five.

This opposite-pair condition always holds for multiplicities (3,1), and for an adjacent (2,2) partition. The sole remaining assignment gives p one opposite pair and q the other opposite pair.

For that assignment, at any chosen c0 pack one contact at p and one at q, avoiding c0, and the two hub triangles on M_F. Pay their four off-hub edges and the two spokes to Q_H. On the unrequired side c0 is covered by the core; at most one other unpacked contact needs a private spoke. On the required side pay the spoke at the vertex contacting c0; the other vertex has its remaining contact at a core-paid anchor of the opposite parity. Thus at most one further spoke is needed in either orientation. This is four triangles and at most seven payments, a universal outcome.
6.4 Combining the admitted outcomes
The preceding cases are exhaustive in n=|H|≤6 and t=|T|≤4 under the no-isolate hypothesis.
- An affordable side combines with any other side by Lemma 4.1 and §3.1.
- Two strong sides combine by §3.3.
- A strong side supplies an unrequired UV construction at every anchor, so it combines with any of the three other non-affordable outcomes at a required good anchor of the latter.
- A universal side combines by the UV construction with any other outcome having a good required anchor.
- Two three-anchor sides have a common good anchor because both good sets have size at least three.
- A three-anchor side and a doubled-port side have a common good anchor because their good sets have sizes at least three and two in a four-element set.
- Two doubled-port sides combine by UV if their double-port anchor pairs intersect. If the pairs are disjoint, choose opposite paid core pairs so that each side's paid pair meets its own double-port anchors. This is possible for complementary adjacent pairs and for complementary opposite pairs. Use the benefit-two construction from §6.2 on both sides and §3.3.
All combinations have one union of actual payments and edge-disjoint actual triangles. This proves the no-private-isolate theorem. ∎
7. Isolated vertices with three or four contacts
Let p be isolated in H. By (2.1) it has at least two contacts.

If it has four, no other private component can meet D: all contact slots are used by p. Connectivity forces H={p}. Its matching loss is one, so Lemma 4.1 closes the pair.

If it has three, relabel its anchors c3,c0,c1. Consider the actual edge u c0. Its common neighbors are exactly {v,c3,c1,p}, inducing the cycle v−c3−p−c1−v. Its private set at u is (A{p})∪{c2}. The vertex c2 has exactly three contacts to this new cycle, namely v,c3,c1. No vertex of A{p} contacts it: p is isolated, and c3,c1 have already used their original private contact on p. Thus this new C4 edge has a side with exactly three contacts and is excluded by Lemma 5.1.

This re-rooting is a direct application of a reduction at another actual edge. It is not a tie-breaking descent. The other new private set and any overlap with the old opposite side are covered by the same actual-graph lemmas.

Therefore every isolated private vertex in a survivor has exactly two contacts.
8. A short explicit reduction for all three named pairings
The general theorem already covers the named hard cases, but the following smaller construction records the decisive exchange.

Each wheel or B6 side has four distinct contacts a0,…,a3. At c0 use the UV core (3.1). On each side pack the three contact triangles indexed 1,2,3.

For a private wheel with center α, additionally pack hαa0. Pay αa0 and three private spokes forming a vertex cover of the wheel containing a0: take α, a0 and the rim vertex opposite a0. This works for every contact bijection; “opposite” refers to the private wheel's rim, not to the labels on C.

For B6, use its free edge f1f2. Pack hf1f2, pay f1f2, and pay the three spokes to the bipartition class of the K3,3 containing a0. That covers every private edge after f1f2 is paid, and covers the omitted contact when required.

There are
|S|=1+4+4=9,
|X|=4+7+7=18.
Every packed edge outside the endpoint stars is one of the paid contact or private edges. The core payments cover every triangle using uv or two cycle vertices. Private-spoke covers capture the remaining endpoint triangles. No wheel center, common vertex or support vertex is deleted. This closes W/W, W/B6, B6/W and B6/B6 regardless of outside support identities and permitted A–B edges.

The selected-edge inequalities e(Z)≥8 and e(Z)≥10 from the starting note remain correct under their stated wheel hypotheses, but are unnecessary for these reductions.
9. A remaining simultaneous pattern and a genuine cross-side exchange
This section identifies a mathematical obstruction still requiring work. It is not a claim that the pattern is globally realizable with all counterexample properties.

On each side take six vertices p,q,a,b,x,y, with p isolated and
E(H)={ax,ay,aq,bx,by,bq,xy}.
Thus H−p is K2,3+xy with parts {a,b} and {x,y,q}. Give p contacts to c0,c2 and q contacts to c1,c3. Use this same orientation on both sides, writing subscripts A,B when necessary. Both endpoint degrees are eleven.
9.1 Why it survives the structural theorem
The private spoke codegrees are 2 at p, 4 at q and 3 at a,b,x,y, within the required range. All four contact slots are used. The whole endpoint link is connected.

The original matching loss is exactly two. Since p is isolated, the matching number is two. Loss at most one would require |Q|≤3 with p,q∈Q; leaving three of the diamond {a,b,x,y} outside Q leaves two incident edges, impossible for a residual matching. Loss two is attained, for example by Q={p,q,a,b}, M={xy,aq}.

The whole endpoint link is non-WKE. The core wheel requires at least three vertices in any Q leaving a matching. The five-vertex block K=H−p requires at least two, so a WKE witness on eleven vertices would have exactly three core vertices and two K-vertices in Q, with p outside Q. In K the unique two-set whose deletion leaves maximum degree at most one is {a,b}: deleting any other pair leaves two incident edges. Thus q is outside Q. If the core center is outside Q, the sole remaining rim vertex has an edge to that center and its contact vertex, impossible. If the center is in Q, the other two remaining rim vertices are either adjacent, giving their cycle edge together with contacts, or opposite, giving two contact edges incident with the same p or q. Again the residual is not a matching.

This proves failure of the cheap-side and WKE mechanisms for the pattern. It does not prove failure of every endpoint reduction, much less irreducibility in the ambient graph.
9.2 If p_A p_B is an actual edge, the pair reduces
There is a useful new cross-side exchange. Begin with the following ten triangles:
u c0 c1,   v c0 c3,
u p_A c2, u q_A c3, u a_A x_A, u b_A y_A,
v p_B c2, v q_B c1, v a_B x_B, v b_B y_B.
Pay E(C)∪{uv}, and on each side pay its two packed contact edges, a_H x_H, b_H y_H, the spokes at x_H,y_H,q_H, and the unused contact p_H c0. This gives 21 payments. They cover all endpoint triangles; for p_H, its two contacts have both been paid, so its spoke need not be paid.

If p_A p_B exists, add the triangle c0 p_A p_B and pay p_A p_B. Its two contact edges are already paid and unused by the ten triangles. The result is
|S|=11,       |X|=22.
It satisfies (2.2). This counts one actual payment union and uses the A–B edge only when it really exists.
9.3 What is not supplied by the local pattern
Each contact edge p_H c0 or p_H c2 currently has only the original hub as a common neighbor. Minimum codegree two therefore requires further support outside that hub's neighborhood. The edges a_H q_H, b_H q_H and q_H c1,q_H c3 also require support. Those witnesses can coincide, can belong to the opposite private side, or can be elsewhere.

The explicit cross-side exchange closes one useful way in which the missing supports can occur. It does not prove that such an edge must exist. Distinct outside supports can respect the immediate degree budgets; no contradiction or exhaustive exchange for those possibilities is established here. Deleting the isolated private vertices themselves would expose their whole actual boundary, and the present proof does not have an affordable capture of that boundary.

This is the remaining structural issue: force a joint reduction from the actual support networks of isolated private contact vertices, or prove that all those networks cannot coexist with connected non-WKE links and the degree/codegree bounds. The local loss-two pattern is an obstruction to specific mechanisms, not an exhibited minimal-counterexample candidate.
10. Scope, overlap and assurance
The new result is the reduction of the full C4 target to the double-contact-isolate domain, together with the explicit exchanges and the proof of the no-isolate classification. It is a paper derivation requiring independent acceptance.

Puleo's WKE definition and lifting rule are existing results. The five-vertex non-WKE classification, complement-matching observation and use of Gallai–Edmonds are existing ingredients; they are not claimed as new. Kandasamy's Lemma 3.6 also develops matching/cover and contact exchanges for a five-vertex private set. The constructions here extend the argument to the stated two-side and six-vertex admission problem, but this bounded source comparison is not a publication-priority claim.

The supplied two-contact lemma and common-K4-minus-edge theorem retain their paper, acceptance-pending status. The latter is used in §5.4; it is not silently promoted to an accepted formal result. The nine-triangle named-pair construction and the no-isolate constructions themselves do not invoke a codegree-five cap or a degree-ten enumeration.

No exhaustive closure is asserted for the remaining isolate domain. No arbitrary label transport is substituted for actual graph admission. No completion percentage is assigned. Closing even the whole C4 domain would leave the paw, lower-density common cores and other global codegree branches.
