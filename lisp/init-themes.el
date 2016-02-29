;; init-themes

;; ample-theme
(require-package 'ample-theme)

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)

;; inti-fonts
(defcustom themes/force-default-font-for-symbols nil
  "When non-nil, force Emacs to use your default font for symbols."
  :type 'boolean)

(defun themes/maybe-use-default-font-for-symbols ()
  "Force Emacs to render symbols using the default font, if so configured."
  (when themes/force-default-font-for-symbols
    (set-fontset-font "fontset-default" 'symbol (face-attribute 'default :family))))

(add-hook 'after-init-hook 'themes/maybe-use-default-font-for-symbols)

;; Changing font sizes
;; 设置改变字号的快捷键
(require-package 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

(defun themes/maybe-adjust-visual-fill-column ()
    "Readjust visual fill column when the global font size is modified.
This is helpful for writeroom-mode, in particular."
    (if visual-fill-column-mode
        (add-hook 'after-setting-font-hook 'visual-fill-column--adjust-window nil t)
      (remove-hook 'after-setting-font-hook 'visual-fill-column--adjust-window t)))

(add-hook 'visual-fill-column-mode-hook
          'themes/maybe-adjust-visual-fill-column)

(setq window-system-default-frame-alist
      '((x (font . "文泉驿等宽微米黑 11"))
        (nil)))

;; 缩进高亮显示
(require-package 'highlight-indent-guides)
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(provide 'init-themes)
