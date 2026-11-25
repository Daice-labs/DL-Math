# The pair-sum three-prefix theorem for arbitrary triples

**A uniform arbitrary-triple theorem, with a complete written proof.**

> **Theorem T (local).** Let 1 ≤ a < b < c with gcd(a, b, c) = 1. Put
>
>     Lat = {(A_ab, A_ac, A_bc) ∈ Z³ : c·A_ab − b·A_ac + a·A_bc = 0,  A_xy ≡ x + y (mod 2)},
>     δ* = min over Lat of max(|A_ab|/(a+b), |A_ac|/(a+c), |A_bc|/(b+c)),     κ* = (1 − δ*)/2.
>
> For every {a, b, c}-avoiding S ⊂ Z and every integer t, one of the prefixes [t, t+a+b), [t, t+a+c), [t, t+b+c) holds at most κ*·(its length) members.
>
> **Theorem T′ (global).** For every 1 ≤ a < b < c, with g = gcd(a, b, c) and D = {a, b, c}:
> μ(D) = κ(D), with |S ∩ [u, v)| ≤ κ(D)(v − u) + κ(D)·(b + c − g) for all integers u < v and every D-avoiding S, and with a periodic attaining set.

If the proof survives review, this is μ = κ for every three-element distance set.

**The answer to the central question.** The smallest-distance-two mechanism was not special to two. For a primitive triple, the local signing forces one class that is always realized by a single common phase θ. Two facts do this:

1. A **general rectangle identity** couples the three pair-sum counts exactly: Σ_{k<b} W_ac(t+k) − Σ_{k<c} W_ab(t+k) = Σ_{j<a} W_bc(t+j). With zero curl it is c·W_ab − b·W_ac + a·W_bc = 0.
2. A **lattice lemma**: for primitive (a, b, c), the integer solutions of that relation with the three forced parities are exactly the classes T(h) of odd triples h. So no larger lattice is minimized over. Pairwise gcds do not matter; only gcd(a, b, c) does.

The proof does not use the accepted smallest-distance-one or smallest-distance-two theorems. Those cases come out again as special cases and serve as independent controls (§6).

Assurance: the decisive consequence is finite and sign-free. An exhaustive search at 25 triples chosen to attack pairwise gcds, parity and boundaries found no counterexample. That is a failed kill test, not evidence of uniformity.

## 1. Normalizing the remainder

**gcd reduction.** Let D = g·D′. For S ⊂ Z and 0 ≤ r < g put S_r = {n : gn + r ∈ S}.

- S avoids D iff every S_r avoids D′ (two members differing by g·d′ lie in one residue class).
- An integer interval [u, v) meets class r in a set {gn + r : n ∈ J_r} with J_r an integer interval, and Σ_r |J_r| = v − u. So if |S′ ∩ J| ≤ κ′|J| + C′ for every D′-avoiding S′ and integer interval J, then |S ∩ [u, v)| ≤ κ′(v − u) + g·C′.
- If S′ is a periodic D′-avoiding set of density κ′, then {gn + r : n ∈ S′, 0 ≤ r < g} is periodic, D-avoiding, of the same density.
- κ(D) = κ(D′): ‖g·d′·θ‖ = ‖d′·(gθ)‖ and θ ↦ gθ is onto the circle. A rotation θ′ = p/r for D′ gives the rotation θ′/g for D directly.

Hence μ(D) = μ(D′), κ(D) = κ(D′), and the constant multiplies by g.

**After dividing by the gcd.**

| Primitive triple | Status |
|---|---|
| a = 1 | accepted (op05 complete classification). Reproved here as a special case; not new coverage. |
| a = 2 | accepted (all-{2,b,c} acceptance). Reproved here as a special case; not new coverage. |
| a, b, c all odd | elementary: the a-pairs (n, n+a), t ≤ n < t + a, partition [t, t+2a), so every 2a-window holds at most a members; the even integers attain 1/2; θ = 1/2 gives κ = 1/2. Theorem T agrees (δ* = 0 at h = (a, b, c)). |
| a ≥ 3, not all odd | **the new domain.** Closed on paper by Theorem T. Pairwise gcds are allowed. |

## 2. The local construction

Fix a primitive triple and t. Write s(u, d) ∈ {±1} for the sign of a wall (u, u+d) (both ends outside S), 0 otherwise, and curl(z; x, y) = s(z, x) + s(z+x, y) − s(z+y, x) − s(z, y).

**Pair-sum counts.** For (x, y) ∈ {(a, b), (a, c), (b, c)}:

    W_xy(z) = Σ_{u=z}^{z+y−1} s(u, x) − Σ_{u=z}^{z+x−1} s(u, y)            window [z, z+x+y).

