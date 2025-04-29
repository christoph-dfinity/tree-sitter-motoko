=========
suggest-conversion-ai.mo
=========

//MOC-FLAG --package conv conv --ai-errors
// should report conversions from all available libs, even when not imported
import Nat8 = "mo:conv/Nat8"
func f(n : Nat) {};
let n8 : Nat8 = 0;
let n16 : Nat16 = 0;
f(n8);
f(n16);



---

(source_file
  (line_comment)
  (line_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (func_body
      (block_exp)))
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
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (var_exp
          (identifier)))))
  (exp_dec
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp
        (var_exp
          (identifier))))))
