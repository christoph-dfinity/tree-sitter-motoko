=========
variant-check.mo
=========

type T = { #exp : Nat8 };

func foo() : T = #exp 42; // this should pass

let why : Nat = 42;
func bar() : T = #exp why; // this should fail

---

(source_file
  (typ_dec
    (type_identifier)
    (variant_typ
      (typ_tag
        (identifier)
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))))
  (func_dec
    (identifier)
    (tup_pat)
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (hash_exp
        (identifier)
        (lit_exp
          (int_literal)))))
  (line_comment)
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier)))))
    (lit_exp
      (int_literal)))
  (func_dec
    (identifier)
    (tup_pat)
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (hash_exp
        (identifier)
        (var_exp
          (identifier)))))
  (line_comment))
