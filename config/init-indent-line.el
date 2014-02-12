;定制C/C++缩进风格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")))
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))

;; 设置缩进字符数
(setq c-basic-offset 4)
(setq tab-width 4
	        indent-tabs-mode nil)

(global-set-key (kbd "RET") 'newline-and-indent)
;;使用易码肆24内嵌的功能：
;(require 'electric)
;;编辑时智能缩进，类似于C-j的效果——这个C-j中，zencoding和electric-pair-mode冲突
;(electric-indent-mode t)
;;系统本身内置的智能自动补全括号
;(electric-pair-mode t)
;;特定条件下插入新行
;(electric-layout-mode t)



(global-linum-mode 1) ; always show line numbers
(setq linum-format "%3d ")

; highligt line
(require 'hl-line)
(global-hl-line-mode t)

(provide 'init-indent-line)
