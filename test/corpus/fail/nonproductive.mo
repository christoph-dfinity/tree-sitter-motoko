=========
nonproductive.mo
=========

do { // reject
  type C<T> = C<T>;
};

do { // reject
  type C = C;
};

do { // reject
  type C<T> = D<T>;
  type D<T> = C<T>;
};

do { // reject
  type C<T> = T;
  type D<T> = C<D<T>>;
};

do { //accept
  type C<T> = T;
  type D<T> = C<T>;
  type E<T> = D<T>;
};

do { //reject
  type C<T> = E<T>;
  type D<T> = C<T>;
  type E<T> = D<T>;
  type T = Nat
};

do { // reject
  type C<T,U> = T;
  type D<T> = C<D<T>,T>;
};

do { // accept
  type C<T,U> = T;
  type D<T> = C<T,D<T>>;
};

do { // reject (ill-formed)
  type C<T,U> = T;
  type D<T> = C<T,D<T>,T>;
};

// nested variants
do { // reject
  type C<T,U> = T;
  do {
    type D<T> = C<D<T>,T>;
  };
};

do { // accept
  type C<T,U> = T;
  do {
    type D<T> = C<T,D<T>>;
  };
};

do { // reject (ill-formed)
  type C<T,U> = T;
  do {
    type D<T> = C<T,D<T>,T>;
  }
};

// accept
do {
  type Top = Any;
  type Bot = None;
  type P = Nat;
  type F = <T>F -> F;
  type T = (T,T);
  type R = {f: R};
  type VarR = {var f: R};
  type V = {#f : V};
  type A = [A];
  type VarA = [var VarA];
  type Async = async ();
};

// examples from manual and explanation

do { // accept
  type Person = { first : Text; last : Text };

  type List<T> = ?(T, List<T>);

  type Fst<T, U> = T;

  type Ok<T> = Fst<Any, Ok<T>>;
};

do { // reject
  type Fst<T, U> = T;

  type C = C;

  type D<T, U> = D<U, T>;

  type E<T> = F<T>;
  type F<T> = E<T>;

  type G<T> = Fst<G<T>, Any>;
};

do {
  class C<A>() { type D = A;};
};

do {
  type A = A and A;
};

do {
  type A = A or A;
};

do {
  type A = B and B;
  type B = A or A;
};

---

(source_file
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
                (type_identifier)))))
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
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
              (type_identifier)))
          (path_typ
            (typ_path
              (type_identifier))
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
              (type_identifier)))
          (path_typ
            (typ_path
              (type_identifier))
            (path_typ
              (typ_path
                (type_identifier)))))
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
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
                (type_identifier)))))
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
                (type_identifier)))))
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
                (type_identifier)))))
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier)))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier))))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier))))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
        (exp_dec
          (do_exp
            (block_exp
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
                      (type_identifier))
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
        (exp_dec
          (do_exp
            (block_exp
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
                      (type_identifier))
                    (path_typ
                      (typ_path
                        (type_identifier))))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
        (exp_dec
          (do_exp
            (block_exp
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
                      (type_identifier))
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier))))
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier))))
        (typ_dec
          (type_identifier)
          (path_typ
            (typ_path
              (type_identifier))))
        (typ_dec
          (type_identifier)
          (func_typ
            (typ_params
              (typ_bind
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier)))))
        (typ_dec
          (type_identifier)
          (tup_typ
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier))))
            (typ_item
              (path_typ
                (typ_path
                  (type_identifier))))))
        (typ_dec
          (type_identifier)
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier))))))
        (typ_dec
          (type_identifier)
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier))))))
        (typ_dec
          (type_identifier)
          (variant_typ
            (typ_tag
              (identifier)
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier)))))))
        (typ_dec
          (type_identifier)
          (array_typ
            (path_typ
              (typ_path
                (type_identifier)))))
        (typ_dec
          (type_identifier)
          (array_typ
            (path_typ
              (typ_path
                (type_identifier)))))
        (typ_dec
          (type_identifier)
          (async_typ
            (tup_typ))))))
  (line_comment)
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
        (typ_dec
          (type_identifier)
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier))))
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier))))))
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
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (exp_dec
    (do_exp
      (block_exp
        (line_comment)
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
          (path_typ
            (typ_path
              (type_identifier))))
        (typ_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier))
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
                (type_identifier)))))
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
                (type_identifier)))))
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
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier))))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (class_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat)
          (class_body
            (obj_body
              (dec_field
                (typ_dec
                  (type_identifier)
                  (path_typ
                    (typ_path
                      (type_identifier)))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (and_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (or_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier))))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (and_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier)))))
        (typ_dec
          (type_identifier)
          (or_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (path_typ
              (typ_path
                (type_identifier)))))))))
