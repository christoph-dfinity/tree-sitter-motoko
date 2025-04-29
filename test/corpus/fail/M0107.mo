=========
M0107.mo
=========

shared({}) class Foo() {}

---

(source_file
  (class_dec
    (shared_pat
      (tup_pat
        (obj_pat)))
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body))))
