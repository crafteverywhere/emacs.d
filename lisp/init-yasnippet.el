;; init-yasnippet.el

;;======================================================
;; Yasnippet
;;======================================================

(require-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; snippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-minor-mode t)

(global-set-key (kbd "C-c s n") 'yas-new-snippet)
(global-set-key (kbd "C-c s i") 'yas-insert-snippet)
(global-set-key (kbd "C-c s v") 'yas-visit-snippet-file)

(setq auto-revert-interval 1)

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
	 (1+ (current-column))))))


(define-key prog-mode-map (kbd "C-c f") 'toggle-selective-display)

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (yas-minor-mode -1)		;Disable Yasnippet in markdown-mode
	    (define-key markdown-mode-map (kbd "TAB") 'markdown-cycle) ;Tab to fold title
	    (markdown-cycle t) ;Auto fold all title after startuping markdown-mode.
	    ))

;;======================================================
;; `auto-insert' Templates
;;======================================================
(require 'autoinsert)
(auto-insert-mode t)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)

;; 利用 yasnippet 作为文件模板
(defun templates/autoinsert-yas-expand()
      "Replace text in yasnippet template."
      (yas/expand-snippet (buffer-string) (point-min) (point-max)))

;; 文件模板加载
(custom-set-variables
     '(auto-insert 'other)
     '(auto-insert-directory "~/templates/")
     '(auto-insert-alist
       '(
	 (("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header") .
	  ["template.h" c++-mode my/autoinsert-yas-expand])
	 (("\\.\\([C]\\|cc\\|cpp\\)\\'" . "C++ source") .
	  ["template.cc" templates/autoinsert-yas-expand])
	 (("\\.sh\\'" . "Shell script") . ["template.sh" templates/autoinsert-yas-expand])
	 (("\\.el\\'" . "Emacs Lisp") . ["template.el" templates/autoinsert-yas-expand])
	 (("\\.pl\\'" . "Perl script") . ["template.pl" templates/autoinsert-yas-expand])
	 (("\\.pm\\'" . "Perl module") . ["template.pm" templates/autoinsert-yas-expand])
	 (("\\.py\\'" . "Python script") . ["template.py" templates/autoinsert-yas-expand])
	 (("[mM]akefile\\'" . "Makefile") . ["Makefile" templates/autoinsert-yas-expand])
	 (("\\.html\\'" . "HTML") . ["template.html" templates/autoinsert-yas-expand])
	 (("\\.tex\\'" . "TeX/LaTeX") . ["template.tex" templates/autoinsert-yas-expand]))))

;; gitignore
(defun touch-gitignore ()
  (interactive)
  (let* ((file (concat
                (read-directory-name "Place ignore file to: " nil nil) ".gitignore")))
    (if (file-exists-p file)
        (message ".gitignore file has been exist, abort.")
      (progn
        (copy-file (concat auto-insert-directory "template.gitignore") file)
        (message "Done.")))))


(provide 'init-yasnippet)
;; ends here
