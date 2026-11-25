## S55.7 From two checked root constructions to every fixed order

### S55.7.1 What the two inputs supply

An internal clique in a set A consists of distinct members of A with every off-diagonal pair sum in A. Call A doubling-free if x and 2x never both belong to A. At order k ≥ 6 the induction proves a stronger statement, Gₖ. Given η > 0 and T sufficiently large for k and η, a doubling-free A ⊆ {1,…,T} of size at least (cₖ + η)T contains an internal k-clique with one vertex above T/2, prescribed upper bounds on all its vertices, and at most three vertices in one of the two odd residue classes modulo four. This last condition preserves a choice of residue for the next step.

The inputs come from earlier problems on a doubling-free set B ⊆ {1,…,4n}. Set H = ⌊n/4⌋ and D = {x ∈ {1,…,H} : 4x ∈ B}. A root is an integer in D. Write q for the unfilled lower odd slots plus the holes in (2n,4n] left after accounting for the doubles of occupied middle elements. For each β > 0 the two root theorems apply above a threshold fixed before B. The small-root bounds in the table hold for every small vertex x.

| Input | Surplus hypothesis | Witness in D |
|---|---|---|
| Six roots | card(D) − q ≥ (341/2048 + β)n | Five small roots with 128x + 5H ≤ 128⌊H/4⌋, and one upper root R. All 15 sums lie in D. |
| Seven roots | card(D) − q ≥ (1365/8192 + β)n | Six small roots with 64x + H ≤ 64⌊H/4⌋, and one upper root R. All 21 sums lie in D. |

In both rows H/2 < R ≤ 3H/4. The six-root declaration takes the five-point midpoint theorem as an explicit input. The checked eight-point midpoint theorem supplies it by restriction. The seven-root declaration comes from the common-upper-seventh construction and takes no external mathematical premise. The paper derivation of that construction uses the independently established order-eight result.

To use the two inputs for an arbitrary doubling-free A, take n = 4T. Up to n, put into B all odd integers and all 4x with x ∈ A. Leave (n,2n] empty and fill (2n,4n]. This B is doubling-free, its lower odd slots are full, and it has no upper holes. Consequently H = T, q = 0 and D = A. Choosing β = η/4 gives exactly the required density hypothesis. With at most seven vertices, one of the two odd residue classes contains at most three. The Lean declarations `shaped_six` and `shaped_seven` implement this passage from the root inputs to the starting statements G₆ and G₇.

### S55.7.2 One candidate and two ways to complete the clique

The instrument had already encountered the distinction between local and simultaneous constraints. In an order-seven experiment its composition engine combined five forbidden-triangle clauses with three shared pivots and proved that at least three distinct probe owners were absent under the specified hypotheses. Eight certificates passed separate replay. In the order-eight construction described in §6.5, a test of the saved family exhibited abundant odd neighbors and an eight outside the prescribed extension. The full argument below counts the failures of all the tests applied to one candidate.

Put J = ⌊T/4⌋. The identity cₖ = 1/2 + cₖ₋₁/4 leaves enough density in A ∩ {1,…,J} for Gₖ₋₁. Project its multiples of four down by four and apply Gₖ₋₂. Dilating this second clique back gives two internal cliques in the first prefix. Write F for the first, of size k − 1, and W = V ∪ {z} for the second, of size k − 2. Every vertex of W is divisible by four, and z lies above J/2. The two cliques may intersect. Each of the constructions below uses the edges of its own predecessor.

Partition {1,…,T} into complete chains x, 2x, 4x, … with odd first element x. A chain of length ℓ contributes at most ⌈ℓ/2⌉ members to a doubling-free set. Let K be the sum of those capacities minus |A|. At most K chains fall short of capacity, and K < eₖT eventually, where eₖ = 2/3 − cₖ. The proof tests upper candidates R on a single arithmetic progression. The k offsets comprise F and 0. For t target offsets u the sum R + u has an odd half m = (R + u)/2. At every nontarget offset, R + u must belong to A. At each target, at least one of R + u and m must belong to A. Writing v = m − z, the lower tests also require v + w in A for every w in V ∪ {0}.

The number of rejected candidates is at most [k + (k − 2)t]K. To see why, assign each rejection to a failed test and a deficient chain. For a fixed upper offset, the chain’s last member is R + u and determines R. For a fixed lower pair (u,w), its odd first member d is v + w, giving R + u + 2w = 2(d + z). Again R is determined. A chain can reject different candidates through different tests. The count allows one candidate per chain per specified test and uses a single inventory of chains.

