=========
queries.mo
=========

import Prim "mo:⛔";

actor a {

  public shared func oneway() { };

  public shared func request() : async () { await okquery()};

  public shared query func okquery() : async () {
  };

  public shared query func badquery() : async () {
    await (loop {}); // can't await
  };

  public shared query func badquery1() : async () {
    oneway(); // can't call a (oneway) shared method
  };

  public shared query func badquery2() : async () {
    ignore (request()); // can't call a shared method
    await request(); // can't wait its result
  };

  public shared query func badquery3() : async () {
    async { }; // can't enter an async expression
  };

  public shared query func badquery4() : async () {
    throw (Prim.error ""); // can throw
  };

  public shared query func badquery5() : async () {
    try ()  catch _  {}; // can catch
  };

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
        (vis)
        (func_dec
          (shared_pat)
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
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
                (await_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp))))))))
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
            (block_exp))))
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
                (await_exp
                  (par_exp
                    (loop_exp
                      (block_exp)))))
              (line_comment)))))
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
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp)))
              (line_comment)))))
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
                  (par_exp
                    (call_exp_object
                      (var_exp
                        (identifier))
                      (par_exp)))))
              (line_comment)
              (exp_dec
                (await_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp))))
              (line_comment)))))
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
                (async_exp
                  (block_exp)))
              (line_comment)))))
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
                (throw_exp
                  (par_exp
                    (call_exp_object
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))
                      (lit_exp
                        (text_literal))))))
              (line_comment)))))
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
                (try_exp
                  (par_exp)
                  (catch
                    (wild_pat)
                    (block_exp))))
              (line_comment))))))))
