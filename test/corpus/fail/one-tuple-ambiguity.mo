=========
one-tuple-ambiguity.mo
=========

func g(()) {};
let h = g : ((),) -> ();

// this is accepted
h(());

// This is rejected, even if it could be seen
// as passing the single argument which is unit.
// It is interpreted as passing the one tuple containing unit.
h((),);


func k((a : Nat, b : Bool)) {};
let l : ((Nat, Bool),) -> () = k;

l 42 false; // rejected, 42 is not of type (Nat, Bool)

l(42, false); // accepted, first-class pair implicitly converted to argument of call
l((42, false)); // accepted, parenthesis around values is redundant

l((42, false),); // rejected, implicitly converted to passing
                 // first class one-tuple (enclosing pair) as the sole argument.
---

(source_file
  (func_dec
    (identifier)
    (tup_pat
      (tup_pat))
    (func_body
      (block_exp)))
  (let_dec
    (var_pat
      (identifier))
    (annot_exp_object
      (var_exp
        (identifier))
      (func_typ
        (tup_typ
          (typ_item
            (tup_typ)))
        (tup_typ))))
  (line_comment)
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (par_exp))))
  (line_comment)
  (line_comment)
  (line_comment)
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (par_exp))))
  (func_dec
    (identifier)
    (tup_pat
      (tup_pat
        (annot_pat
          (var_pat
            (identifier))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier)))))
        (annot_pat
          (var_pat
            (identifier))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier)))))))
    (func_body
      (block_exp)))
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (func_typ
          (tup_typ
            (typ_item
              (tup_typ
                (typ_item
                  (path_typ
                    (typ_path
                      (type_identifier))))
                (typ_item
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (tup_typ))))
    (var_exp
      (identifier)))
  (exp_dec
    (call_exp_object
      (call_exp_object
        (var_exp
          (identifier))
        (lit_exp
          (int_literal)))
      (lit_exp
        (bool_literal))))
  (line_comment)
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (lit_exp
          (int_literal))
        (lit_exp
          (bool_literal)))))
  (line_comment)
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (par_exp
          (lit_exp
            (int_literal))
          (lit_exp
            (bool_literal))))))
  (line_comment)
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (par_exp
          (lit_exp
            (int_literal))
          (lit_exp
            (bool_literal))))))
  (line_comment)
  (line_comment))
