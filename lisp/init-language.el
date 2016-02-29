;; init-language.el

;; 加载与语言支持相关的自定义脚本所存放的路径
(add-to-list
 'load-path
 (expand-file-name "lisp/language" user-emacs-directory))

;; 对各种编程语言的支持
(require 'init-cc) ;; c/cpp
(require 'init-python) ;; python
(require 'init-lisp) ;; lisp family
(require 'init-web) ;; html, css, js, php
(require 'init-go) ;; go
(require 'init-markdown) ;; markdown

(provide 'init-language)
;; init-language.el ends here
