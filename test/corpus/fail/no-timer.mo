=========
no-timer.mo
=========

//MOC-FLAG -no-timer

actor {

    system func timer(_ : Nat64 -> ()) : async () {
  }

}

---

(source_file
  (line_comment)
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat
            (annot_pat
              (wild_pat)
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (tup_typ)))))
          (typ_annot
            (async_typ
              (tup_typ)))
          (func_body
            (block_exp)))))))
