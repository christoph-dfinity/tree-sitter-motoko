=========
unused-switch-case.mo
=========

switch (?1) {
    case (?unused1) {};
    case unused2 {};
};

---

(source_file
  (exp_dec
    (switch_exp
      (par_exp
        (quest_exp
          (lit_exp
            (int_literal))))
      (case
        (tup_pat
          (quest_pat
            (var_pat
              (identifier))))
        (block_exp))
      (case
        (var_pat
          (identifier))
        (block_exp)))))
