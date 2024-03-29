# Vim

## Modifiers

`^` = Ctrl key
shift = The described character is capitalized
`%` = select whole file
`/` = start search
`!` = filter, ...

## Modes

You start in normal mode

`ESC` = Normal mode
`i` = Insert mode
`v` = Visual mode
`A` = Insert mode at end of line

## File commands

`:w` = write
`:x` = write and quit
`:q` = quit
`:q!` = saviour of poor souls

## Objects

`word` = sequence of letters, digits, underscores seperated by whitespace
`WORD` = sequence of non-blank characters seperated by whitespace

## Movement

`h j k l` = Cursor navigation (left down up right)
`w e b` = word navigation (forward begin, forward end, back begin)
`W E B` = WORD navigation (forward begin, forward end, back begin)
`{ }` = Paragraph navigation
`[{ ]}` = Block navigation

## Mode commands

`y` = Copy selection (yank)
`p` = Paste after cursor
`dd` = Cut line
`x` = Cut character
`u` = Undo
`^r` = Redo

## Useful commands

`^d` = List autocompletions
`:options` = Show vim options
`:h` = Show vim help
`:find` = find a file to open
`:read !` = read stdout from command
`:%!xxd` = hex view and edit
`:%!xxd -r` = parse hex back to a file
