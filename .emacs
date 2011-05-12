;==============================================================================
;; $Id: .emacs,v 1.10 2008/05/22 15:24:34 bmy Exp $
;;
;; The .emacs customization file for both EMACS on Tethys and XEMACS on SGI.
;; (phs, bmy, 12/20/07, 3/19/09)
;;
;; Please peruse this file carefully!  For many settings there are several 
;; options that you can pick from.  You can uncomment the settings that you 
;; would like to use and comment out the ones that you don't.  
;;
;; The comment character for this file is ";". 
;; Logical switches are turned on with "t" and turned off with "nil".
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

;; Lucida Typewriter 13pt bold
;(set-face-font 
; 'default "-*-Lucidatypewriter-Bold-R-*-*-*-130-*-*-*-*-iso8859-1" )

;; Lucida Typewriter 13pt normal
;(set-face-font 
; 'default "-*-Lucidatypewriter-*-R-*-*-*-130-*-*-*-*-iso8859-1" )

;; Lucida Typewriter 12pt bold
;(set-face-font 
; 'default "-*-Lucidatypewriter-Bold-R-*-*-*-120-*-*-*-*-iso8859-1" )

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

;; Courier 12 pt normal
;(set-face-font 
; 'default "-*-Courier-*-R-*-*-*-120-*-*-*-*-iso8859-1" )


;;=============================================================================
;; COLOR SETTINGS
;;=============================================================================

;; Set the background colors (pick the one that you like best)
(set-face-background 'default "gray75")            ; Bob's preference
;(set-face-background 'default "FloralWhite")      ; Philippe's preference
;(set-face-background 'default "dark slate gray")  ; ... a 
;(set-face-foreground 'default "blanched almond")  ;     few
;(set-face-foreground 'default "black")            ;     other
;(set-face-foreground 'default "white")            ;     options ...

;; Set "colorization" colors for code
;; Use the same scheme as from the old .xemacs-options file
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(dired-face-symlink ((t (:foreground "white" :background "darkOrchid"))))
 '(font-lock-comment-face ((t (:foreground "#6920ac"))))
 '(font-lock-doc-string-face ((t (:foreground "green4"))))
 '(font-lock-function-name-face ((t (:foreground "red2"))))
 '(font-lock-keyword-face ((t (:foreground "orange3"))))
 '(font-lock-other-type-face ((t (:foreground "blue"))))
 '(font-lock-preprocessor-face ((t (:foreground "red2"))))
 '(font-lock-reference-face ((t (:foreground "red2"))))
 '(font-lock-string-face ((t (:foreground "green4"))))
 '(font-lock-type-face ((t (:foreground "brown"))))
 '(font-lock-variable-name-face ((t (:foreground "black")))))

;;=============================================================================
;; FUNCTIONS and GLOBAL SETTINGS
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


;;=============================================================================
;; FUNCTIONS and GLOBAL SETTINGS
;;=============================================================================

;; kill process (like a tail -f) and purge output. In shell mode.
(defalias 'quitnclean
  (read-kbd-macro "C-c C-\\ C-c C-o"))

;; to swicth back and forth b/w 2 buffers
(defalias 'swapbuffer
  (read-kbd-macro "C-x b RET"))

;; Whatever your configuration is, you get TWO WINDOWS SPLIT VERTICAL. If
;; it is already the case, the left and right buffers are switched.
(defalias 'two-windows-vertical
  (read-kbd-macro "C-x 1 C-x 3 C-x b RET"))

;; EDIFF : close the two compared windows
;; This one depends on the bindings below
(defalias 'fullcleanediff
  (read-kbd-macro "<f3> <f2> <f3>"))

; -- some little tricks for F90 mode:

;; macro used in F90 mode. Since line starting with a ! in 1st col are
;; not aligned with the code, this comment will do it. 
(fset 'smart-f90-tab
   [home ?  tab end])

;; customized insertion of timestamp (function is defined below in miscella.)
(fset 'macrotimestamp
   [?\M-x ?i ?n ?s ?e ?r ?t ?- ?t ?i ?m ?e ?s ?t tab return return left ? ])


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


;; to get rid of ^M in files imported from MS. In DIR mode,
;; should use: ! to_unix
;; Not available on Tethys?


;;(setq delete-key-deletes-forward 0)     ; works for Xemacs ONLY 
(global-set-key [(delete)] "\C-d")        ; Now do that instead: 
                                          ;  works for both emacs/Xemacs

(global-set-key [(control delete)]    'kill-word)
(global-set-key [(control backspace)] 'backward-kill-word)

;; to replaces (when typing) or delete (when pressing DEL 
;; or Backspace) **highlighted** text (very  useful!)
(delete-selection-mode t)


;;=============================================================================
;;            MOTION STUFF
;;=============================================================================

;; ---------- SCROLL BUFFER
;;  M-n / M-p (and M-up / M-down) scroll buffer ahead / behind

(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

;; classic keyboard
(global-set-key [(meta n)] 'scroll-n-lines-ahead)
(global-set-key [(meta p)] 'scroll-n-lines-behind)

;; added for kinesis keyboard
;(global-set-key [(meta down)] 'scroll-n-lines-ahead)
;(global-set-key [(meta up)] 'scroll-n-lines-behind)


;; To scroll only one line when cursor is at the bottom of the screen 
;; (instead of finding the lastline suddenly in the middle)
;; (I use it in conjonction with C-l to get the cursor at the middle of 
;;  the screen if this is what I really want)
(setq scroll-step 1)


;; ---------- GO TO OTHER WINDOW
;; The following binding is needed for Emacs, but was automatic in Xemacs.
(if (not(featurep 'xemacs)) 
    (progn
      (global-set-key [(control tab)] 'other-window)
      ))


;; ---------- BOUNCE B/W PARENTHESES
;; bounces from one sexp "(){}[]<>" to another (ala vi's %)
;; written by Joe Casadonte (joc@netaxs.com)
(defun joc-bounce-sexp ()
  "Will bounce between matching parens just like % in vi"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char))))
        (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
                  ((string-match "[\]})>]" prev-char) (backward-sexp 1))
                  (t (error "%s" "Not on a paren, brace, or bracket")))))

(global-set-key [(control =)] 'joc-bounce-sexp)


;; ---------- ACCELERATORS
;; to get 10 lines at a time down/up. Something b/w one line and one page 
;; at a time...

;; classic keyboard
(global-set-key [(control shift n)]  (lambda () (interactive) (next-line 10)) )
(global-set-key [(control shift p)]  (lambda () (interactive) (previous-line 10)) )

;; kinesis keyboard
;;(global-set-key [(control down)]  (lambda () (interactive) (next-line 10)) )
;;(global-set-key [(control up)]  (lambda () (interactive) (previous-line 10)) )

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
(setq-default line-number-mode   t)
(setq-default column-number-mode t)

;; get date and time in the info bar ("mode line")
;;(setq display-time-day-and-date t)
;;(setq display-time-string-forms
;;      (quote
;;       ((if (and (not display-time-format)
;;		 display-time-day-and-date)
;;	    (format-time-string "%a %b %e   " now) "  ")
;;	(format-time-string
;;	 (or display-time-format
;;	     (if display-time-24hr-format "%H:%M" "%-I:%M%p")) now)
;;	))
;;      )
;;(display-time)

;; To insert a basic time stamp in a buffer
(defun insert-timestamp ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "!  %e %b %Y - R. Yantosca - ")))

;; no splash screen at start 
(setq inhibit-splash-screen t)   ;; not working w/ 21.4
(setq inhibit-startup-message t) ;; working w/ 21.4

;; C-k kills line and end of line 
(setq kill-whole-line t)

;; Enable multiple minibuffers.  If you don't do this, then you 
;; can't do things like search the minibuffer history with M-s.
(setq minibuffer-max-depth nil)

;; to answer Y/ N instead of YES/NO RET when asked for confirmation 
;; NOTE: not for newbies!
(defalias 'yes-or-no-p 'y-or-n-p)

;; flash instead of beep
;;COMMENT OUT FOR NOW
;;(setq visible-bell 1)

;; get rid of ALL the bars
;;COMMENT OUT FOR NOW
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ; keep that one for idlwave?

;; change default Ediff splitting to horizontal
;;(setq ediff-split-window-function 'split-window-horizontally)

;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
;; Your init file should contain only one such instance.
(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(global-font-lock-mode t nil (font-lock))
 '(query-user-mail-address nil)
 '(transient-mark-mode t)
 '(user-mail-address "yantosca@seas.harvard.edu"))

;;=============================================================================
;; BACKUPS (made "once per session" at first save)
;;  & AUTOSAVES (to recover from any crash)
;;=============================================================================
(setq

 ;; for symlinks to refer to the last version
 backup-by-copying t

 ;; where to backup (default is same directory as file being backuped)
; backup-directory-alist
; '( ;("~/Code.current/." . "~/.emacs.d/auto-save-list/gc_current/") 
;    ;("~/esmf/misc/gridv1/." . "~/.emacs.d/auto-save-list/esmf_proj/") )
;    ("." . "~/.emacs.d/auto-save-list/") )
 
 ;; delete excess backups silently
 delete-old-versions t

 ;; number of versions to keep
 kept-new-versions 10
 kept-old-versions 2

 ;; always use versioned backups
 version-control t)


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
;; FUNCTION KEY BINDINGS -- Bob Y's preferences (updated 3/19/09)
;;=============================================================================

; Editing
(global-set-key [f1]             'kill-line)             
(global-set-key [f2]             'kill-word)             
(global-set-key [f3]             'string-rectangle)      
(global-set-key [f4]             'delete-rectangle)      
(global-set-key [f5]             'macrotimestamp)      ; Timestamp for ProTeX
(global-set-key [kp-add]         "\M-l")               ; Lowercase
(global-set-key [kp-enter]       "\M-u")               ; Uppercase
(global-set-key [kp-subtract]    'goto-line)   

; Search & replace
(global-set-key [f6]             'find-file)
(global-set-key [(shift f6)]     'insert-file)
(global-set-key [f7]             'save-buffer)
(global-set-key [f8]             'isearch-forward)     
(global-set-key [f9]             'replace-string)
(global-set-key [(shift f9)]     'query-replace)       

; Buffers
(global-set-key [f10]            'swapbuffer)
(global-set-key [f11]            'switch-to-buffer)
(global-set-key [f12]            'kill-this-buffer)

; Modes
(global-set-key [(control f5)]   'fortran-mode)
(global-set-key [(control f6)]   'idlwave-mode)
(global-set-key [(control f7)]   'makefile-mode)
(global-set-key [(control f8)]   'shell-script-mode)
(global-set-key [(control f9)]   'perl-mode)
(global-set-key [(control f10)]  'font-lock-mode)

; EDIFF
(global-set-key [(shift f1)]     'ediff-files)
(global-set-key [(shift f2)]     'fullcleanediff)

; CVS
(global-set-key [(shift f3)]     'cvs-examine)
(global-set-key [(shift f4)]     'cvs-update)
;(global-set-key [(shift f5)]     'smerge-keep-mine) 
;(global-set-key [(shift f6)]     'smerge-keep-other)

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

;; activate image mode to display images in emacs buffer (jpg, gif, tiff, ...)
;; Alternatively, you can use ! command, where command is DISPLAY, GV 
(auto-image-file-mode)

;; Add path where IDLWAVE v6 is located, so that we will load that.
;; If we don't do this, then the older IDLWAVE v4.7 will load by default.
(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

;; Matlab mode (uncomment this if you need it)
;(autoload 'matlab-mode "matlab" "Major mode for editing .m files" t)

;; IDL mode - Useful if you do not have IDLWave
(autoload 'idl-mode "idl" "Major mode for editing IDL/WAVE CL .pro files" t)

;; Load IDLWAVE in emacs or the IDL shell in Xemacs
(if (not(featurep 'xemacs))
    (progn
      (autoload 'idlwave-mode  "idlwave"    "IDLWAVE Mode"  t)
      (autoload 'idlwave-shell "idlw-shell" "IDLWAVE Shell" t)
      ))

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
				("\\.tex$" . latex-mode)
				("\\.c$"   . c-mode))auto-mode-alist))

;; Link *.pro to IDLWAVE on EMACS or to the IDL mode on XEMACS
(if (featurep 'xemacs)    
  (setq auto-mode-alist (append '(("\\.pro$" . idl-mode))auto-mode-alist))
  (setq auto-mode-alist (append '(("\\.pro$" . idlwave-mode))auto-mode-alist)))


;;-----------------------------------------------------------------------------
;; Add the following for IDL mode (for XEMACS where we don't have IDLWAVE)
;;-----------------------------------------------------------------------------
(add-hook 'idl-mode-hook
  (function 
    (lambda ()
      (setq                           ; Set options here
	idl-block-indent         3    ; Indentation settings
	idl-main-block-indent    3
	idl-end-offset          -3
	idl-continuation-indent  3
	
	;; Leave ";" but not ";;" anchored at start of line.
	idl-begin-line-comment   "^\;[^\;]" 

	idl-surround-by-blank    t    ; Turn on padding symbols =,<,>, etc.
	abbrev-mode              1    ; Turn on abbrevs (-1 for off)
	idl-pad-keyword          nil  ; Remove spaces for keyword assign '='

	;; If abbrev-mode is off, then case changes (the next 2 lines)
	;; will not occur.
	idl-reserved-word-upcase f    ; Change reserved words to upper case
	idl-abbrev-change-case   nil  ; Don't force case of expansions
	idl-hang-indent-regexp   ": " ; Change from "- "
	idl-show-block           nil  ; Turn off blinking to matching begin
	idl-abbrev-move          t    ; Allow abbrevs to move point backwards
	case-fold-search         nil  ; Make searches case sensitive
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

(if (not(featurep 'xemacs))
    (progn

      ;; Change the indentation preferences
      (setq idlwave-main-block-indent  3         ; default  0
	    idlwave-block-indent       3         ; default  4
	    idlwave-end-offset        -3   )     ; default -4

      ;; Pad some operators with spaces (or not)
      (setq idlwave-do-actions         t
	    idlwave-surround-by-blank  t
	    idlwave-pad-keyword        nil )  

      ;; Indent ";" comments with the code but not ";;", ";;;", ";;;;" etc.
      (setq idlwave-code-comment       ";[^;]"  )

      ;; Some setting can only be done from a mode hook
      (add-hook 'idlwave-mode-hook
	    (lambda ()

	      ;; Turn off auto filling
	      (idlwave-auto-fill-mode 0)
		 
	      ;; Some personal abbreviations
	      (idlwave-define-abbrev "dpf" "dialog_pickfile()"
	      (idlwave-keyword-abbrev 1))

		 ;; Pad '*' and '+'
	      (idlwave-action-and-binding "*" '(idlwave-surround 1 1))
	      (idlwave-action-and-binding "+" '(idlwave-surround 1 1))
	      
	      ))


      ;; Automatically start the shell when needed - RHEA only
      (setq idlwave-shell-automatic-start t)

      ;; Bind debugging commands with CONTROL and SHIFT modifiers
      ;; It replaces C-c C-d C-c
      (setq idlwave-shell-debug-modifiers '(control shift))

      ;; Where are the online help files? -NEED CHECKING
      (setq idlwave-help-directory "~/.idlwave")

      ;; Pop open the IDL command line shell in a separate EMACS window 
      (setq idlwave-shell-use-dedicated-frame t)

      ;; Hack since help is temporarily missing in IDL7 (not working yet..)
      (setq idlwave-html-system-help-location "/users/ctm/phs/IDL/help/online_help/")

      ;; To Make C-TAB be "other window" in IDLWAVE
      (require 'idlwave)
         (define-key idlwave-mode-map [(control tab)] 'other-window)
         (define-key idlwave-mode-map [?\M-p]         'idlwave-complete)

         ;; Since M-Tab is used by Windows, Linux .. and we want to keep
         ;; that feature, we need amother binding to 'idlwave-complete
         ;; (which we really want to use).  Could use ESC-p but I prefer
         ;; to use M-p and F4 since they are available locally. This is NOT 
	 ;; for idl-shell mode, where you simply use TAB to get completion
	 (define-key idlwave-mode-map [?\M-p] 'idlwave-complete)
	 (define-key idlwave-mode-map [f4] 'idlwave-complete)

         ;; Bind most useful help functions to S-F1 (for M-?) and 
         ;; M-F1 (for C-c ?), in both modes, first file buffer...  
	 (define-key idlwave-mode-map  [(meta f1)]   'idlwave-routine-info)
	 (define-key idlwave-mode-map  [(shift f1)]  'idlwave-context-help)

         ;; ..then for the shell buffer
	 (add-hook 'idlwave-shell-mode-hook
	     (lambda ()
	       (local-set-key [(meta f1)]   'idlwave-routine-info)
	       (local-set-key [(shift f1)]  'idlwave-context-help)))
))


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
	      
;; Make sure we have F90 mode loaded
(require 'fortran)

;;
;; %%% ABBREVIATIONS %%% 
;; When inside a F77 file, type: ;? to see the already defined abbreviations.
;;
;; %%% General FORTRAN abbreviations (IF blocks and DO loops) %%%
;;
(define-abbrev fortran-mode-abbrev-table ";ife" ""  'fortran-skeleton-if-else-endif)
(define-abbrev fortran-mode-abbrev-table ";do"  ""  'fortran-skeleton-do-enddo)
(define-abbrev fortran-mode-abbrev-table ";do2" ""  'fortran-skeleton-do-enddo-2)
(define-abbrev fortran-mode-abbrev-table ";do3" ""  'fortran-skeleton-do-enddo-3)
(define-abbrev fortran-mode-abbrev-table ";do4" ""  'fortran-skeleton-do-enddo-4)

(define-skeleton fortran-skeleton-if-else-endif
  "Insert an if - else - end if region" nil
  >  "IF (" _ ") THEN" \n
  -3 "ELSE" \n
  -3 "ENDIF")

(define-skeleton fortran-skeleton-do-enddo
  "Insert an do - enddo region (1 loop)" nil
  >  "DO I = x, y" \n
  -3 "ENDDO")

(define-skeleton fortran-skeleton-do-enddo-2
  "Insert an do - enddo region (2 loops)" nil
  >  "DO J = x, y" \n
  -3 "DO I = x, y" \n
  -3 "ENDDO" \n
  -3 "ENDDO")

(define-skeleton fortran-skeleton-do-enddo-3
  "Insert an do - enddo region (3 loops)" nil
  >  "DO L = x, y" \n
  -3 "DO J = x, y" \n
  -3 "DO I = x, y" \n
  -3 "ENDDO" \n
  -3 "ENDDO" \n
  -3 "ENDDO")

(define-skeleton fortran-skeleton-do-enddo-4
  "Insert an do - enddo region (4 loops)" nil
  >  "DO N = x, y" \n
  -3 "DO L = x, y" \n
  -3 "DO J = x, y" \n
  -3 "DO I = x, y" \n
  -3 "ENDDO" \n
  -3 "ENDDO" \n
  -3 "ENDDO" \n
  -3 "ENDDO")

;;
;; %%% FORTRAN data type abbreviations %%%
;;
(define-abbrev fortran-mode-abbrev-table ";ii"   ""  'fortran-intent-in)
(define-abbrev fortran-mode-abbrev-table ";io"   ""  'fortran-intent-out)
(define-abbrev fortran-mode-abbrev-table ";iio"  ""  'fortran-intent-inout)
(define-abbrev fortran-mode-abbrev-table ";i4"   ""  'fortran-type-integer4)
(define-abbrev fortran-mode-abbrev-table ";r4"   ""  'fortran-type-real4)
(define-abbrev fortran-mode-abbrev-table ";r8"   ""  'fortran-type-real8)
(define-abbrev fortran-mode-abbrev-table ";ch"   ""  'fortran-type-character)

(define-skeleton fortran-intent-in
  "Insert an INTENT(IN) template" nil
  > "INTENT(IN) ")

(define-skeleton fortran-intent-out
  "Insert an INTENT(OUT) template" nil
  > "INTENT(OUT) ")

(define-skeleton fortran-intent-inout
  "Insert an INTENT(INOUT) template" nil
  > "INTENT(INOUT) ")

(define-skeleton fortran-type-integer4
  "Insert an INTEGER*4 template" nil
  > "INTEGER :: ")

(define-skeleton fortran-type-real4
  "Insert an REAL*4 template" nil
  > "REAL*4 :: ")

(define-skeleton fortran-type-real8
  "Insert an REAL*8 template" nil
  > "REAL*8 :: ")

(define-skeleton fortran-type-character
  "Insert a CHARACTER template" nil
  > "CHARACTER(LEN=255) :: ")

;;
;; %%% ProTex header abbreviations %%%
;;
(define-abbrev fortran-mode-abbrev-table ";pi"   ""  'fortran-protex-italic)
(define-abbrev fortran-mode-abbrev-table ";pb"   ""  'fortran-protex-bold)
(define-abbrev fortran-mode-abbrev-table ";pu"   ""  'fortran-protex-underline)
(define-abbrev fortran-mode-abbrev-table ";pel"  ""  'fortran-protex-enumerated-list)
(define-abbrev fortran-mode-abbrev-table ";pil"  ""  'fortran-protex-itemized-list)
(define-abbrev fortran-mode-abbrev-table ";pdl"  ""  'fortran-protex-description-list)
(define-abbrev fortran-mode-abbrev-table ";plb"  ""  'fortran-protex-line-break)

(define-skeleton fortran-protex-italic
  "Italic command for ProTeX header" nil
  > "\\emph{}")

(define-skeleton fortran-protex-bold
  "Underline command for ProTeX header" nil
  > "\\textbf{}")

(define-skeleton fortran-protex-underline
  "Underline command for ProTeX header" nil
  > "\\underline{}")

(define-skeleton fortran-protex-enumerated-list
  "Enumerated list for ProTeX header" nil
  > "! \\begin\{enumerate}"\n
  > "! \\item"\n
  > "! \\end\{enumerate}")

(define-skeleton fortran-protex-itemized-list
  "Itemized list for ProTeX header" nil
  > "! \\begin\{itemize}"\n
  > "! \\item"\n
  > "! \\end\{itemize}")

(define-skeleton fortran-protex-description-list
  "Description list for ProTeX header" nil
  > "! \\begin\{description}"\n
  > "! \\item[]"\n
  > "! \\end\{description}")

(define-skeleton fortran-protex-line-break
  "Line break for ProTeX header" nil
  > "! \\\\"\n
  > "! \\\\")

;;
;; %%% Various comments %%%
;;
(define-abbrev fortran-mode-abbrev-table ";b"   ""  'fortran-comment-1)
(define-abbrev fortran-mode-abbrev-table ";d"   ""  'fortran-comment-2)

(define-skeleton fortran-comment-1
  "Comment style 1" nil
  > "!###")

(define-skeleton fortran-comment-2
  "Comment style 2" nil
  > "!%%%")

;;-----------------------------------------------------------------------------
;; Add the following for FORTRAN 90 MODE
;;-----------------------------------------------------------------------------
(add-hook 'f90-mode-hook
	  (function
	   (lambda ()

	     ;; use abbreviations (e.g.: "`pr" for "print")	     
	     (setq  abbrev-mode 1)
	     
	     )))

;; Make sure we have F90 mode loaded
(require 'f90)

;;
;; %%% ABBREVIATIONS %%% 
;; When inside a F90 file, type: `? to see the already defined abbreviations.
;;
;; %%% General F90 abbreviations (IF blocks and DO loops) %%%
;;
(define-abbrev f90-mode-abbrev-table "`ife" "" 'f90-skeleton-if-else-endif)
(define-abbrev f90-mode-abbrev-table "`do"  ""  'f90-skeleton-do-enddo)
(define-abbrev f90-mode-abbrev-table "`do2" ""  'f90-skeleton-do-enddo-2)
(define-abbrev f90-mode-abbrev-table "`do3" ""  'f90-skeleton-do-enddo-3)
(define-abbrev f90-mode-abbrev-table "`do4" ""  'f90-skeleton-do-enddo-4)

(define-skeleton f90-skeleton-if-else-endif
  "Insert an if - else - end if region" nil
  >  "IF (" _ ") THEN" \n
  -3 "ELSE" \n
  -3 "ENDIF")

(define-skeleton f90-skeleton-do-enddo
  "Insert an do - enddo region (1 loop)" nil
  >  "DO I = x, y" \n
  -3 "ENDDO")

(define-skeleton f90-skeleton-do-enddo-2
  "Insert an do - enddo region (2 loops)" nil
  >  "DO J = x, y" \n
  -3 "DO I = x, y" \n
  -3 "ENDDO" \n
  -3 "ENDDO")

(define-skeleton f90-skeleton-do-enddo-3
  "Insert an do - enddo region (3 loops)" nil
  >  "DO L = x, y" \n
  -3 "DO J = x, y" \n
  -3 "DO I = x, y" \n
  -3 "ENDDO" \n
  -3 "ENDDO" \n
  -3 "ENDDO")

(define-skeleton f90-skeleton-do-enddo-4
  "Insert an do - enddo region (4 loops)" nil
  >  "DO N = x, y" \n
  -3 "DO L = x, y" \n
  -3 "DO J = x, y" \n
  -3 "DO I = x, y" \n
  -3 "ENDDO" \n
  -3 "ENDDO" \n
  -3 "ENDDO" \n
  -3 "ENDDO")

;;
;; %%% ESMF abbreviations #1 %%%
;;
(define-abbrev f90-mode-abbrev-table "`ii"   ""  'f90-intent-in)
(define-abbrev f90-mode-abbrev-table "`io"   ""  'f90-intent-out)
(define-abbrev f90-mode-abbrev-table "`iio"  ""  'f90-intent-inout)
(define-abbrev f90-mode-abbrev-table "`i4"   ""  'f90-esmf-type-integer4)
(define-abbrev f90-mode-abbrev-table "`r4"   ""  'f90-esmf-type-real4)
(define-abbrev f90-mode-abbrev-table "`r8"   ""  'f90-esmf-type-real8)
(define-abbrev f90-mode-abbrev-table "`ch"   ""  'f90-esmf-type-character)

(define-skeleton f90-intent-in
  "Insert an INTENT(IN) template" nil
  > "INTENT(IN) ")

(define-skeleton f90-intent-out
  "Insert an INTENT(OUT) template" nil
  > "INTENT(OUT) ")

(define-skeleton f90-intent-inout
  "Insert an INTENT(INOUT) template" nil
  > "INTENT(INOUT) ")

(define-skeleton f90-esmf-type-integer4
  "Insert an ESMF INTEGER*4 template" nil
  > "INTEGER(ESMF_KIND_I4) :: ")

(define-skeleton f90-esmf-type-real4
  "Insert an ESMF REAL*4 template" nil
  > "REAL(ESMF_KIND_R4) :: ")

(define-skeleton f90-esmf-type-real8
  "Insert an ESMF REAL*8 template" nil
  > "REAL(ESMF_KIND_R8) :: ")

(define-skeleton f90-esmf-type-character
  "Insert a ESMF CHARACTER template" nil
  > "CHARACTER(LEN=ESMF_MAXSTR) :: ")

;;
;; %%% ESMF abbreviations #2 %%%
;;
(define-abbrev f90-mode-abbrev-table "`ea"   ""  'f90-esmf-type-array)
(define-abbrev f90-mode-abbrev-table "`eas"  ""  'f90-esmf-type-arrayspec)
(define-abbrev f90-mode-abbrev-table "`eb"   ""  'f90-esmf-type-bundle)
(define-abbrev f90-mode-abbrev-table "`ecl"  ""  'f90-esmf-type-clock)
(define-abbrev f90-mode-abbrev-table "`eco"  ""  'f90-esmf-type-config)
(define-abbrev f90-mode-abbrev-table "`ecc"  ""  'f90-esmf-type-cplcomp)
(define-abbrev f90-mode-abbrev-table "`del"  ""  'f90-esmf-type-delayout)

(define-skeleton f90-esmf-type-array
  "Insert a ESMF Array template" nil
  > "TYPE(ESMF_Array) :: ")

(define-skeleton f90-esmf-type-arrayspec
  "Insert a ESMF Array template" nil
  > "TYPE(ESMF_ArraySpec) :: ")

(define-skeleton f90-esmf-type-bundle
  "Insert a ESMF Bundle template" nil
  > "TYPE(ESMF_Bundle) :: ")

(define-skeleton f90-esmf-type-clock
  "Insert a ESMF Clock template" nil
  > "TYPE(ESMF_Clock) :: ")

(define-skeleton f90-esmf-type-config
  "Insert a ESMF Config template" nil
  > "TYPE(ESMF_Config) :: ")

(define-skeleton f90-esmf-cplcomp
  "Insert a ESMF CplComp template" nil
  > "TYPE(ESMF_CplComp) :: ")

(define-skeleton f90-esmf-delayout
  "Insert a ESMF DeLayout template" nil
  > "TYPE(ESMF_DeLayout) :: ")

;;
;; %%% ESMF abbreviations #3 %%%
;;
(define-abbrev f90-mode-abbrev-table "`ef"   ""  'f90-esmf-type-field)
(define-abbrev f90-mode-abbrev-table "`eg"   ""  'f90-esmf-type-grid)
(define-abbrev f90-mode-abbrev-table "`egc"  ""  'f90-esmf-type-gridcomp)
(define-abbrev f90-mode-abbrev-table "`es"   ""  'f90-esmf-type-state)
(define-abbrev f90-mode-abbrev-table "`et"   ""  'f90-esmf-type-time)
(define-abbrev f90-mode-abbrev-table "`eti"  ""  'f90-esmf-type-timeinterval)
(define-abbrev f90-mode-abbrev-table "`evm"  ""  'f90-esmf-type-vm)

(define-skeleton f90-esmf-type-field
  "Insert a ESMF Field template" nil
  > "TYPE(ESMF_Field) :: ")

(define-skeleton f90-esmf-type-grid
  "Insert a ESMF Grid template" nil
  > "TYPE(ESMF_Grid) :: ")

(define-skeleton f90-esmf-type-gridcomp
  "Insert a ESMF GridComp template" nil
  > "TYPE(ESMF_GridComp) :: ")

(define-skeleton f90-esmf-type-state
  "Insert a ESMF State template" nil
  > "TYPE(ESMF_State) :: ")

(define-skeleton f90-esmf-type-time
  "Insert a ESMF Time template" nil
  > "TYPE(ESMF_Time) :: ")

(define-skeleton f90-esmf-type-timeinterval
  "Insert a ESMF TimeInterval template" nil
  > "TYPE(ESMF_TimeInterval) :: ")

(define-skeleton f90-esmf-type-vm
  "Insert a ESMF VM template" nil
  > "TYPE(ESMF_VM) :: ")

;;
;; %%% ProTex header abbreviations %%%
;;
(define-abbrev f90-mode-abbrev-table "`pi"   ""  'f90-protex-italic)
(define-abbrev f90-mode-abbrev-table "`pb"   ""  'f90-protex-bold)
(define-abbrev f90-mode-abbrev-table "`pu"   ""  'f90-protex-underline)
(define-abbrev f90-mode-abbrev-table "`pel"  ""  'f90-protex-enumerated-list)
(define-abbrev f90-mode-abbrev-table "`pil"  ""  'f90-protex-itemized-list)
(define-abbrev f90-mode-abbrev-table "`pdl"  ""  'f90-protex-description-list)
(define-abbrev f90-mode-abbrev-table "`plb"  ""  'f90-protex-line-break)

(define-skeleton f90-protex-italic
  "Italic command for ProTeX header" nil
  > "\\emph{}")

(define-skeleton f90-protex-bold
  "Underline command for ProTeX header" nil
  > "\\textbf{}")

(define-skeleton f90-protex-underline
  "Underline command for ProTeX header" nil
  > "\\underline{}")

(define-skeleton f90-protex-enumerated-list
  "Enumerated list for ProTeX header" nil
  > "! \\begin{enumerate}" \n
  > "! \\item" \n
  > "! \\end{enumerate}")

(define-skeleton f90-protex-itemized-list
  "Enumerated list for ProTeX header" nil
  > "! \\begin\{itemize}"\n
  > "! \\item"\n
  > "! \\end\{itemize}")

(define-skeleton f90-protex-description-list
  "Description list for ProTeX header" nil
  > "! \\begin\{description}"\n
  > "! \\item[]" \n
  > "! \\end\{description}")

(define-skeleton f90-protex-line-break
  "Line break for ProTeX header" nil
  > "! \\\\" \n
  > "! \\\\")

;; Don't start code on the next line after a skeleton abbrev
(setq skeleton-end-hook nil)


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
;; Add the following for TXT MODE
;;-----------------------------------------------------------------------------

; auto-formatting in text-mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)  

;;-----------------------------------------------------------------------------
;; For PERL mode
;;-----------------------------------------------------------------------------

;; Number of spaces for each indentation
(setq perl-indent-level 2)

;; Create a new comment with tab
(setq perl-tab-to-comment t)

;; Automatically add the matching parentheses, brace, or curly bracket
(setq perl-electric-parens t)

;; Automatic expansion of keywords
(setq perl-electric-keywords t)

;; Extra indentation given to a sub-block
(setq perl-continued-statement-offset 2)

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
;;
;; Depending on the size of your monitor, you can customize this accordingly.
;;=============================================================================

;; Default --Open one window, 80 columns wide and 55 lines high
;;(set-frame-height (selected-frame) 57)    ; %%% bmy changed to 57 lines high
(set-frame-height (selected-frame) 72)    ; %%% bmy changed to 72 lines high
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
