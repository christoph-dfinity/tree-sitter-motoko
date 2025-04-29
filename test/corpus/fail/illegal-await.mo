=========
illegal-await.mo
=========

// immediate deadlock
do { 
  let t : async () = async { await t; };
};



// circular deadlock

do {
  ignore async {
    let a1 : async () = async { await a2; }; // illegal await since a1 : Async<X>() </: Async<Y>()
    let a2 : async () = async { await a1; }; // illegal await since a2 : Async<X>() </: Async<Z>()
    ();
  };
};


// Imperative deadlock

do {
  ignore async {
    var x = async { 0 };
    x := (async {
      await x // illegal: await _ : async<S>T -> T (not async<R> T -> T) (any T))
    });
  }
};

// Recursive deadlock


func Rec(n : Int, a : async ()) : async () {
   if (n == 0) {
    await a // <- illegal await since async<@>() </: async<X>()
   }
   else {
    await Rec(n-1, a)
   }
};


do {
  ignore async {
    let t : async () = Rec(10,t);
    await t;
  }
};

---

(source_file
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (async_typ
                (tup_typ))))
          (async_exp
            (block_exp
              (exp_dec
                (await_exp
                  (var_exp
                    (identifier))))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (async_exp
              (block_exp
                (let_dec
                  (annot_pat
                    (var_pat
                      (identifier))
                    (typ_annot
                      (async_typ
                        (tup_typ))))
                  (async_exp
                    (block_exp
                      (exp_dec
                        (await_exp
                          (var_exp
                            (identifier)))))))
                (line_comment)
                (let_dec
                  (annot_pat
                    (var_pat
                      (identifier))
                    (typ_annot
                      (async_typ
                        (tup_typ))))
                  (async_exp
                    (block_exp
                      (exp_dec
                        (await_exp
                          (var_exp
                            (identifier)))))))
                (line_comment)
                (exp_dec
                  (par_exp)))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (async_exp
              (block_exp
                (var_dec
                  (var_pat
                    (identifier))
                  (async_exp
                    (block_exp
                      (exp_dec
                        (lit_exp
                          (int_literal))))))
                (exp_dec
                  (assign_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (async_exp
                        (block_exp
                          (exp_dec
                            (await_exp
                              (var_exp
                                (identifier))))
                          (line_comment)))))))))))))
  (line_comment)
  (func_dec
    (identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (async_typ
            (tup_typ)))))
    (typ_annot
      (async_typ
        (tup_typ)))
    (func_body
      (block_exp
        (exp_dec
          (if_exp
            (par_exp
              (bin_exp_object
                (var_exp
                  (identifier))
                (rel_op)
                (lit_exp
                  (int_literal))))
            (block_exp
              (exp_dec
                (await_exp
                  (var_exp
                    (identifier))))
              (line_comment))
            (block_exp
              (exp_dec
                (await_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (lit_exp
                          (int_literal)))
                      (var_exp
                        (identifier))))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (exp_dec
          (ignore_exp
            (async_exp
              (block_exp
                (let_dec
                  (annot_pat
                    (var_pat
                      (identifier))
                    (typ_annot
                      (async_typ
                        (tup_typ))))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (lit_exp
                        (int_literal))
                      (var_exp
                        (identifier)))))
                (exp_dec
                  (await_exp
                    (var_exp
                      (identifier))))))))))))
