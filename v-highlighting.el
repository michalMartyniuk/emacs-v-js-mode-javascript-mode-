;; -*- lexical-binding: t -*-
(provide 'v-highlighting)


(defun v-h-add-rule-func (&optional rules)
  (lambda (rule)
    (if (null rule) rules
        (progn (setq rules `(,@rules ,rule)) (v-h-add-rule-func rules)))))


(defun v-h-create-or-rule (face &rest patterns)
  (setq patterns (regexp-opt `(,@patterns)))
  (setq patterns (concat "\\<" patterns "\\>" ))
  `(,patterns . ,face))


(defun v-h-create-group-rule (font-face group-num &rest regexp-string)
  (let ((patterns))
    (unless (not (null group-num)) (setq group-num 0))
    (setq patterns (mapconcat (lam el => (concat "\\(" el "\\)")) regexp-string ""))
    (setq patterns (concat "\\<" patterns "\\>"))
    `(,patterns ,group-num ,font-face)))


(defun v-get-faces (faces-list)
  (lambda (face-type) (cdr (assoc face-type faces-list)))
)

(defun v-h-add-rule (mode pattern face &optional group)
  (let ((rule))
    (if (bound-and-true-p group)
      (setq rule `(,pattern ,group ,face))
      (setq rule `(,pattern . ,face))
    )
    (font-lock-add-keywords mode `(,rule))
  )
)

(defun v-h-remove-rule (mode pattern face &optional group)
  (let ((rule))
    (if (bound-and-true-p group)
      (setq rule `(,pattern ,group ,face))
      (setq rule `(,pattern . ,face))
    )
    (font-lock-remove-keywords mode `(,rule))
  )
)
