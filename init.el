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
