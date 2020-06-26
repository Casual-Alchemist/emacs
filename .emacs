(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (flymake-json yaml-mode kivy-mode emojify elpy)))
 '(python-shell-interpreter "python3")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 165 :width normal)))))


;; ==================== Backup Settings ==================== ;;
(setq backup-directory-alist `(("." . "~/.saves")))


;; ==================== UI settings ==================== ;;
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-linum-mode 1)
(toggle-scroll-bar 0)


;; ==================== Mode settings ==================== ;;
(setq auto-mode-alist
      ;; for scons
      (cons '("SCons" . python-mode) auto-mode-alist))


;; ==================== Elpy configuration ==================== ;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)
(setq elpy-rpc-python-command "python3")


;; ==================== Enable recent file mode ==================== ;;
(require 'recentf)
(recentf-mode 1)


;; ==================== Custom Funtions ==================== ;;
;; (defun text-indent-mode ()
;;  ;;(setq-default indent-tabs-mode nil)
;;  (setq-default tab-width 4)
;;  (setq indent-line-function 'insert-tab))
(add-hook 'comint-mode-hook
          (defun rm-comint-postoutput-scroll-to-bottom ()
            (remove-hook 'comint-output-filter-functions
                         'comint-postoutput-scroll-to-bottom)))
(setq-default c-basic-offset 8)


;; ==================== Hooks ==================== ;;
;; (add-hook 'text-mode-hook '(lambda ()
;;   (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent)))
;; (add-hook 'prog-mode-hook 'linum-mode)
;; (add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)
(add-hook 'js-mode-hook 'flymake-json-maybe-load)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'after-init-hook 'global-emojify-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)


;; ==================== Key bindings ==================== ;;
(global-set-key
 (kbd "C-c C-f") 'recentf-open-files)
(global-set-key
 (kbd "C-c c") 'comment-region)
(global-set-key
 (kbd "C-c u") 'uncomment-region)
(global-set-key
 (kbd "C-c k") (kbd "C-u 0 C-k"))
(global-set-key
 (kbd "C-c h") 'hs-hide-block)
(global-set-key
 (kbd "C-c s") 'hs-show-block)
