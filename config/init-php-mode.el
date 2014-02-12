(add-to-list 'load-path "~/.emacs.d/plugins/php-mode")
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))


(provide 'init-php-mode)
