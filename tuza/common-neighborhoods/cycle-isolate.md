# Closing the common-C4 two-contact-isolate remainder

Research checkpoint: 1 November 2026, America/New_York (2 November UTC).

Status: complete paper derivation, independent acceptance pending. This note closes the remaining isolate case conditional on the explicitly identified earlier paper inputs. It is not a Lean result, a replay result, independent acceptance of those inputs, or a proof of the global degree-eleven theorem.
1. The theorem and its dependencies
Let G be a hypothetical minimal counterexample under the inherited strict edge-reduction framework, with maximum degree at most eleven and all edge codegrees between two and four. Use the inherited connected, non-WKE actual-link restrictions. Let uv have common neighborhood inducing
\[
C=c_0c_1c_2c_3c_0,\quad A=N(u)\setminus N[v],\quad B=N(v)\setminus N[u].
\]
The paper dependencies are:
1. The recovered C4_TWO_SIDE_STRUCTURAL_CHECKPOINT.md, §§2–7: the uniform private-loss bound two, exclusion of sides with at most three contacts, exhaustive no-isolate side profiles, and exclusion of isolates with three or four contacts.
2. The supplied K4_MINUS_EDGE_PAPER_PROOF.md, §3 two-contact lemma and common-K4-minus-edge theorem. Both remain acceptance-pending paper inputs.
3. Existing WKE machinery, the WKE property of connected graphs of order at most four, and the connected five-vertex non-WKE classification. These are literature inputs.
Theorem
Under these inputs, the entire remaining common-C4 two-contact-isolate class is reducible in its actual ambient graph. This includes isolate-count patterns (0,1), (0,2), (1,1), (1,2), (2,2), every contact assignment, and arbitrary permitted supports and A–B edges.

The proof works at any qualifying common-C4 edge; selected-edge tie-breaking is unnecessary. No eleven-regularity, disjoint-support assumption, or independently realizable side abstraction is used.

