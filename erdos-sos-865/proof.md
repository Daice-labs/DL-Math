# A two-predecessor induction for the Erdős–Sós pairwise-sums conjecture

Paper proof of 21 November 2026. The induction starts from the six-root and seven-root theorems. Its transfer to general sets uses a theorem of Dousse. The subsequent [Lean formalization](lean-sources.zip) proves the all-orders statement.

## 1. Statement and invariant

Write \([T]=\{1,\ldots,T\}\). An internal clique of size \(s\) in \(A\subseteq[T]\) is a set of \(s\) distinct members of \(A\) such that every sum of two distinct vertices belongs to \(A\). Different pairs may have the same sum. Write \(f(T,s)\) for the least cardinality threshold forcing such a clique in every \(A\subseteq[T]\). Put
\[
 c_s=\frac23(1-4^{1-s}),\qquad e_s=\frac23-c_s=\frac{2}{3\cdot4^{s-1}}.
\]
Then \(c_s=1/2+c_{s-1}/4\). The claimed conclusion is
\[
 \forall s\ge2,\qquad \lim_{T\to\infty}\frac{f(T,s)}{T}=c_s .
\]
Here \(s\) is fixed before the scale tends to infinity. This is the all-orders asymptotic variant in the public [Erdős 865 specification](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/865.lean).

A set is doubling-free if it contains no pair \(x,2x\). For \(s\ge6\) we prove the stronger assertion \(G_s\). For every \(\eta>0\), for all sufficiently large \(T\) depending only on \(s,\eta\), every doubling-free \(A\subseteq[T]\) of size at least \((c_s+\eta)T\) has an internal \(s\)-clique \(F\) satisfying the following conditions.

1. Exactly one vertex is in \((T/2,\gamma_sT]\). The other \(s-1\) vertices are at most \(\alpha_sT\).
2. At least one of the two odd residue classes modulo four contains at most three vertices of \(F\).

The pair sums only need to be in the ambient \(A\). Bounds on the vertices never impose a smaller bound on their pair sums. The width \(\lambda_s\) in the table is a fraction of the quarter-prefix length used to construct a clique.

| \(s\) | \(\alpha_s\) | \(\gamma_s\) | \(\lambda_s\) |
|---|---:|---:|---:|
| 6, 7 | \(1/4\) | \(3/4\) | — |
| 8 | \(3/16\) | \(11/16\) | \(1/4\) |
| 9 | \(3/16\) | \(21/32\) | \(1/8\) |
| 10 | \(11/64\) | \(77/128\) | \(1/32\) |
| 11 | \(21/128\) | \(149/256\) | \(1/64\) |
| every \(s\ge12\) | \(13/64\) | \(9/16\) | \(1/64\) |

The reflection itself comes from the order-nine upper-seventh proof. Two features make it repeatable. When the sparse control class is odd, a successful direct extension places its new vertex in the other odd class. A failed direct extension produces a replacement with at most two odd vertices in total. The size bounds in the table eventually allow *every* seed vertex, including the largest, to supply the missing translate for this replacement.

## 2. Starting cases and the scope of their quantifiers

We use two root-supply statements. In their notation the original set is \(B\subseteq[4n]\), \(H=\lfloor n/4\rfloor\), and \(D=\{x\le H:4x\in B\}\) on positive integers. For fixed \(\beta>0\) the hypothesis is \(|D|-q\ge c_j n/4+\beta n\) for \(j=6,7\), where \(q\) is the lower odd-slot deficit plus the excess upper holes. The quantified statements apply to every physical doubling-free word satisfying the indicated hypotheses.

- For \(j=6\) the checked source gives six actual roots and all fifteen pair sums in \(D\). Five vertices satisfy \(128x+5H\le128\lfloor H/4\rfloor\); the sixth satisfies \(H<2R\) and \(4R\le3H\). Its explicit midpoint premise is Dousse5. [Exact root type](lean-sources.zip) · [Lean declaration](lean-sources.zip)
- For \(j=7\) the reviewed upper-seventh theorem gives six vertices at most \(\lfloor H/4\rfloor-64(H/4096)\), one in \((H/2,3H/4]\), and all 21 pair sums in \(D\). The independently reviewed statement allows the choice of the six to depend on the word. The root conclusion is available before using its physical lift to construct a nine. [Theorem](deep-shallow.md) · Independent verdict

