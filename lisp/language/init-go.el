;; init-go

(require-package 'go-mode)
(require 'go-mode)

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'init-go)