In that window the listed pairs form a 2-regular graph: a position at offset r is the lower end of an x-pair iff r < y, the upper end iff r ≥ x, and likewise for y. It has gcd(x, y) cycles. No pair is doubly occupied, so walls = x + y − 2·members:

    members[z, z+x+y) ≤ (x + y − |W_xy(z)|)/2,        W_xy(z) ≡ x + y (mod 2).

Only the total over all cycles of the window is used, so several components cause no difficulty.

**Increment.** W_xy(z+1) − W_xy(z) = −curl(z; x, y).

**General rectangle identity (every S, every signs).**

    Σ_{k=0}^{b−1} W_ac(t+k) − Σ_{k=0}^{c−1} W_ab(t+k) = Σ_{j=0}^{a−1} W_bc(t+j).

*Proof.* The a-terms on the left are both Σ s(t+k+j, a) over 0 ≤ k < b, 0 ≤ j < c, and cancel. The rest is Σ_{j<a} [Σ_{k<c} s(t+j+k, b) − Σ_{k<b} s(t+j+k, c)]. ∎

**Faces.** The identity uses W_ab at c starts, W_ac at b starts and W_bc at a starts. The faces whose curls are the corresponding increments are

    F_ab = {(t+k; a, b) : 0 ≤ k ≤ c−2},   F_ac = {(t+k; a, c) : 0 ≤ k ≤ b−2},   F_bc = {(t+k; b, c) : 0 ≤ k ≤ a−2},

a + b + c − 3 faces inside [t, t+a+b+c−2]. For a = 2 this is the accepted complex; for a = 1 the family F_bc is empty. Boundary: ∂(z; x, y) = (z, x) + (z+x, y) − (z+y, x) − (z, y). Orientation: +1 on F_ab, −1 on F_ac, +1 on F_bc.

**Incidence (r = offset of the lower end from t; oriented coefficients).**

| Pair | r | Faces | Coefficients |
|---|---|---|---|
| a-pair | 0 … b−2 | F_ab(k=r), F_ac(k=r) | +1, −1 |
| a-pair | b−1 | F_ab(k=r) | single |
| a-pair | b … c−2 | F_ab(k=r), F_ab(k=r−b) | +1, −1 |
| a-pair | c−1 | F_ab(k=r−b) | single |
| a-pair | c … b+c−2 | F_ab(k=r−b), F_ac(k=r−c) | −1, +1 |
| b-pair | 0 … a−2 | F_ab(k=r), F_bc(k=r) | −1, +1 |
| b-pair | a−1 | F_ab(k=r) | single |
| b-pair | a … c−2 | F_ab(k=r), F_ab(k=r−a) | −1, +1 |
| b-pair | c−1 | F_ab(k=r−a) | single |
| b-pair | c … a+c−2 | F_ab(k=r−a), F_bc(k=r−c) | +1, −1 |
| c-pair | 0 … a−2 | F_ac(k=r), F_bc(k=r) | +1, −1 |
| c-pair | a−1 | F_ac(k=r) | single |
| c-pair | a … b−2 | F_ac(k=r), F_ac(k=r−a) | +1, −1 |
| c-pair | b−1 | F_ac(k=r−a) | single |
| c-pair | b … a+b−2 | F_ac(k=r−a), F_bc(k=r−b) | −1, +1 |

Empty ranges drop out (a = 1; b = a + 1; c = b + 1). So **(F1)** every pair lies in at most two faces, and **(F2)** two faces at a shared pair give it opposite coefficients. Six pairs are single.

**Signing lemma.** For every avoiding S the walls on these faces admit signs with curl 0 on every face.
*Proof.* The accepted pass-graph argument, which uses only (F1) and (F2). A face has 0, 2 or 4 walls; a 2-wall face is one pass and a 4-wall face is two passes at opposite corners; the pass condition is α(f, E)σ(E) + α(f, E′)σ(E′) = 0. By (F1) the pass graph is a union of paths and cycles, and by (F2) the product of propagation ratios round a cycle of r passes is (−1)^r·(−1)^r = 1. ∎

**Local class.** With such signs, W_ab is constant on [t, t+c−1], W_ac on [t, t+b−1] and W_bc on [t, t+a−1]. The rectangle identity gives

    c·W_ab − b·W_ac + a·W_bc = 0,        W_xy ≡ x + y (mod 2).

So A := (W_ab, W_ac, W_bc) ∈ Lat, hence max |W_xy|/(x+y) ≥ δ*, and the corresponding prefix at t holds at most (x+y)(1 − δ*)/2 members. This proves Theorem T. ∎

The signs are private to the start t. Only the unsigned prefix inequality leaves the local argument.

