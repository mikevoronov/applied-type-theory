Module Lecture10.

Print nat.

Theorem t1: 2 * 2 = 4.
Proof.
    Print "*".
    simpl.
    reflexivity.
Qed.

Theorem t2: exists x, x * 2 = 4.
Proof.
  exists 2.
  apply t1.
Qed.

Print t2.
Print t1.

Theorem t3: exists x y, x*y = 4.
Proof.
  exists 2.
  exists 2.
  apply t1.
Qed.

Print t3.

Inductive bool: Type :=
| true
| false
.

Check false.
Check (bool -> bool): Type.
Check (fun b: bool => b).

Check (fun b => bool).

Check (fun b => b) true.
Check fun (f: bool -> bool) => f true.

Compute (fun b => b) 1.

Definition i := fun b: bool => b.
Check i.
Compute i true.

Definition neg :=
  fun (b: bool) =>
    match b with
    | true  => false
    | false => true
  end.

Check neg.

Compute neg false.
Compute neg true.

Definition and (a b: bool) : bool := 
  match a with 
  | false => false
  | true  => b
end.

Compute and true true.
Compute and true false.

(*

Set : Type(0)
Prop : Type(0)
\forall i Type(i)

BHK interptertation
 exists p:A . P(p) - (a \in A, P)
*)

Print "=".

(*
  A -> Prop

  (fun (x: nat) => x%2 == 0): nat -> Prop
*)

Inductive eq (A : Type) (x : A) : A -> Prop :=  
  eq_refl : eq x x
.

Print nat.

Inductive nat: Type :=
| O
| S: nat -> nat.

Check S(S(S O)).

Definition succn := S.

(*
There are some possible signatures of pred is possible:
  predn: nat -> nat
  predn: nat -> Option nat
  predn: forall n: nat, (n <> 0) -> nat
*)

Definition predn (n :nat) : nat :=
  match n with 
  | S x => x
  | O => O
end.

Fixpoint addn (n m: nat) {struct n}: nat :=
  match n with
  | O => m
  | S k => S (addn k m)
end.

Compute addn (S (S O)) (S (S O)).

Print list.

Inductive list (A : Type) : Type :=
	| nil : list A 
  | cons : A -> list A -> list A
.

Theorem list2: list nat.
Proof.
  apply cons.
  {
    apply 1.
  }
  apply cons.
  {
    apply 2.
  }
  apply nil.
Qed.

Set Printing All.
Check 5 + 5.
