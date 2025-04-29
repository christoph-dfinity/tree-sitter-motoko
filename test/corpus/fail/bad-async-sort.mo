=========
bad-async-sort.mo
=========

actor {
  func f() : async* Nat {
    await* g(); // reject
  };

  func g() : async Nat {
   await f(); // reject
  };

  func anon1() : async () {
    await async* {}; // reject
  };

  func anon2() : async () {
    await* async {}; // reject
  };

  func anon3() : async () {
    ignore ((async {}) : async* ()); // reject
  };

  func anon4() : async () {
    ignore ((async* {}) : async ()); // reject
  };

}

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (awaitstar_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp))))
              (line_comment)))))
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (await_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp))))
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
                (await_exp
                  (asyncstar_exp
                    (block_exp))))
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
                (awaitstar_exp
                  (async_exp
                    (block_exp))))
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
                (ignore_exp
                  (par_exp
                    (annot_exp_object
                      (par_exp
                        (async_exp
                          (block_exp)))
                      (async_typ
                        (tup_typ))))))
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
                (ignore_exp
                  (par_exp
                    (annot_exp_object
                      (par_exp
                        (asyncstar_exp
                          (block_exp)))
                      (async_typ
                        (tup_typ))))))
              (line_comment))))))))
