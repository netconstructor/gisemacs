(add-to-list 'load-path (expand-file-name "~/gisemacs/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/.emacs.d/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/cedet-1.0pre7/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/ecb/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/tree/"))


(setq visible-bell t)

;; Za windows
(getenv "PATH")

; example of setting env var named “path”
; by appending a new path to existing path
(setenv "PATH"
	(concat
	 "C:/cygwin/usr/local/bin" ";"
	 "C:/cygwin/usr/bin" ";"
	 "C:/cygwin/bin" ";"
	 "C:/Program Files/Emacs/EmacsW32/gnuwin32/bin" ";"
	 (getenv "PATH")
	 )
	)


					;(when (string-equal system-type "windows-nt")
(setq exec-path
      '(
	"C:/Program Files/Emacs/emacs/bin/"
	"C:/Program Files/Emacs/EmacsW32/gnuwin32/bin/"
	"C:/Windows/system32/"
	"C:/Windows/"
	"C:/Windows/System32/Wbem/"
	"C:/Windows/system32/WindowsPowerShell/v1.0/"
	)
      )
					;)


;; GPG
(setq epa-file-cache-passphrase-for-symmetric-encryption t)


;; FTP
(setq ange-ftp-ftp-program-name "C:/Program Files/Emacs/EmacsW32/gnuwin32/bin/ftp.exe")


