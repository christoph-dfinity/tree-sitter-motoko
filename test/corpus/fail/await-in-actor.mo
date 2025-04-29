=========
await-in-actor.mo
=========

let _ = async {
  let a = actor {
    let x = await { async 1 };
    public func getX() : async Nat { x };
  };
  ()
}

---

(source_file
  (let_dec
    (wild_pat)
    (async_exp
      (block_exp
        (let_dec
          (var_pat
            (identifier))
          (obj_dec
            (obj_sort)
            (obj_body
              (dec_field
                (let_dec
                  (var_pat
                    (identifier))
                  (await_exp
                    (block_exp
                      (exp_dec
                        (async_exp
                          (lit_exp
                            (int_literal))))))))
              (dec_field
                (vis)
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
                        (var_exp
                          (identifier))))))))))
        (exp_dec
          (par_exp))))))
