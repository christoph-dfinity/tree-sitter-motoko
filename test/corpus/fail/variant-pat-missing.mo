=========
variant-pat-missing.mo
=========

func (#variant : { #variant : Nat }) = ()

---

(source_file
  (exp_dec
    (func_exp
      (tup_pat
        (annot_pat
          (tag_pat
            (identifier))
          (typ_annot
            (variant_typ
              (typ_tag
                (identifier)
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier)))))))))
      (func_body
        (par_exp)))))
