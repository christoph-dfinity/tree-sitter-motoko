=========
bad-utf8.mo
=========

import Prim "mo:⛔";
do {
Prim.debugPrint("Zero byte: >\00<");
};
do {
Prim.debugPrint("FF byte: >\ff<");
};
do {
Prim.debugPrint("uFF char: >\u{ff}<");
};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (par_exp
              (lit_exp
                (text_literal))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (call_exp_object
            (dot_exp_object
              (var_exp
                (identifier))
              (identifier))
            (par_exp
              (lit_exp
                (text_literal))))))))
  (exp_dec
    (do_exp
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
