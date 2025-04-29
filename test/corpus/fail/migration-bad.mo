=========
migration-bad.mo
=========

// test migration function restrictions

(with migration = ()) // reject, not a function
actor a {
};

(with migration = func <T>(x:T) : T {x}) // reject, a generic function
actor b {
};

(with migration = func () : {} {{}}) // reject, domain is not a record
actor c {
};

(with migration = func ({}) : () {}) // reject, co-domain is not a record
actor d {
};

(with migration = func ({f:()->()}) : () {}) // reject domain is unstable
actor e {
};

(with migration = func () : {f:()->()}{ {f = func(){}} }) // reject, co-domain is unstable
actor f {
   stable let f : Any = ()
};

(with migration = (func () : ({} -> {}) {}) ()) // reject, not static
actor g {
   stable let f : Any = ()
};

(with other = ()) // reject, no migration field
actor h {
};

({} with other = ())
actor i { // reject, no migration field
};

(with migration = ();
      extra = ()) // future: warn, unexpected field
actor j {
};

(with migration = func ({}) : {}{{}};) // error, unexpected module
module k {
};

(with migration = func ({}) : {}{{}};) // error, unexpected object
object l {
};

---

(source_file
  (line_comment)
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (par_exp)))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (var_exp
                  (identifier))))))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat)
          (typ_annot
            (obj_typ))
          (func_body
            (block_exp
              (exp_dec
                (object_exp)))))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat))
          (typ_annot
            (tup_typ))
          (func_body
            (block_exp)))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat
              (pat_field
                (identifier)
                (typ_annot
                  (func_typ
                    (tup_typ)
                    (tup_typ))))))
          (typ_annot
            (tup_typ))
          (func_body
            (block_exp)))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat)
          (typ_annot
            (obj_typ
              (val_tf
                (identifier)
                (func_typ
                  (tup_typ)
                  (tup_typ)))))
          (func_body
            (block_exp
              (exp_dec
                (object_exp
                  (exp_field
                    (identifier)
                    (func_exp
                      (tup_pat)
                      (func_body
                        (block_exp)))))))))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (stab)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier)))))
          (par_exp)))))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (call_exp_object
          (par_exp
            (func_exp
              (tup_pat)
              (typ_annot
                (tup_typ
                  (typ_item
                    (func_typ
                      (obj_typ)
                      (obj_typ)))))
              (func_body
                (block_exp))))
          (par_exp))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (stab)
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (path_typ
                (typ_path
                  (type_identifier)))))
          (par_exp)))))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (par_exp)))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (object_exp)
      (exp_field
        (identifier)
        (par_exp)))
    (obj_sort)
    (identifier)
    (obj_body
      (line_comment)))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (par_exp))
      (exp_field
        (identifier)
        (par_exp)))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat))
          (typ_annot
            (obj_typ))
          (func_body
            (block_exp
              (exp_dec
                (object_exp)))))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body))
  (obj_dec
    (parenthetical
      (exp_field
        (identifier)
        (func_exp
          (tup_pat
            (obj_pat))
          (typ_annot
            (obj_typ))
          (func_body
            (block_exp
              (exp_dec
                (object_exp)))))))
    (line_comment)
    (obj_sort)
    (identifier)
    (obj_body)))
