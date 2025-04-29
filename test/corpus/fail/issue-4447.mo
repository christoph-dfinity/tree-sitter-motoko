=========
issue-4447.mo
=========

import { debugPrint; setTimer } = "mo:⛔";

func _f() {

    func indirect<system>() {
        ignore setTimer<system>(0, false, func () : async () { debugPrint "YEP!" });
    };

    indirect<system>();
    ignore indirect<system>()
};

class _C() {

    func indirect<system>() {
        ignore setTimer<system>(0, false, func () : async () { debugPrint "YEP!" });
    };

    indirect<system>();
    ignore indirect<system>()
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
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (func_dec
          (identifier)
          (typ_params)
          (tup_pat)
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
                          (block_exp
                            (exp_dec
                              (call_exp_object
                                (var_exp
                                  (identifier))
                                (lit_exp
                                  (text_literal))))))))))))))
        (exp_dec
          (call_exp_object
            (var_exp
              (identifier))
            (inst)
            (par_exp)))
        (exp_dec
          (ignore_exp
            (call_exp_block
              (var_exp
                (identifier))
              (inst)
              (par_exp)))))))
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (func_dec
            (identifier)
            (typ_params)
            (tup_pat)
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
                            (block_exp
                              (exp_dec
                                (call_exp_object
                                  (var_exp
                                    (identifier))
                                  (lit_exp
                                    (text_literal)))))))))))))))
        (dec_field
          (exp_dec
            (call_exp_object
              (var_exp
                (identifier))
              (inst)
              (par_exp))))
        (dec_field
          (exp_dec
            (ignore_exp
              (call_exp_block
                (var_exp
                  (identifier))
                (inst)
                (par_exp)))))))))
