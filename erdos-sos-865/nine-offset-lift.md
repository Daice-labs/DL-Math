# Nine-offset lift and a reduction of its root-supply assumption

## Physical theorem

Fix β>0, H=⌊n/4⌋, J=⌊H/4⌋ and Q=H/4096 (real). In the handoff's doubling-free physical B⊆[1,4n], retain the original signed gap |D|−q≥c7 n/4+βn. Assume an internal eight S in L=B∩[1,n], including all 28 sums in L. Assume seven distinct roots r₁,…,r₆,R in D, with all 21 mutual sums in D, each rᵢ≤J−64Q, and H/2<R≤3H/4. Above a threshold depending only on β, there is a nine in B for **every** placement of the nine offsets {0}∪S. The proof below also derives six suitable small roots from the signed gap, and obtains their common upper seventh for a specified class of their residue placements. The unrestricted upper-seventh supply is open in this argument.

Let A(H) be the sum of the independence numbers of the doubling chains in [1,H], κ=A(H)−|D|. D is doubling-free, so κ≥0. For each chain, taking its first, third, fifth, … positions attains its maximum. Consequently A(H)=⌈H/2⌉+A(⌊H/4⌋), with A(0)=0, and A(H)≤2H/3+1+⌊log₄ H⌋ for H≥1 by iteration (rounding adds at most one per nonempty level). Since 2/3−c7=1/6144 and n/4≥H, we have κ+q≤(2/3)Q+1+⌊log₄ H⌋−βn. Choose n so large that βn>1+⌊log₄H⌋ and Q≥10, before B and its vertices. Thus κ+q<2Q/3. A top-band position y in (H/2,H] with even 2-adic valuation ends an odd-length chain. Its maximum independent set is unique, taking every other position starting at the first. Missing y costs at least one in κ. Distinct such y end different chains. This bound includes both odd y and y of valuation two or four.

Let V={4rᵢ:1≤i≤6}, z=4R, and W=V∪{z}. These are seven distinct positive even members of B with all 21 sums in B by dilation. We have n/2<z≤3n/4: write n=4H+s, s≤3, and use 4R≥2H+2 and 4R≤3H. Also every y∈V is at most 4J−256Q≤n/4−H/16. Write U={0}∪S; |U|=9, and at most one member of U exceeds n/2 since two large distinct positive offsets would sum beyond n.

## Exhaustive placement and the common progression

If the smaller parity of U contains at most three offsets, select it. Partition that parity into its two residue classes mod four. Make the class containing the unique large offset, if present there, the controls; otherwise choose either as controls. The other class is the targets. If the smaller parity contains four offsets and all four are ≤n/2, select it. If that side contains a large offset, select the other five, which are all ≤n/2. In both these last cases choose the smaller mod-four cell of the selected side as controls. This proves at once, including empty sides or cells, that every target is ≤n/2, that c=number of controls is ≤3, that t+c≤5, and that t+c≤3 whenever the chosen parity contained the large offset. Labels for the opposite parity will be odd.

Write a for the residue of the target cell (well-defined even if empty) and use p≡2−a mod four. Target labels p+u are 2 mod four and controls are multiples of four. For c≤1 choose one residue class mod eight making the single control label 4 mod eight, or choose any compatible lift when c=0. For 2≤c≤3 start with any residue b≡2−a mod four and write p=b+4j. The c integers j+(b+u)/4 for the control offsets u can be made all odd except at most one by choosing j's parity. If one is even, choose j mod eight so that that one is 4 mod eight, preserving the odd remainder of the list. Thus a single progression mod 32 gives control labels 4 mod eight or 16 mod 32. The construction counts offsets with multiplicity even if translated residues agree.

Intersect this progression with the half-open integer interval

    n+2z < p ≤ n+2z+⌊H/8⌋.

Then 2n<p≤3n because z>n/2 and 2z≤3n/2. All p+u are in (2n,4n]. For each target u put mᵤ=(p+u)/2 and vᵤ=mᵤ−z. The integer mᵤ is odd, so vᵤ is odd. For every y∈{0}∪V,
    
    n/2 < vᵤ+y ≤ 3n/4+⌊H/8⌋/2+4J−256Q ≤ n.

The strict lower bound follows from p>n+2z, u,y≥0; the upper from u≤n/2, 4J≤n/4 and 256Q=H/16. This includes a zero target and endpoints for odd n.

## One rejection account and the two completions

Let O be the absent high odds in (n/2,n], δ_h=|O|, and E the excess upper holes. For each candidate p, test all nine upper labels against E, all controlled labels for membership, and all seven high labels vᵤ+y for every target, before choosing any missing target. A missing non-excess control x is the double of a member of M. If x≡4 mod eight, then the occupied x/2 forces x/4∈O; its range is (n/2,n]. If x≡16 mod 32, its occupied half forces x/4 absent from B, so the odd root x/16∈(H/2,H] is absent from D. Here x>2n gives x/16>H/2 and x/16≤n/4, with its integrality giving x/16≤H. The latter missing roots have total count ≤κ by the odd-length chain argument.

For any fixed offset an E-label determines p. For a fixed control its quarter or sixteenth determines p. For fixed u,y an absent high label vᵤ+y determines p. Therefore the union of rejected pivots has size at most

    9|E|+(7t+c)δ_h+cκ ≤ max(9,7t+c)q+cκ.

The original q covers both disjoint inventories E and O, also retaining its empty-slot term; the displayed coefficient aggregates all inverse roles of the same singleton. The root-charge positions are represented physically by missing multiples of four below n, distinct from high odd singletons and upper E. A candidate with multiple failures is removed only once.

