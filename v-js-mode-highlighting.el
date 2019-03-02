;; -*- lexical-binding: t -*-
(provide 'v-js-mode-highlighting)

(defun v-js-highlighting ()
  (let ((v-js-faces))
    (setq v-js-faces (v-get-faces (v-js-face-list)))
    `(,(v-h-create-or-rule (funcall v-js-faces 'functions) "function" "while" "for")
      ,(v-h-create-group-rule (funcall v-js-faces 'function-name) 2 "function\s+" "[a-z]+"))
  )
)

(defun v-js-face-list ()
  (let ((faces))
    (setq faces (v-get-faces (v-faces)))
    `(
      (function-name . ,(funcall faces 'bold-lightblue))
      (functions . ,(funcall faces 'bold-red))
       ;; (arguments . )
     )
  )
)
