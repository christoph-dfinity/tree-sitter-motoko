=========
object-patterns.mo
=========

// Subtyping in patterns

let q : {a : Int; b : Nat} = {a = -42; b = 25};

func get_a () : Int = switch (q) {
  case {a = 25 : Nat} 1;  // NOT OK: Nat cannot consume all Ints
  case {a = 42; b} b;     // OK: 42 is Int by subtyping
  case {a = a : Int; b = 25 : Int} a; // OK: Int can consume all Nats
};


// the above is analogous to the simpler:

func (a : Int) = switch a {
  case 25 ();         // OK: 25 is Int by subtyping
  case (25 : Int) (); // OK: 25 is Int by ascription
  case (a : Nat) ()   // NOT OK: Nat cannot consume all Ints
};

---

(source_file
  (line_comment)
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (obj_typ
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier))))
          (val_tf
            (identifier)
            (path_typ
              (typ_path
                (type_identifier)))))))
    (object_exp
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (func_dec
    (identifier)
    (tup_pat)
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (switch_exp
        (par_exp
          (var_exp
            (identifier)))
        (case
          (obj_pat
            (pat_field
              (identifier)
              (annot_pat
                (lit_pat
                  (int_literal))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (lit_exp
            (int_literal)))
        (line_comment)
        (case
          (obj_pat
            (pat_field
              (identifier)
              (lit_pat
                (int_literal)))
            (pat_field
              (identifier)))
          (var_exp
            (identifier)))
        (line_comment)
        (case
          (obj_pat
            (pat_field
              (identifier)
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (pat_field
              (identifier)
              (annot_pat
                (lit_pat
                  (int_literal))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (var_exp
            (identifier)))
        (line_comment))))
  (line_comment)
  (exp_dec
    (func_exp
      (tup_pat
        (annot_pat
          (var_pat
            (identifier))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))))
      (func_body
        (switch_exp
          (var_exp
            (identifier))
          (case
            (lit_pat
              (int_literal))
            (par_exp))
          (line_comment)
          (case
            (tup_pat
              (annot_pat
                (lit_pat
                  (int_literal))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (par_exp))
          (line_comment)
          (case
            (tup_pat
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (par_exp))
          (line_comment))))))
