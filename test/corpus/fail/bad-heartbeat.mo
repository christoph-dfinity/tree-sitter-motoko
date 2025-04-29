=========
bad-heartbeat.mo
=========

actor {
  system func heartbeat() : () { // reject, should be async ()
  };
};


---

(source_file
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (tup_pat)
          (typ_annot
            (tup_typ))
          (func_body
            (block_exp
              (line_comment))))))))