;; Imenu tree mode
;(autoload 'imenu-tree "imenu-tree" "Imenu tree" t)
;(autoload 'tags-tree "tags-tree" "TAGS tree" t)



;(load-file "~/gisemacs/ecb.el")

(load-file "~/gisemacs/my-occur.el")


;(load-file "~/gisemacs/ViewUndo.el")


;; Org Mode
(setq org-startup-indented t) ; Hide *
(setq org-startup-folded 'showall)



;; Which function
(setq which-func-modes t)
(which-func-mode t)




;; Mark, jump to marker C-xC-x
(delete-selection-mode 1)
(transient-mark-mode -1)




;; nXhtml mode
;(load "~/gisemacs/nxhtml/autostart.el")



;;(load-file "~/imenu-tree.el")


(add-to-list 'load-path (expand-file-name "~/gisemacs/color-theme/"))



(load-file "~/gisemacs/my-occur.el")


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/giscloud/.emacs.d/ac-dict")
(ac-config-default)



;; Chrome edit textarea
(require 'edit-server)
(edit-server-start)

;; MoinMoin Mode
(require 'moinmoin-mode)


;; Da ne wrapa linije
(setq-default truncate-lines t)


(show-paren-mode 1)



;; Tags list
(setq tags-table-list '("/var/lib/giscloud/www/TAGS"))
;(set-face-background 'show-paren-match-face (face-background 'default))
(set-face-background 'show-paren-match-face "#1c1c1c")
(set-face-foreground 'show-paren-match-face "color-43")
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)



(setq tramp-default-method "scp")


(recentf-mode 1)

(defun recentf-open-files-compl ()
      (interactive)
      (let* ((all-files recentf-list)
        (tocpl (mapcar (function 
           (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
        (prompt (append '("File name: ") tocpl))
        (fname (completing-read (car prompt) (cdr prompt) nil nil)))
        (find-file (cdr (assoc-ignore-representation fname tocpl))))) 
(global-set-key "\C-x\C-r" 'recentf-open-files-compl) ;; old map ‘find-file-read-only’










;; Create tags function for using inside emacs
(setq path-to-ctags "/usr/bin/ctags") 
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
  )






(global-set-key (kbd "\C-q") 'kill-buffer-and-window)
(global-set-key (kbd "\C-cc") 'comment-or-uncomment-region)




;(global-set-key (kbd "\C-x <tab>") 'indent-rigidly 4)





;; Search
;; Search and replace
(global-set-key (kbd "\C-f") 'my-occur)
(global-set-key (kbd "\C-h") 'replace-string)





;; Shortcuts for switching modes
(global-set-key (kbd "M-g p") 'php-mode)
(global-set-key (kbd "M-g h") 'html-mode)
(global-set-key (kbd "M-g j") 'js-mode)
(global-set-key (kbd "M-g n") 'html-mumamo)





(require 'php-mode)

;(require 'color-theme)
;(require 'color-theme-tangotango)
;(color-theme-initialize)
;(color-theme-tangotango)

(require 'color-theme-gruber-darker)
(color-theme-gruber-darker)


(tool-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode 1)
(setq linum-format "%d ")

(setq linum-format
          (lambda (line)
            (propertize (format
                         (let ((w (length (number-to-string
                                           (count-lines (point-min) (point-max))))))
                           (concat "%" (number-to-string w) "d "))
                         line)
                        'face 'linum)))


(defalias 'yes-or-no-p 'y-or-n-p)





(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;(global-set-key "\M-[1;5C"    'forward-word)      ; Ctrl+right   => forward word
;(global-set-key "\M-[1;5D"    'backward-word)     ; Ctrl+left    => backward word



(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 



(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;Duplicate line with C-d
(defun duplicate-current-line ()
    (interactive)
      (beginning-of-line nil)
        (let ((b (point)))
	      (end-of-line nil)
	          (copy-region-as-kill b (point)))
	  (beginning-of-line 2)
	    (open-line 1)
	      (yank)
	        (back-to-indentation))

(global-set-key "\C-cd" 'duplicate-current-line)
;(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")


;Ibuffer shortcut
(global-set-key "\C-b" "\C-x\C-b")


;; Bookmark shortcut
(global-set-key (kbd "M-b") 'bookmark-bmenu-list)



;; Desktop session
(global-set-key [C-f12] 'desktop-save)
(global-set-key [f12] 'desktop-read)



;; C-j stavi to na default ENTER
(global-set-key (kbd "RET") 'newline-and-indent)



;; Bookmark
(setq
   bookmark-default-file "~/gisemacs/bookmarks" ;; keep my ~/ clean
   bookmark-save-flag 1)                        ;; autosave each change)


;; 4 space indent
(setq sgml-basic-offset 4)


;; za sve modove izvedene od cmode da ne uvlaci viticastee zagrade
(dolist (mode-hook '(c-mode-hook))
    (add-hook mode-hook (lambda nil (c-set-style "stroustrup"))))

(dolist (mode-hook '(css-mode-hook))
    (add-hook mode-hook (lambda nil (css-set-style "stroustrup"))))




;; Scroll page na alt gore/dolje
;; bolje nego na Ctrl jer je to po defaultu jump more lines, kao section
(global-set-key (kbd "M-<up>")  '(lambda nil (interactive) (scroll-down 3)))
(global-set-key (kbd "M-<down>") '(lambda nil (interactive) (scroll-up 3)))
(global-set-key (kbd "M-<right>") '(lambda nil (interactive) (scroll-left 3)))
(global-set-key (kbd "M-<left>") '(lambda nil (interactive) (scroll-right 3)))





(setq ibuffer-formats
      (quote ((mark modified read-only "  " (name 30 30 :left :elide) "  " filename-and-process)
              (mark "  " (name 30 30) "  " filename))))
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("*star*" (name . "\\*.*\\*")))
              ("cpp"
               ("source files" (filename . ".*\\.cpp"))
               ("header files" (filename . ".*\\.hpp"))
               ("resources" (filename . ".*/resources/.*"))
               ("*star*" (name . "\\*.*\\*")))
              ("kohana"
               ("*star*" (name . "\\*.*\\*"))
               ("controllers" (filename . ".*controller/.*"))
               ("views" (filename . ".*views/.*"))
               ("models" (filename . ".*model/.*"))
               ("lib" (filename . ".*/lib/.*"))
               ("configuration" (filename . ".*config/.*"))
               ("i18n" (filename . ".*i18n/.*"))
               ("logs" (filename . ".*logs/.*"))))))




 (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")

;; (custom-set-variables


;;  '(linum ((t (:inherit (shadow default) :background "color-236")))))
;; (put 'scroll-left 'disabled nil)
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.


 
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "color-236"))))
 '(which-func ((((class color) (min-colors 88) (background dark)) (:foreground "color-255")))))
