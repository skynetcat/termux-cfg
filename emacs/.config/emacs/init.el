;; -*- lexical-binding: t; -*-

;; Enable virtual keyboard on Android all the time
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(touch-screen-display-keyboard t))

;; Inhibits startup page
;;(setq inhibit-startup-message t)

(scroll-bar-mode -1) ;; Disable scrollbar
(tooltip-mode -1) ;; Disable tooltips
(tool-bar-mode -1) ;; Disable toolbar
(menu-bar-mode -1) ;; Disable menu bar

;; Give breathing space to columns around doc
(set-fringe-mode 17)

;; Enable visual bell instead of sound
(setq visible-bell t)

;; Change font family and size
(set-face-attribute 'default nil :font "Droid Sans Mono" :height 137)

;; Change theme
(load-theme 'tango-dark)
