;; init-web.el

;; web 模板编辑模式
(require-package 'web-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist
	     '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist
	     '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist
	     '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist
	     '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist
	     '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist
	     '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist
	     '("\\.djhtml\\'" . web-mode))

(defun custom/web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0)
  (setq web-mode-comment-style 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-part-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-heredoc-fontification
	t)
  (setq web-mode-enable-current-element-highlight
	t))
(add-hook 'web-mode-hook 'custom/web-mode-hook)

;; emmet minor mode
;; 利用类 css 选择器语法快速插入 html 标签
(require-package 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode) ;; Auto-start on html-mode
(add-hook 'css-mode-hook 'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'emmet-mode-hook
	  (lambda ()
	    (setq emmet-indent-after-insert nil)))
(add-hook 'emmet-mode-hook
	  (lambda ()
	    (setq emmet-indentation 2))) ;; indent 2 spaces.
(setq emmet-move-cursor-between-quotes t) ;; default nil

;; JavaScript
(require-package 'js2-mode)
(require-package 'ac-js2)
(require-package 'json-mode)
(require-package 'coffee-mode)

(defcustom preferred-javascript-mode (first (remove-if-not #'fboundp
							   '(js2-mode js-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js-mode))

(defconst preferred-javascript-indent-level
  2)

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist
      (cons `("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
	    (loop for entry in auto-mode-alist unless
		  (eq preferred-javascript-mode (cdr entry))
		  collect entry)))

;; js2-mode

;; Change some defaults: customize them to override
(setq-default js2-basic-offset 2 js2-bounce-indent-p
	      nil)
(after-load 'js2-mode
  ;; Disable js2 mode's syntax error highlighting by default...
  (setq-default js2-mode-show-parse-errors nil
		js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer
    "flycheck")
  (defun sanityinc/disable-js2-checks-if-flycheck-active ()
    (unless (flycheck-get-checker-for-buffer)
      (set (make-local-variable 'js2-mode-show-parse-errors)
	   t)
      (set (make-local-variable 'js2-mode-show-strict-warnings)
	   t)))
  (add-hook 'js2-mode-hook 'sanityinc/disable-js2-checks-if-flycheck-active)
  (add-hook 'js2-mode-hook
	    (lambda ()
	      (setq mode-name "JS2")))
  (after-load 'js2-mode
    (js2-imenu-extras-setup)))

;;; js-mode
(setq-default js-indent-level preferred-javascript-indent-level)
(add-to-list 'interpreter-mode-alist
	     (cons "node" preferred-javascript-mode))

;; Javascript nests {} and () a lot, so I find this helpful
;; 彩虹色嵌套括号
(require-package 'rainbow-delimiters)
(dolist (hook '(js2-mode-hook js-mode-hook json-mode-hook))
  (add-hook hook 'rainbow-delimiters-mode))

;;; Coffeescript
(after-load 'coffee-mode
  (setq coffee-js-mode preferred-javascript-mode
	coffee-tab-width preferred-javascript-indent-level))

(when (fboundp 'coffee-mode)
  (add-to-list 'auto-mode-alist
	       '("\\.coffee\\.erb\\'" . coffee-mode)))

;; php
(require-package 'php-mode)
(require-package 'smarty-mode)

(provide 'init-web)