To apply these results to an *arbitrary* doubling-free \(A\subseteq[T]\), set \(n=4T\). In \([1,n]\) place all the odd numbers and the multiples \(4x\) for \(x\in A\). Leave \((n,2n]\) empty and fill \((2n,4n]\). This is a physical doubling-free \(B\). A lower odd doubles into residue two or into the empty middle. A lower multiple of four cannot double to another occupied lower multiple since \(A\) is doubling-free. An upper member doubles outside \([4n]\). The lower nonmultiples of four are exactly all the odds, so their count fills the entire \(\lceil n/2\rceil\) budget. There are no upper holes. Hence \(q=0,\ H=T,\ D=A\) exactly. With \(\beta=\eta/4\), the signed hypothesis is precisely \(|A|\ge (c_j+\eta)T\). All the exported vertices and sums are in \(A\). If the auxiliary lower-eight admission is wanted in the physical \(j=7\) assembly, its prefix has size \(n/2+|A|\ge (c_8+\eta/4)n\), so the inherited order-eight endpoint supplies it at a preselected threshold. The root assertion itself already suffices here. [Signed gap](lean-sources.zip) · [Projection and auxiliary-word precedent](nine-offset-lift.md)

The resulting cliques have the base vertex bounds of the table. Among at most seven vertices at least one of the two odd classes has size at most three. This proves \(G_6,G_7\) with their stated source assurance. Dousse's published midpoint theorem supplies the finite midpoint premises of the inherited results at every fixed order.

## 3. Two projections and one physical loss inventory

Assume \(s\ge8\), \(G_{s-1}\), \(G_{s-2}\), and the hypotheses of \(G_s\) on \(A\subseteq[T]\). Set
\[
 J=\lfloor T/4\rfloor,\qquad h=\lfloor J/4\rfloor,\qquad
 A_1=A\cap[J],\qquad A_2=\{x\in[h]:4x\in A_1\}.
\]
Both projections are doubling-free. The portion of \(A\) above \(J\) injects into \((T/2,T]\) by doubling elements at most \(T/2\) and fixing the others. Doubling-freeness ensures injectivity. The nonmultiples of four in \(A_1\) inject into the odd indices in \([J]\) by fixing odds and halving residue-two elements. Each operation removes at most the half-size ceiling. As \(c_r=1/2+c_{r-1}/4\) and each new scale is its predecessor's floored quarter,
\[
 |A_1|\ge c_{s-1}J+\eta T-\tfrac12,\qquad
 |A_2|\ge c_{s-2}h+\eta T-1.
\]
Apply \(G_{s-1}\) and \(G_{s-2}\), for example at tolerance \(\eta/2\). Choose \(T\) large enough for those two fixed thresholds before choosing \(A\). We obtain:

- A seed \(F\) of \(s-1\) vertices in \(A_1\), with its pair sums in \(A_1\), one largest vertex \(b\le\gamma_{s-1}J\), and every other vertex at most \(\alpha_{s-1}J\). In \(U=F\cup\{0\}\) one odd residue class has size at most three.
- Dilation by four of the clique in \(A_2\) gives an even clique \(W=V\cup\{z\}\) of size \(s-2\) in \(A_1\), with every pair sum in \(A_1\). All its vertices are multiples of four, \(|V|=s-3\), \(\max V\le\alpha_{s-2}J\), and \(J/2<z\le\gamma_{s-2}J\). Indeed for \(J=4h+d,\ 0\le d\le3\), the integral upper root \(Z>h/2\) gives \(4Z\ge2h+2>J/2\).

These two cliques may intersect. Each of the two completions below uses one of them, so no disjointness or cross-contact between them is required.

Partition \([T]\) into the complete paths \(d,2d,4d,\ldots\) for odd \(d\), terminating at their largest member at most \(T\). A path of length \(l\) contributes capacity \(\lceil l/2\rceil\). Let \(C(T)\) be their total capacity and \(K=C(T)-|A|\). A deficient chain is one whose occupancy is strictly below its own capacity. There are at most \(K\) such chains. Selecting the first, third, fifth, … entries on each chain shows that \(C(T)\) counts the integers of even 2-adic valuation. Thus \(C(T)=\lceil T/2\rceil+C(\lfloor T/4\rfloor)\), so \(C(T)\le 2T/3+1+\lfloor\log_4 T\rfloor\) for \(T\ge1\). Choose \(T\) so the error is below \(\eta T\). Then \(K<e_s T\).

Three tests use this one physical inventory.