With c≥2 the congruence has period 32. Since t+c≤5 and c≥2, max(9,7t+c)≤23. At least ⌊⌊H/8⌋/32⌋=⌊16Q⌋ candidates occur, and 23(q+κ)<46Q/3<16Q−1 for Q≥10. With c≤1 the period is eight, max(9,7t+c)≤35, and there are at least ⌊64Q⌋ candidates, exceeding 35(q+κ). These bounds count any single residue on consecutive integer labels and require no alignment of n and z with 32.

Take a surviving p. If every p+u is present, zero gives p∈B, and p exceeds all eight seed vertices. The 28 internal and eight new sums form a nine. Otherwise choose any missing p+u. It cannot be a non-excess odd (all forced holes are even), or a control by the preceding test, or an excess hole. Thus u is a target and the missing p+u=2mᵤ forces mᵤ∈M. The already qualified high odd vᵤ belongs to B by the zero test, has each of its six sums with V in B, and has vᵤ+z=mᵤ∈B. By parity it is distinct from W. This gives an actual eight with 21+7 edges.

For this fixed eight choose a fresh P∈(2n,3n] with P≡4−vᵤ mod eight. There are at least ⌊n/8⌋ candidates. P and all seven P+w (w∈W) are odd upper labels; a failure must lie in odd E and each has at most eight inverse roles. P+vᵤ is an upper label 4 mod eight; if absent it belongs to even E or its high odd quarter is in O. All ranges are in (2n,4n] because each offset is at most n. Hence at most 8|E_odd|+|E_even|+δ_h≤8q candidates fail, fewer than ⌊n/8⌋. This conditional selection uses the same inventory afresh for each fixed prior survivor. No two existence bounds are added. The new upper P is distinct from the eight previously selected lower vertices. All 21+7+8=36 edges are accounted for.

## What the signed gap supplies

The same signed word supplies the original internal eight under the order-eight midpoint premise: |L|=⌈n/2⌉+|D|−q+|E|≥c8 n+βn since c8=1/2+c7/4. Apply the order-eight limit at tolerance β/2 with its threshold chosen in advance.

The short six require only the existing order-eight root-supply theorem under its order-five midpoint premise (also implied by the order-eight premise). Set D_J=D∩[1,J]. Map each member of D∩(J,H] to itself when it exceeds H/2, or its double otherwise. This is an injection into (H/2,H], by doubling-freeness and the floor defining J. Thus

    |D_J| ≥ |D|−⌈H/2⌉ ≥ c6 J+q+βn−1/2,

using c7=1/2+c6/4, n≥4H, H≥4J. Transfer this exact root prefix by embedding into an auxiliary doubling-free word with parameter n'=4J. Its lower entries are all odds through n' and exactly the multiples 4D_J; take its middle empty and its upper full. Doubling an odd lands on an absent residue-two lower label or in the empty middle. An occupied lower multiple of four doubles to another lower multiple only when the original roots could double, which they cannot. Each odd slot and high singleton is filled, E'=∅, q'=0, and its quarter roots are exactly D_J. Choose the source threshold for tolerance β/2 before n; for large n the inequality βn−1/2≥(β/2)n' verifies that theorem's signed requirement c6 n'/4+(β/2)n'. Then K8CertifiedEndpoint.root_supply_of_dousse5 (declaration OP02.SharpK8.root_supply_of_dousse5) yields six distinct actual roots F⊆D_J with all 15 sums in D_J. Five are ≤⌊J/4⌋−5J/128 and the sixth is in (J/2,3J/4]. All six are ≤J−64Q for sufficiently large H since J/4≥H/64. The auxiliary word only realizes the input to the proved root theorem. Every exported root and sum lies in the *original* D_J.

Here is a sufficient condition to supply the remaining upper root in the same D. For F from this argument (or any six this short with their sums in D), put U'=F∪{0}. Suppose some mod-four residue class of U' is empty and the class opposite it (difference two) has at most three members. Use the empty cell as targets and the other as controls in the phase construction above, this time for R∈(H/2,3H/4]. Every R+u, u∈U', is odd, 4 mod eight, or 16 mod 32, hence canonical (even 2-adic valuation). All seven are in the top band, since u≤J and R≤3H/4. A missing one costs a top-band canonical hole; the injective map for each labelled role bounds the union by 7κ. Even in a prescribed period-32 class, the interval has ≥⌊H/128⌋=⌊32Q⌋ candidates (one point per complete length-32 subinterval), greater than 7κ. A surviving R is distinct from all six lower vertices and supplies its own membership and all six contacts. Therefore the lift and an actual nine follow in this branch.

For arbitrary F the first unproved extension inequality, with Y=(H/2,3H/4]∩ℤ, is

    |{R∈Y : ∃u∈F∪{0}, R+u∉D}| < |Y|

for at least one admissible F, or a separately constructed complete seven of the specified shape. In particular, if all four cells of U' occur, every phase forces at least one label R+u≡2 mod four. Its absence can be explained by an occupied odd half in D∩(H/4,H/2]; this need not consume any complete-chain deficit, since a chain of length two can attain its maximum using that half. This is an unpaid witness for the phase argument. It does not show that this six lacks an upper neighbor, or that no other six has one.

Source inputs are the frozen signed inventory and integer constants, and the existing Studio order-eight proof modules K8GeometrySpec, K8Budget, K8ProfilesProgression, K8Physical, K8Selection and K8CertifiedEndpoint. This is a new paper derivation. The nine-offset lift, auxiliary-prefix use, and upper-seventh branch have not been Lean-checked here. No new solver or sweep was used.
