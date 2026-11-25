# Separate corrections and proof clarifications

The original submission is unchanged. No theorem-changing repair is required. The following explicit expansions clarify compressed arguments and correct the interpretation of the historical test evidence. All mathematical expansions were independently reconstructed in the reviewer reports before parent reconciliation.

## C1 — ambient support and finite-word scope (clarification)

Source: RESULT §2 Faces, §6 U4. Faces reach t+a+b+c−2 inclusive. Relative to the longest prefix [t,t+b+c), this uses a−1 additional physical vertices. The proof may read them from the ambient avoiding set. A legal finite word on [t,t+b+c) always has an avoiding zero extension to Z: every pair of occupied positions remains inside the original finite word. Thus finite-prefix testing and the ambient local theorem are consistent. No finite extension hypothesis is introduced. Independently checked by A and C.

## C2 — constructive signing without inherited topology (proof expansion)

Source: RESULT §2 Signing lemma. Let α(f,E) be an oriented incidence. A pass E→E′ imposes σ(E′)=−α(f,E)α(f,E′)σ(E). Each physical wall occurs in at most two passes. For a pass cycle of r edges, multiplying the relations gives (−1)^r times the product of the two incidence coefficients at each wall. Each such pair is opposite, so the product is (−1)^r(−1)^r=1. Paths can be assigned from one endpoint. Every face's paired terms cancel. This is sufficient even with parallel pass edges, additive distance relations, or a boundary that is not a simple polygon. Independently checked by A and C.

## C3 — full primitive integer image (proof expansion)

Source: RESULT §3 Lattice lemma. Put Q(A)=(-A_bc,A_ac,-A_ab), so Q(T(h))=n×h. Given primitive n, choose integer u with n·u=1. For integer v⊥n, n×(−u×v)=v. Thus every relation-lattice point has an integer preimage. For A with the prescribed parities, (A−T(1,1,1))/2 is an integer relation-lattice point, giving an odd preimage 1+2k. This avoids any need for pairwise coprimality. Independently checked by B; C separately reconstructed the dual-basis proof.

## C4 — rational phase and endpoints (clarification)

Source: RESULT §3 κ=κ*, attainment. At a minimizing class T(h), choose rational ε_a in the common closed interval and set θ=(h_a/2+ε_a)/a. The same θ gives ε_b, ε_c by the displayed formulas. Since δ*<1, every error lies in [-1/2,1/2], so ||dθ||=1/2−|ε_d|. Write θ=p/r in lowest terms; equality κ=min_d||dθ|| gives κ=H/r for an integer H. Multiplication by p permutes residues, so [0,H/r) selects exactly H of them. Distinct selected phases have circular distance strictly less than κ, including κ=1/2. Hence every seam is safe. Independently checked by B and C.

## C5 — one overshoot and the gcd constant (proof expansion)

Source: RESULT §§1,4. Choose good blocks successively from u until the first endpoint x_m≥v. Because x_{m−1}≤v−1 and the last length≤b+c, x_m−v≤b+c−1. Therefore count[u,v)≤count[u,x_m)≤κ(x_m−u)≤κ(v−u)+κ(b+c−1). This uses a full overshooting block, not a separate unpaid remainder.

For gcd g, residue r corresponds to J_r=[ceil((u−r)/g),ceil((v−r)/g)). Their lengths sum to v−u. Empty intervals satisfy the same inequality with nonnegative constant. Summation gives gκ(b/g+c/g−1)=κ(b+c−g). Integer endpoints are required for the stated constant. Independently reconstructed by C and parent.
