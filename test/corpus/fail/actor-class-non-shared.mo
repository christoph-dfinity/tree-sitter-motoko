=========
actor-class-non-shared.mo
=========

actor class C1(f:()->()) {}; // reject: non-shared parameter



---

(source_file
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (func_typ
            (tup_typ)
            (tup_typ)))))
    (class_body
      (obj_body)))
  (line_comment))
