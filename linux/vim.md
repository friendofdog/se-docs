VIM
===

Movement
--------

Any of the below commands can be preceeded with a number, causing the cursor to make the given number of movements happen. E.g. <kbd>3</kbd> &rarr; <kbd>h</kbd> moves left three characters. If no number is given, defaults to one.

### Basic movement

- <kbd>h</kbd>: left x characters
- <kbd>j</kbd>: down x rows
- <kbd>k</kbd>: up x rows
- <kbd>l</kbd>: right x characters

### Line start / end

- <kbd>0</kbd> or <kbd>^</kbd>: go to start of line
- <kbd>$</kbd>: go to end of line

### Relative to word

- <kbd>w</kbd>: move forward x words to beginning of word
- <kbd>e</kbd>: move fowrard x word to end of word
- <kbd>b</kbd>: move back x word to beginning of word

### Relative to bracket

- <kbd>%</kbd>: when on a bracket (`{`, `[`, `(`), jump to the corresponding open / close bracket

### Skip to line

- <kbd>g</kbd> &rarr; <kbd>g</kbd>: go to start of file
- <kbd>G</kbd> &rarr; <kbd>G</kbd>: go to end of file
- <kbd>10</kbd> &rarr; <kbd>G</kbd>: go to 10th line in file

Manipulate content
------------------

### Multiline selection

- <kbd>v</kbd>: select multiple characters
- <kbd>V</kbd>: select multiple lines
  - Use arrow or movement keys to select content from here

### Copying text

- <kbd>y</kbd>: copy highlighted text
- <kbd>y</kbd> &rarr; <kbd>y</kbd>: copy entire line

### Deleting text

- <kbd>x</kbd>: delete character on cursor (equivalent of <kbd>Del</kbd> on Windows)
  - Can be used with multiple characters
- <kbd>X</kbd>: delete character preceeding cursor (equivalent of <kbd>Backspace</kbd> on Windows)
  - When used on multiple characters, deletes entire line

You can combine deletion with movement using <kbd>d</kbd>. For example...

- <kbd>d</kbd> &rarr; <kbd>w</kbd>: delete up to start of next word
- <kbd>d</kbd> &rarr; <kbd>2</kbd> &rarr;  <kbd>w</kbd>: delete up to start of next next word
- <kbd>d</kbd> &rarr; <kbd>e</kbd>: delete up to end of current word
- <kbd>d</kbd> &rarr; <kbd>b</kbd>: delete back to start of current word

### Pasting text

- <kbd>p</kbd>: paste whatever text you last copied or deleted

### Replace text

- <kbd>r</kbd> &rarr; <kbd>q</kbd>: replaces highlighted character(s) with "q"
  - When used on multiple characters, every character replace with "q"

### Insert text multiple times

A string of text can be inserted multiple times by typing a number before entering insert mode.

<kbd>3</kbd> &rarr; <kbd>i</kbd> &rarr; `something` &rarr; <kbd>Esc</kbd> &rarr; <kbd>any key</kbd> evaluates to:

```text
somethingsomethingsomething
```

### Type text to multiple lines

1. <kbd>Cntr</kbd> + <kbd>v</kbd> to enter visual block mode
2. <kbd>I</kbd>
3. Enter desired string
4. <kbd>Esc</kbd> and wait (change will appear on all lines in a few seconds)

### New line

- <kbd>o</kbd>: insert new line below cursor, enter edit mode
- <kbd>O</kbd>: insert new line above cursor, enter edit mode

### Repeat last action

- <kbd>.</kbd>: repeat whatever you just did (delete two words, paste something, etc.)

Search and replace
------------------

### Search for string

Specify the string to search for either by putting cursor over desired string and pressing...

- <kbd>\*</kbd>: to select string and search descending
- <kbd>#</kbd>: to select string and search ascending

... or, press <kbd>/</kbd> then type the string manually.

Either way, one the string is selected you can press...

- <kbd>n</kbd>: to find next match, preserve order
- <kbd>N</kbd>: to find next match, reverse order

### Replace string

Press <kbd>/</kbd> then enter one of the following:

- `:%s/search/replace/g`: search-replace without confirmation
- `:%s/search/replace/gc`: search-replace with confirmation
