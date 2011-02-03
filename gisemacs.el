(add-to-list 'load-path (expand-file-name "~/gisemacs/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/.emacs.d/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/ecb/"))
(add-to-list 'load-path (expand-file-name "~/gisemacs/tree/"))



;; Imenu tree mode
;(autoload 'imenu-tree "imenu-tree" "Imenu tree" t)
;(autoload 'tags-tree "tags-tree" "TAGS tree" t)



(load-file "~/gisemacs/my-occur.el")


(load-file "~/gisemacs/ViewUndo.el")


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




(require 'ecb)
;(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)



;; Create tags function for using inside emacs
(setq path-to-ctags "/usr/bin/ctags") 
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
  )





(defun ecb-expand-methods-nodes2 (&optional force-all)
  (interactive "P")
  (let* ((first-node (save-excursion
                       (goto-char (point-min))
                       (tree-buffer-get-node-at-point))))
    (when ecb-expand-methods-switch-off-auto-expand
      (ecb-toggle-auto-expand-tag-tree -1))
    (ecb-expand-methods-node-internal (with-current-buffer ecb-methods-buffer-name
                                         (tree-buffer-get-root))
                                       10 force-all t t)))


;; ECB custom settings
(global-set-key (kbd "\C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "\C-c e") 'ecb-expand-methods-nodes2)

(add-hook 'after-save-hook 'ecb-expand-methods-nodes2)
(add-hook 'ecb-activate-hook 'ecb-expand-methods-nodes2)




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

			  
  (ecb-layout-define "markolayout" right nil                                                                                          
   (if (fboundp (quote ecb-set-methods-buffer)) (ecb-set-methods-buffer) (ecb-set-default-ecb-buffer))                               
   (dotimes (i 2) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))                                
   (dotimes (i 1) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))                                
   )   

 (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")

;; (custom-set-variables

;;  '(ecb-auto-activate t)
;;  '(ecb-auto-expand-tag-tree (quote all))
;;  '(ecb-auto-update-methods-after-save t)
;;  '(ecb-expand-methods-switch-off-auto-expand nil)
;;  '(ecb-layout-name "markolayout")
;;  '(ecb-methods-nodes-expand-spec (quote all))
;;  '(ecb-options-version "2.40")
;;  '(ecb-tag-jump-sets-mark nil)
;;  '(ecb-toggle-auto-expand-tag-tree 1)
;;  '(ecb-windows-width 0.2))
;; (custom-set-faces

;;  '(linum ((t (:inherit (shadow default) :background "color-236")))))
;; (put 'scroll-left 'disabled nil)
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-lha -h --group-directories-first")
 '(ecb-auto-activate t)
 '(ecb-fix-window-size t)
 '(ecb-auto-expand-tag-tree (quote all))
 '(ecb-auto-update-methods-after-save t)
 '(ecb-expand-methods-switch-off-auto-expand nil)
 '(ecb-layout-name "markolayout")
 '(ecb-methods-nodes-expand-spec (quote all))
 '(ecb-options-version "2.40")
 '(ecb-tag-jump-sets-mark nil)
 '(ecb-toggle-auto-expand-tag-tree 1)
 '(ecb-windows-width 0.2))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "color-236"))))
 '(which-func ((((class color) (min-colors 88) (background dark)) (:foreground "color-255")))))