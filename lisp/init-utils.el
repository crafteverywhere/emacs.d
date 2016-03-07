;; init-utils

;; enhanced help mechanism
(require-package 'help-fns+)
(require 'help-fns+)

;; some default value
;; 默认值设置
(setq
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 buffers-menu-max-size 20
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 delete-selection-mode t
 grep-scroll-output t
 indent-tabs-mode t
 tab-width 4
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 scroll-step 1
 scroll-margin 3
 scroll-conservatively 10000
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)
(set-scroll-bar-mode nil)
(show-paren-mode)
(tool-bar-mode 0)

;; auto-revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose t)

;; newline behavior
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;; change yes-or-no to y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; display time
(display-time-mode t)
(setq display-time-24hr-format t)

;; display line number
(setq linum-right-space nil)
(setq linum-left-space nil)
(setq linum-format 'dynamic)
(global-linum-mode t)

;; 某些模式下不显示行号
(setq inhibit-linum-mode-alist
      `(eshell-mode
	shell-mode
	term-mode
	erc-mode
	compilation-mode
	woman-mode
	w3m-mode
	magit-mode
	magit-status-mode
	,(if (not (window-system)) 'twittering-mode)
	))

;; 单行过长的 .org 文件不显示行号
(defadvice linum-on (around inhibit-for-modes activate)
  "Stop turing linum-mode if it is in the inhibit-linum-mode-alist."
  (unless (or (member major-mode inhibit-linum-mode-alist)
              (and (eq major-mode 'org-mode)
                   (> (count-lines (point-min) (point-max)) 1000)))
    ad-do-it))

;; enable uppercase and lowercase transform for region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; use page-break-line to handle the ^L page-breaking symbol
(require-package 'page-break-lines)
(global-page-break-lines-mode)

(provide 'init-utils)
