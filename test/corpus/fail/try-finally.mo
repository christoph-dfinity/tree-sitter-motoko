=========
try-finally.mo
=========

import { error } = "mo:⛔";

actor A {
    func m() : async () {
    };

    func _t0() : async () {
        try { await m() }
        catch _ {}
        finally { ignore m() } // BAD: no effects allowed!
    };

    func _t1a() : async () {
        try { await m() }
        catch _ {}
        finally { throw error "Nope" } // BAD: has effect.
    };

    func _t1b() : async () {
        try { await m() }
        catch _ {}
        finally { ignore async {} } // BAD: has effect. Weird error...
    };

    func _t2() : async () {
        try { await m() }
        catch _ {}
        finally { 42 } // BAD: should return unit.
    };

    func _t3r() : async () {
        try { await m() }
        catch _ {}
        finally { return } // BAD: no outward edges allowed!
    };

    func _t3l() : async () {
        label out try { await m() }
        catch _ {}
        finally { break out } // BAD: no outward edges allowed!
    };
}

---

(source_file
  (import
    (obj_pat
      (pat_field
        (identifier)))
    (text_literal))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (try_exp
                  (block_exp
                    (exp_dec
                      (await_exp
                        (call_exp_block
                          (var_exp
                            (identifier))
                          (par_exp)))))
                  (catch
                    (wild_pat)
                    (block_exp))
                  (finally
                    (block_exp
                      (exp_dec
                        (ignore_exp
                          (call_exp_block
                            (var_exp
                              (identifier))
                            (par_exp))))))))
              (line_comment)))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (try_exp
                  (block_exp
                    (exp_dec
                      (await_exp
                        (call_exp_block
                          (var_exp
                            (identifier))
                          (par_exp)))))
                  (catch
                    (wild_pat)
                    (block_exp))
                  (finally
                    (block_exp
                      (exp_dec
                        (throw_exp
                          (call_exp_block
                            (var_exp
                              (identifier))
                            (lit_exp
                              (text_literal)))))))))
              (line_comment)))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (try_exp
                  (block_exp
                    (exp_dec
                      (await_exp
                        (call_exp_block
                          (var_exp
                            (identifier))
                          (par_exp)))))
                  (catch
                    (wild_pat)
                    (block_exp))
                  (finally
                    (block_exp
                      (exp_dec
                        (ignore_exp
                          (async_exp
                            (block_exp))))))))
              (line_comment)))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (try_exp
                  (block_exp
                    (exp_dec
                      (await_exp
                        (call_exp_block
                          (var_exp
                            (identifier))
                          (par_exp)))))
                  (catch
                    (wild_pat)
                    (block_exp))
                  (finally
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (int_literal)))))))
              (line_comment)))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (try_exp
                  (block_exp
                    (exp_dec
                      (await_exp
                        (call_exp_block
                          (var_exp
                            (identifier))
                          (par_exp)))))
                  (catch
                    (wild_pat)
                    (block_exp))
                  (finally
                    (block_exp
                      (exp_dec
                        (return_exp))))))
              (line_comment)))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (label_exp
                  (identifier)
                  (try_exp
                    (block_exp
                      (exp_dec
                        (await_exp
                          (call_exp_block
                            (var_exp
                              (identifier))
                            (par_exp)))))
                    (catch
                      (wild_pat)
                      (block_exp))
                    (finally
                      (block_exp
                        (exp_dec
                          (break_exp
                            (identifier))))))))
              (line_comment))))))))
