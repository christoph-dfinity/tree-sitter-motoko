=========
modexp5.mo
=========

class OK<T>() {
  type T = Int;
  type U = T
};

class Wrong1<T>(){ type U = T; };

module class Wrong2<T>(){ type U = T; };

---

(source_file
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
                (type_identifier)))))
        (dec_field
          (typ_dec
            (type_identifier)
            (path_typ
              (typ_path
                (type_identifier))))))))
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
                (type_identifier))))))))
  (class_dec
    (obj_sort)
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
                (type_identifier)))))))))
