=========
bad-actor.mo
=========

actor class A() : async actor {} {}; //ok

actor class A1<T>() {}; // reject generic actor class
actor class A2<T,U>() {}; // reject generic actor class

actor class A3(c:[var Int]) {}; // reject non-shared parameter

actor class A4() : async object {} {}; // reject bad async return type
actor class A5() : actor {} {}; // reject non async return type

---

(source_file
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (typ_annot
      (async_typ
        (obj_sort_typ
          (obj_typ))))
    (class_body
      (obj_body)))
  (line_comment)
  (class_dec
    (obj_sort)
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (class_body
      (obj_body)))
  (line_comment)
  (class_dec
    (obj_sort)
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (class_body
      (obj_body)))
  (line_comment)
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (array_typ
            (path_typ
              (typ_path
                (type_identifier)))))))
    (class_body
      (obj_body)))
  (line_comment)
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (typ_annot
      (async_typ
        (obj_sort_typ
          (obj_typ))))
    (class_body
      (obj_body)))
  (line_comment)
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (typ_annot
      (obj_sort_typ
        (obj_typ)))
    (class_body
      (obj_body)))
  (line_comment))