1. A missing \(x\in(T/2,T]\) of even 2-adic valuation is the terminal point of an odd-length chain. Omitting its terminal point decreases the maximum by one.
2. For \(x=2m\in(T/2,T]\) with \(m\) odd, \(\{m,2m\}\) is a complete two-point chain. Missing both points costs a unit.
3. For odd \(y\in(J/2+2,J]\) the complete chain is \(y,2y,4y\), since \(4y\le T<8y\). Omitting \(y\) costs a unit.

In the first two tests the chain identifies its terminal label; in the third it identifies its odd head. This will bound the inverse counts of all tests against the same \(K\).

## 4. Choosing a residue and qualifying the same candidate

Choose a target residue \(a\bmod4\); the control residue is \(a+2\bmod4\). Let \(t\) be the number of target offsets in \(U\) and \(b_c\) the number of controls. Offsets of the other parity will have odd translates. The zero offset is included throughout.

For \(8\le s\le11\) keep the largest offset out of the targets. There are exactly three choices of control class doing this: the class of the largest offset and either of the two opposite-parity classes. At least one has at most three offsets, since \(|U|=s<12\). Choose it. Every target then satisfies \(u\le\theta_sJ\) for \(\theta_s=\alpha_{s-1}\).

For every \(s\ge12\) take as controls an odd class with at most three offsets, given by the invariant on \(F\). The targets are the other odd class. The largest vertex is allowed to be a target. Use \(\theta_s=\gamma_{s-1}\).

Set \(R\equiv2-a\pmod4\). Target translates \(R+u\) are \(2\bmod4\). Every control translate can be made \(4\bmod8\) or \(16\bmod32\) on one progression. With zero or one control a period \(d=8\) suffices. With two or three controls take period \(d=32\). To see this, write \(R=r+4i\). For a control \(u\) write \(R+u=4(i+(r+u)/4)\). Choose the parity of \(i\) making all but at most one inner value odd. If one is even, prescribe \(i\bmod8\) making that inner value \(4\bmod8\). Its parity remains the one chosen. Every nontarget translate thus has even valuation, including the odd translates.

Restrict this progression to
\[
       J+2z+4<R\le J+2z+\lfloor\lambda_s J\rfloor.                 \tag{1}
\]
There are at least \(\lambda_sT/(4d)-3\) candidates. Indeed \(J\ge T/4-3/4\), and a progression has at least the floor of length divided by its period on an integer half-open interval. All \(R>T/2\), since \(T\le4J+3\) and \(z>J/2\). For each target \(u\) define
\[
              m_u=(R+u)/2,\qquad v_u=m_u-z .
\]
Both are odd. The useful bounds, in units of \(J\), are
\[
 \begin{split}
 R&\le(1+2\gamma_{s-2}+\lambda_s)J,\\
 J/2+2&<v_u\le V_sJ,\qquad V_s=(1+\lambda_s+\theta_s)/2.
 \end{split}                                                       \tag{2}
\]
Section 6 verifies \(V_s+\alpha_{s-2}\le1\); therefore \(v_u\) and every \(v_u+w,\ w\in V\), lie in \((J/2+2,J]\). Also \(R+u\le T\) for *every* offset: the right side of (2) for \(R\) is at most \(11J/4\), and \(u\le3J/4\). Thus every upper label is in \((T/2,T]\) and every target half is in \((T/4,T/2]\).

Before selecting a missing target, apply these tests to a candidate \(R\):

1. Every nontarget \(R+u\) belongs to \(A\).
2. For each target \(u\), at least one of \(R+u,m_u\) belongs to \(A\).
3. For every target \(u\) and \(w\in V\cup\{0\}\), \(v_u+w\) belongs to \(A\).

The number of candidates failing any test is at most
\[
                [\,s+(s-2)t\,]K.                                  \tag{3}
\]
For each of the \(s\) upper roles, a failed test specifies a deficient chain, and its terminal point \(R+u\) determines \(R\) for that role. For each of the \((s-2)t\) lower roles the chain's head \(d=v_u+w\) determines \(R=2(d+z-w)-u\). Assign a rejected candidate to its first failed test in any fixed ordering. A fixed deficient chain receives at most one such candidate per role across both test lists. It occurs only once in the count of chains. This permits a chain's head to fail a lower role while its terminal point fails an upper role. Section 6 proves (1) supplies strictly more candidates than (3).

## 5. Two completions and preservation of the odd residue bound

