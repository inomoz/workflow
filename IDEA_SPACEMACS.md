```
## IDEA                            Description                                    ## SpaceIdea     # Spacemacs
Remember these Shortcuts 
Ctrl + Shift + Space               Smart code completion
Double Shift                       Search everywhere 
Alt + Enter                        Show intention actions and quick-fixes
Alt + Ins                          Generate code
Ctrl + P                           Parameter info
Ctrl + W                           Extend selection
Ctrl + Shift + W                   Shrink selection
Ctrl + E                           Recent files popup
Shift + F6                         Rename

General
Alt + #[0-9]                       Open corresponding tool window
Ctrl + S                           Save all
Ctrl + Alt + Y                     Synchronize
Ctrl + Shift + F12                 Toggle maximizing editor
Alt + Shift + I                    Inspect current file with current profile
Ctrl + BackQuote (`)               Quick switch current scheme
Ctrl + Alt + S                     Open Settings dialog
Ctrl + Alt + Shift + S             Open Project Structure dialog
Ctrl + Shift + A                   Find Action
SPC f c   	copy current file to a different location	
SPC f D   	delete a file and the associated buffer (ask for confirmation)	
SPC f E   	open a file with elevated privileges (sudo edit)	
SPC f f   	open file with =helm= (or =ido=)	
SPC f F   	try to open the file under point =helm=	
SPC f j   	jump to the current buffer file in dired	
SPC f l   	open file literally in =fundamental mode=	
SPC f L   	Locate a file (using =locate=)	
SPC f o   	open a file using the default external program	
SPC f R   	rename the current file	
SPC f s   	save a file	
SPC f S   	save all files	
SPC f r   	open a recent file with =helm=	
SPC f t   	toggle file tree side bar using [[https://github.com/jaypei/emacs-neotree][NeoTree]]	
SPC f v d 	add a directory variable	
SPC f v f 	add a local variable to the current file	
SPC f v p 	add a local variable to the first line of the current file	
SPC f y   	show current file absolute path in the minibuffer
SPC f e c	open =ido= in the =contrib= folder	
SPC f e d	open the spacemacs dotfile (=/.spacemacs=)	
SPC f e D	open =ediff= buffer of =/.spacemacs= and =.spacemacs.template=	
SPC f e f	discover the =FAQ= using =helm=	
SPC f e i	open the all mighty =init.el=	
SPC f e R	resync the dotfile with spacemacs
SPC ss		Search in files		
/:              search with evil		
SPC s l	        find all function definitons in a file	

Debugging
Step over/into                     F8 / F7
Smart step into / Step out         Shift + F7 / Shift + F8
Alt + F9                           Run to cursor
Alt + F8                           Evaluate expression
F9                                 Resume program
Ctrl + F8                          Toggle breakpoint
Ctrl + Shift + F8                  View breakpoints
Search / Replace
Double Shift                       Search everywhere
Ctrl + F                           Find
Find next / previous               F3 / Shift + F3
Ctrl + R                           Replace
Ctrl + Shift + F                   Find in path
Ctrl + Shift + R                   Replace in path
Alt + J                            Select next occurrence
Ctrl + Alt + Shift + J             Select all occurrences
Alt + Shift + J                    Unselect occurrence
SPC ff:	find files or url	
SPC pf:	find file in project	
SPC ph:	search in a project with helm	
SPC bb:	search in buffers

Editing
Ctrl + Space                       Basic code completion
Ctrl + Shift + Space               Smart code completion
Ctrl + Shift + Enter               Complete statement
Ctrl + P                           Parameter info (within method call arguments)
Ctrl + Q                           Quick documentation lookup
Shift + F1                         External Doc
Ctrl + mouse                       Brief Info
Ctrl + F1                          Show descriptions of error at caret
Alt + Insert                       Generate code...
Ctrl + O                           Override methods
Ctrl + I                           Implement methods
Ctrl + Alt + T                     Surround with...
Ctrl + /                           Comment/uncomment with line comment
Ctrl + Shift + /                   Comment / uncomment with block comment
SPC ;	comment operator	
SPC c y	comment and yank	
SPC c p	comment paragraphs
Ctrl + W                           Extend selection
Ctrl + Shift + W                   Shrink selection
Alt + Q                            Context info
Alt + Enter                        Show intention actions and quick-fixes
Ctrl + Alt + L                     Reformat code
Ctrl + Alt + O                     Optimize imports
Ctrl + Alt + I                     Auto-indent line(s)
Tab / Shift + Tab                  Indent / unindent selected lines   
Ctrl + X , Shift + Delete          Cut current line to clipboard
Ctrl + C , Ctrl + Insert           Copy current line to clipboard
Ctrl + V , Shift + Insert          Paste from clipboard
Ctrl + Shift + V                   Paste from recent buffers...
Ctrl + D                           Duplicate current line
Ctrl + Y                           Delete line at caret
Ctrl + Shift + J                   Smart line join
Ctrl + Enter                       Smart line split
Shift + Enter                      Start new line
Ctrl + Shift + U                   Toggle case for word at caret or selected block
Select till code block end / start Ctrl + Shift + ] / [
Ctrl + Delete                      Delete to word end
Ctrl + Backspace                   Delete to word start
Ctrl + NumPad+ / -                 Expand / collapse code block
Ctrl + Shift + NumPad+             Expand all
Ctrl + Shift + NumPad-             Collapse all
Ctrl + F4                          Close active editor tab
SPC TAB	switch to alternate buffer in the current window (switch back and forth)	
SPC b b	switch to a buffer using helm	
SPC b B	ibuffer	
SPC b d	kill the current buffer (does not delete the visited file)	
SPC b M	move buffer to another window	
SPC b e	erase the content of the buffer (ask for confirmation)	
SPC b h	open *spacemacs* home buffer	
SPC b k	kill a buffer	
SPC b K	kill all buffers except the current one

Refactoring
F5                                 Copy
F6                                 Move
Alt + Delete                       Safe Delete
Shift + F6                         Rename
Ctrl + Alt + Shift + T             Refactor this
Ctrl + F6                          Change Signature
Ctrl + Alt + N                     Inline
Ctrl + Alt + M                     Extract Method
Ctrl + Alt + V                     Extract Variable
Ctrl + Alt + F                     Extract Field
Ctrl + Alt + C                     Extract Constant
Ctrl + Alt + P                     Extract Parameter
SPC m r R x	                   extract region into partial

Navigation
Ctrl + N                           Go to class
Ctrl + Shift + N                   Go to file
Ctrl + Alt + Shift + N             Go to symbol
Alt + Right/Left                   Go to next / previous editor tab
F12                                 Go back to previous tool window
Esc                                Go to editor (from tool window)
Shift + Esc                        Hide active or last active window
Ctrl + G                           Go to line
Ctrl + E                           Recent files popup
Ctrl + Alt + Left/Right            Navigate back /forward
Ctrl + Shift + Backspace           Navigate to last edit location
Alt + F1                           Select current file or symbol in any view
Ctrl + B , Ctrl + Click            Go to declaration
Ctrl + Alt + B                     Go to implementation(s)
Ctrl + Shift + I                   Open quick definition lookup
Ctrl + Shift + B                   Go to type declaration
Ctrl + U                           Go to super-method / super-class
Alt + Up/Down                      Go to previous / next method
Ctrl + ]/[                         Move to code block end / start
Ctrl + F12                         File structure popup
Ctrl + H                           Type hierarchy
Ctrl + Shift + H                   Method hierarchy
Ctrl + Alt + H                     Call hierarchy
F2 / Shift + F2                    Next / previous highlighted error
F4 / Ctrl + Enter                  Edit source / View source
Alt + Home                         Show navigation bar
F11                                Toggle bookmark
Ctrl + F11                         Toggle bookmark with mnemonic
Ctrl + #[0-9]                      Go to numbered bookmark
Shift + F11                        Show bookmarks

Window
SPC 1	switch to window 1	
SPC 2	switch to window 2	
SPC w =	balance split windows	
SPC w c	close a window	
SPC w C	delete another window using ace-delete-window	
SPC w d	toggle window dedication (dedicated window cannot be reused by a mode)	
SPC w [hjkl]	move to window	
SPC w [HJKL]	move the window	
SPC w s or SPC w	horizontal split and focus new window	
SPC w S	horizontal split and focus new window	
SPC w u	undo window layout (used to effectively undo a closed window)	
SPC w U	redo window layout	
SPC w v	or SPC w /	vertical split
SPC w V	vertical split and focus new window	
SPC w w	cycle and focus between windows	
SPC w m	maximize/minimize a window (maximize is equivalent to delete other windows)	
SPC w M	maximize/minimize a window, when maximized the buffer is centered

Compile and Run
Ctrl + F9                          Make project
Ctrl + Shift + F9                  Compile selected file, package or module
Alt + Shift + F10/F9               Select configuration and run / debug
Shift + F10 / F9                   Run / Debug
Ctrl + Shift + F10                 Run context configuration from editor

Usage Search
Alt + F7 / Ctrl + F7               Find usages / Find usages in file
Ctrl + Shift + F7                  Highlight usages in file
Ctrl + Alt + F7                    Show usages

VCS / Local History
Ctrl + K                           Commit project to VCS
Ctrl + T                           Update project from VCS
Ctrl + Shift + K                   Push commits
Alt + BackQuote (`)                ‘VCS’ quick popup
Git commands		
SPC g b  	open a =magit= blame	
SPC g B  	quit =magit= blame	
SPC g c  	commit changes	
SPC g C  	checkout branches	
SPC g d  	show diff prompt	
SPC g D  	show diff against current head	
SPC g e  	show ediff comparison	
SPC g E  	show ediff against current head	
SPC g f  	show fetch prompt	
SPC g F  	show pull prompt	
SPC g H c	clear highlights	
SPC g H h	highlight regions by age of commits	
SPC g H t	highlight regions by last updated time	
SPC g i  	git init a given directory	
SPC g I  	open =helm-gitignore=	
SPC g l  	open a =magit= log	
SPC g L  	display the log for a file	
SPC g P  	show push prompt	
SPC g s  	open a =magit= status window	
SPC g S  	stage current file	
SPC g m  	display the last commit message of the current line	
SPC g t  	launch the git time machine	
SPC g U	unstage current file

Project
SPC p !  	run shell command in root	
SPC p &  	run async shell command in root	
SPC p a  	toggle between implementation and test	
SPC p b  	switch to project buffer	
SPC p c  	compile project using =projectile=	
SPC p d  	find directory	
SPC p D  	open project root in =dired=	
SPC p f  	find file	opens root of project
SPC p G  	regenerate the project's =etags= / =gtags=	
SPC p h  	find file using =helm=	
SPC p I  	invalidate the projectile cache	
SPC p k  	kill all project buffers	
SPC p o  	run =multi-occur=	
SPC p p  	switch project	
SPC p r  	open a recent file	
SPC p R  	replace a string	
SPC p s  	see [[Searching in a project][search in project]]	
SPC p t  	open =NeoTree= in =projectile= root	
SPC p T  	find test files	
SPC p v  	open project root in =vc-dir= or =magit=	
SPC p y  	find tags	
SPC /    	search in project with the best search tool available	
SPC s a p	run =ag=	
SPC s g p	run =grep=	
SPC s k p	run =ack=	
SPC s t p	run =pt=

Live Templates
Ctrl + Alt + J                     Surround with Live Template
Ctrl + J                           Insert Live Template
```

```

		

errors		
SPC e n	go to the next error	
SPC e p	go to the previous error

Quit		
SPC q q	Quit Emacs and kill the server, prompt for changed buffers to save	
SPC q Q	Quit Emacs and kill the server, lose all unsaved changes.	
SPC q r	Restart both Emacs and the server, prompting to save any changed buffers	
SPC q s	Save the buffers, quit Emacs and kill the server	
SPC q z	Kill the current frame	
	
	
		
SPC v	enter expand-region mode	
SPC V	contract region	
CTRL SPC - Mark Items		
CTRL z - Actions		
CTRL h	up a folder	
CTRL l	open a folder	
CTRL j	up	
CTRL k	down	



Evil-mc		
grm	make-all-cursors	
gru	undo-all-cursors	
grs	pause-cursors	
grr	resume-cursors	
grf	make-and-goto-first-cursor	
grl	make-and-goto-last-cursor	
grh	make-cursor-here	
M-n	make-and-goto-next-cursor	
grN	skip-and-goto-next-cursor	
M-p	make-and-goto-prev-cursor	
grP	skip-and-goto-prev-cursor	
C-n	make-and-goto-next-match	
grn	skip-and-goto-next-match	
C-t	skip-and-goto-next-match	
C-p	make-and-goto-prev-match	
grp	skip-and-goto-prev-match	

Find/Replace		
Alt %	query-replace; active region, or cursor point to end interactive find/replace	
y     	do the replacement.	
n     	skip	
“”!	do this and all remaining replacements without asking.	
Ctrl+g	cancel.	
s (	put parens around a region	
SPC s e	multiple cursors	
n - jump		
N - jump		
SPC h d - help describe		
SPC h d f - help describe functions		
SPC h d v - help describe variables		
SPC f e h - help		
ALT /	snippet completion	
		
SPC t s - syntax checking		
SPC e - syntax checking options		
SPC a r - ranger		
SPC a d - deer		
		
unimpaired		
'"[e    	Move line up	
'"]e    	Move line down	
'"[SPACE	Insert space above	
'"]SPACE	Insert space below	
'"[p    	Paste above current line	
'"]p    	Paste below current line	
```

```
Key	Description
C-i	Forward
C-o	Go back
g d	Go to declaration
g h	Go to Documentation
g r	Find Usages
g s	Go to Symbol
leader ’	Active terminal window
leader R	reload ~/.ideavimrc
leader a a	Select All
leader a l	Prompt action list
leader b b (<CR>)	Recent files (You can still use command+e or ctrl+e)
leader b i	Active structure tool window
leader b u	Reopen Closed Tab
leader c c	Go to Class
leader d D	Debug Class
leader d d	Debug
leader e e	show error description
leader f T	Select current file in project view
leader f b	Show Bookmarks
leader f d	Smart search launcher (You have to install Dash or Zeal first)
leader f f	Search Everywhere
leader f s	save all files (I still use command+s or ctrl+s)
leader f t	Active file tree window
leader i m	Implement Methods
leader g S/	Active version control window
leader g s	Vsc quick list pop up
leader j i	Fire structure pop up (similar to structure tool)
leader j j	Ace Action
leader j l	Ace Line Action
leader m =	beautify file
leader r R	Run Class
leader r p	Replace in project
leader r r	Run
leader s s	Stop
leader s p	Search in project
leader space	Go to Action
leader t b	Toggle Bookmark
leader t t	Toggle Line Breakpoint
leader w [lhjk]	navigate window
leader w c	close window
leader w m	hide all windows except the editor tabs (You can invoke again to revert)
leader w s	split window horizontally
leader w v	split window vertically
leader w z	Toggle Zen mode
z C	collapse all region
z O	expand all region
z c	collapse region
z o	expand region
```


PLAN:
each day configure 10 shortcuts
helpers: actionlist
         https://ztlevi.github.io/posts/The-Minimal-Spacemacs-Tweaks-for-Jetbrain-IDES/
	 ~/.ideavimrc
