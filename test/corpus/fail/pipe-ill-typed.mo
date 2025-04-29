=========
pipe-ill-typed.mo
=========

type A = {#A};
type B = {#B};

func f2<T1, T2>(x1 : T1, x2 : T2) : (T1, T2) { (x1, x2) };

do {
  let (#A, #B) = #B |> f2<A, B>(_, #B); // type error
};

do {
  let (#A, #B) = #A |> f2<A, B>(#A, _); // type error
};


do {
  let (#A, #B) = #A |> f2<A, B> _; // type error
};

---

(source_file
  (typ_dec
    (type_identifier)
    (variant_typ
      (typ_tag
        (identifier))))
  (typ_dec
    (type_identifier)
    (variant_typ
      (typ_tag
        (identifier))))
  (func_dec
    (identifier)
    (typ_params
      (typ_bind
        (type_identifier))
      (typ_bind
        (type_identifier)))
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
              (type_identifier))))))
    (typ_annot
      (tup_typ
        (typ_item
          (path_typ
            (typ_path
              (type_identifier))))
        (typ_item
          (path_typ
            (typ_path
              (type_identifier))))))
    (func_body
      (block_exp
        (exp_dec
          (par_exp
            (var_exp
              (identifier))
            (var_exp
              (identifier)))))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (tup_pat
            (tag_pat
              (identifier))
            (tag_pat
              (identifier)))
          (bin_exp_object
            (hash_exp
              (identifier))
            (bin_op)
            (call_exp_object
              (var_exp
                (identifier))
              (inst
                (path_typ
                  (typ_path
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier))))
              (par_exp
                (wild_exp)
                (hash_exp
                  (identifier))))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (tup_pat
            (tag_pat
              (identifier))
            (tag_pat
              (identifier)))
          (bin_exp_object
            (hash_exp
              (identifier))
            (bin_op)
            (call_exp_object
              (var_exp
                (identifier))
              (inst
                (path_typ
                  (typ_path
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier))))
              (par_exp
                (hash_exp
                  (identifier))
                (wild_exp)))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (let_dec
          (tup_pat
            (tag_pat
              (identifier))
            (tag_pat
              (identifier)))
          (bin_exp_object
            (hash_exp
              (identifier))
            (bin_op)
            (call_exp_object
              (var_exp
                (identifier))
              (inst
                (path_typ
                  (typ_path
                    (type_identifier)))
                (path_typ
                  (typ_path
                    (type_identifier))))
              (wild_exp))))
        (line_comment)))))
