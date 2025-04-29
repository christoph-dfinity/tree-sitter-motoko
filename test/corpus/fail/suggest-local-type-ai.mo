=========
suggest-local-type-ai.mo
=========

//MOC-FLAG --ai-errors
type Foo = Int;
type Zap = [Fo];

---

(source_file
  (line_comment)
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
