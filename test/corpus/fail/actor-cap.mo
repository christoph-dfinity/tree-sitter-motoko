=========
actor-cap.mo
=========

import Prim "mo:⛔"

actor class C () = self {
  return self;
  throw (Prim.error("wrong"));
};

actor self {
   return self;
   throw (Prim.error("wrong"));
}

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (class_body
      (identifier)
      (obj_body
        (dec_field
          (exp_dec
            (return_exp
              (var_exp
                (identifier)))))
        (dec_field
          (exp_dec
            (throw_exp
              (par_exp
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (lit_exp
                      (text_literal)))))))))))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (exp_dec
          (return_exp
            (var_exp
              (identifier)))))
      (dec_field
        (exp_dec
          (throw_exp
            (par_exp
              (call_exp_object
                (dot_exp_object
                  (var_exp
                    (identifier))
                  (identifier))
                (par_exp
                  (lit_exp
                    (text_literal)))))))))))
