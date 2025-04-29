=========
cyclic-bound4.mo
=========

/* check cyclic bounds are rejected, would loop sans check */

type C<U,V> = U;

type T<U> = C<U,U>;

func f<A <: T<B>, B <: T<C>, C <: T<A>>(a : A, b : B, c : C) {
  let _ : () = a;
  let _ : () = b;
  let _ : () = c;
};

---

(source_file
  (block_comment
    (comment_text))
  (typ_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
    (path_typ
      (typ_path
        (type_identifier))))
  (typ_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (path_typ
      (typ_path
        (type_identifier))
      (path_typ
        (typ_path
          (type_identifier)))
      (path_typ
        (typ_path
          (type_identifier)))))
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier)
        (path_typ
          (typ_path
            (type_identifier))
          (path_typ
            (typ_path
              (type_identifier)))))
      (typ_bind
        (type_identifier)
        (path_typ
          (typ_path
            (type_identifier))
          (path_typ
            (typ_path
              (type_identifier)))))
      (typ_bind
        (type_identifier)
        (path_typ
          (typ_path
            (type_identifier))
          (path_typ
            (typ_path
              (type_identifier))))))
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier)))))
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (type_identifier))))))
    (func_body
      (block_exp
        (let_dec
          (annot_pat
            (wild_pat)
            (typ_annot
              (tup_typ)))
          (var_exp
            (identifier)))
        (let_dec
          (annot_pat
            (wild_pat)
            (typ_annot
              (tup_typ)))
          (var_exp
            (identifier)))
        (let_dec
          (annot_pat
            (wild_pat)
            (typ_annot
              (tup_typ)))
          (var_exp
            (identifier)))))))
