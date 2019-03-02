(provide 'v-h-patterns)

(defun v-h-patterns ()
`(
  (parenthesis . ,(regexp-opt '("(" ")" "[" "]")))
  (args-pattern . "\\((\\)\\(.*\\)\\()\\)")
  )
)



