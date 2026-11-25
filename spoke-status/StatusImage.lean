import Std

namespace SpokeStatus

def rise {V : Type} (pred : V → V) (values : V → Bool) (i : V) : Bool :=
  !(values (pred i)) && values i

def independent {V : Type} (pred : V → V) (status : V → Bool) : Prop :=
  ∀ i, status i = true → status (pred i) = false

def nonzeroTrit (b : Bool) : Nat := if b then 2 else 1

theorem table (left right : Bool) :
    decide ((1 + nonzeroTrit left + 3 - nonzeroTrit right) % 3 = 0) =
      ((!left) && right) := by
  cases left <;> cases right <;> decide

theorem exactImage {V : Type} (pred : V → V) (z : V → Bool) :
    (∃ x, ∀ i, rise pred x i = z i) ↔ independent pred z := by
  constructor
  · rintro ⟨x, h⟩ i hi
    have step := (h i).trans hi
    have before : x (pred i) = false := by
      cases hb : x (pred i) with
      | false => rfl
      | true => simp [rise, hb] at step
    rw [← h (pred i)]
    simp [rise, before]
  · intro valid
    refine ⟨z, fun i => ?_⟩
    cases hi : z i with
    | false => simp [rise, hi]
    | true => simp [rise, hi, valid i hi]

theorem overlay {V : Type} (pred : V → V) (A : (V → Bool) → Prop) :
    (∃ x, A (rise pred x)) ↔ ∃ z, independent pred z ∧ A z := by
  constructor
  · rintro ⟨x, hx⟩
    exact ⟨rise pred x, (exactImage pred _).mp ⟨x, fun _ => rfl⟩, hx⟩
  · rintro ⟨z, hz, ha⟩
    obtain ⟨x, hx⟩ := (exactImage pred z).mpr hz
    have eq : rise pred x = z := funext hx
    exact ⟨x, eq ▸ ha⟩

#print axioms table
#print axioms exactImage
#print axioms overlay
end SpokeStatus

