=========
issue-4323.mo
=========

type Main = actor { beep : () -> async () };

// let-like annotation
actor Main : Main = {

}

---

(source_file
  (typ_dec
    (type_identifier)
    (obj_sort_typ
      (obj_typ
        (val_tf
          (identifier)
          (func_typ
            (tup_typ)
            (async_typ
              (tup_typ)))))))
  (line_comment)
  (obj_dec
    (obj_sort)
    (identifier)
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (obj_body)))
