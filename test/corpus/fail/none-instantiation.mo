=========
none-instantiation.mo
=========

class Box<A>() {
    var item : ?A = null;
    public func fill(i : A) {
        item := ?i
    }
};
// Should be `let box = Box<Nat>();`
let box = Box();
box.fill(10);

---

(source_file
  (class_dec
    (type_identifier)
    (typ_params
      (typ_bind
        (type_identifier)))
    (tup_pat)
    (class_body
      (obj_body
        (dec_field
          (var_dec
            (var_pat
              (identifier))
            (typ_annot
              (quest_typ
                (path_typ
                  (typ_path
                    (type_identifier)))))
            (lit_exp
              (null_literal))))
        (dec_field
          (vis)
          (func_dec
            (identifier)
            (tup_pat
              (annot_pat
                (var_pat
                  (identifier))
                (typ_annot
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (func_body
              (block_exp
                (exp_dec
                  (assign_exp_object
                    (var_exp
                      (identifier))
                    (quest_exp
                      (var_exp
                        (identifier))))))))))))
  (line_comment)
  (let_dec
    (var_pat
      (identifier))
    (call_exp_object
      (var_exp
        (identifier))
      (par_exp)))
  (exp_dec
    (call_exp_object
      (dot_exp_object
        (var_exp
          (identifier))
        (identifier))
      (par_exp
        (lit_exp
          (int_literal))))))
