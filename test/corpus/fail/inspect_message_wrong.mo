=========
inspect_message_wrong.mo
=========

actor {

   var c = 0;

   public func inc() : async () { c += 1 };
   public func set(n : Nat) : async () { c := n };
   public query func read() : async Nat { c };
   public func reset() : () { c := 0 }; // oneway

   system func inspect()  {}

};

---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
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
                (binassign_exp_object
                  (var_exp
                    (identifier))
                  (binassign_op)
                  (lit_exp
                    (int_literal))))))))
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (exp_dec
                (assign_exp_object
                  (var_exp
                    (identifier))
                  (var_exp
                    (identifier))))))))
      (dec_field
        (vis)
        (func_dec
          (shared_pat)
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
                  (identifier)))))))
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
                (assign_exp_object
                  (var_exp
                    (identifier))
                  (lit_exp
                    (int_literal))))))))
      (line_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (func_body
            (block_exp)))))))
