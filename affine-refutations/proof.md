# Uniform refutations of inconsistent binary affine systems

For an inconsistent $m$-row, $n$-column system, the constructed proof has at most $23mn+3$ derived constraints and $23mn+8$ physical lines. The archived Lean theorem proves acceptance by the specified operational PB+RED checker and covers zero dimensions. Source: v72, §6.7 and S58.

## Uniform construction and acceptance argument

Write c = a + b over GF(2). If c is outside the column image of A, finite-dimensional separation supplies a row vector y satisfying

$$
yᵀA = 0,     yᵀc = 1.
$$

If x solved Ax = c, multiplication by y would give 0 = 1. This establishes witness existence uniformly; it is not a search over the finite validation matrix. The compiler encodes each selected row as a chain of parity gates, using shared source-variable IDs and separate auxiliary IDs. Its encoding theorem proves both directions: an affine solution extends to a source model by assigning prefix parities, and every source model recovers an affine solution.

The operational proof next accepts the actual local 23-command gate log. Injective renaming preserves the local derivation, source payments reference the required original clauses, and freshness prevents auxiliary variables from aliasing earlier ones. Induction on the emitted blocks preserves the checker database invariants and the two output constraints of each block. Aggregating the y-selected rows cancels source coefficients to even integers while leaving an odd right-hand side. The last three emitted commands derive the referenced contradiction. Counting the emitted blocks and final commands gives the stated 23mn + 3 constraint and 23mn + 8 line bounds.

The [Lean proof sources](lean-sources.zip) culminate in `OP03.Acceptance.accepted_and_counted` in `AffineAcceptance.lean`. Native VeriPB conformance is supported by finite tests.
