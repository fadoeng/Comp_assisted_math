import Mathlib.LinearAlgebra.Matrix.IsDiag
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.FiniteDimensional
import Mathlib.LinearAlgebra.Eigenspace.IsAlgClosed
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Finrank
import Mathlib.Algebra.Module.LinearMap
import Mathlib.FieldTheory.IsAlgClosed.Spectrum
open Matrix
open Fintype

/- We create variables to later be able to easily reference objects of type Field 
and to establish a Fintype whose elements can be identified and used as natural numbers.-/
variable {m : ℕ} [Fintype (Fin m)] [Field F]

/-We then define what we mean by an eigenvector of a given square matrix A of dimension m over a field F.
This was not a preexisting notion found in Mathlib altough an equivalent definition exists for linear endomorphisms which we will rely on later.-/
def IsEigenvector (A : Matrix (Fin m) (Fin m) F) (v : Fin m → F) := (v ≠ 0) ∧ (∃ μ : F, (mulVec A v) = μ • v)

 open FiniteDimensional
 open LinearMap
 open Module
 universe u v w

 variable {ℂ : Type v} {V : Type w} [Field ℂ] [Field ℝ]  [AddCommGroup V] [Module ℂ V]
 /-Theorem 2-/

 /-Theorem 2 is a restatement of the FTA in terms of eigenvectors of square matrices/ linear operators. 
 Here we use our previously established definition of an eigenvector-/

theorem exists_eigenvector (A : Matrix (Fin m) (Fin m) ℂ) : (m ≥ 1) → (∃ v : Fin m → ℂ, IsEigenvector A v) :=
by sorry


 /-Lemma 3-/

/-In this lemma we rely on linear endomorphisms, it would need to be finished by including the notion of commutativity.
I attempt this by restating it for matrices associated with the linear operators for which commutativity is easy to state 
as  (A*B=B*A).-/

 lemma comm_lin_opHasEigenvector [FiniteDimensional ℂ V] [Nontrivial V] (f : End ℂ V) (g : End ℂ V) (h : End ℂ V) 
 : (m ≥ 1) ∧ ¬(m ∣ (finrank ℂ  V))∧ (∃ v : V , f.HasEigenvector μ v)→ (∃ v : V , g.HasEigenvector μ v ∧ h.HasEigenvector ν v)  := sorry

 lemma comm_MatHasEigenvector (A : Matrix (Fin m) (Fin m) F ) (B : Matrix (Fin m) (Fin m) F) (C : Matrix (Fin m) (Fin m) F): 
 (A*B=B*A) ∧ (n ≥ 1) ∧ ¬(n ∣ m) ∧ (∃ (v : Fin m → F) , IsEigenvector A v) 
 → (∃ (w : Fin m → F), IsEigenvector B w ∧ IsEigenvector C w)  := sorry

 /-Corolarry 4-/
/-This corollary treats the special case of a real Vectorspace of odd dimensions the matrices are stand-ins for
their associated linear operators on that vector space-/
 lemma exists_eigenvector_odd (A : Matrix (Fin m) (Fin m) ℝ ) (B : Matrix (Fin m) (Fin m) ℝ) (h : A*B=B*A) :
(Odd (card)) → (∃ v :  Fin m → ℝ ,IsEigenvector  A v ∧ IsEigenvector B v ) := by sorry
 