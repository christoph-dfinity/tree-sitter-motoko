=========
no-system-cap.mo
=========

import { setTimer; cyclesAdd } = "mo:⛔";

actor {

 public query func q() : async () {
    ignore setTimer<system>(1_000_000, false, func () : async () { });
    cyclesAdd<system>(1_000_000);
 };

 public composite query func cq() : async() {
     ignore setTimer<system>(1_000_000, false, func () : async () { });
     cyclesAdd<system>(1_000_000);
 };

}

---

(source_file
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
        (vis)
        (func_dec
          (shared_pat)
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (ignore_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (inst)
                    (par_exp
                      (lit_exp
                        (int_literal))
                      (lit_exp
                        (bool_literal))
                      (func_exp
                        (tup_pat)
                        (typ_annot
                          (async_typ
                            (tup_typ)))
                        (func_body
                          (block_exp)))))))
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst)
                  (par_exp
                    (lit_exp
                      (int_literal)))))))))
      (dec_field
        (vis)
        (func_dec
          (shared_pat)
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (ignore_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (inst)
                    (par_exp
                      (lit_exp
                        (int_literal))
                      (lit_exp
                        (bool_literal))
                      (func_exp
                        (tup_pat)
                        (typ_annot
                          (async_typ
                            (tup_typ)))
                        (func_body
                          (block_exp)))))))
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst)
                  (par_exp
                    (lit_exp
                      (int_literal))))))))))))