Fix a surviving \(R\). If every \(R+u\) is present, \(R\in A\) by the zero offset. Adjoin \(R\) to \(F\). It lies above \(T/2\), is distinct from the entire prefix, and gives its own membership and every new edge. If the target class is even, \(R\) is even and the two odd class counts stay as before. If the target class is odd, \(2-a\equiv a\bmod4\). Hence \(R\) joins the target class. The other odd class is the control class and still has at most three vertices. This works also during the four starting steps when the choice was made by placement.

Otherwise fix any missing \(R+u\). This is a target by the first test. Its actual half \(m_u\in A\) follows from the second test. Put \(v=v_u\). By the third test \(v\in A\) and \(v+w\in A\) for all \(w\in V\); its remaining contact is \(v+z=m_u\in A\). Thus \(W\cup\{v\}\) is an actual clique of size \(s-1\). The odd \(v\) differs from every multiple of four in \(W\). This is the point at which an omitted upper label on a saturated two-point chain becomes an edge of the replacement clique.

For this fixed clique choose a fresh \(P\equiv4-v\bmod8\) in \((T/2,\gamma_sT]\). Its own label and \(P+w\) for \(w\in W\) are odd, while \(P+v\equiv4\bmod8\). All are in \((T/2,T]\) by the bounds in §6. A failed label costs a deficient chain. For each of the \(s\) roles its terminal point fixes \(P\), so at most \(sK\) candidates fail. The interval supplies at least \(T/128-1\) because \(\gamma_s\ge9/16\). For \(s\ge8\), \(s e_s\le 8e_8=1/3072<1/128\). A fresh \(P\) exists for sufficiently large \(T\). This bound is conditional on an already chosen clique in the same \(A\). The two candidate counts are never added. The new clique has \(s-2\) even vertices and two odd vertices \(v,P\). All old edges, the \(s-2\) edges from \(v\), and the \(s-1\) edges from \(P\) belong to \(A\).

In either completion its \(s-1\) smaller vertices are bounded by \(\max(\gamma_{s-1},\gamma_{s-2},V_s)J\). Its upper vertex is \(R\) from (2) or \(P\) from its prescribed interval. This proves the invariant once the three estimates below are checked.

## 6. Geometry, candidate surplus and induction

The three geometric requirements are
\[
 V_s+\alpha_{s-2}\le1,\qquad
 A_s^*=\frac{\max(\gamma_{s-1},\gamma_{s-2},V_s)}4\le\alpha_s,\qquad
 G_s^*=\frac{1+2\gamma_{s-2}+\lambda_s}{4}\le\gamma_s.             \tag{4}
\]
The first keeps the lower odd labels on three-point chains, the second bounds the smaller vertices and the third bounds the direct upper vertex. Since \(4J\le T\), all three are sufficient with the displayed integer endpoints. In the final selection \(\alpha_s+\gamma_s\le1\) keeps each translated label at most \(T\). Here are the exact left sides:

| \(s\) | permitted target bound \(\theta_s\) | \(V_s+\alpha_{s-2}\) | \(A_s^*\) | \(G_s^*\) |
|---|---:|---:|---:|---:|
| 8 | \(1/4\) | \(1\) | \(3/16\) | \(11/16\) |
| 9 | \(3/16\) | \(29/32\) | \(3/16\) | \(21/32\) |
| 10 | \(3/16\) | \(51/64\) | \(11/64\) | \(77/128\) |
| 11 | \(11/64\) | \(25/32\) | \(21/128\) | \(149/256\) |
| 12 | \(149/256\) | \(497/512\) | \(409/2048\) | \(71/128\) |
| 13 | \(9/16\) | \(61/64\) | \(101/512\) | \(279/512\) |
| every \(s\ge14\) | \(9/16\) | \(127/128\) | \(101/512\) | \(137/256\) |

At \(s=8\) equality in the first bound is allowed. Odd \(y=J\) still satisfies \(4y\le T<8y\) at the selected scale. The \(+4\) in (1) is only at the *lower* endpoint; it never increases a lower test's maximum. At \(s=12\) the bound switches to the entire largest-vertex range. The row \(s\ge14\) follows once by substituting the same constants for both predecessors. This proves (4) for every order.

For the first selection, in units of \(e_s T\) the leading candidate supply is \(\lambda_s/(4d e_s)\). When \(d=32\) at least two offsets are controls, hence \(t\le s-2\). For \(d=8\) always \(t\le s\). These give the following upper bounds on loss roles and the corresponding supplies before the fixed rounding allowance:

