=========
region-ops.mo
=========

// Region types are stable, but not shared.

func badEquals(r1: Region, r2 : Region) : Bool {
  r1 == r2 // reject
};

func badNotEquals(r1 : Region, r2 : Region) : Bool {
  r1 != r2 // reject
};

func badEqualsNested(r1: Region, r2 : Region) : Bool {
  ?r1 == ?r2 // reject
};

func badNotEqualsNested(r1 : Region, r2 : Region) : Bool {
  ?r1 != ?r2 // reject
};

func ToCandid(r : Region) : Blob {
  to_candid(r); // reject
};

func FromCandid(b : Blob) : ?Region {
  let r: ?Region = from_candid b; // reject
};

do {
   type t = async Region; // reject
};

---

(source_file
  (line_comment)
  (func_dec
    (identifier)
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
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (bin_exp_object
            (var_exp
              (identifier))
            (rel_op)
            (var_exp
              (identifier))))
        (line_comment))))
  (func_dec
    (identifier)
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
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (bin_exp_object
            (var_exp
              (identifier))
            (rel_op)
            (var_exp
              (identifier))))
        (line_comment))))
  (func_dec
    (identifier)
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
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (bin_exp_object
            (quest_exp
              (var_exp
                (identifier)))
            (rel_op)
            (quest_exp
              (var_exp
                (identifier)))))
        (line_comment))))
  (func_dec
    (identifier)
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
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (bin_exp_object
            (quest_exp
              (var_exp
                (identifier)))
            (rel_op)
            (quest_exp
              (var_exp
                (identifier)))))
        (line_comment))))
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
    (typ_annot
      (path_typ
        (typ_path
          (type_identifier))))
    (func_body
      (block_exp
        (exp_dec
          (to_candid_exp
            (var_exp
              (identifier))))
        (line_comment))))
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
    (typ_annot
      (quest_typ
        (path_typ
          (typ_path
            (type_identifier)))))
    (func_body
      (block_exp
        (let_dec
          (annot_pat
            (var_pat
              (identifier))
            (typ_annot
              (quest_typ
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (from_candid_exp
            (var_exp
              (identifier))))
        (line_comment))))
  (exp_dec
    (do_exp
      (block_exp
        (typ_dec
          (type_identifier)
          (async_typ
            (path_typ
              (typ_path
                (type_identifier)))))
        (line_comment)))))
