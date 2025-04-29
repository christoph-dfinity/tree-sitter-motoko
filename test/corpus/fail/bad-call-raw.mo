=========
bad-call-raw.mo
=========

import P "mo:⛔";

actor self {
  let a = P.call_raw(P.principalOfBlob(""),"foo",""); // reject, send capability required
};

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
        (let_dec
          (var_pat
            (identifier))
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (par_exp
              (call_exp_object
                (dot_exp_object
                  (var_exp
                    (identifier))
                  (identifier))
                (par_exp
                  (lit_exp
                    (text_literal))))
              (lit_exp
                (text_literal))
              (lit_exp
                (text_literal))))))
      (line_comment))))
