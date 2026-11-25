# A structural reduction for the entire K4-minus-edge common-core class

Research note — 1 November 2026. Status: complete paper argument developed in this session; not independently reviewed, accepted into the campaign, or Lean-checked.
1. Result and scope
The selected common-core K4-e class can be eliminated by a uniform paper reduction. The proof does not use maximum common-core density, either private-edge tie-break, or eleven-regularity. It applies to any codegree-four edge with this common graph under the hypotheses below.

The new ingredient is a small structural lemma: a private graph on at most six vertices, attached to a suitable five-vertex core by at most two edges, has a matching cover costing at most one more than its matching size, unless the whole endpoint link is WKE. The difficult six-vertex matching-number-two case produces an explicit WKE witness, rather than an unproved admission assumption.

Combining the two private sides with four fixed core triangles gives one shared payment budget. Only the two endpoints need be removed. Every packed edge outside their stars is paid, so no unspecified outside-cover allowance is needed.
Local reduction theorem
Let G be a finite simple graph such that every actual edge has codegree between two and four. Suppose uv is an edge satisfying:
1. d(u), d(v) <= 11;
2. both actual links G[N(u)] and G[N(v)] are connected;
3. N(u) intersection N(v) = {a,b,c,d} and its induced graph is K4-ab.
Then either an endpoint has a WKE link, or {u,v} has an explicit vertex reduction. In particular, G has a sound strict edge reduction after expressing endpoint deletion as deletion of their actual stars.

The theorem does not require a degree bound at other vertices. Its stated global codegree assumptions are sufficient; no codegree-five hypothesis is used.
Minimal-counterexample consequence
A counterexample to Tuza's inequality with maximum degree at most eleven, chosen minimal in |V|+|E|, and having global maximum codegree four, contains no codegree-four edge whose common graph is K4-e.

Together with the existing complete K6 reduction under codegree cap four, this says that every four-vertex common graph at a codegree-four edge has at most four edges. The selected-edge density-five branch therefore disappears. The noncomplete codegree-four branch as a whole remains open.
2. Existing inputs and the exact induction contract
Write Bound(G) for tau(G) <= 2 nu(G).

A WKE witness in a graph L consists of a matching M and a vertex set Q with
\[
|Q|\le |M|,\qquad E(L-Q)\subseteq M.
\]
Puleo's Definition 4.1 and Lemma 4.4 turn such a witness in the actual link at x into triangles xrs for rs in M, with payments M and the spokes xq for q in Q. A WKE component similarly gives an edge reduction. These are existing results, not new claims of this note. [P, Definition 4.1; Lemmas 4.3–4.4]

For the minimal-counterexample consequence, the following premises are already justified without extending a degree-ten finite computation:
- Every edge has codegree at least two. A triangle-free edge can simply be deleted. For an edge in a unique triangle, delete that edge, pack its unique triangle, and pay its other two edges; this is a strict edge reduction.
- Every link component has at least five vertices, because connected graphs of order at most four are WKE. [P, Corollary 4.9; K, Lemma 2.3]
- Under global codegree cap four, a link component of order five gives a reduction. Kandasamy's Lemma 3.4 proves this using the three possibilities K5, K5-e, and W4. Inspection of that argument shows that it uses the codegree cap and component closure, not maximum degree ten. [K, Lemma 3.4]
- Consequently every link component has at least six vertices. A link of order at most eleven is therefore connected.
- A minimal counterexample has no WKE link and no sound strict reduction.
The supplied A1 thin-six exclusion remains a paper-level input to the wider campaign. This particular proof does not need A1: the private-side lemma below also covers private orders zero and one. Thus the use of connected links here does not conceal an assumption of minimum degree seven.

