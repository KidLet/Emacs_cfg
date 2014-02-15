;;使用emacs24内嵌的功能：
;(require 'electric)
;(electric-indent-mode t)
;(electric-layout-mode t)
;(global-set-key (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "~/.emacs.d/plugins/google-c-style")
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'cpp-mode-common-hook 'google-set-c-style)
(add-hook 'cpp-mode-common-hook 'google-make-newline-indent)

(setq c-basic-offset 4          ;; 基本缩进宽度
      default-tab-width 4       ;; 默认Tab宽度
	  tab-width 4
	  indent-tabs-mode t)




(global-linum-mode 1) ; always show line numbers
(setq linum-format "%3d ")

; highligt line
(require 'hl-line)
(global-hl-line-mode t)

(provide 'init-indent-line)
