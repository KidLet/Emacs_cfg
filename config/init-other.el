; set encode
(setq default-buffer-file-coding-system 'utf-8)       ;默认buffer编码是utf-8,(新文件)
(prefer-coding-system 'utf-8)   ;指定文件编码优先,此时buffer新建和读取都默认是utf-8,也可以M-x prefer-coding-system 只执行一次

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

; 让Shell支持Ansi 高亮
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

(provide 'init-other)
