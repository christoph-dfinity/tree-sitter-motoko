=========
suggest-local-type.mo
=========

type Foo = Int;
type Zap = [Fo];

---

(source_file
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (type_identifier))))
  (typ_dec
    (type_identifier)
    (array_typ
      (path_typ
        (typ_path
          (type_identifier))))))
