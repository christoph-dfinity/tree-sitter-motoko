=========
unused-import.mo
=========

import TestActor "unused-actor-class/test-actor-class";
import UnusedTestModule "unused-module/test-module";
import { debugPrint; Array_init } = "mo:prim";

actor {
    debugPrint("Test");
};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (obj_pat
      (pat_field
        (identifier))
      (pat_field
        (identifier)))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (exp_dec
          (call_exp_object
            (var_exp
              (identifier))
            (par_exp
              (lit_exp
                (text_literal)))))))))
