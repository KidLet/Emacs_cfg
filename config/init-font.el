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

(provide 'init-font)