The proof first reduces the side configurations to aligned I/I, I/J, J/J pairs (§4). Each pair has a captured packing with a deficit of one payment (§5). A switch between two pairs of unused, already-paid spokes constrains every attachment in the actual outside neighborhood of a common-cycle vertex (§§6–7). This outside neighborhood has at most five vertices, and a structural argument closes all its possibilities (§8).
2. Exact reduction contract
Write St(h) for the actual star at h. A reduction consists of an edge-disjoint triangle packing S and edge sets X subseteq F such that
\[
E(S)\subseteq F,\quad
\text{every ambient triangle meeting }F\text{ meets }X,\quad
|X|\le2|S|,\quad F\ne\varnothing.
\tag{2.1}
\]
For G'=G-F,
\[
\nu(G)\ge\nu(G')+|S|,\qquad
\tau(G)\le\tau(G')+|X|.
\]
Strict edge induction therefore gives a contradiction. Minimality in |V|+|E| implies the required fixed-vertex proper-edge induction premise.

A WKE witness in L=G[N(h)] is a matching M and set Q with
\[
|Q|\le|M|,\qquad E(L-Q)\subseteq M.
\]
It gives the explicit reduction
\[
S=\{hxy:xy\in M\},\quad
X=M\cup\{hq:q\in Q\},\quad F=\operatorname{St}(h)\cup M.
\tag{2.2}
\]
Every triangle through h uses a paid matching edge or a paid spoke; any other triangle meeting F uses a paid matching edge. No neighbor of h is deleted.

For the two-endpoint constructions, take
\[
F_0=\operatorname{St}(u)\cup\operatorname{St}(v)\cup X_0.
\tag{2.3}
\]
Every packed edge outside those stars is explicitly paid. Arbitrary A–B edges and outside boundary edges are retained unless explicitly included in the payment union.
3. Exact isolate-support equations
Let p be isolated in A with contacts a,b in C. Put
\[
S_p=N(p)\setminus\{u,a,b\},\qquad \epsilon=\mathbf1_{ab\in E(G)}.
\]
Then S_p is disjoint from A,C,{u,v}, may meet B, and has at most eight vertices. The exact identity
\[
N(p)\cap N(a)=\{u\}\cup
(\{b\}\text{ if }\epsilon=1)\cup(S_p\cap N(a))
\]
and its counterpart at b give
\[
1-\epsilon\le |S_p\cap N(a)|,\ |S_p\cap N(b)|\le3-\epsilon.
\tag{3.1}
\]
For s in S_p, its common neighbors with p are exactly its neighbors in S_p together with those among a,b. Thus
\[
2\le d_{G[S_p]}(s)+|N(s)\cap\{a,b\}|\le4.
\tag{3.2}
\]
The old hub has degree exactly two in G[N(p)]. Opposite contacts each require external support; adjacent contacts need not. No six-vertex catalogue is applied to S_p. The different five-vertex bound in §6 concerns the actual outside neighborhood of one contact anchor, not all supports of p.
4. Exhaustive admission of sides containing isolates
Let h be one endpoint, D the wheel consisting of the other hub and C, and H its entire private graph. In the reported remainder there are exactly four contact edges, |H|<=6, and
\[
2\le d_H(t)+|N(t)\cap C|\le4.
\tag{4.1}
\]
Every isolate has exactly two contacts, by the earlier checkpoint.
4.1 Two isolates
Two isolates p,q consume all four slots. Whole-link connectivity forces H={p,q}. Their pairs partition C.

For adjacent pairs, choose opposite anchors contacting distinct p,q; match these across, match the wheel center to a retained anchor, and put the wheel center and retained opposite pair in Q. This is whole-link WKE with matching and cover size three.

For opposite pairs the side has a universal UV profile. At any chosen alpha, pack one contact triangle at p and one at q, avoiding alpha. Pay the two contact edges and at most one private spoke. On a required side pay the vertex contacting alpha; on an unrequired side pay the other vertex if needed. The last unpacked contact is core-paid.

Here and below the UV core is
\[
S_C=\{uvc_0\},\quad X_C=\{uc_0,uc_2,vc_1,vc_3\}.
\tag{4.2}
\]
At c_0 the u-side is unrequired and the v-side required. Each side benefit 2|S_H|-|X_H| at least one pays its share of the core deficit. The two-isolate construction has two triangles and at most three payments in either orientation.
4.2 One isolate and a connected block
Let p be the only isolate, with contact pair P, and K=H-p. The remaining two contacts lie either both at q or singly at q,r. K is connected: every component needs a contact, and a component with just one single contact has at least three vertices, because its uncontacted vertices have internal degree at least two. Two such components would exceed |K|<=5.

If K has a WKE cover Q_K containing a contact vertex, the whole link is WKE. At most three anchors remain uncovered, including both p-anchors. Cross-match p at an endpoint of their three-anchor path, and complete the matching on D minus that anchor. Take those three anchors as Q_D. With at most two required anchors, use the earlier checkpoint's wheel-completion lemma (§3.4). The combined matching size is |M_K|+3 and cover size at most that.

For |K|<=4 a rooted WKE cover exists. At order two or three this is immediate for an edge, path or triangle. At order four with a perfect matching, take as Q_K the endpoints of its edge containing the chosen contact vertex. The sole connected four-vertex graph without a perfect matching is K1,3, whose three leaves would need three contacts, unavailable here.

Thus a surviving one-isolate side has |H|=6, |K|=5, and its hub has degree eleven. This is derived only for that surviving case.
4.3 Non-WKE K
The existing classification gives K5, K5-e or W4. K5 violates (4.1) at a contact. In K5-e the two contacts must be single and at its tips; an edge from h to a universal vertex of K has common graph K4-e, excluded by the supplied paper theorem.

For W4 the contacts are single and on its rim. Re-root at h and its center. The new common graph is the rim C4, and h's new private set is old D plus p, with exactly two contacts to that rim. The supplied two-contact lemma gives loss at most one, the other side has loss at most two, and the four-core-triangle construction reduces. No selection comparison is used.

We may assume K is WKE but no WKE cover contains any of its contacted vertices.
4.4 Five-vertex observation
In a connected five-vertex graph of matching number two, a triple inducing at most one edge is the complement of a WKE cover. If it is independent, use any two-edge matching. If its sole edge is ab and its third vertex t, connectivity gives an edge from t to the complementary pair; it and ab form a matching.

Our K has matching number two: a connected five-vertex graph with matching number one is a four-leaf star, and four leaves cannot be supported by two contacts.
4.5 One other double-contact vertex
Let q have the other two contacts. By §4.4 its four free vertices induce K4 with a matching removed, and d_K(q)<=2.

Except for
\[
\boxed{E(K)=\{ax,ay,aq,bx,by,bq,xy\},}
\tag{I}
\]
there are a perfect matching M on the four free vertices and a free two-set Q with E(K-Q) subseteq M, exposing q. With one neighbor, include it in the endpoints of a matching edge. With two neighbors use them as Q, except when they are the nonadjacent tips of a diamond with adjacent complementary pair; that exceptional graph is (I). The other complementary pairs can be matched or are independent.

In the exposing case, an adjacent partition of the contacts gives whole-link WKE: cross opposite anchors to p,q, use the free perfect matching and one wheel-center edge, and take Q plus the wheel center and retained opposite pair. An opposite partition gives a universal UV profile: the two matching triangles and one contact at p,q require four off-hub payments, two Q-spokes and at most one more spoke.

Call p+K in (I) an I side. Pack one contact at p and one at q, avoiding alpha, and hax,hby; pay their four off-hub edges and hx,hy,hq. Only the unused p-contact remains to be covered by the core. Thus, with U,V denoting good unrequired and required anchors,
\[
\begin{array}{c|c|c}
P&U&V\\ \hline
\text{adjacent}&C&C\setminus P\\
\text{opposite}&P&C\setminus P.
\end{array}
\tag{4.3}
\]
4.6 Two other single-contact vertices
Let q,r have anchors d,e, with P=C minus {d,e}. The free three vertices form a path or triangle, and each port sees at least two free vertices. Otherwise §4.4 produces a WKE cover containing a contact.

After (4.1) and §4.3, the full list is:
Name	Entire block K
P0	K2,3 with parts {a,c}, {b,q,r}
P1	P0 plus bq
P2	P0 plus qr
J	K4 on {x,y,q,r}, plus z joined to x,y
T2	K4 on {x,y,z,q}, plus r joined to x,y
T3	Edge xy joined to the independent set {z,q,r}
T4	Vertex x joined to every vertex of the path q-y-z-r


For a free path a-b-c, q,r both meet a,c. At most one of bq,br,qr is present: bq+br gives W4, and qr with either exceeds a contacted vertex's cap. This gives P0,P1,P2. For a free triangle, if qr is present both ports miss exactly one free vertex: equal missing vertices give J, different ones W4. If qr is absent, neither missing gives K5-e, one missing gives T2, equal missing vertices T3, different ones T4. This proves exhaustiveness.

The following exposed-port WKE witnesses have free covers:
K	Exposed port	M_K	Q_K
P0	q	{ab,cr}	{a,c}
P0	r	interchange q,r	{a,c}
T2	r	{qz,xy}	{x,y}
T3	r	{xz,yq}	{x,y}
T3	q	interchange q,r	{x,y}
T4	q	{zr,xy}	{x,y}
T4	r	{yq,xz}	{x,z}


For exposed q at d, pack its contact, one p-contact, and the two matching hub triangles. Pay their four off-hub edges and the two Q_K-spokes. The remaining p- and r-contacts cost at most one additional spoke at
\[
U=C\setminus\{d\},\quad
V=\{e\}\cup(P\cap N_C(e)).
\tag{4.4}
\]
Here |U|=3 and |V|>=2. At a required anchor in P, pay hp and require e to be core-paid; at e pay hr and choose the remaining p-contact core-paid. At an unrequired anchor in P its omitted p-contact is already core-paid. When both ports can be exposed, the two profiles together are universal.

P1 and P2 have the same profile via:
K	Hub matching	Internal triangle	Additional initially paid spoke
P1	{ar,bc}	abq	hc
P2	{ab,cr}	aqr	hc


Also pack the p- and q-contacts. Pay their two edges, the two matching edges, all three internal-triangle edges and hc. This is five triangles/eight payments before the two remaining contacts; all remaining private edges meet c. Hence (4.4) applies. P2 is symmetric in q,r and universal.

For J, if alpha is in P, pack the other p-contact, both single contacts, hxz and internal yqr. Pay their seven off-hub edges and hx,hy: five triangles/nine payments, in the unrequired orientation.

If alpha is q's anchor, pack a p-contact, the r-contact, hxz,hyq and internal xyr. Pay their seven off-hub edges and hq,hy. Remaining private edges xq,qr,yz and the omitted q-contact are captured. Only the leftover p-contact must be core-paid. Interchange q,r at the other single anchor. Therefore J has exactly the sufficient profile (4.3).
4.7 Combining profiles: the exact surviving pairs
The earlier no-isolate profiles are affordable, strong, three-anchor, universal or doubled-port. An affordable side combines with the uniform loss-two bound. A strong side works unrequired everywhere, so combines with a required anchor of any isolate side. A three-anchor side intersects every required set of size at least two. A doubled-port side works both ways on its two anchors; it intersects the three-anchor unrequired set, or one of U,V when their union is C.

Two isolate sides combine if one is universal or has |U|>=3, since the other has |V|>=2. An I/J side with adjacent P has U=C. Thus only two I/J sides with opposite P remain. If their opposite pairs differ, one U equals the other's V, so they combine.

Every survivor therefore has exactly one isolate on each side, both original hubs of degree eleven, both blocks I or J, and
\[
P_A=P_B=\{c_0,c_2\}.
\tag{4.5}
\]
This closes all one-sided-isolate cases and all cases with two isolates on one side, without external-support assumptions.
5. A captured packing with one missing payment unit
Assume (4.5), with isolates p_A,p_B. Start with
\[
S_C=\{uc_0c_1,vc_0c_3\},\qquad X_C=E(C)\cup\{uv\}.
\tag{5.1}
\]
At u put eta=c_3, theta=c_1; at v put eta=c_1, theta=c_3. For that side's hub h, use:
Side	Triangles S_H	Payments X_H
I	hpc_2, hq eta, hax, hby	pc_2, q eta, ax, by, hx, hy, hq, pc_0
J, q at theta and r at eta	hpc_2, hr eta, hxz, hyq, xyr	pc_2, r eta, xz, yq, xy, xr, yr, hq, hy, pc_0


Take one union S_0 and one union X_0. Private sets on different sides are disjoint. The two core triangles have different cycle edges and hub spokes; each side's hub triangles use disjoint hub spokes, and the internal J triangle shares no edge with them. Thus S_0 is edge-disjoint.

If j is the number of J sides,
\[
|S_0|=10+j,\qquad |X_0|=21+2j=2|S_0|+1.
\tag{5.2}
\]
Full ambient capture of the base
Triangles on uv meet its payment, and endpoint cycle triangles meet E(C). In I, all private edges not individually paid meet x,y or q, whose spokes are paid. The q-contacts meet hq; both p-contacts are individually paid. In J, the remaining private edges are xq,qr,yz, covered by hq,hy; the omitted q-contact meets hq, and both p-contacts are individually paid.

This covers every triangle through u or v. All packed edges outside their stars are paid. With F_0 from (2.3), every ambient triangle meeting F_0 meets X_0.

At c_0 the paid edges c_0p_A,c_0p_B are unused by S_0. At c_2 the paid cycle edges c_2c_1,c_2c_3 are unused. Rotation by two exchanges these roles. Thus at either fixed c in {c_0,c_2} we can choose a base leaving unused either pair
\[
\{cp_A,cp_B\}\quad\text{or}\quad\{cc_1,cc_3\}.
\tag{5.3}
\]
All four spokes are paid in either base.
If the actual cross-edge exists
If p_Ap_B is an edge, add c_0p_Ap_B and pay p_Ap_B. This closes (5.2), giving 11/22, 12/24 or 13/26 for I/I, I/J or J/J. The I/I construction is exactly recovered checkpoint §9.2; the J extensions are explicit above.

Henceforth assume
\[
p_Ap_B\notin E(G).
\tag{5.4}
\]
6. The actual outside neighborhood at one contact anchor
Fix c in {c_0,c_2}, put k=c_1,l=c_3, and define
\[
J_0=N[u]\cup N[v],\qquad R=N(c)\setminus J_0.
\]
Contact-slot saturation gives
\[
N(c)\cap J_0=B_0=\{u,v,k,l,p_A,p_B\}.
\tag{6.1}
\]
Its entire induced graph is
\[
E(G[B_0])=\{uv,uk,ul,vk,vl,up_A,vp_B\}.
\tag{6.2}
\]
Here (5.4) is used. Therefore |R|<=5.

Vertices of R miss u,v and may attach to B_0 only at
\[
D_0=\{k,l,p_A,p_B\}.
\]
Both p_A and p_B have a neighbor in R. The edge cp_A has only u as a common neighbor in J_0: its other C-contact is opposite, it is a private isolate, and p_Ap_B is absent. Minimum codegree forces an R-neighbor. The same holds for p_B.

The whole actual link is L_c=G[B_0 union R]. Every r in R satisfies
\[
2\le d_{G[R]}(r)+|N(r)\cap D_0|\le4.
\tag{6.3}
\]
Also k,l each have at most two R-neighbors and p_A,p_B at most three. Witnesses shared across obligations remain the same actual vertices.

This R contains precisely the external anchor-neighbors. It is not asserted to contain all of either S_p, and no support vertex is deleted.
7. The two-choice augmentation lemma
Choose D={p_A,p_B} or D={k,l}, and choose the base whose cD spokes are paid and unused. Suppose M is a matching of edges inside R or from D to R, and Q subseteq R, with
\[
E(G[R]-Q)\subseteq M\cap E(G[R]),\qquad |M|>|Q|.
\tag{7.1}
\]
Define the actual objects
\[
S_1=\{cst:st\in M\},\quad X_1=M\cup\{cq:q\in Q\},
\]
\[
S=S_0\cup S_1,\quad X=X_0\cup X_1,\quad
F=F_0\cup\{cr:r\in R\}\cup X_1.
\tag{7.2}
\]
The matching uses only unused cD spokes and new cR spokes; its other edges lie outside J_0. Hence the enlarged packing is edge-disjoint and all its edges lie in F. Also X subseteq F.

Only the newly removed cR spokes need additional capture. If a triangle crs has r,s in R, (7.1) covers it by M or a paid cq. If its other vertex is in B_0, that vertex cannot be u,v; its c-spoke is one of the four already paid in (5.3). A triangle meeting any other new deleted edge meets X_1 directly. All other edges incident with supports are retained.

The increments are |M| triangles and |M|+|Q| payments, so
\[
|X|-2|S|\le 1+|Q|-|M|\le0.
\tag{7.3}
\]
F contains uv, hence is nonempty. This proves a strict reduction with full ambient capture.
Consequences if no augmentation exists
There is no strict WKE witness of R, meaning |Q|<|M|, since it would satisfy (7.1) without a D–R edge.

Call t WKE-exposed if some WKE matching of R leaves t unmatched; its cover may contain t. No vertex attached to any of the four vertices in D_0 is WKE-exposed. Otherwise add its attachment dt to that matching and choose the base with cd unused. The same Q then satisfies (7.1).

The ability to use both pairs in (5.3) is essential: it constrains attachments to k,l as well as those to the isolates.
8. The outside-neighborhood lemma
We prove that every actual R satisfying §6 gives augmentation, a WKE whole link, or an available earlier exclusion.
8.1 Disconnected graphs and leaves
If R is disconnected, all components have order at most four and are WKE. A disconnected graph of order at most five has an isolate or an edge component. An isolate has an attachment by (6.3) and is exposed in the union of component witnesses. An edge component gives a strict witness by taking its edge with no cover vertex there. Both augment.

Thus R is connected and nonempty. Orders one and two give an exposed attached vertex or a strict witness immediately.

For order three or four, a leaf is WKE-exposed or there is a strict witness. P3 and K1,3 expose any chosen leaf. P4 and a triangle with a pendant vertex have a two-edge matching and a one-vertex residual-matching cover.

For connected order five, let t be a leaf at w. If R-t has a perfect matching, take it and put in Q the endpoints of its edge containing w. This exposes t and leaves only the other matching edge. Otherwise the connected four-vertex graph R-t is K1,3. If w is its center, R is K1,4 and another star edge exposes t. If w is a leaf of that star with center x, Q={x} and M={wt,xa}, for another leaf a, give a strict witness.

A leaf must have an attachment by (6.3). Therefore, if there is no augmentation,
\[
\delta(G[R])\ge2.
\tag{8.1}
\]
At order three, R is a triangle and every vertex is WKE-exposed, impossible. At order four, only C4, K4-e and K4 remain.
8.2 R=K4
Each vertex allows at most one attachment. Choose distinct w adjacent to p_A and s adjacent to p_B, and let t,r be the other R-vertices. Then
\[
M=\{p_Aw,p_Bs,tr\},\quad Q=\{w,s\}
\]
gives augmentation.
8.3 R=C4
If there are adjacent distinct w in N_R(p_A), s in N_R(p_B), the complementary pair is an edge and the same augmentation works.

Otherwise both support sets lie in one opposite pair {a,b}. Write {t,r} for the other opposite pair. If neither k nor l meets {t,r}, use the whole-link WKE witness
\[
Q_L=\{u,v,a,b\},\quad M_L=\{up_A,vp_B\}\cup M_R,
\]
where M_R is a perfect matching of R. Q_L is an ordinary vertex cover.

If, after relabeling, lt is an edge, choose a in N_R(p_A) and use
\[
Q_L=\{u,k,l,a,b\},\quad
M_L=\{vp_B,uk,p_Aa,lt,br\}.
\tag{8.2}
\]
The only residual edge is vp_B. The five matching edges have distinct endpoints.
8.4 R=K4-e
Let a,b be the nonadjacent tips and x,y the degree-three vertices. Distinct w in N_R(p_A), s in N_R(p_B) augment whenever their complementary pair is adjacent.

If no such choice works, either the support sets are {x},{y}, or both equal the same singleton tip {a}. Indeed, any distinct chosen pair must be {x,y}. A tip in either support set forces both sets to that singleton. Otherwise both sets lie in {x,y}, whose vertices each allow only one attachment.

In the first case x,y permit no other attachments. If k,l have no contacts to the tips, use Q_L={u,v,x,y}, M_L={up_A,vp_B} plus a perfect matching of R. If la is an edge, use
\[
Q_L=\{u,k,l,x,y\},\quad
M_L=\{vp_B,uk,p_Ax,la,yb\}.
\tag{8.3}
\]
Only vp_B remains outside Q_L.

In the second case a is saturated. If lx is an edge, use
\[
Q_L=\{u,k,l,a,x\},\quad
M_L=\{vp_B,yb,p_Aa,uk,xl\}.
\tag{8.4}
\]
The residual edges are vp_B,yb. If neither high vertex has a k/l attachment, such attachments can only be at b; use
\[
Q_L=\{u,v,a,b\},\quad
M_L=\{xy,up_A,vk,ap_B\}.
\tag{8.5}
\]
Only xy remains outside Q_L. All cases are WKE.
8.5 Connected non-WKE R of order five
The existing classification gives K5, K5-e or W4.

K5 has no capacity for an attachment, contrary to the required p_A neighbor.

In K5-e choose a universal vertex w. It has four R-neighbors and no B_0 attachment. The actual edge cw has exactly R minus {w} as common neighbors, inducing K4-e. Apply the supplied paper theorem.

In W4 choose its center w. Again it has no B_0 attachment. The actual edge cw has the rim C4 as common graph, and its whole private set at c is B_0. By (6.2) that side has no isolates. But §4 proved that any surviving common-C4 edge must have an isolate on each side. This contradiction is independent of the new private side at w.

The latter invocation is not circular: §4 uses only the earlier checkpoint, the K4-e input and its own side analysis.
8.6 Connected WKE R of order five
Let T be the nonempty set of R-vertices with any attachment to B_0. Suppose no augmentation exists. There is no strict WKE witness and no t in T is WKE-exposed.

By (8.1), the matching number is two. Every WKE witness has matching size two and cover size two: a smaller cover is strict; a one-edge/one-vertex witness cannot leave minimum degree at least two on five vertices.

Suppose a t in T belongs to a WKE cover Q={t,z}. If R-Q contains an edge ab, let r be its third vertex. Its only possible neighbors are t,z, and (8.1) forces both. Then {ab,rz} with the same Q exposes t, contradiction. Thus Q is an ordinary vertex cover.

Each vertex outside Q is adjacent to both vertices of Q. Each can be exposed by matching Q to the other two outside vertices. Therefore T subseteq Q. The whole link is WKE via
\[
Q_L=\{u,v\}\cup Q,\quad
M_L=\{up_A,vp_B\}\cup M_R,
\tag{8.6}
\]
where M_R is any two-edge matching. Q_L is an ordinary vertex cover.

It remains that no t in T belongs to any WKE cover. Choose one. Since it is attached, d_R(t)<=3. The five-vertex observation in §4.4 implies that every triple of R-t spans at least two edges. Thus R-t is K4 with a matching removed.

The following rooted check is exhaustive:
R-t	Neighbors of t	Outcome
K4	one or two	t exposed
K4	three	K5-e
diamond	one, or two other than its nonadjacent tips	t exposed
diamond	its two nonadjacent tips	I
diamond	three, missing a high vertex	W4
diamond	three, missing a tip	J
C4	one or two	t exposed
C4	three	I


For each exposed entry use a perfect matching on R-t and a free two-set covering t's neighbors whose complement is independent or is the other matching edge. With one neighbor use the endpoints of a matching edge containing it. In a diamond, two adjacent neighbors have an adjacent complement, except for the two high vertices, whose complement is independent. In C4, adjacent and opposite pairs give the corresponding two cases. This verifies the table without a census.

The non-WKE outcomes have already been treated, and exposure augments. Hence R itself is I or J, as a five-vertex graph without the original isolate.

R=I. The cover {a,b} with matchings {xy,aq} and {xy,bq} exposes b and a. Neither can be attached. Thus all attachments lie in {x,y,q}, and
\[
Q_L=\{u,v,x,y,q\}
\]
is an ordinary vertex cover. Choose an actual p_A t attachment. For t=x,y,q, respectively, the graph R-t has perfect matchings {ay,bq}, {ax,bq}, {ax,by}. Therefore
\[
M_L=\{uk,vl,p_A t\}\cup M_{R-t}
\tag{8.7}
\]
is a five-edge matching, proving WKE.

R=J. The cover {x,y} with matchings {qr,xz}, {qr,yz}, {qr,xy} exposes y,x,z. Attachments can only be at q,r. Their internal degree three allows one attachment each. Both isolates need one, so after relabeling the attachments are exactly p_Aq,p_Br. Use
\[
Q_L=\{u,v,q,r,z\},\quad
M_L=\{xy,p_Aq,p_Br,uk,vl\}.
\tag{8.8}
\]
Only xy remains outside Q_L. This is WKE and finishes the lemma.
9. Conclusion, scope and assurance
The cross-edge case is reduced in §5. Otherwise the actual R at either isolate contact anchor satisfies §6. An augmentation gives the explicit S,X,F of (7.2). If no augmentation exists, §8 gives a WKE whole link, the supplied common-K4-e exclusion, or a common-C4 edge already excluded independently by §4. The WKE alternative uses (2.2) on its own; it is not added to a possibly colliding base packing.

Together with §4, this closes the entire two-contact-isolate remainder. Together with the recovered checkpoint's earlier dispatch, it closes the entire common-C4 branch under the inherited cap-four minimal-counterexample restrictions.

This is a complete paper argument conditional on acceptance-pending paper inputs, with independent acceptance still required. No formal or independent verification status is claimed. Closing C4 leaves the paw, lower-density common cores and other global degree-eleven branches.
The missing unit and the boundary
The proof does not force two isolates to be adjacent or force a convenient shared witness. It retains arbitrary support identifications. Its captured base has deficit one; switching the unused paid spokes from the isolates to the other two cycle vertices constrains all attached R-vertices. The whole-link constructions then close the surviving small R graphs.

No support vertex is removed. The extra deletion consists only of cR spokes and explicitly paid matching edges, so every other support boundary edge remains. The degree-eleven bound limits the actual set R; it does not itself pay any boundary.
Preserved failure: the isolate's link need not be WKE
The local isolate equations alone do not force its whole link to be WKE. Consider the independent two-vertex blow-up of C5, then subdivide one edge. The resulting graph L has eleven vertices, maximum degree four and a degree-two subdivision vertex, which can serve as the old hub. Its two neighbors are opposite contacts, and the local isolate-support equations hold.

L is non-WKE. The original blow-up has no five-vertex induced subgraph of maximum degree at most one: using both vertices of a bag forces its two adjacent bags empty and allows at most two more vertices; using at most one from each bag would require all five bags, making a cycle. Removing one edge increases this bound by at most one.

A six-vertex residual in L cannot avoid the subdivision vertex, by that bound after edge removal. If it includes the subdivision vertex, its five old vertices must include both ends of the subdivided edge; otherwise they would be a prohibited five-set in the original blow-up. The subdivision vertex then has degree two. Thus a residual-matching cover needs at least six vertices, while a matching has at most five.

This is an obstruction to that proposed mechanism, not a demonstrated actual minimal-counterexample candidate. The successful proof moves to the contact anchor's actual link and does not independently realize abstract isolate links.
Literature overlap and new coverage
Puleo's WKE machinery and small-graph classification are existing results. The two-contact lemma, common-K4-e theorem, earlier C4 dispatch and the I/I cross-edge exchange are supplied earlier paper inputs, not new results of this session.

The new coverage is the full isolate-side admission in §4, the I/J captured bases with two available spoke pairs, and the actual-anchor support theorem in §§6–8. The idea of obtaining packing credit from already-paid edges is not claimed as new. The supplied clique-overlap-exchange packet has a related mechanism under a closed K5 link-component and outside-witness contract; it does not directly apply to these blocks. This bounded overlap comparison is not a publication-priority claim.
