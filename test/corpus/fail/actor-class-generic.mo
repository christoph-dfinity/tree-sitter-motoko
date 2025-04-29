=========
actor-class-generic.mo
=========

actor class C<T>(){}; // reject: parametric actor class

---

(source_file
  (class_dec
    (obj_sort)
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (class_body
      (obj_body)))
  (line_comment))
