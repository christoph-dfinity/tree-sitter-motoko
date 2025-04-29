=========
issue-2135.mo
=========

import C = "lib/generic-actor"

actor a {
  public func f () : async ()  { let ci = C.C<Int>(); };
}
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
          (identifier)
          (tup_pat)
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp))))))))))
