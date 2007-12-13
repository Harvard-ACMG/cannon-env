;==============================================================================
;; $Id: .emacs,v 1.1 2007/12/13 19:20:37 bmy Exp $
;;
;; The .emacs customization file for both EMACS on Tethys and XEMACS on SGI.
;; (phs, bmy, 12/13/07)
;;
;; Please peruse this file carefully!  For many settings there are several 
;; options that you can pick from.  You can uncomment the settings that you 
;; would like to use and comment out the ones that you don't.  The comment
;; character for this file is ";".
;;
;; Also be sure to set your default email address under "MISCELLANEOUS STUFF".
;==============================================================================

;;=============================================================================
;; FONTS (pick the one that you like the best, or add your own!)
;;=============================================================================

;; Lucida Typewriter 14pt bold
(set-face-font 
 'default "-*-Lucidatypewriter-Bold-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Lucida Typewriter 14pt normal
;(set-face-font 
; 'default "-*-Lucidatypewriter-*-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Lucida Typewriter 12pt bold
;(set-face-font 
; 'default "-*-Lucidatypewriter-Bold-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Lucida Typewriter 12pt normal
;(set-face-font 
; 'default "-*-Lucidatypewriter-*-R-*-*-*-120-*-*-*-*-iso8859-1" )

;; Courier 14 pt bold
;(set-face-font 
; 'default "-*-Courier-Bold-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Courier 14 pt normal
;(set-face-font 
; 'default "-*-Courier-*-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Courier 12 pt bold
;(set-face-font 
; 'default "-*-Courier-Bold-R-*-*-*-120-*-*-*-*-iso8859-1" )

;; Courier 14 pt normal
;(set-face-font 
; 'default "-*-Courier-*-R-*-*-*-120-*-*-*-*-iso8859-1" )


;;=============================================================================
;; COLOR SETTINGS
;;=============================================================================

;; Set the background colors (pick the one that you like best)
(set-face-background 'default "gray75")            ; bmy's preference
;(set-face-background 'default "FloralWhite")      ; phs's preference
;(set-face-background 'default "dark slate gray")  ; ... a few
;(set-face-foreground 'default "blanched almond")  ;     other 
;(set-face-foreground 'default "black")            ;     options ...

;; Set "colorization" colors for code
;; Use the same scheme as from the old .xemacs-options file
(custom-set-faces
 '(font-lock-comment-face       ((t (:foreground "#6920ac"))) t) ; comments
 '(font-lock-doc-string-face    ((t (:foreground "green4" ))) t) ; strings
 '(font-lock-function-name-face ((t (:foreground "red2"   ))) t) ; func names
 '(font-lock-keyword-face       ((t (:foreground "orange3"))) t) ; commands
 '(font-lock-other-type-face    ((t (:foreground "blue"   ))) t) ; other type
 '(font-lock-preprocessor-face  ((t (:foreground "red2"   ))) t) ; Cpp blocks
 '(font-lock-reference-face     ((t (:foreground "red2"   ))) t) ; Cpp blocks
 '(font-lock-string-face        ((t (:foreground "green4" ))) t) ; strings
 '(font-lock-type-face          ((t (:foreground "brown"  ))) t) ; F90 types
 '(font-lock-variable-name-face ((t (:foreground "black"  ))) t) ; variables

 ;; Following was working in Xemacs, but no more in Emacs 21.4...:
 '(dired-face-symlink ((t (:foreground "white" :background "darkOrchid"))))
)

;;=============================================================================
;; FUNCTIONS
;;=============================================================================

;; kill process (like a tail -f) and purge output. In shell mode.
(defalias 'quitnclean
  (read-kbd-macro "C-c C-\\ C-c C-o"))

;; for quick swap b/w 2 buffers
(defalias 'swapbuffer
  (read-kbd-macro "C-x b RET"))

;; EDIFF : to restore my 2 windows setting w/ each compared file in one window 
(defalias 'clean-after-ediff
  (read-kbd-macro "C-x 1 C-x 3 C-x b RET"))

;; EDIFF : like clean-after-ediff but close the two compared windows
;; This one depends on the bindings below
(defalias 'fullcleanediff
  (read-kbd-macro "<f3> <C-f2> <f3>"))

;; OMIT :
;; This C-o business was working in Xemacs, but it is not in Emacs...:
;; to add ".mod" to the list of file type to omit when you do C-o in Directory
(defalias 'omitmod
  (read-kbd-macro "C-u %o.mod RET"))


;; So redefined the "omit" functions for Emacs in dired mode:
(if (not(featurep 'xemacs)) 
    (fset 'omitdotfiles
	  [?% ?m ?^ ?\\ ?. ?. ?* return ?k])
  )

;; and this one will omit .o, .mod, ~, and . files from directory listing
(if (not(featurep 'xemacs)) 
    (fset 'omit-fortran
	  [?% ?m ?^ ?\\ ?. ?\\ ?| ?\\ ?. ?o ?$ ?\\ ?| ?\\ ?. ?m ?o ?d ?$ ?\\ ?| ?~ ?$ return ?k])
  )

;; to get rid of ^M in files imported from MS. In DIR mode,
;; should use: ! to_unix
;; Not available on Tethys?

;;=============================================================================
;; DELETE COMMANDS (new = set here)
;;
;;     DEL       is delete forward (new)
;;   C-DEL       is kill-word      (new)
;;   M-DEL       is kill-word
;;     Backspace is backward delete
;;   C-backspace is word-backward-delete (new)
;;
;;   ( M-d remains kill-word, C-d remains delete-forward)
;;
;; so, like in Windows:
;;=============================================================================

;;(setq delete-key-deletes-forward 0)     ; works for Xemacs ONLY 
(global-set-key [(delete)] "\C-d")        ; Now do that instead: 
                                          ;  works for both emacs/Xemacs

(global-set-key [(control delete)]    'kill-word)
(global-set-key [(control backspace)] 'backward-kill-word)

;; to replaces (when typing) or delete (when pressing DEL 
;; or Backspace) **highlighted** text (very  useful!)
(delete-selection-mode t)


;;=============================================================================
;; MISCELLANEOUS STUFF
;;=============================================================================

;; To scroll only one line when cursor is at the bottom of the screen 
;; (instead of finding the lastline suddenly in the middle)
;; (I use it in conjonction with C-l to get the cursor at the middle of 
;;  the screen if this is what I really want)
(setq scroll-step 1)

;; Display path name in window title
(setq frame-title-format "%S: %f")

;; Turn on line and column number mode
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;; Set your email address
(custom-set-variables
 '(user-mail-address "yantosca@seas.harvard.edu" t)
 '(query-user-mail-address nil))

;; Initialize the max minbuffer depth
(setq minibuffer-max-depth nil)


;;=============================================================================
;; MOUSE WHEEL BUSINESS
;;=============================================================================
(if (featurep 'xemacs) 
    (progn
      (global-set-key '(button4) 'scroll-down)
      (global-set-key '(button5) 'scroll-up))
  (progn
    (global-set-key [mouse-4] 'scroll-down)
    (global-set-key [mouse-5] 'scroll-up))
  )


;;=============================================================================
;; FUNCTION KEY BINDINGS -- standard options 
;;
;; These are the same settings as we use in XEMACS on SGI.  You can use 
;; these settings, or you may use Philippe's preferences below.
;;=============================================================================

(global-set-key [f1]           "\M-v")
(global-set-key [f2]           "\C-v")
(global-set-key [f3]           'search-backward)
(global-set-key [f4]           'search-forward)
(global-set-key [f5]           'fortran-mode)
(global-set-key [f6]           'idl-mode)
(global-set-key [f7]           'makefile-mode)
(global-set-key [f8]           'font-lock-mode)
(global-set-key [f9]           'replace-string)
(global-set-key [f10]          'goto-line)
(global-set-key [f11]          'find-file)
(global-set-key [f12]          'insert-file)
(global-set-key [kp-subtract]  'shell-script-mode)
(global-set-key [kp-add]       "\M-l")
(global-set-key [kp-enter]     "\M-u")


;;=============================================================================
;; FUNCTION KEY BINDINGS -- Philippe's preferences
;;
;; Default is to leave these commented out.  If you would like to use these,
;; then uncomment the lines below and comment out the lines in the section
;; above.
;;=============================================================================

;(global-set-key [f1]             'help)
;(global-set-key [f2]             'ediff-buffers)      ; I love it so much! 
;(global-set-key [(control f2)]   'clean-after-ediff)  ;
;(global-set-key [(meta f2)]      'fullcleanediff)
;(global-set-key [f3]             'kill-this-buffer)
;(global-set-key [(control f3)]   'delete-window)
;(global-set-key [f4]          	 'quitnclean)         ; see definition above 
;                                                     ; (work in shell mode only)
;(global-set-key [(meta f4)]  	 "\C-x\C-c")          ; quit 
;                                                     ; (seems to not work if 
;                                                     ;  a shell is active)
;(global-set-key [f5]          	 'shell)
;(global-set-key [f6]         	 'swapbuffer)         ; see definition above 
;                                                     ; (same as "F7 RET")
;(global-set-key [f7]          	 'switch-to-buffer)
;(global-set-key [f8]         	 'font-lock-mode)
;
;(global-set-key [f9]         	 'query-replace)
;(global-set-key [(shift f9)]     'query-replace-regexp)
;
;(global-set-key [f10]         	 'control-X-prefix)   ; C-x
;(global-set-key [(shift f10)]    'goto-line)
;
;(global-set-key [f11]        	 'find-file)
;(global-set-key [(shift f11)]	 "\C-x\C-b")          ; buffer list in 
;                                                      ; other window
;(global-set-key [(control f11)]  'find-file-other-window)
;
;;; experimental:
;(global-set-key [f12]            "\M-w")    ; copy
;(global-set-key [(control f12)]  "\C-y")    ; paste
;(global-set-key [(shift f12)]    "\C-w")    ; cut
;(global-set-key [(meta f12)]     "\M-y")    ; loop
;
;(global-set-key [(control f6)]    'fortran-mode)
;(global-set-key [(control f7)]    'idl-mode)
;(global-set-key [(control f8)]    'makefile-mode)
;(global-set-key [(control f9)]    'idlwave-mode)
;(global-set-key [(control f10)]   'shell-script-mode)

;;------------ Others Unset / Set

;; never iconify with C-z (but keeps C-x C-z to do it)
;; instead, set C-z to UNDO, like in Windows
;(global-unset-key [(control z)])
;(global-set-key [(control z)] 'undo)
;
;(global-set-key [kp-add]       "\M-l")
;(global-set-key [kp-enter]     "\M-u")


;;=============================================================================
;; MODES 
;;=============================================================================

;; Matlab mode (uncomment this if you need it)
;(autoload 'matlab-mode "matlab" "Major mode for editing .m files" t)

;; IDL mode - Useful if you do not have IDLWave
(autoload 'idl-mode "idl" "Major mode for editing IDL/WAVE CL .pro files" t)

;; Load different major modes depending on the file extension
(setq auto-mode-alist (append '(("\\.C$"   . c++-mode)
				("\\.cc$"  . c++-mode)
				("\\.hh$"  . c++-mode)
				("\\.hpp$" . c++-mode)
				("\\.cpp$" . c++-mode)
				("\\.h$"   . fortran-mode)
				("\\.hM$"  . fortran-mode)
				("\\.F$"   . fortran-mode)
				("\\.F90"  . f90-mode)
				("\\.FM$"  . fortran-mode)
				("\\.COM$" . fortran-mode)
				("\\.c$"   . c-mode))auto-mode-alist))

;; Link *.pro to IDLwave if Emacs 21.4 (thetys), 
;; or IDL for our old Xemacs () on sgi
(if (featurep 'xemacs)    
  (setq auto-mode-alist (append '(("\\.pro$" . idl-mode))auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.pro$" . idlwave-mode))auto-mode-alist))
)


;;-----------------------------------------------------------------------------
;; Add the following for IDL mode (for XEMACS where we don't have IDLWAVE)
;;-----------------------------------------------------------------------------
(add-hook 'idl-mode-hook
  (function 
    (lambda ()
      (setq                        ; Set options here
	idl-block-indent 3          ; Indentation settings
	idl-main-block-indent 3
	idl-end-offset -3
	idl-continuation-indent 3
	
	;; Leave ";" but not ";;" anchored at start of line.
	idl-begin-line-comment "^\;[^\;]" 
	idl-surround-by-blank t     ; Turn on padding symbols =,<,>, etc.
	abbrev-mode 1               ; Turn on abbrevs (-1 for off)
	idl-pad-keyword nil         ; Remove spaces for keyword assign '='

	;; If abbrev-mode is off, then case changes (the next 2 lines)
	;; will not occur.
	idl-reserved-word-upcase f  ; Change reserved words to upper case
	idl-abbrev-change-case nil  ; Don't force case of expansions
	idl-hang-indent-regexp ": " ; Change from "- "
	idl-show-block nil          ; Turn off blinking to matching begin
	idl-abbrev-move t           ; Allow abbrevs to move point backwards
	case-fold-search nil        ; Make searches case sensitive
      )
       
      ;; Run other functions here
      (font-lock-mode 1)           ; font-lock mode
      (idl-auto-fill-mode 0)       ; Turn off auto filling

      ;; Pad with with 1 space (if -n is used then make the 
      ;; padding a minimum of n spaces.)  The defaults use -1
      ;; instead of 1.
      (idl-action-and-binding "=" '(idl-expand-equal 1 1))
      (idl-action-and-binding "<" '(idl-surround 1 1))
      (idl-action-and-binding ">" '(idl-surround 1 1))
      (idl-action-and-binding "&" '(idl-surround 1 1))

      ;; Only pad after comma and with exactly 1 space
      ;; (idl-action-and-binding "," '(idl-surround nil 1))
      ;; Set some personal bindings
      ;; (In this case, makes `,' have the normal self-insert behavior.)
      (local-set-key "," 'self-insert-command)

      ;; Create a newline, indenting the original and new line.
      ;; A similar function that does _not_ reindent the original
      ;; line is on "\C-j" (The default for emacs programming modes).
      (local-set-key "\n" 'idl-newline)
      ;(local-set-key "\C-j" 'idl-newline) ; My preference.
    )
  )
)


;;-----------------------------------------------------------------------------
;; Add the following for IDLWAVE (for EMACS only)
;;-----------------------------------------------------------------------------

;; Change the indentation preferences
(setq idlwave-main-block-indent 3         ; default  0
      idlwave-block-indent 3              ; default  4
      idlwave-end-offset -3)              ; default -4

;; Pad some operators with spaces
(setq idlwave-do-actions t
      idlwave-surround-by-blank t)

;; Syntax Highlighting - done globally below
;(add-hook 'idlwave-mode-hook 'turn-on-font-lock)

;; Automatically start the shell when needed - RHEA only
(setq idlwave-shell-automatic-start t)

;; Bind debugging commands with CONTROL and SHIFT modifiers
;; It replaces C-c C-d C-c
(setq idlwave-shell-debug-modifiers '(control shift))

;; Where are the online help files? -NEED CHECKING
(setq idlwave-help-directory "~/.idlwave")

;; To Make C-TAB be "other window" in IDLWAVE
(require 'idlwave)
  (define-key idlwave-mode-map [(control tab)] 'other-window)

;;-----------------------------------------------------------------------------
;; Add the following for FORTRAN MODE
;;-----------------------------------------------------------------------------

(add-hook 'fortran-mode-hook
	  (function
	   (lambda ()
	     (setq
	      ;; use abbreviations (e.g.: ";s" for "stop")
	      abbrev-mode 1
	      )
	     )))
	      

;;-----------------------------------------------------------------------------
;; Add the following for SHELL SCRIPT MODE
;;-----------------------------------------------------------------------------

(add-hook 'shell-mode-hook
	  '(lambda ()
             (local-set-key [home]        ; move to beginning of line, 
                                          ; after prompt  
                            'comint-bol)

	     (local-set-key [up]          ; cycle backward through 
                                          ; command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-previous-input 1)
                                 (previous-line 1))))

	     (local-set-key [down]        ; cycle forward through 
                                          ; command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-next-input 1)
                                 (forward-line 1))))
             ))


;;-----------------------------------------------------------------------------
;; For FONT-LOCK and AUTO-FILL
;;-----------------------------------------------------------------------------

;; enable font-lock globally (i.e., all major modes).
;; This will work for both Emacs and XEmacs:

(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)          ; GNU Emacs
    (setq font-lock-auto-fontify t))   ; XEmacs


;;=============================================================================
;; FOR EMACS ONLY! 
;;
;; The following three commands are needed for Emacs as opposed to XEMACS.
;; The first one is automatic in Xemacs for some reason.
;; The second one and most of the third one were binded to C-o
;;=============================================================================

(if (not(featurep 'xemacs)) 
  (progn
     
    ;; to put cursor in the next window 
    (global-set-key [(control tab)] 'other-window)

    ;; to omit the dot files in a directory, C-c o :
    (global-set-key [?\C-c ?o] 'omitdotfiles)

    ;; to omit the .mod, .o, ~, and dot files in a directory, M-o:
    (global-set-key [?\M-o] 'omit-fortran)
  ) 
)


;;=============================================================================
;; FOR XEMACS ONLY! 
;;
;; For backwards compatibility with the existing XEMACS on SGI, we will 
;; continue to load the default .xemacs-options file as before.  This will
;; re-define some of the font & color settings defined above.
;;
;; For EMACS, we do not need to read this file.
;;=============================================================================

(cond
 ((and (string-match "XEmacs" emacs-version)
	(boundp 'emacs-major-version)
	(or (and
	     (= emacs-major-version 19)
	     (>= emacs-minor-version 14))
	    (= emacs-major-version 20))
	(fboundp 'load-options-file))
  (load-options-file "~/.xemacs-options")))


;;=============================================================================
;; To save desktop, i.e., re-open the same files as when exiting.
;; Load the desktop library to do so.  For this to work, you must type
;; M-x desktop-save during the session.  This also needs to be done *after* 
;; all modes are loaded -like here-, if you want the "colorization" of code
;; to work.
;;=============================================================================

(load "desktop")
(desktop-load-default)
(desktop-read)


;;=============================================================================
;; Define the frame size, and split it in two vertical windows.  
;; These are for 17 inch monitor running 1280x1024 resolution. 
;; If you change font sizes, you'll probably have to tweak this. 
;; 
;; You can comment out the stuff that you don't want.  You can also change
;; the default lines & columns that EMACS/XEMACS will start with
;;=============================================================================

;; Default --Open one window, 80 columns wide and 55 lines high
(set-frame-height (selected-frame) 55)    ; 55 lines high
(set-frame-width  (selected-frame) 80)    ; 80 colums wide

;; Philippe's preference -- put 2 windows side by side
;(set-frame-height (selected-frame) 70 )  ; 70 lines high
;(set-frame-width  (selected-frame) 173)  ; 173 columns wide
;(split-window-horizontally)              ; want two windows at startup 
;(other-window 1)                         ; move to other window
;(split-window-vertically)                ; and separate it in  2 windows 
;(other-window 1)                         ; move to other window
;(shell)                                  ; start a shell 
;                                         ;  -has a problem in Tethys-
;;(rename-buffer "shell-first")           ; rename it
;(other-window 1)                         ; move back to first window 
