# A uniform formal realization of Schnorr’s parity lower bound

Schnorr’s classical lower bound for parity is $3(n-1)$ gates in the stated two-input basis. The contribution here is a uniform formal proof construction with a specified checker and an explicit size bound in the encoded formula. Source: v72, §6.4 and Supplement S45.

## Uniform formal L3 emitter and circuit bridge

The later formal development closes the uniform emitter objective beyond the historical restricted-transport results retained in Supplement S17. The endpoint L3Emitter.UniformEmitterCloseout.complete_formal_emitter establishes, for every n ≥ 2, acceptance of the original formula bytes and newly canonicalized proof bytes by the formal checker, together with an explicit ASCII-byte upper bound. No construction, successful-run or candidate-coverage premise remains in this endpoint (Supplement S45).

The bound is 10¹⁶⁰ · R(n)¹²⁰ bytes, where R(n) is the row count of the original truth-table encoding. This is a deliberately coarse polynomial in encoded formula size, not a polynomial in n or a practical runtime estimate. Native source-model acceptance additionally requires the declared machine-range conditions. Acceptance of the manually formalized source model is not a theorem about the compiled Rust executable; that correspondence remains unproved.

The companion theorem L3Emitter.CircuitLowerBound.schnorr_lower_bound proves the classical bound 3(n − 1) ≤ s for parity in the specified U2 model: ordered two-input gates excluding XOR and XNOR, arbitrary output wire and fanout, and no free complemented wires. The contribution is the formal constructive pipeline and its checked connection to the circuit statement, not novelty of Schnorr’s lower bound.

The deposited 26 October source rebuild records 1,122 Lean modules and 17,309 audited declarations, with only propext, Classical.choice and Quot.sound. This manuscript integration reads that receipt; it does not rerun the compiler. The new canonical stream, historical finite admissions, explicit truth-table encoding and unfinished Rust verification remain separate. No k5 experiment or unrestricted circuit lower bound is inferred.

The source envelope bounds R(n) by 128(n + 1)²2^n. Native range conditions require the actual final allocation counter and encountered-name count below 2^63 and the token-bound-plus-one below 2^64. Scalars include arbitrary-precision promotion. The symbolic native_base case establishes nonvacuity at arity two; no k5 admission is implied.

## Construction and circuit proof

The formal construction has two conclusions that must be composed rather than conflated. The canonical stream theorem accepts the encoded instance and the generated proof for every n ≥ 2. The circuit theorem then excludes a parity circuit below the gate bound by mapping any such circuit back to a model of that same encoded instance.

For the latter step, suppose a circuit on n inputs has s < 3(n − 1) gates and computes parity at an arbitrary allowed output wire. Put T = 3n − 4. Cut the circuit after the output's dependency prefix and pad the remaining positions to T with the allowed projection gate. The retained prefix computes the old output, the projection gates preserve it, and every input wire still precedes its gate. The padded circuit therefore supplies a model of the original T-gate truth-table encoding. UniformSemanticReduction.original_family_unsat excludes that model. Hence s ≥ 3(n − 1). This handles arbitrary output wires without assuming that the original output is its final gate.

For the emitter, complete_formal_emitter combines canonical acceptance, serialized-byte accounting and the polynomial encoded-size bound. Its final conjunct separately assumes MachineRange to obtain native-source acceptance. AliasHistory records actual successful store mutations and safety at every prefix, rather than assuming a successful run as an unexplained premise. These are the proof products reused by the closeout; the source-model-to-compiled-binary obligation is not discharged by this composition.

The [Lean proof project](lean-sources.zip) includes the two theorem roots, their imported project modules and the pinned Lake configuration. With that toolchain and its Mathlib dependency installed, run `lake build +UniformEmitterCloseout +CircuitLowerBound` from the extracted directory.
