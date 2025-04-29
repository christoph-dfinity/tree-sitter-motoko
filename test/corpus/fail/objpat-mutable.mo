=========
objpat-mutable.mo
=========

import Prim "mo:⛔";

type WithMut = { var x : Int; y : Text };

func reject (o : WithMut) =
  switch o {
    case { y = "good" } { Prim.debugPrint "good" };
    //case { x = -42 } { Prim.debugPrint "bad" }; // backend: Invalid_argument("unop")
    //case { x = (42 : Int) } { Prim.debugPrint "bad" }; // tc: cannot consume expected
    case { x } { Prim.debugPrintInt x }
  };

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (typ_dec
    (type_identifier)
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
            (type_identifier))))))
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
      (switch_exp
        (var_exp
          (identifier))
        (case
          (obj_pat
            (pat_field
              (identifier)
              (lit_pat
                (text_literal))))
          (block_exp
            (exp_dec
              (call_exp_object
                (dot_exp_object
                  (var_exp
                    (identifier))
                  (identifier))
                (lit_exp
                  (text_literal))))))
        (line_comment)
        (line_comment)
        (case
          (obj_pat
            (pat_field
              (identifier)))
          (block_exp
            (exp_dec
              (call_exp_object
                (dot_exp_object
                  (var_exp
                    (identifier))
                  (identifier))
                (var_exp
                  (identifier))))))))))
