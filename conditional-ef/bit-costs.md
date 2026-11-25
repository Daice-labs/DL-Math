# Full serialized record bound and exact arithmetic

Use n,N,m,ell,Q,R,r,tau,D_des,d,q,J as in COMPATIBILITY.md. All ordinary parameters and polynomial source/design descriptions are N^O_k(1); D_des<=(2n)^(1/128). Every coefficient cost below is a bit cost. L_a is the uncompressed external source plus one complete graded trace, not the working space of the external algorithm.

## S1. Count the records that the streaming algorithm did not retain

At a fixed point let c_t be the total surviving measurement rows and r_t<=r the nonempty group count. Put

    A = 2^(2n/r),
    K_t = (2D_des+1)^c_t <= K=(2D_des+1)^(2tau n),
    C_q = sum_(j=0)^min(q,n) binom(n,j) 2^j.

Every local cube has <=A members. Every point's base fibres have at most r A members. Every E-restricted key tuple count is <=K_t because each measurement coordinate is an integer in [-D_des,D_des]. Restriction cannot create a key. For each such tuple there are at most r groups and at most r A member-term occurrences in total. The same member repeated in different tuples, pairs, or points is counted again.

Thus counts, before polynomial payloads, are bounded as follows:

| Record family | Upper bound |
|---|---:|
| Base fibre members | Q r A |
| Correction (E,U) records, including sign and Z | Q C_q |
| Tuple records, including ybar and product | Q C_q K |
| Tuple group records and B | Q C_q K r |
| Term records, including u, inputs, lifted factors, A | Q C_q K r A |
| Point Taylor data | Q J ell scalar entries |
| Full recovery vectors | ell(d+1) scalar entries |

Each term has at most polynomially many actual incidence inputs/equation lifts; each jet has J ell entries. Dense zero coefficients, own binary member, repeated E/U lists, measurement keys, all intermediate A/B/product/Z jets, and original coordinate labels contribute polynomial factors in N. The lifted e_s arrays, forms, exact lambda vectors, point-specific partitions/owners/measurements, duplicated source, and full rectangular recovery arrays also have N^O_k(1) length before scalar bit widths. No symbolic ell^m grade-choice expansion is serialized: G6 uses the canonical finite convolution and successive powers. The convolution's arithmetic intermediates are bounded/charged in time, even though only the required G6 values are records.

With Sbit=N^O_k(1) a scalar bit bound from S2, and explicit decimal conversion charged by a constant-factor increase in digit length,

    L_a <= N^O_k(1) (1 + Q r A + Q C_q K r A)
        <= N^O_k(1) C_q (2D_des+1)^(2tau n) 2^(2n/r).

This is not inferred merely from the counter's polynomial workspace. It counts precisely the repeated material required by the exact profile. Identifiers are tagged finite indices with O(log of total records) bits, also polynomial in N, not recursively concatenated paths.

## S2. Coefficient, denominator and intermediate bit bounds

Let delta=(R-1)!Q!; design coordinates have denominator dividing delta and numerator bits O(Q log Q+log D_des). Shifted input coefficients have common denominator delta and absolute coefficient norm bounded by

    B0=delta+3n(R+1)2^BP (Q+1)^R,

after clearing delta, with BP polynomial in Q,log D_des. Own/foreign decomposition may use extra lambda denominators; Gaussian elimination gives N^O_k(1) bits for them. There are only polynomially many ground lambdas/forms. A product delta_star of all their denominators has polynomial bit length. Use delta_star to bound the arithmetic of their separate products/sums; exact simplification recovers the semantic input with denominator delta. This charges cancellation work rather than assuming lambda entries are small integers.

For canonical equation lifts, set Delta=delta^k_a and bound the norm of Delta L_i by B=max(Delta,S_m B0^k_a), where S_m is the total source monomial-list size. The canonical e_s coefficients have O(ell^2) bits by E4/Lemma B.1. Let E=max(1,all ||e_s||_1), Gamma=Delta^(2ell-1), and B1=ell E(B+Delta+2)^(2ell-1). Then each cleared lifted factor Gamma B_i has norm <=B1. Products owned by group g have denominator dividing Gamma^m_g and norm <=B1^m_g. A group sum adds at most 2^|S_g| terms, contributing only |S_g| bits. A tuple product has common denominator Omega=Gamma^m and cleared norm <=2^n B1^m. Partial products use the appropriate subset exponent of Gamma; no repeated arbitrary-denominator squaring is prescribed.

