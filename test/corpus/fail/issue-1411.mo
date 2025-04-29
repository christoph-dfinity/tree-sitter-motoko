=========
issue-1411.mo
=========

import M "lib/M";

let Z1 : M.F = M.F();

type T1 = Z1.T;  //ok
let x1 = Z1.x;  //ok

let (Z2 : M.F) = M.F();

type T2 = Z2.T;  //ok
let x2 = Z2.x;  //ok

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (path_typ
          (typ_path
            (identifier)
            (type_identifier)))))
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp)))
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (identifier)
        (type_identifier))))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier)))
  (line_comment)
  (let_dec
    (tup_pat
      (annot_pat
        (var_pat
          (identifier))
        (typ_annot
          (path_typ
            (typ_path
              (identifier)
              (type_identifier))))))
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp)))
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (identifier)
        (type_identifier))))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (dot_exp_object
      (var_exp
        (identifier))
      (identifier)))
  (line_comment))
