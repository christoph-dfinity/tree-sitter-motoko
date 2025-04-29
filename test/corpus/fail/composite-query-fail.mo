=========
composite-query-fail.mo
=========


actor Composites {

   func ok() {};

   // local async
   func f() : async () {
   };

   // local async*
   func s() : async* () {
   };

   // update
   public func m() : async() {
   };

   // oneway
   public func o() : () {
   };

   public composite query func cq() : async () {
     ok(); // allow local, non-async call
   };

   public query func q() : async () {
     ignore cq(); // reject composite call
   };

   public composite query func cqm() : async () {
     ignore m(); // reject update call
   };

   public composite query func cqo() : async () {
     o(); // reject oneway call
   };

   public composite query func cqf() : async () {
     ignore f(); // reject local async call
   };

   public composite query func cqs() : async () {
     ignore s(); // reject local async* call
   };

   public composite query func cqa() : async () {
     ignore async (); // reject anonymous async
   };

   public composite query func cqas() : async () {
     //ignore async* (); // odd syntax error!
     ignore async* {}; // reject anonymous async*
     // actually, it might be safe to allow this, but disallow await* (coz lazy)
   };

   // bad update
   public func n() : async() {
      ignore cq(); // reject
   };

   // bad oneway
   public func p() : () {
      ignore cq(); // reject
      ignore async { cq() }; // reject
   };

   // bad query
   public query func r() : async () {
      ignore cq(); // reject
   };

}

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (tup_typ))
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
                (ignore_exp
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
                (ignore_exp
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
                (ignore_exp
                  (async_exp
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
              (line_comment)
              (exp_dec
                (ignore_exp
                  (asyncstar_exp
                    (block_exp))))
              (line_comment)
              (line_comment)))))
      (line_comment)
      (dec_field
        (vis)
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
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp))))
              (line_comment)))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (tup_typ))
          (func_body
            (block_exp
              (exp_dec
                (ignore_exp
                  (call_exp_block
                    (var_exp
                      (identifier))
                    (par_exp))))
              (line_comment)
              (exp_dec
                (ignore_exp
                  (async_exp
                    (block_exp
                      (exp_dec
                        (call_exp_object
                          (var_exp
                            (identifier))
                          (par_exp)))))))
              (line_comment)))))
      (line_comment)
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
                    (par_exp))))
              (line_comment))))))))
