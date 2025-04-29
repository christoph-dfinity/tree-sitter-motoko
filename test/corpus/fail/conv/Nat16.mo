=========
conv/Nat16.mo
=========

import Prim "mo:⛔"
module {

  public func toNat(n : Nat16) : Nat { Prim.nat16ToNat(n) };

  public func fromNat16(n : Nat16) : Nat { Prim.nat16ToNat(n) };

  public module Outer {
     public module Inner {
       public func toNat(n : Nat16) : Nat { Prim.nat16ToNat(n) };
       public func fromNat16(n : Nat16) : Nat { Prim.nat16ToNat(n) };
     }
  }

}

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
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
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))))))
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
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))))))
      (dec_field
        (vis)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (obj_dec
                (obj_sort)
                (identifier)
                (obj_body
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
                        (path_typ
                          (typ_path
                            (type_identifier))))
                      (func_body
                        (block_exp
                          (exp_dec
                            (call_exp_object
                              (dot_exp_object
                                (var_exp
                                  (identifier))
                                (identifier))
                              (par_exp
                                (var_exp
                                  (identifier)))))))))
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
                        (path_typ
                          (typ_path
                            (type_identifier))))
                      (func_body
                        (block_exp
                          (exp_dec
                            (call_exp_object
                              (dot_exp_object
                                (var_exp
                                  (identifier))
                                (identifier))
                              (par_exp
                                (var_exp
                                  (identifier))))))))))))))))))
