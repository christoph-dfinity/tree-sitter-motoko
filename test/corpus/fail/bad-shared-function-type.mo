=========
bad-shared-function-type.mo
=========

type t = shared() -> async* (); // reject (shared function can't return async*)

---

(source_file
  (typ_dec
    (type_identifier)
    (func_typ
      (tup_typ)
      (async_typ
        (tup_typ))))
  (line_comment))
