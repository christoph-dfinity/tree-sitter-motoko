=========
cyclic-bound5.mo
=========

/* check cyclic bounds are rejected, would loop sans check */



type T<U> = U;

type C<U <: T<U>> = ();
---

(source_file
  (block_comment
    (comment_text))
  (typ_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (path_typ
      (typ_path
        (type_identifier))))
  (typ_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)
        (path_typ
          (typ_path
            (type_identifier))
          (path_typ
            (typ_path
              (type_identifier))))))
    (tup_typ)))
