=========
unused-module.mo
=========

import TestModule "unused-module/test-module";

actor {
    TestModule.publicModuleFunction();
};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (exp_dec
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (par_exp)))))))
