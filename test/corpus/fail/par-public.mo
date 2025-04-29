=========
par-public.mo
=========

actor {
  public func baz() : async () = (with) async { }
}

---

(source_file
  (obj_dec
    (obj_sort)
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
            (async_exp
              (parenthetical)
              (block_exp))))))))
