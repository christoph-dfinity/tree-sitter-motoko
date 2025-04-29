=========
typ-field-lub-glb-fail.mo
=========

class Ctx() {
  public type T = Int;
  public let x = 0;
};

class Ct() {
  public type T = Int;
};

class Cx() {
  public let x = 1;
};

let wrong1 : [Ctx] = [ Ctx(), Cx() ]; // wrong
let wrong2 : [Ctx] = [ Ctx(), Ct() ]; // wrong

let ox =
  [ object { public type T = Int; public let x = 1 },
    object { public type T = Bool; public let x = 2 } ][0];

func wrong3() { type U = ox.T }; // wrong, type component mismatch

let px =
  [ object { public type T = Int; public let x = 1 },
    object { public type T<U> = Int; public let x = 2 } ][0];

func wrong4() { type U = px.T }; // wrong, type component arity mismatch

---

(source_file
  (class_dec
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
            (var_pat
              (identifier))
            (lit_exp
              (int_literal)))))))
  (class_dec
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
                (type_identifier))))))))
  (class_dec
    (type_identifier)
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (vis)
          (let_dec
            (var_pat
              (identifier))
            (lit_exp
              (int_literal)))))))
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (array_typ
          (path_typ
            (typ_path
              (type_identifier))))))
    (array_exp
      (call_exp_object
        (var_exp
          (identifier))
        (par_exp))
      (call_exp_object
        (var_exp
          (identifier))
        (par_exp))))
  (line_comment)
  (let_dec
    (annot_pat
      (var_pat
        (identifier))
      (typ_annot
        (array_typ
          (path_typ
            (typ_path
              (type_identifier))))))
    (array_exp
      (call_exp_object
        (var_exp
          (identifier))
        (par_exp))
      (call_exp_object
        (var_exp
          (identifier))
        (par_exp))))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (array_idx_exp_object
      (array_exp
        (obj_dec
          (obj_sort)
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
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal))))))
        (obj_dec
          (obj_sort)
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
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal)))))))
      (lit_exp
        (int_literal))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier)))))))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (array_idx_exp_object
      (array_exp
        (obj_dec
          (obj_sort)
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
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal))))))
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
                    (type_identifier)))))
            (dec_field
              (vis)
              (let_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (int_literal)))))))
      (lit_exp
        (int_literal))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (identifier)
              (type_identifier)))))))
  (line_comment))
