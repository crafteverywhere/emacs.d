;; init-lisp

(require-package 'paredit)

(autoload 'enable-paredit-mode
  "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook
	  #'enable-paredit-mode)
(add-hook 'ielm-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-mode-hook #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook #'enable-paredit-mode)

;; rainbow-delimiters
(add-hook 'emacs-lisp-mode-hook
	  #'rainbow-delimiters-mode)
(add-hook 'ielm-lisp-mode-hook
	  #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook
	  #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook
	  #'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook
	  #'rainbow-delimiters-mode)

;; srefactor
(require-package 'srefactor)
(require 'srefactor)
(require 'srefactor-lisp)

;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++. 
;; (semantic-mode 1) ;; -> this is optional for Lisp

;; (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
;; (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o")
		'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m")
		'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d")
		'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b")
		'srefactor-lisp-format-buffer)

(provide 'init-lisp)
