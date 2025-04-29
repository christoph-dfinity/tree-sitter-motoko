=========
unused-field-pattern.mo
=========

import Prim "mo:prim";
let { field1; field2; field3 = _; field4 = _field4 } = {
    field1 = 1;
    field2 = 2;
    field3 = 3;
    field4 = 4;
    field5 = 5;
};
Prim.debugPrint(debug_show (field1));
// field2 is reported as unused

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (let_dec
    (obj_pat
      (pat_field
        (identifier))
      (pat_field
        (identifier))
      (pat_field
        (identifier)
        (wild_pat))
      (pat_field
        (identifier)
        (var_pat
          (identifier))))
    (object_exp
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))
      (exp_field
        (identifier)
        (lit_exp
          (int_literal)))))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp
        (debug_show_exp
          (par_exp
            (var_exp
              (identifier)))))))
  (line_comment))
