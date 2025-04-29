=========
unused-module-identifier.mo
=========

module UsedModule {
    public module SubModule {
        public type T1 = Nat;
    };
};

module UnusedModule {
    module UnusedSubModule {};
};

type T2 = UsedModule.SubModule.T1;

---

(source_file
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (vis)
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body
            (dec_field
              (vis)
              (typ_dec
                (type_identifier)
                (path_typ
                  (typ_path
                    (type_identifier))))))))))
  (obj_dec
    (obj_sort)
    (identifier)
    (obj_body
      (dec_field
        (obj_dec
          (obj_sort)
          (identifier)
          (obj_body)))))
  (typ_dec
    (type_identifier)
    (path_typ
      (typ_path
        (identifier)
        (identifier)
        (type_identifier)))))
