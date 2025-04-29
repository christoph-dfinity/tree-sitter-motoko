=========
type-combine-forward.mo
=========

do {
  type A = B and C;
  type B = {};
  type C = {};
};

do {
  type A = B or C;
  type B = {};
  type C = {};
};

do {
  type A = (Int, {a : Nat; b : [B]}) and (Nat, {b : [C]; c : ()});
  type B = {};
  type C = {};
};

do {
  type A = (Int, {a : Nat; b : [B]}) and (Nat, {d : [C]; c : ()});
  type B = {};
  type C = {};
};

do {
  type A = (B, B);
  type B = A and (A, A);
};

do {
  type A = B and {};
  type B = {b : A};
};

do {
  type A = {a : B};
  type B = A and {};
};

---

(source_file
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
          (obj_typ))
        (typ_dec
          (type_identifier)
          (obj_typ)))))
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
                (type_identifier)))))
        (typ_dec
          (type_identifier)
          (obj_typ))
        (typ_dec
          (type_identifier)
          (obj_typ)))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (and_typ
            (tup_typ
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_item
                (obj_typ
                  (val_tf
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (val_tf
                    (identifier)
                    (array_typ
                      (path_typ
                        (typ_path
                          (type_identifier))))))))
            (tup_typ
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_item
                (obj_typ
                  (val_tf
                    (identifier)
                    (array_typ
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (val_tf
                    (identifier)
                    (tup_typ)))))))
        (typ_dec
          (type_identifier)
          (obj_typ))
        (typ_dec
          (type_identifier)
          (obj_typ)))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (and_typ
            (tup_typ
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_item
                (obj_typ
                  (val_tf
                    (identifier)
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (val_tf
                    (identifier)
                    (array_typ
                      (path_typ
                        (typ_path
                          (type_identifier))))))))
            (tup_typ
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_item
                (obj_typ
                  (val_tf
                    (identifier)
                    (array_typ
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (val_tf
                    (identifier)
                    (tup_typ)))))))
        (typ_dec
          (type_identifier)
          (obj_typ))
        (typ_dec
          (type_identifier)
          (obj_typ)))))
  (exp_dec
    (do_exp
      (block_exp
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
          (and_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (tup_typ
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))
              (typ_item
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (and_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (obj_typ)))
        (typ_dec
          (type_identifier)
          (obj_typ
            (val_tf
              (identifier)
              (path_typ
                (typ_path
                  (type_identifier)))))))))
  (exp_dec
    (do_exp
      (block_exp
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
          (and_typ
            (path_typ
              (typ_path
                (type_identifier)))
            (obj_typ)))))))
