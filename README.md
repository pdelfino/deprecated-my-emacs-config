# Emacs config

Check-out the dot file
- paredit
- rainbow-block
- transpose-frame
- cursor highlight for the parenthesis scope
- helm
- magit

### My cheat-sheet

Useful to [remember](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)
```
COMMANDS

	1. C- = Ctrl Key
	
	2. M- = Meta Key / Alt Key (ESC Don't hold and then the Letter)
	
	3. Start Emacs without Opening Screen : emacs -Q
		
	4. Open Help : C-h i (HELP INFO)
	
		A. Show All Key Bindings : C-h b (BINDINGS)
		
		B. Get Info on Key Binding : C-h k "binding"
		
			i. C-h k C-x b -> Find Out About Switching Buffers
			
	5. See All Functions for an Action : C-h a (ALL)
	
		A. All Buffer Functions : C-h a buffer
		
		B. Execute Command with : ESC x "functionName"
		
	6. Turn on Auto New Line (Hard Wrap) : ESC x auto-fill-mode 
	
	7. Turn on Visual Line Mode (Soft Wrap) ESC x visual-line-mode
	
	8. Increase Text Size : C-x C-+
	
	9. Decrease Text Size : C-x C--
	
	10. Change the Font : ESC x menu-set-font
	
	11. Change Themes : ESC x customize-themes
	
	12. Open Tetris : ESC x tetris
		
		
	BUFFERS
	
	1. Show Buffers : C-x C-b (COMMAND BUFFERS)
	
	2. C-x k : Kills the Buffer (KILL)
	
	3. Switch Buffers : C-x b (BUFFER)
	
		A. Type just the 1st letter of the buffer and click <Tab> <Enter>
		
		B. ? : Shows all possible options
		
		C. M-x beginning-of-command? : Shows all matching commands
		
	4. Select Whole Buffer : C-x h
	
		
	EDITING
	
	1. Quit Emacs : C-x -> C-c (Press y to save and n to not)
	
	2. C-x and M-x : Issues commands (EXECUTE)
	
	3. C-g : Cancels the command or Running Program (GO BACK)
	
	4. Open or Create a File : C-x C-f -> "enter file name" (EXECUTE FILE)
	
	5. Save File : C-x C-s (SAVE)
	
	6. Write Buffer to File : C-x C-w (WRITE FILE)
	
	7. Insert Buffer in File : C-x i "buffer name" (INSERT BUFFER)
	
	8. Undo : C-x u (UNDO)
	
	9. Delete Selection : C-w 
	
	10. Delete # Back : ESC #CharToDel BS
	
	11. Kill / Cut Word Forward : ESC d
	
	12. Kill Word Backward : ESC BS
	
	13. Kill to End of Sentence : ESC k
	
	14. Kill up through Character : ESC z "char"
	
	15. Kill the Next 2 Words : ESC 2 ESC d
	
	16. Yank or Paste Last Killed Text : C-y (YANK)
	
	17. Copy Selection : ESC w (take WITH)
	
	18. Show Text in Kill Ring : C-h v kill-ring
	
	19. Paste Next Kill Ring Item after C-y : ESC Y
	
MOVING AROUND
	
	1. Move Down 1 Screen : C-v (VERTICAL)
	
	2. Move Up 1 Screen : M-v
	
	3. Previous Line : C-p (PREVIOUS)
	
	4. Next Line : C-n (NEXT)
	
	5. Forward Word : M-f (FORWARD)
	
	6. Backward Word : M-b (BACKWARD)
	
	7. Forward Sentence : M-e (sENTENCE)
	
	8. Backward Sentence : M-a (AWAY)
	
	9. Forward Paragraph : M-} (BIG FORWARD)
	
	10. Backward Paragraph : M-{ (BIG BACKWARD)
	
	11. Beginning of Buffer : M-< (BIGGEST BACK)
	
	12. End of Buffer : M-> (BIGGEST FORWARD)
	
	13. Display Line Numbers : M-x linum-mode
	
	14. Go to Line Number : M-g g "Line#"
	
	
REGIONS
	
	1. Define a Region 
		
		A. Define the Mark : C-SPC
		B. Move Cursor to a Position which is the Point
		C. Delete the Region : C-w 
		
	2. Select Whole Paragraph : M-h (wHOLE)
	
	3. Select Whole Buffer : C-x h (wHOLE BUFFER)
	
	4. Select # of Words : ESC #ofWords M-@
	
	5. Erase Selection : C-w
	
	6. Run Shell using Selection as Input : M-|
	
	7. Format Selection
	
		A. Select Paragraph : M-h
		B. Format Selection : M-x fill-region
	 
	
THE MODE LINE
		
	1. C-x C-q : Turn on/off Read Only Mode
	2. **- : Modified and not saved
	3. --- : Not Modified
	4. %% : Read Only Mode not Modified
	5. %* : Read Only Mode has been Modified
	6. Buffer name or *scratch* if no name
	7. Location in the buffer (% or All)
	8. Line Number
	9. Current Mode
		
		A. Fundamental Mode : Default mode
		B. Text Mode : Use when using paragraphs
		C. Paragraph Indent Text Mode : When paragraphs should be indented
		D. Indented Text Mode : Used for outlines
		E. Switch : ESC x fundamental-mode
			
	10. Show all Modes : ESC x *-mode <Tab>
	11. Describe Modes : C-h a mode
		
WINDOWS
	
	1. Working with Windows : 
	
		A. Close Current Window : C-x 0 (ZERO IN ON 1 WINDOW)
		B. Close All but Current Window : C-x 1 (1 WINDOW)
		C. Move to Other Window : C-x o (OTHER WINDOW)
		D. Split Window Vertically : C-x 2 (2 WINDOWS)
		E. Split Window Horizontally : C-x 3 
		F. Make Window Wider : C-x }
		G. Make Window Narrow : C-x {
		H. C-x 3 -> C-x b -> a <tab> <enter>
	
	2. Tutorial : Ctrl-h -> t (TUTORIAL)
	
	3. Delete to End of Line : C-k
	
	4. Delete Previous Sentence : C-x BS
	
	5. Emacs auto saves your work in a file with #s at the beginning and end
	
		A. To use the backup file type M-x recover-file
		
	
REPEATING COMMANDS
	
	1. ESC #ofTimes "Command"
	
		A. Move Up 2 Lines : ESC 2 C-p
	
	
SEARCHING AND REPLACING

	1. Search Forward : C-s "searchWord" (SEARCH)
	
		A. Keep pressing C-s for next 
		
		B. RET to End Search
	
	2. Search Backward : C-r "searchWord" (REVERSE SEARCH)
	
		A. Keep pressing C-r for next 
		
		B. RET to End Search
	
	3. Search for Regex : M-C-s Type Expression (SUPER SEARCH) [MP]att*
	
	4. Find and Replace : ESC % "findWord" "replaceWord" 
	
		A. Responses 
		
			i. y : Replace 1
			ii. n : Don't Replace
			iii. ! : Replace All
			iv. . : Replace and quit
			
EXECUTING SHELL COMMANDS

	1. Open Shell in a Buffer : ESC x shell
	
	2. Run Shell Command : ESC ! "command"
	
	3. Use Region as Input for Shell Command : Select ESC | "command"
	
		A. Select b d a c ESC | sort -> Sorts letters
		
	4. Replace Selected Text with Shell Output : Select ESC 1 ESC | sort
	
EDITING .EMACS

	1. Don't Show Startup Message : (setq inhibit-startup-message t)
	
	2. Set Starting Mode to Text Mode : (setq major-mode 'text-mode)
	
	3. Set Default Mode to Text Mode : (setq-default major-mode 'text-mode)
	
	4. Set Default Theme : (load-theme 'misterioso)
	
	
EXTRAS
	
	1. Count the Words and Characters : M-= 
	
	2. Convert to Uppercase : C-x C-u
	
	3. Convert to Lowercase : C-x C-l
	
	
Creating Macros

	1. Macros record actions and then replay them
	
	2. How to Record
	
		A. C-x (
		B. Perform actions you want recorded
		C. C-x ) Closes the Macro
		D. C-x e Plays the Macro
		
	3. Remove list number from item
	
		A. C-x (
		B. ESC z [SPC]
		C. C-x )
		D. C-x e
		
	4. Show your Macro : C-x C-k SPC
	
		A. C-g Closes this
		
	5. Play Macro with e
	
		A. C-x (
		B. ESC z [SPC] -> Go to next line
		C. C-x e
		D. Repeat e
		
	6. Save Macro : C-x C-k n -> Give it a name "delete-line-number"
	
	7. Use Macro M-x delete-line-number
	
		A. C-x z to run command again -> z to execute again
		
	8. Save your Macro
	
		A. Open .emacs -> C-x C-f ~/.emacs
		
		B. M-x insert-kbd-macro
		
		C. Enter delete-line-number
		
```