| \(s\) | period 8 | period 32 |
|---|---:|---:|
| 8 | \(56<192\) | \(44<48\) |
| 9 | \(72<384\) | \(58<96\) |
| 10 | \(90<384\) | \(74<96\) |
| 11 | \(110<768\) | \(110<192\) |

For \(s\ge11\) the width is fixed and the period is at most 32. The loss is bounded by \(s(s-1)e_sT\). Its coefficient at \(s=11\) is \(110/1572864<1/8192=\lambda_s/(4\cdot32)\). From \(s\) to \(s+1\) the coefficient is multiplied by \((s+1)/(4(s-1))<1\). Hence every later step has a strict linear surplus, uniformly in the input set. The finite \(-3\) in (1) is absorbed by increasing the preselected scale. The second selection has its separate strict surplus shown in §5.

This completes a two-predecessor induction on the positive integer \(s\) starting with 6 and 7. Every assertion \(G_s\) has quantifiers “for each \(\eta>0\), eventually for every \(A\)”. For example, before \(A\) choose \(T\) large enough that \(J,h\) meet the two predecessor thresholds at \(\eta/2\), \(\eta T\) absorbs the projection and capacity errors, and both candidate surpluses exceed their fixed rounding allowances. The geometry and these comparisons are independent of the seed, control residue and placements. No threshold uniform over a growing \(s=s(T)\) is needed.

## 7. Passage to the original interval and matching lower bound

Fix \(s\ge6\). For \(A\subseteq[N]\) containing no internal \(s\)-clique, let \(D_A=\{x\in A:2x\in A\}\). For every \(\delta>0\), sufficiently large \(N\), uniformly in such \(A\), one has \(|D_A|<\delta N\). Otherwise Dousse's midpoint theorem at fixed order \(s\) provides \(s\) distinct \(x_i\in D_A\) with \(x_i+x_j=2z_{ij}\) for \(z_{ij}\in D_A\). All \(x_i\) and all \(2z_{ij}\) belong to \(A\), contradicting the assumption. Corollary 3.5 is stated for arbitrary fixed cardinality; its threshold can be chosen for the given lower bound on the density. [Dousse, Corollary 3.5, p. 8](https://arxiv.org/pdf/1210.1729v2#page=8)

Now \(A\setminus D_A\) is doubling-free and retains absence of an internal \(s\)-clique. Given \(\varepsilon>0\), take \(\delta=\eta=\varepsilon/3\). An \(A\) of size at least \((c_s+\varepsilon)N\) would leave at least \((c_s+\eta)N\) elements for \(G_s\), a contradiction for sufficiently large \(N\). Thus \(f(N,s)\le\lceil(c_s+\varepsilon)N\rceil\) eventually. This argument uses \(G_s\) on the original interval length.

For every integer \(s\ge2\) and \(m=\lfloor N/(2\cdot4^{s-2})\rfloor\), form the \(s-1\) bands
\[
                  (4^j m,\,2\cdot4^j m]\cap\mathbb Z,\quad 0\le j\le s-2.
\]
They lie in \([N]\). The sum of two members of the same band is in \((2\cdot4^j m,\,4^{j+1}m]\), a gap in their union, also when \(j\) indexes the last band. An internal clique in the union takes at most one member per band. Hence
\[
 f(N,s)\ \ge\ 1+\frac{4^{s-1}-1}{3}
                      \left\lfloor\frac N{2\cdot4^{s-2}}\right\rfloor .
\]
Dividing by \(N\) and taking limits gives the lower coefficient \(c_s\). Together with the upper bound this proves the asserted limit for every \(s\ge6\) on the named bases.

For \(s=2\), let \(M\) be the maximum of a nonempty clique-free \(A\). Of each pair \(\{x,M-x\}\) of distinct positive integers below \(M\) at most one belongs to \(A\). Including a possible midpoint and \(M\) gives \(|A|\le1+\lfloor M/2\rfloor\). For \(s=3\) use Cipollini's \(5/8\) theorem. For \(s=4,5\) the retained finite-order upper bounds give \(21/32\) and \(85/128\) respectively, with their midpoint premises supplied by Dousse. These are exactly \(c_2,\dots,c_5\); the band construction applies to each of them. Finally
\[
 c_s=\frac12\left(1+\sum_{r=1}^{s-2}4^{-r}\right),
\]
so this is the coefficient in the stated all-orders conjecture. [Cipollini's order-three result](https://arxiv.org/abs/2606.29361) · [Order-four proof record](lean-sources.zip) · [Order-five proof record](lean-sources.zip)
