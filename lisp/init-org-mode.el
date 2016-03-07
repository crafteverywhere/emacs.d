;; init-org-mode.el

(require 'org)
(setq org-log-done t)

;; kbd
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-agenda-files (list "~/org/gtd/work.org" ;;工作事务
			     "~/org/gtd/learn.org" ;;学习任务
			     "~/org/gtd/notes.org" ;;笔记本
			     "~/org/gtd/home.org" ;;家务,生活事务
			     "~/org/gtd/buy.org" ;;购物单
			     "~/org/gtd/family.org" ;;家人相关
			     ))

(provide 'init-org-mode)
