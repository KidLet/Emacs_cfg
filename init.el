; color-theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/themes")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)

; Solarized Colorscheme for Emacs
(add-to-list 'load-path' "~/.emacs.d/plugins/emacs-color-theme-solarized")
(if
    (equal 0 (string-match "^24" emacs-version))
    ;; it's emacs24, so use built-in theme 
    (require 'solarized-dark-theme)
  ;; it's NOT emacs24, so use color-theme
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark)))
(setq solarized-termcolor 256)

(global-linum-mode 1) ; always show line numbers

; auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1/")
(require 'auto-complete-config)  
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/ac-dict")  
(ac-config-default)

; close toolbar and Startup Page
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

; set the font for windows
(if (eq system-type 'windows-nt)
(progn
(set-face-attribute
  'default nil :font "Monaco-11")
(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "Microsoft Yahei" :size 15))
)
)

; change the key bind for set-mark form C-Space
(global-set-key (kbd "M-SPC") 'set-mark-command)

; js2-mode
(add-to-list 'load-path' "~/.emacs.d/plugins/js2mode")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; maximized at start
(run-with-idle-timer 0.0 nil 'w32-send-sys-command 61488)

;set indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;关闭自动保存模式
(setq auto-save-mode nil)
;;不生成 #filename# 临时文件
(setq auto-save-default nil)

;;关闭自动保存模式
(setq auto-save-mode nil)
;;不生成 #filename# 临时文件
(setq auto-save-default nil)

(setq
 backup-by-copying t ; 自动备份
 backup-directory-alist
 '(("." . "~/.emacs.d/backupfiles")) ; 自动备份在目录"~/.saves"下
 delete-old-versions t ; 自动删除旧的备份文件
 kept-new-versions 6 ; 保留最近的6个备份文件
 kept-old-versions 2 ; 保留最早的2个备份文件
 version-control t ; backup more times
)


; set encode
(setq default-buffer-file-coding-system 'utf-8)       ;默认buffer编码是utf-8,(新文件)
(prefer-coding-system 'utf-8)   ;指定文件编码优先,此时buffer新建和读取都默认是utf-8,也可以M-x prefer-coding-system 只执行一次

