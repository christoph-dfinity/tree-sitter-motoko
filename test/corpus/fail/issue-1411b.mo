=========
issue-1411b.mo
=========


module class F() {
  public type T = Int;
  public let x : T = 1;
};

let Z1 : F = F();
type T1 = Z1.T;  //ok: can infer type of forward variable reference Z1
let x1  = Z1.x;  //ok

let (Z2 : F) = F();
type T2 = Z2.T;  //ok: can infer type of forward variable reference Z2
let x2  = Z2.x;  //ok

let Z3 = F();
type T3 = Z3.T;  //rejected: cannot infer type of forward variable reference Z3
let x3  = Z3.x;  //ok


---

(source_file
  (class_dec
    (obj_sort)
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (vis)
          (typ_dec
            (type_identifier)
            (path_typ
              (typ_path
                (type_identifier)))))
        (dec_field
          (vis)
          (let_dec
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (lit_exp
              (int_literal)))))))
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (path_typ
          (typ_path
            (type_identifier)))))
    (call_exp_object
      (var_exp
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
              (type_identifier))))))
    (call_exp_object
      (var_exp
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
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
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
