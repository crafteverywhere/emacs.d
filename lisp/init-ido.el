;; init-ido.el

;; ido-mode
(ido-mode t)
(ido-everywhere t)

(require-package 'ido-ubiquitous)
(require 'ido-ubiquitous)

;; smex
(require-package 'smex)
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

;; smex kbd
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'init-ido)
