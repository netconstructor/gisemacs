
(require 'ecb)
(setq ecb-tip-of-the-day nil)

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



(custom-set-variables
  (ecb-layout-define "markolayout" right nil                                                                                          
   (if (fboundp (quote ecb-set-methods-buffer)) (ecb-set-methods-buffer) (ecb-set-default-ecb-buffer))                               
   (dotimes (i 2) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))                                
   (dotimes (i 1) (other-window 1) (if (equal (selected-window) ecb-compile-window) (other-window 1)))                                
   )   
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

