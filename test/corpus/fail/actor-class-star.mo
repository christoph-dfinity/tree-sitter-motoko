=========
actor-class-star.mo
=========

actor class C() : async* actor {} = {}

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
      (obj_body))))
