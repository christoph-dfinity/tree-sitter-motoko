=========
actor-reexport.mo
=========

import Prim "mo:⛔";

actor test {
  public func exported() {
    Prim.debugPrint("exported()");
  };
  public let exported_too = exported;
};

actor test2 {
  public let exported_three = test.exported_too;
  public let (exported_four, exported_five) =
    if (true)
      (test.exported_too, test.exported_too)
    else
      (exported_three, exported_three)
};

test.exported();
test.exported_too();
test2.exported_three();
test2.exported_four();
test2.exported_five();

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (lit_exp
                      (text_literal)))))))))
      (dec_field
        (vis)
        (let_dec
          (var_pat
            (identifier))
          (var_exp
            (identifier))))))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (let_dec
          (var_pat
            (identifier))
          (dot_exp_object
            (var_exp
              (identifier))
            (identifier))))
      (dec_field
        (vis)
        (let_dec
          (tup_pat
            (var_pat
              (identifier))
            (var_pat
              (identifier)))
          (if_exp
            (par_exp
              (lit_exp
                (bool_literal)))
            (par_exp
              (dot_exp_object
                (var_exp
                  (identifier))
                (identifier))
              (dot_exp_object
                (var_exp
                  (identifier))
                (identifier)))
            (par_exp
              (var_exp
                (identifier))
              (var_exp
                (identifier))))))))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp))))
