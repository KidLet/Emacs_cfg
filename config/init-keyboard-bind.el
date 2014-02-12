; change the key bind for set-mark form C-Space
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key [(control tab)] 'tabbar-backward)  
(global-set-key [(control shift tab)] 'tabbar-forward)

(provide 'init-keyboard-bind)