A point's signed accumulation visits <=C_q K contributions, so its cleared numerator norm is <=C_q K 2^n B1^m. All partial sums are bounded by this absolute bound, independent of cancellation. log C_q<=n log 3, log K<=2tau n log(2D_des+1), and

    log Omega= k_a m (2ell-1) log delta = N^O_k(1).

Hence all recorded jets and the accumulators/power/convolution arithmetic have N^O_k(1)-bit numerators and denominators. The norm argument applies coefficientwise and to partial convolution sums. Zero measurements, unowned groups and changing partitions do not change it. Reduction by gcd after each rational operation, or these fixed denominators, avoids accidental denominator growth from a poorly chosen arithmetic program.

For full recovery let Hdim=QJ=O_k(nR+Q), and Bdata=N^O_k(1) bound the integral data after clearing Omega. Matrix entries have O(Hdim log(Q+2)) bits. Every minor of the augmented system has O(Hdim(Bdata+Hdim log(Q+2)+log(Hdim+1))) bits by the determinant norm bound. Fraction-free elimination computes all coefficient vectors with polynomial bit time; computing all coefficients instead of just the endpoint adds only polynomial factors. Endpoint sums and division by 2^ell are signed exact arithmetic on polynomial-bit words. Endpoint integrality is proved separately by the source identity, not assumed from a rounded solver result.

## S3. Serializer construction time

Construct canonical forms/lift/lambda/recovery matrices in polynomial bit time. For each point enumerate at most r A local members; sorting/grouping is polynomial in that explicit table length and polynomial word widths. Enumerate exactly C_q pairs, filter the base tables, and enumerate at most K tuples per pair. Compute and emit each tuple's at most r A terms, each with polynomial bit work for incidence sums, monomials, h powers, truncated convolution and subsequent group/tuple/record sums. Filtering by scanning the full base table at every pair costs Q C_q r A and is already below the term allowance. Sorting or deduplicating for canonical output can conservatively be charged a fixed polynomial in the total record count; a fixed power only multiplies the exponent by a constant. No all-cube Cartesian member product is formed.

Consequently for some fixed polynomial and constant a_k,

    time_serializer <= N^O_k(1) [C_q K A]^a_k.

An optimized streaming version can do better, but no linear-output claim is needed. Generation may use space as large as its serialized output; polynomial workspace is not an acceptance target here. Rational parsing/serialization is uncompressed and bounded, with no appeal to a native implementation.

## S4. Substitute the exact design parameters

The branch n is in [N/2,N]. With lambda_n=ceil(log2 n), nu_n=ceil(log2 lambda_n), E3 gives

    r=Theta(sqrt(lambda_n)/nu_n^2),
    Q=Theta(lambda_n/nu_n), R=O_k(sqrt(lambda_n)),
    tau=1/(r lambda_n), D_des=r^(2Q)<=(2n)^(1/128).

Since ell=N+1=O(n) and m<=6N=O(n), d=O_k(nR), q<=d/Q=O_k(nR/Q). Using eta=R/Q<1, C_q<=eta^(-q)(1+2eta)^n, so

    log2 C_q=O_k(n(R/Q) log(2Q/R))=O_k(rho(n)).

Furthermore log2 K<=2tau n log2(2D_des+1)=O(n/r)=O(rho(n)), and log2 A=2n/r=O(rho(n)). Thus

    L_a, time_serializer <= N^O_k(1) 2^O_k(rho(n))
                        <= N^O_k(1) 2^O_k(rho(N)).

The last comparison uses n in [N/2,N], so logarithms and iterated logarithms are comparable after a fixed cutoff. There is no replacement of original N by B N, M, or a gate-expanded dimension. This establishes the bit-length/time bound for each complete graded leaf, including records absent from the streaming workspace description.
