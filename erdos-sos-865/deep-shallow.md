# A common upper seventh at order nine

Fix \(\beta>0\). For every sufficiently large \(n\), let \(B\subseteq[1,4n]\) be doubling-free with the original OP-02 budget \(q\) and
\[
 H=\lfloor n/4\rfloor,\quad D=\{1\le a\le H:4a\in B\},\quad
 |D|-q\ge c_7 n/4+\beta n,\qquad c_j=\tfrac23(1-4^{1-j}).
\]
Write \(J=\lfloor H/4\rfloor\) and \(Q=H/4096\). Some six distinct roots in \([1,J-64Q]\) have all fifteen pair sums in \(D\) and a common seventh \(R\in(H/2,3H/4]\) with \(R\) and all six translates in the same \(D\). This implies a physical nine with all 36 pair sums in \(B\) using the reviewed nine-offset construction. The six may be chosen after the set. The proof can replace a six that fails.

The lower-order proofs used here are the order-four upper endpoint, the certified order-eight root-supply theorem under its order-five midpoint input, and the order-eight endpoint for internal-eight admission. The prior Studio certificate proves Dousse8 from Roth. Passing to four or five of those eight points supplies the respective midpoint inputs. All lower-order thresholds can be chosen before \(B\). This paper assumes no order-nine endpoint.

## 1. The smaller five that suffices

The second reflection in ALTERNATIVE, §2 needs five actual even roots \(w_1,\ldots,w_4,Z\in D\) with all ten sums in \(D\), \(w_i\le J/4\), and \(J/2<Z\le3J/4\). It then produces the claimed seven for every profile. It uses the previously established six with five entries at most \(27J/128\), the other in \((J/2,3J/4]\), and all fifteen contacts in \(D\cap[1,J]\). If its first upper candidate has a missing target, its occupied odd half gives the fifth contact of a replacement six. The replacement has one odd and five even vertices, and hence a common upper seventh. The nineteen or more inverse roles in some phases in that proof act on one original inventory, with the period-32 worst case bounded by \(12\kappa\). The proof below supplies its five without a residue premise.

Put
\[
 h=\lfloor J/4\rfloor,\quad l=\lfloor h/4\rfloor,\quad
 m=\lfloor l/4\rfloor,\quad b=\lfloor m/4\rfloor,\qquad
 G=\{a\in[1,h]:4a\in D\},\quad Y=\{a\in[1,m]:4a\in G\}.
\]
We construct an actual five in \(G\), having four vertices at most \(l\) and one in \((h/2,3h/4]\), with every pair sum in \(G\). Dilation by four gives the five required in \(D\). Indeed, \(4l\le J/4\). If \(P>h/2\) is integral and \(J=4h+s\), \(0\le s\le3\), then \(4P\ge2h+2>J/2\). The opposite endpoint gives \(4P\le3h\le3J/4\).

## 2. Exact inventories and thresholds

For any doubling-free set on \([1,T]\), the portion above \(\lfloor T/4\rfloor\) injects into \((T/2,T]\): double the elements at most \(T/2\) and fix the larger ones. Doubling-freeness prevents cross-collisions. Among the elements at most \(T\), those not divisible by four inject into the odd indices in \([1,T]\) by fixing odds and halving those congruent to two modulo four. In either operation the removed population is at most \(\lceil T/2\rceil\). Using \(c_j=1/2+c_{j-1}/4\), each application loses at most \(1/2\) to rounding. Applying prefix, then division, first to \(D\) and then to \(G\), gives
\[
 |G|\ge c_5h+q+\beta n-1,\quad
 |G\cap[1,l]|\ge c_4 l+q+\beta n-\tfrac32,\quad
 |Y|\ge\tfrac58 m+q+\beta n-2 .
\]
All these sets are doubling-free. The order-four endpoint therefore gives an internal four \(T\subseteq G\cap[1,l]\), including its six sums in that same prefix, for a threshold uniform in the input. If \(T\cup\{0\}\) omits a residue modulo four, the five in \(G\) follows from ALTERNATIVE, §3. Its proof uses at most three inverse roles per missing top in the period-32 case against \(\lfloor h/128\rfloor\) trials. The signed margin in the next display covers equality of the leading coefficients. We now handle every full-residue \(T\).

