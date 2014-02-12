(add-to-list 'custom-theme-load-path "~/.emacs.d/plugins/molokai-theme")
(load-theme 'molokai t)
(setq molokai-theme-kit t)

; maximized at start
(run-with-idle-timer 0.0 nil 'w32-send-sys-command 61488)

; scroll smoothly
(setq scroll-margin 5
	scroll-conservatively 10000)

; hide Startup Page
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

; close menu 
(menu-bar-mode -1)
(provide 'init-theme)
