=========
bad-obj-base-types.mo
=========

let o1 = object { public type t = Int };
let o2 = object { public type t = Nat };
let o3 = object { public type t<A> = A };
let o4 = object { public type t<A> = Int };

let _ : {} = { o1 and o1 }; // ok

let _ : {} = { o1 and o2 }; // reject

let _ : {} = { o3 and o3 }; // ok

let _ : {} = { o3 and o4 }; // reject

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (typ_dec
            (type_identifier)
            (path_typ
              (typ_path
                (type_identifier))))))))
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (typ_dec
            (type_identifier)
            (path_typ
              (typ_path
                (type_identifier))))))))
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (typ_dec
            (type_identifier)
            (typ_params
              (typ_bind
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (let_dec
    (var_pat
      (identifier))
    (obj_dec
      (obj_sort)
      (obj_body
        (dec_field
          (vis)
          (typ_dec
            (type_identifier)
            (typ_params
              (typ_bind
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (obj_typ)))
    (object_exp
      (var_exp
        (identifier))
      (var_exp
        (identifier))))
  (line_comment)
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (obj_typ)))
    (object_exp
      (var_exp
        (identifier))
      (var_exp
        (identifier))))
  (line_comment)
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (obj_typ)))
    (object_exp
      (var_exp
        (identifier))
      (var_exp
        (identifier))))
  (line_comment)
  (let_dec
    (annot_pat
      (wild_pat)
      (typ_annot
        (obj_typ)))
    (object_exp
      (var_exp
        (identifier))
      (var_exp
        (identifier))))
  (line_comment))
