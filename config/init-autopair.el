(add-to-list 'load-path "~/.emacs.d/plugins/autopair") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

(provide 'init-autopair)
