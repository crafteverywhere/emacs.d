;; init.el
;; Emacs 初始启动文件
;; crafteverywhere

;; 配置脚本加载路径
;; add '~/.emacs.d/preload/' to 'load-path
;; 加载 init-basic 脚本文件所在路径 .emacs/preload/init-basic.el
(add-to-list
 'load-path
 (expand-file-name "preload" user-emacs-directory))

;; 通用配置管理
(require 'init-basic) ;; 基本配置
(require 'init-elpa) ;; 包管理器配置
(require 'init-themes) ;; 主题、配色、字体管理
(require 'init-utils) ;; 通用配置管理

;; 插件管理
(require 'init-lib) ;; 额外的库文件支持
(require 'init-ido) ;; 交互式操作增强, ido-mode 和 smex 配置
(require 'init-org-mode) ;; org-mode 配置
(require 'init-windmove) ;; 更方便的窗格移动方式
(require 'init-multiple-cursors) ;; 同 buffer 多光标支持
(require 'init-yasnippet) ;; 自定义模板插入
(require 'init-magit) ;; 对 git 的支持
(require 'init-company) ;; 自动补全
(require 'init-language) ;; 对各种编程语言的支持
(require 'init-fun) ;; 娱乐相关

(provide 'init) ;; 允许外部加载