For fixed-vertex edge induction, let F be a nonempty set of actual edges and let S,X satisfy
\[
|X|\le2|S|,\qquad E(S)\setminus F\subseteq X,
\qquad G-X\text{ has no triangle using }F.
\]
Put G' = G-(F union X), on the same vertex set. The local packing is disjoint from every packing of G', and X together with any triangle cover of G' covers G. Therefore
\[
\tau(G)\le\tau(G')+|X|
\le2\nu(G')+2|S|\le2\nu(G).
\]
Since F is nonempty, the edge count decreases strictly. This is Puleo's edge-reduction contract, also stated in Kandasamy's preliminaries. Minimality in |V|+|E| implies the needed proper-edge induction premise directly. [P, Definition 4.2 and Lemma 4.3; K, Section 2]
3. The reusable structural lemma
Lemma: a five-vertex core with at most two contacts
Let L be a connected graph with vertex partition D union H, where D has five vertices and H has at most six. Use the same letters for the induced graphs. Suppose:
1. there are at most two edges between D and H;
2. every vertex of H has degree at least two in L;
3. for every vertex alpha of D incident with an edge to H, the graph D-alpha has a perfect matching;
4. L is not WKE.
Let T be the vertices of H having a neighbor in D. Then there exist a matching M in H and a set Q subseteq V(H) such that
\[
T\subseteq Q,\qquad E(H-Q)\subseteq M,
\qquad |Q|\le |M|+1. \tag{1}
\]
The statement has no maximum-degree hypothesis on H. The two contacts are actual edges, and Q contains all of their private endpoints. In the application, D=K5-ab and the only possible contact anchors are a,b; deleting either leaves K4, so hypothesis 3 is immediate. A factor-critical five-vertex core is another sufficient choice for D.
Proof
Let n=|H|, and put F=V(H)\T. Every vertex of F has degree at least two inside H, and |F| >= n-2.
Orders zero through four
For n=0,1, take M empty and Q=V(H).

For n=2, H has an edge: otherwise its two vertices would require at least four contacts. Take that edge for M and all of H for Q.

For n=3, choose a contact-free vertex f. It has a neighbor in H, so choose any edge for M and take Q=V(H)\{f}.

For n=4, choose two contact-free vertices W. If they are adjacent, use their edge as M; otherwise use any edge of H, which exists because a contact-free vertex has degree at least two. Set Q=V(H)\W.

Each construction satisfies (1).
Matching number at orders five and six
For n=5,6, the matching number of H is at least two. Indeed, a graph with matching number at most one is edgeless, a star together with isolates, or a triangle together with isolates. In a star with r leaves, the leaves need at least r contacts and the n-r-1 isolates need at least twice that many further contacts. The total is at least
\[
r+2(n-r-1)=2n-r-2\ge n-1\ge4.
\]
A triangle together with isolates needs at least 2(n-3) >= 4 contacts. The edgeless case needs still more. All contradict the two-contact bound.
Order five
Here the maximum matching size is two and |F| >= 3.

If two vertices of F are nonadjacent, let W be that pair, choose any matching of size two, and set Q=V(H)\W.

If F is a clique of order at least four, choose two disjoint edges in it, use them for M, and let W be the endpoints of either edge.

The remaining possibility is that F is a triangle and the other two vertices are the two contact vertices. Each has exactly one contact and hence has a neighbor inside H. Choose an edge incident with one of them. It is disjoint from some edge of the triangle F; use these two edges for M, and use the endpoints of the triangle edge for W.

In all cases Q=V(H)\W contains T, has size three, and leaves at most an edge belonging to M.
Order six with a perfect matching
Choose a perfect matching M. Since at most two vertices belong to T, some edge of M has both endpoints in F. Let W be those two endpoints and set Q=V(H)\W. Then |Q|=4=|M|+1, and (1) follows.
Order six with matching number two
If three vertices W subseteq F induce at most one edge, take Q=V(H)\W. If H[W] is edgeless, any two-edge matching works. If its only edge is rs, write t for the third vertex. Because t is contact-free, has degree at least two in H, and is adjacent to neither r nor s, it has an edge disjoint from rs. These two edges form the required matching. Thus (1) holds.

Assume no such triple exists. Every triple of F then spans at least two edges, which says precisely that the missing edges of H[F] form a matching.

If |F|=6, this gives a perfect matching in H, contrary to the present case. If |F|=5, let p be the sixth vertex. Any neighbor f of p would give a perfect matching: use pf and a perfect matching of H[F\{f}], which is K4 with a matching removed. Hence p has no neighbor in H. All contacts are at p, so F is disconnected from D, contradicting connectivity of L.

It remains that |F|=4, with two contact vertices p,q. Each has exactly one contact and hence a nonempty neighborhood in F, unless they are adjacent. But pq together with a perfect matching of H[F] would be a perfect matching of H. Thus pq is absent, and
\[
R=N_H(p)\subseteq F,\qquad S=N_H(q)\subseteq F
\]
are nonempty.

Choose any perfect matching M_F of H[F]. We claim there is a two-element set Q_H subseteq F with
\[
E(H-Q_H)\subseteq M_F. \tag{2}
\]
If R=S={f}, take Q_H to be the endpoints of the edge of M_F containing f. The other two free vertices form the other matching edge, and both contact vertices have all their H-neighbors in Q_H.

Otherwise choose distinct r in R, s in S. The two vertices in F\{r,s} must be nonadjacent, or their edge together with pr,qs would be a perfect matching of H. On four vertices, the complements of the missing pairs of H[F] form a matching as well. Consequently every distinct pair from R cross S must belong to this same matching, forcing R union S subseteq {r,s}. Take Q_H={r,s}. It covers all edges of H, so (2) again holds.

Now let the two contacts be alpha p and beta q, allowing alpha=beta. Choose a perfect matching M_D of D-alpha. If beta != alpha, let e be its edge containing beta; otherwise choose either edge. Put
\[
Q_D=\{\alpha\}\cup V(e).
\]
This set has size three, contains both contact anchors, and the two vertices of D-Q_D form the other edge of M_D. Therefore
\[
M^*=M_F\cup M_D\cup\{\alpha p\},\qquad
Q^*=Q_H\cup Q_D
\]
is a WKE witness for the whole graph L: M* is a five-edge matching, Q* has five vertices, every remaining internal edge belongs to the appropriate matching, and both contacts meet Q_D. This contradicts hypothesis 4.

The last possible obstruction is therefore excluded by an explicit WKE construction, completing the lemma. \(\square\)
4. Applying the lemma to the actual endpoint links
Let
\[
C=\{a,b,c,d\},\qquad G[C]=K_4-ab,
\]
and define the actual private sets
\[
A=N(u)\setminus N[v],\qquad B=N(v)\setminus N[u].
\]
They are disjoint and have sizes at most six, because d(u),d(v) <= 11 and each endpoint already has the other endpoint and four common neighbors.

The edges uc and ud already have four common neighbors in the six-vertex core. Hence neither c nor d has a neighbor in A. The edges ua and ub already have three common neighbors there, so each of a,b has at most one neighbor in A. The same statements hold for B at endpoint v.

Thus there are at most two contacts from each private side to C. For every p in A, the common neighbors of up are exactly
\[
N_A(p)\cup\bigl(N(p)\cap\{a,b\}\bigr).
\]
The lower codegree bound therefore gives degree at least two for p in the actual link at u. The link has the five-vertex core D_u={v,a,b,c,d}, inducing K5-ab, and the remaining graph G[A]. Removing either possible contact anchor a or b from D_u leaves K4.

If either endpoint link is WKE, its existing WKE reduction applies. Otherwise the lemma supplies actual witnesses (M_A,Q_A) and (M_B,Q_B) with
\[
\begin{aligned}
&Q_A\text{ contains every vertex of }A\text{ contacting }C,\\
&E(G[A]-Q_A)\subseteq M_A,\qquad |Q_A|\le |M_A|+1,
\end{aligned}
\]
and the symmetric conditions on B.

These are existential conclusions proved from the actual link hypotheses. No preassigned labels, catalog membership, or unresolved matching-budget antecedent is being assumed.
5. The shared reduction
Take four core triangles
\[
\mathcal S_0=\{uac,\ ubd,\ vad,\ vbc\}
\]
and six core payments
\[
X_0=E(G[C])\cup\{uv\}
=\{ac,ad,bc,bd,cd,uv\}.
\]
Extend the packing and payment set by
\[
\begin{aligned}
\mathcal S={}&\mathcal S_0
\cup\{uxy:xy\in M_A\}
\cup\{vxy:xy\in M_B\},\\
X={}&X_0\cup M_A\cup M_B
\cup\{uq:q\in Q_A\}
\cup\{vq:q\in Q_B\}.
\end{aligned}
\]
Packing and budget
The four core triangles are edge-disjoint. Each private matching supplies edge-disjoint triangles using private spokes, so it shares no edge with the core packing. The two sides are disjoint, and their hub spokes have different endpoints. Thus S is an actual edge-disjoint packing.

Writing k_A=|M_A|, k_B=|M_B|, its size is 4+k_A+k_B, and
\[
\begin{aligned}
|X|
&=6+k_A+|Q_A|+k_B+|Q_B|\\
&\le6+(2k_A+1)+(2k_B+1)\\
&=2(4+k_A+k_B)=2|\mathcal S|.
\end{aligned}
\]
This is one combined budget, with one unit allocated to each private side.
Actual ambient capture
Every triangle through u is covered:
- A triangle using uv meets the payment uv.
- A triangle using two vertices of C meets its paid edge in E(G[C]).
- A triangle using one vertex of C and one of A has its private vertex in Q_A, so its spoke from u is paid.
- A triangle using two vertices of A either uses a matching edge in M_A, or has an endpoint in Q_A.
These cases exhaust the actual neighborhood of u. The symmetric argument covers every triangle through v.

Every packed edge outside the stars of {u,v} belongs to X: the core packing's outside edges are ac,bd,ad,bc, and the private packing's outside edges are precisely the two matchings.

Arbitrary A-B edges do not create a triangle at either endpoint. Additional triangles on paid common or private edges are already hit by that paid edge. Outside witnesses may coincide wherever the graph permits; the proof never requires their distinctness or a bound on their number. No common vertex is deleted, so there is no additional degree-eleven boundary bill at a common vertex.

Finally, take F to be the union of the two actual endpoint stars. It contains the actual edge uv, so it is nonempty. The packing, payments, capture statement, and strict lifting contract of Section 2 apply. This proves the local theorem and its minimal-counterexample consequence. \(\square\)
6. What this removes from the global route
The result removes the entire c=4, common-density-five class, including endpoint degree eleven. It also removes the need to establish degree-eleven versions of either selected-edge tie-break for that class: the reduction applies before selection.

The existing complete-core rule removes density six. Hence the next maximum-density possibilities are:
Common-core density	Remaining four-vertex common graph	Status here
6	K4	Existing complete K6 closure under cap four
5	K4-e	Complete paper proof above; independent acceptance pending
4	C4 or the paw	Not closed by this note
At most 3	The lower-density common graphs	No total admission proved here


The wider codegree-four theorem, the subcubic branch, and the branches of larger maximum codegree are not claimed closed. The already accepted capped K7-e result is distinct and is not counted as a result of this session.
7. Further attack: the exact limit at a C4 common core
For a common cycle c0 c1 c2 c3 c0, four core triangles can again be packed using alternating cycle edges at the two endpoints. Paying the four cycle edges and uv costs five. This leaves three units of combined slack for the two private sides.

However, each common vertex can now have one contact on each private side, so a side can have four contacts. The two-contact lemma cannot simply be extended to this situation.
An eleven-vertex link obstruction to that extension
Let D be a wheel W4, with center v and four rim vertices C. Let H have bipartition
\[
\{f_1,f_2,s\},\qquad \{t_1,t_2,t_3\},
\]
all nine cross edges of K3,3, and the additional edge f1 f2. Join the four rim vertices of D, by any bijection, to
\[
T=\{s,t_1,t_2,t_3\}.
\]
The resulting link L is connected, has eleven vertices, and is 4-regular. Both D and H have clique number three; the four contacts form a matching, so no triangle spans the two blocks. In particular L contains no K5-e.

It is not WKE. For any matching, a set covering D minus the matching must contain at least three vertices of D: every three wheel vertices span at least two incident edges. Similarly, deleting at most two vertices from K3,3 leaves a vertex of degree at least two, so a set covering H minus a matching must contain at least three vertices of H. Thus any WKE cover would have size at least six, whereas a matching in eleven vertices has size at most five.

There is also no matching M in H and set Q containing all four vertices of T with |Q| <= |M|+1 and E(H-Q) subseteq M. If |M| <= 2, the cardinality bound already fails. If |M|=3, it forces Q=T, and then f1 f2 must belong to a perfect matching. This is impossible: after deleting f1,f2, the remaining graph is the star on s,t1,t2,t3, whose matching number is one.

The loss of two units is sharp: choose any perfect matching of the underlying K3,3 and put Q=T union {f1}. For two such private sides, the fixed cycle-core construction exceeds its shared budget by exactly one. This is a mathematical obstruction to that construction, rather than an assumed failure of a solver.

This is only a link pattern. It is not a graph satisfying all minimal-counterexample conditions. In the cone over this link, some edges have only one known triangle; their required further supports, the neighboring links, and the global degree bound have not been completed. Nor does the failure of this matching-cover construction prove that every other reduction fails.

The analogous four-contact W4 private side already obstructs the same construction at private order five. Thus the phenomenon is not confined to degree eleven; the K3,3+e example identifies an actual private-order-six obstruction.
Why the paw also requires a different exchange
The six-vertex core obtained by joining the two endpoints to a paw has thirteen edges and four odd-degree vertices. Four edge-disjoint triangles would leave a single edge, but removal of triangles preserves degree parity, whereas a single edge has only two odd-degree vertices. Consequently this core has at most three packed triangles. The four-triangle starting budget of the K4-e argument is unavailable there.

These observations delimit the next step precisely. A proof for common C4 or paw must supply another actual reduction or use neighboring-link/global incompatibility to eliminate the problematic private structures. It cannot be obtained by silently carrying over the one-unit private-side conclusion proved above.
8. Approaches discarded and what was learned
The initial four-hub view exposes the saturated K4={u,v,c,d} and disjoint private groups, but its natural payment allocation does not itself provide a uniform saving. Restricting deletion to u,v yields a cleaner shared budget and avoids outside payments at the other core vertices.

Requiring the private graph alone to be WKE is too strong. The reduction needs only the one-unit relaxation (1). The one-unit relaxation cannot simply be assumed at private order six: the matching-number-two exception must be handled. Its whole-link WKE witness is the decisive step of the proof.

The contact-free vertices used in H-Q are allowed to be matched. They are not required to be vertices left unmatched by a maximum matching. The relevant condition is exactly E(H-Q) subseteq M; imposing an unmatched-vertex condition would discard valid reductions.

The attempted extension to four contacts encounters the explicit K3,3+e link pattern above. Therefore the present result supplies total admission for one entire top-level common-core class, but does not supply total admission for all noncomplete codegree-four cores.
