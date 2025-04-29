=========
bang-fail.mo
=========

func wrong1() {
  let _ = (?1) ! : Nat; // reject in checking context
};

func wrong2() {
  let _ = ? () !; // not an option in checking
};

func wrong3() {
  let _ = (?1) !; // reject in synthesis
};

func wrong4() {
  let _ = ? (() !); // not an option in synthesis
};

func wrong5() {
  let _ = ? ((? ()) ! : Nat); // wrong content type
};


---

(source_file
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (let_dec
          (wild_pat)
          (annot_exp_object
            (bang_exp_object
              (par_exp
                (quest_exp
                  (lit_exp
                    (int_literal)))))
            (path_typ
              (typ_path
                (type_identifier)))))
        (line_comment))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (let_dec
          (wild_pat)
          (quest_exp
            (bang_exp_object
              (par_exp))))
        (line_comment))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (let_dec
          (wild_pat)
          (bang_exp_object
            (par_exp
              (quest_exp
                (lit_exp
                  (int_literal))))))
        (line_comment))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (let_dec
          (wild_pat)
          (quest_exp
            (par_exp
              (bang_exp_object
                (par_exp)))))
        (line_comment))))
  (func_dec
    (identifier)
    (tup_pat)
    (func_body
      (block_exp
        (let_dec
          (wild_pat)
          (quest_exp
            (par_exp
              (annot_exp_object
                (bang_exp_object
                  (par_exp
                    (quest_exp
                      (par_exp))))
                (path_typ
                  (typ_path
                    (type_identifier)))))))
        (line_comment)))))
