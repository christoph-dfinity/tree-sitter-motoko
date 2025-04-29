=========
type-comp.mo
=========

// test type components in types
do {
  type MT = module { type T = Null; type T<A> = A }; // reject
};

do {
  type MT = module { T : Null; type T<A> = A }; // accept
};

do {
  type Upper<A <: {}> = A;
  type B1 = module { type T<P1 <: { x : Int}> = Upper<P1> }; // accept
  type B2 = module { type T<P2 <: Null> = Upper<P2> }; // reject
  type B3 = module { type T<P3> = Upper<P3> }; // reject
};

do {
  type List<A> = ?(A,List<A>);
  type R1 = module { type List<A> = List<A> }; // accept (non-recursive, refers to previous List)
  type R2 = module { type Bogus<A> = Bogus<A> }; // reject (non-recursive, refers to nothing)
};

do {
  type Outer = module { type Open<A, B> = (A, B) }; // accept (closed type definition)
};

do {
  type Outer<A> = module { type Open<B> = (A, B) }; // reject (open type definition)
};

---

(source_file
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier)))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (val_tf
                (identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier)))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)
              (obj_typ)))
          (path_typ
            (typ_path
              (type_identifier))))
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)
                    (obj_typ
                      (val_tf
                        (identifier)
                        (path_typ
                          (typ_path
                            (type_identifier)))))))
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))))
        (line_comment)
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)
                    (path_typ
                      (typ_path
                        (type_identifier)))))
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))))
        (line_comment)
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (quest_typ
            (tup_typ
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))))
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))))
        (line_comment)
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier))
                  (typ_bind
                    (type_identifier)))
                (tup_typ
                  (typ_item
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (typ_item
                    (path_typ
                      (typ_path
                        (type_identifier)))))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (obj_sort_typ
            (obj_typ
              (typ_tf
                (type_identifier)
                (typ_params
                  (typ_bind
                    (type_identifier)))
                (tup_typ
                  (typ_item
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (typ_item
                    (path_typ
                      (typ_path
                        (type_identifier)))))))))
        (line_comment)))))
