;; init-basic.el
;; emacs 启动基本配置

;; add 'lisp/' to 'load-path
;; 加载自定义脚本文件所在路径
(add-to-list
 'load-path
 (expand-file-name "lisp" user-emacs-directory))

;; after-load
;; 依赖项加载顺序调整
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; require-package
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;; splash-image 替换
(setq fancy-splash-image "~/.emacs.d/startup.png")

(provide 'init-basic)
