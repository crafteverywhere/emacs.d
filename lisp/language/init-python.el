;; init-python.el

(require-package 'company-jedi)

(defun language/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'language/python-mode-hook)
;;(jedi:install-server)

(provide 'init-python)