One candidate R survives. If all its translates are in A, append R to F. Otherwise choose a missing target translate for that same R. The tests force its half m into A and put v and every v + w for w in V into A. The last contact is the equality v + z = m. Now W ∪ {v} is an internal (k − 1)-clique, and a fresh upper vertex completes it. This construction has only two odd vertices. The direct construction preserves the sparse odd class by its residue choice.

### S55.7.3 Why the induction covers every fixed order

At order eight the tightest progression has period 32. In units of e₈T its leading supply is 48 against at most 44 loss roles. The strict gap absorbs the fixed rounding error. At orders eight through eleven the choice of residue keeps the largest seed vertex outside the target class. At order twelve the proof permits that vertex to supply the missing translate. The direct completion retains 55 old pair incidences and adds 11. The replacement retains 45, adds 10 through v and 11 through the fresh upper vertex. Both give 66 incidences in one set. Repeated sum values cause no difficulty.

Order thirteen has unequal predecessor bounds and is checked separately. From order fourteen on, both predecessors use the same bounds. The furthest lower label is at most 127J/128. All small output vertices are at most 101T/512, below the permitted 13T/64, and the direct upper vertex is at most 137T/256, below the permitted 9T/16. The upper bound on loss as a fraction of T is k(k − 1)eₖ. From one order to the next it is multiplied by (k + 1)/(4(k − 1)), which is less than one. Thus the positive surplus persists for every later k. The interval threshold is chosen from k and η before the set or either clique is chosen.

### S55.7.4 Sharpness on the original interval

For the upper bound let A ⊆ {1,…,N} have no internal k-clique and define P = {x ∈ A : 2x ∈ A}. If P had positive density at arbitrarily large N for fixed k, Dousse’s Corollary 3.5 would give k distinct points in P whose pairwise midpoints also lie in P. The doubles of those midpoints are exactly the pair sums in A. It follows that |P| = o(N), uniformly over the avoiding sets at that order. Deleting P leaves a doubling-free subset, to which Gₖ applies for k ≥ 6. The reflection bound at order two, Cipollini’s order-three theorem and the earlier order-four and order-five endpoints supply the smaller orders. [66, 72]

For the lower bound put m = ⌊N/(2·4ᵏ⁻²)⌋ and take the k − 1 bands (4ʲm, 2·4ʲm] for 0 ≤ j ≤ k − 2. The sum of any two distinct members of the same band falls in the following gap. The union therefore has no internal k-clique. Its size gives the finite bound

f(N,k) ≥ 1 + ((4ᵏ⁻¹ − 1)/3) ⌊N/(2·4ᵏ⁻²)⌋.

The extra unit comes from the definition of the least forcing size. Dividing by N gives cₖ in the limit, matching the upper bound.

### S55.7.5 Proof objects and independent review

| Result | Verification available on 21 November 2026 |
|---|---|
| Orders four through seven | Lean checked the original-interval endpoints with explicit fixed-order midpoint inputs. The later checked midpoint theorem at order eight supplies the required lower-order inputs by restriction. |
| Orders eight and nine | Lean checked 5461/8192 and 21845/32768 as the respective limits for the original threshold. The declarations carry no external mathematical premise. The fixed-order midpoint proofs use mathlib’s Roth theorem. |
| All orders, paper | Three fresh non-author model reviews accepted the order-twelve completion, shared-loss count, induction and sharp endpoint. They clarified how one deficient chain can reject different candidates through different tests. |
| All orders, Lean | The checked proof covers both root inputs, their use in the induction, and the original least forcing threshold. Lean also proves the finite lower bound with its extra unit for every interval length. |

The six-root input is `OP02.SharpK8.root_supply_of_dousse5` and the seven-root input is `OP02.SharpK9.root_seven_supply`. In the paper, the midpoint step uses Dousse’s Corollary 3.5 [66]. In Lean, `OP02.AllOrders.midpoints_all` derives it for arbitrary order from a checked consequence of Roth’s theorem. This discharges the midpoint premise inside the formal proof.

Astra supplied the all-orders paper. After its review, the Studio formalization proved the displayed limit in `OP02.AllOrders.sharp_limit` and the public finite-sum statement in `OP02.AllOrders.erdos_sos`. Lean checks that the project’s threshold and proposition are definitionally equal to the versions transcribed from the public source [73]. A fresh Studio build rebuilt 297 modules. A separate Lean checker replayed 20 all-orders modules and probes. A non-author audit matched the sources, declarations and replay receipts. The final declarations depend only on propositional extensionality, classical choice and quotient soundness.
