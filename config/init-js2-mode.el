; js2-mode
(add-to-list 'load-path' "~/.emacs.d/plugins/js2mode")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(provide 'init-js2-mode)