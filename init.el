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
    (progn
    ;; it's emacs24, so use built-in theme 
      ;(require 'solarized-dark-theme)
      (add-to-list 'custom-theme-load-path "~/.emacs.d/plugins/molokai-theme")
      ;(setq molokai-theme-kit t)
      (load-theme 'molokai t)
      
    )
  ;; it's NOT emacs24, so use color-theme
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark)))
(setq solarized-termcolor 256)

(global-linum-mode 1) ; always show line numbers
(setq linum-format "%3d ")

; highligt line
(require 'hl-line)
(global-hl-line-mode t)        

; auto complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1/")
(require 'auto-complete-config)  
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/ac-dict")  
(ac-config-default)

; and Startup Page
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
(tool-bar-mode -1) ;close toolbar 
)
)

; change the key bind for set-mark form C-Space
(global-set-key (kbd "M-SPC") 'set-mark-command)

; scroll smoothly
        (setq scroll-margin 5
        scroll-conservatively 10000)        
        
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

;定制C/C++缩进风格
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")))
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))
 

;; 设置缩进字符数
(setq c-basic-offset 4)
(global-set-key (kbd "RET") 'newline-and-indent)
;;使用易码肆24内嵌的功能：
(require 'electric)
;;编辑时智能缩进，类似于C-j的效果——这个C-j中，zencoding和electric-pair-mode冲突
(electric-indent-mode t)
;;系统本身内置的智能自动补全括号
(electric-pair-mode t)
;;特定条件下插入新行
;(electric-layout-mode t)

(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
        (tabbar-mode 1)



;; Tabbar settings
        (set-face-attribute
         'tabbar-default nil
         :background "gray20"
         :foreground "gray20"
         :box '(:line-width 1 :color "gray20" :style nil))
        (set-face-attribute
         'tabbar-unselected nil
         :background "gray30"
         :foreground "white"
         :box '(:line-width 5 :color "gray30" :style nil))
        (set-face-attribute
         'tabbar-selected nil
         :background "gray75"
         :foreground "black"
         :box '(:line-width 5 :color "gray75" :style nil))
        (set-face-attribute
         'tabbar-highlight nil
         :background "white"
         :foreground "black"
         :underline nil
         :box '(:line-width 5 :color "white" :style nil))
        (set-face-attribute
         'tabbar-button nil
         :box '(:line-width 1 :color "gray20" :style nil))
        (set-face-attribute
         'tabbar-separator nil
         :background "gray20"
         :height 0.6)

        ;; Change padding of the tabs
        ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
        (custom-set-variables
         '(tabbar-separator (quote (1.5))))
        ;; adding spaces
        (defun tabbar-buffer-tab-label (tab)
          "Return a label for TAB.
    That is, a string used to represent it on the tab bar."
          (let ((label  (if tabbar--buffer-show-groups
                            (format "[%s]  " (tabbar-tab-tabset tab))
                          (format "%s  " (tabbar-tab-value tab)))))
            ;; Unless the tab bar auto scrolls to keep the selected tab
            ;; visible, shorten the tab label to keep as many tabs as possible
            ;; in the visible area of the tab bar.
            (if tabbar-auto-scroll-flag
                label
              (tabbar-shorten
               label (max 1 (/ (window-width)
                               (length (tabbar-view
                                        (tabbar-current-tabset)))))))))
