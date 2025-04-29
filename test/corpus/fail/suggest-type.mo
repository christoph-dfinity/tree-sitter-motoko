=========
suggest-type.mo
=========

import Prim "mo:⛔";

type T = Prim.Types.Num;

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (identifier)
        (identifier)
        (type_identifier)))))