Let \(A(h)\) be the sum of the maxima of the complete original doubling chains inside \([1,h]\), and \(K=A(h)-|G|\). Put \(\ell=1+\lfloor\log_4 h\rfloor\). The chain recurrence gives \(A(h)\le 2h/3+\ell\). Since \(h=64b+s_0\), \(0\le s_0\le63\),
\[
 0\le K\le h/384+\ell-q-\beta n+1
             \le b/6+\ell+2-q-\beta n .                                      \tag{1}
\]
Write \(\sigma\) for the sum of the deficits of precisely those \(G\)-chains with primitive odd head \(>l/2\). The other original chains have total deficit \(K-\sigma\). Every debit below refers to that exact partition. \(K\) is a projected capacity account justified by (1); it is never added to the outer chain deficit. Let \(b\ge256\) and \(\beta n\ge100(1+\log_2(H+1))+500\), in addition to the earlier fixed-order convergence and root-supply thresholds. Enlarge \(n\) until \(l\) is past the order-four threshold at tolerance \(\beta/2\). These conditions precede all selections and give \(0\le\sigma\le K<b/6\).

## 3. A triangle with a high tester paid by the disjoint chains

Set \(S=Y\cap[1,b]\) and \(r=\lceil m/2\rceil-|Y\setminus S|\). By the prefix injection, \(r\ge0\), and every missing odd in \((m/2,m]\) is a distinct unused image because doubled lower entries are even. Thus there are at most \(r\) such missing odds. From the signed density of \(Y\),
\[
 s=|S|-\lceil b/2\rceil\ \ge\ r+q+\beta n-3 > r .                             \tag{2}
\]
Let \(e\) be the largest even member of \(S\); one exists by (2). In \([1,e-1]\) the positions other than \(e/2\) form disjoint reflection pairs \(\{a,e-a\}\), and \(e/2\) is absent. Above \(e\) only odds occur. Counting one place for \(e\), one per pair, and at most \(\lceil b/2\rceil-e/2\) odds above \(e\) gives at least \(s\) disjoint pairs \(1\le a<c\le b-1\) with \(a,c,e=a+c\) in \(S\). Endpoints in each pair have the same parity.

Take the integer interval
\[
   I=(2b+4\sigma+12,\ 3b].
\]
It has length \(L=b-4\sigma-12>0\). For \(2b+12<x\le4b\), the original \(G\)-chain through \(4x\) ends at \(16x\): \(16x\le64b\le h<32x\). If \(\nu_2(x)\) is even, this chain has odd length and its unique largest independent set contains \(4x\). Missing \(x\) in \(Y\) therefore requires a deficient \(G\)-chain with primitive at most \(x\le m<l/2\). Distinct such \(x\)'s in this range have distinct heads, as their ratio is strictly between \(1/2\) and \(2\). These are the chains accounted for by \(K-\sigma\).

* If one of the disjoint pairs is even-even, fix it. For odd \(x\in I\) test \(x,x+a,x+c\) in \(Y\). They are odd and all in \((2b+12,4b]\). Each deep deficient chain rules out at most three candidates, one for each inverse offset. The number of candidate odds is at least \(L/2-1\). By (1),
\[
 L/2-1-3(K-\sigma)\ \ge\ \sigma+3(q+\beta n)-3\ell-13>0.
\]
Take a surviving \(z_0=x\).

* Otherwise all the disjoint pairs are odd-odd. In \(I\), the positions of valuation \(2,4,6,\ldots\) number at least \(L/6-\ell-1\). For each \(1\le j\le\ell\), count the class \(2^{2j}\bmod(2\cdot4^j)\), losing at most one endpoint; the density sum is \((1-4^{-\ell})/6\) and \(L<4^\ell\). The number of trials exceeds \(K-\sigma\) by at least
\[
 \sigma/3+q+\beta n-2\ell-5>0.
\]
One such \(z_0\) belongs to \(Y\). Fix it. For each disjoint pair its two contacts \(z_0+a,z_0+c\) are odd positions of \((m/2,m]\): \(m\le4b+3\) and \(z_0+c\le4b-1\). A missing contact can spoil only one pair by disjointness. By (2) a pair survives the single \(r\)-account.

In both cases the same \(Y\) contains the triangle \(a,c,z_0\) and all three sums. The three distinct even vertices
\[
 w_1=4a,\quad w_2=4c,\quad z=4z_0
\]
and all three of their pair sums lie in \(G\). Write \(B_*=\max(w_1,w_2)\). We have \(B_*\le l/4\), \(w_1+w_2\le l/4\), and \(z\le12b\le3l/4\). The delayed tester gives \(2z-l-2>32\sigma+60\), since \(l\le16b+15\). Thus it lies high enough in the interval to cover exactly the inverse load of the later reflection.

## 4. The full four-residue case with a single physical charge

