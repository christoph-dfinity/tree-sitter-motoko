=========
migration.mo
=========

import Prim "mo:prim";

(with migration =
  func({unstable1 : () -> () }) :
    { unstable2 : () -> (); // not stable
      var three : Text; // wrong type, reject
      var versoin : (); // unrequired/mispelled, reject
    } {
    { var three = "";
      var unused = ();
      var versoin = ();
      unstable2 = func () {};
    }})
actor {

   stable var version = 0;

   stable var three : [var (Nat, Text)] = [var];

   public func check(): async() {
     Prim.debugPrint (debug_show {three});
   }

};

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat
              (pat_field
                (identifier)
                (typ_annot
                  (func_typ
                    (tup_typ)
                    (tup_typ))))))
          (typ_annot
            (obj_typ
              (val_tf
                (identifier)
                (func_typ
                  (tup_typ)
                  (tup_typ)))
              (line_comment)
              (val_tf
                (identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))
              (line_comment)
              (val_tf
                (identifier)
                (tup_typ))
              (line_comment)))
          (func_body
            (block_exp
              (exp_dec
                (object_exp
                  (exp_field
                    (identifier)
                    (lit_exp
                      (text_literal)))
                  (exp_field
                    (identifier)
                    (par_exp))
                  (exp_field
                    (identifier)
                    (par_exp))
                  (exp_field
                    (identifier)
                    (func_exp
                      (tup_pat)
                      (func_body
                        (block_exp)))))))))))
    (obj_sort)
    (obj_body
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal))))
      (dec_field
        (stab)
        (var_dec
          (var_pat
            (identifier))
          (typ_annot
            (array_typ
              (tup_typ
                (typ_item
                  (path_typ
                    (typ_path
                      (type_identifier))))
                (typ_item
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (array_exp)))
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
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (debug_show_exp
                      (object_exp
                        (exp_field
                          (identifier))))))))))))))
