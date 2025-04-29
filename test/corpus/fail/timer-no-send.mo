=========
timer-no-send.mo
=========

import { debugPrint; setTimer } = "mo:⛔";

// no system capability: must not call `setTimer`
func _bowm() {
    ignore setTimer(1_000_000, false, func () : async () { });
};

// transferred system capability: may call `setTimer`
func _gawd<system>() {
    ignore setTimer(1_000_000, false, func () : async () { });

    debugPrint<system>("caveat"); // misplaced `<system>`

    ignore async 42 // not allowed
};

---

(source_file
  (import
    (obj_pat
      (pat_field
        (identifier))
      (pat_field
        (identifier)))
    (text_literal))
  (line_comment)
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (exp_dec
          (ignore_exp
            (call_exp_block
              (var_exp
                (identifier))
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
                    (block_exp))))))))))
  (line_comment)
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
                (text_literal)))))
        (line_comment)
        (exp_dec
          (ignore_exp
            (async_exp
              (lit_exp
                (int_literal)))))
        (line_comment)))))
