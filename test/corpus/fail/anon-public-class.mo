=========
anon-public-class.mo
=========

module X {
  public class(){};
};

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (class_dec
          (tup_pat)
          (class_body
            (obj_body)))))))
