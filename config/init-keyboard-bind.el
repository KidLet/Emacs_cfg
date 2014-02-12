; change the key bind for set-mark form C-Space
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "M-j") 'tabbar-backward)  
(global-set-key (kbd "M-k") 'tabbar-forward)

;; PuTTY fix. Ugly. Bad. But it works. (Good)
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)

(provide 'init-keyboard-bind)