The five offsets \(T\cup\{0\}\) have multiplicities \(2,1,1,1\). The parity opposite the duplicated residue has exactly two singleton offsets, in opposite classes modulo four. Choose the smaller \(u\) as target and the other \(u'\) as control. Then \(u\le l/2\): if neither is zero this follows from the actual pair sum in \(G\cap[1,l]\), and if one is zero then \(u=0\). All other offsets have opposite parity. This works for any choice of the duplicated class.

On the progression \(R+u'\equiv4\pmod8\), the translate \(R+u\) is two modulo four. Restrict to
\[
 \max(2l+2,\ l+4+2z-u)<R\le
 \min(3l,\ 2l+2z-2B_*-u).                                                       \tag{3}
\]
Its length is at least \(\min(l/2-4,\ 2z-l-2)>32\sigma+8\). Indeed the four endpoint differences are \(l-2\), \(2l-4-2z+u\), \(2z-2B_*-u-2\), and \(l-4-2B_*\). Use \(z\le3l/4\), \(u\le l/2\), \(B_*\le l/4\) and \(l\ge16b\), \(\sigma<b/6\). Consequently this one class modulo eight supplies more than \(4\sigma\) integer candidates. Each satisfies \(h/2<R\le3h/4\), and all five \(R+t\) for \(t\in T\cup\{0\}\) lie in \((h/2,h]\).

For every candidate put \(M_R=(R+u)/2\) and \(v=M_R-z\). They are odd, and (3) gives \(l/2+2<v\le l-B_*\). Run the following tests simultaneously:

1. Require the three opposite-parity upper translates and \(R+u'\) in \(G\). These are respectively odd or of valuation two. Each is canonical at the top of its original chain, so absence requires a deficit.
2. Require at least one of \(R+u,M_R\) in \(G\). They form the whole two-position chain with odd primitive \(M_R\in(h/4,h/2]\). Failing this test requires a deficit. A missing top with its half present passes this test.
3. Require \(v,v+w_1,v+w_2\in G\). Each tested lower odd \(x\) lies in \((l/2+2,l]\); its original chain is \(x,2x,4x\) ending at \(4x\in(h/2,h]\). Missing its primitive \(x\) reduces the maximum.

Each failed test uses a primitive \(>l/2\). The primitive of the upper valuation-two control is \((R+u')/4>l/2\), and the other upper primitives are odd tops or the target half. For each fixed chain and each fixed role, its endpoint or primitive determines at most one \(R\). Among upper roles a fixed chain's top can be reached only through offsets in a single residue modulo four, hence at most two. If this chain can also cause any lower test failure, its top is four modulo eight. The **single** upper control is then its only possible upper role. It can spoil at most three further candidates through the three lower roles. This bounds the number of rejected \(R\)'s by \(4\sigma\) for the union. No owner is counted separately as a fresh unit across the top and reflected lists.

Fix a survivor. If \(R+u\in G\), then \(R\) joins the original \(T\); this includes the case \(u=0\), where the target is the vertex itself. Otherwise \(M_R\in G\). Its exact identity \(v+z=M_R\) gives the third edge from \(v\) to the even triangle in §3. Requirements in step 3 give its other two edges and its own membership. Thus \(w_1,w_2,z,v\) are four distinct elements of \(G\cap[1,l]\), all six sums in \(G\). Odd \(v\) is distinct from the three even entries. Pick \(P\equiv4-v\pmod8\) in \((h/2,3h/4]\). The five positions \(P,P+w_1,P+w_2,P+z,P+v\) are high odd or of valuation two, all at most \(h\). Each missing position has a deficient chain; at most \(5K\) candidates fail among at least \(h/32-1\), and \(K<h/384\) at the stated threshold. This extension follows the fixed choice of the quartet and uses the unchanged inventory. It produces all four new contacts. The newly chosen quartet is ambient in \(G\); its pair labels need not be at most \(l\) for the dilation or upper step.

## 5. Composition

Every original inner four \(T\) selected in §2 either omits a residue or has the full profile of §4. Both cases yield a five in \(G\) with the exact ranges in §1. After dilation, the reviewed outer second reflection produces six short vertices in \(D\) with their fifteen edges and one common upper seventh with six more. The independently reviewed nine-offset lift then supplies a nine in the original \(B\). Depending on the chosen physical pivot, it either adds eight edges to an actual lower eight, or obtains seven dilates with 21 internal edges, a physical neighbor with seven contacts, and a final upper vertex with eight contacts. All 36 unordered pair incidences are in this one \(B\); different pairs may have the same sum label.

The argument proves existence of some qualifying short six. The independently retained positive-gap example in the initial review shows why a prescribed six can fail even when another works. No search over scales, solver computation or order-nine Lean build is used in this argument.