## 3. Arithmetic: the class is always a rotation class

For an odd triple h = (h_a, h_b, h_c) put T(h) = (b·h_a − a·h_b, c·h_a − a·h_c, c·h_b − b·h_c).

**Lattice lemma.** If gcd(a, b, c) = 1 then Lat = {T(h) : h_a, h_b, h_c odd}.

*Proof.* Let n = (a, b, c) and Λ₀ = {A ∈ Z³ : c·A_ab − b·A_ac + a·A_bc = 0}. Up to signs and order of coordinates, T(h) = n × h and Λ₀ = n^⊥ ∩ Z³.

(i) *T(Z³) = Λ₀.* Extend n to a basis (n, p, r) of Z³ with determinant 1. The dual basis is p × r, r × n, n × p. A vector v ∈ n^⊥ ∩ Z³ has coordinates (v·n, v·p, v·r) = (0, α, β) in the dual basis, so v = α(r × n) + β(n × p) = n × (βp − αr).

(ii) *Λ₀ ∩ 2Z³ = 2Λ₀*, since half of an even solution of a linear equation is an integer solution.

T(1, 1, 1) = (b − a, c − a, c − b) has the parities of Lat. If A ∈ Lat, then A − T(1, 1, 1) ∈ Λ₀ ∩ 2Z³ = 2Λ₀ = 2T(Z³), so A = T((1,1,1) + 2k). Conversely T of an odd triple has those parities. ∎

For g = gcd(a, b, c) > 1 step (i) fails. That is exactly why the non-primitive case goes through §1 and not through parities.

**κ = κ*.** Write dθ = h_d/2 + ε_d with h_d odd and |ε_d| ≤ 1/2. Then ε_b = (b·ε_a + A_ab/2)/a and ε_c = (c·ε_a + A_ac/2)/a with A = T(h). For a given h and δ, a common ε_a with all |ε_d| ≤ δ/2 exists iff the intervals

    [−δ/2, δ/2],   [(−A_ab − aδ)/(2b), (−A_ab + aδ)/(2b)],   [(−A_ac − aδ)/(2c), (−A_ac + aδ)/(2c)]

have a common point, iff they meet pairwise, iff |A_ab| ≤ δ(a+b), |A_ac| ≤ δ(a+c), |A_bc| ≤ δ(b+c). (For the third pair use c·A_ab − b·A_ac = −a·A_bc.)

- Any θ gives an odd triple (h_d the odd integer nearest 2dθ) and δ = 1 − 2·min ‖dθ‖ satisfying the three conditions. So δ* ≤ 1 − 2·min ‖dθ‖, i.e. κ(D) ≤ κ*.
- At a minimizer A = T(h) of Lat, with δ = δ* ≤ 1, a common ε_a exists and can be taken rational. Then ‖dθ‖ = ½ − |ε_d| ≥ κ* for every d. So κ(D) ≥ κ*.

**Guards.** The minimum exists: a sublevel set of the max is finite, because it bounds all three coordinates. 0 ≤ δ* < 1: the first bullet with any θ having min ‖dθ‖ > 0, e.g. θ = 1/(2c). δ* = 0 exactly when a, b, c are all odd.

**Periodic attainment.** Write the rational θ = p/r in lowest terms. Each ‖dθ‖ is a multiple of 1/r and κ* ≤ min ‖dθ‖ ≤ κ(D) = κ*, so κ* = h/r. S_θ = {n : (np mod r) < h} is r-periodic with exactly h members per period. Two members cannot differ by d ∈ D: their phases would differ by dθ, of circular norm at least κ*, while two points of the half-open arc [0, κ*) are at circular distance less than κ* (κ* ≤ ½). This holds for all pairs of integers, so across every period seam.

(For all-odd triples κ* = ½, θ = ½ and S_θ is the even integers.)

## 4. Composition and the global statement

**Primitive triples.** Greedy tiling by good prefixes, each of length at most b + c: for integers u < v,

    |S ∩ [u, v)| ≤ κ*(v − u) + κ*(b + c − 1).

With §3: μ(D) = κ(D) = κ*.

**All triples.** By §1 with D = g·D′, D′ = {a/g, b/g, c/g}: μ(D) = κ(D) = κ*(D′), and

    |S ∩ [u, v)| ≤ κ(D)(v − u) + g·κ(D)·(b/g + c/g − 1) = κ(D)(v − u) + κ(D)(b + c − g).

**Role of predecessor results.** None is a premise. The accepted signing argument is restated in six lines and depends only on (F1), (F2). The accepted a = 1 and a = 2 theorems are not used; they agree with Theorem T where both apply. Real endpoints: as in the accepted corrections, the constant above is for integer endpoints.
