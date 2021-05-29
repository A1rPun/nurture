# Vim

## Modes

You start in normal mode

`ESC` = Normal mode
`i` = Insert mode
`v` = Visual mode
`A` = Insert mode at end of line
`:options` = Show vim options
`:h` = Show vim help
`ctrl+d` = List autocompletions

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
`%` = select whole file
`!` = filter
`/` = start search

## Mode commands

`y` = Copy selection (yank)
`p` = Paste after cursor
`dd` = Cut line
`x` = Cut character
`u` = Undo
`.` = Redo

## Useful commands

`:%!xxd` = hex view and edit
`:%!xxd -r` = parse hex back to a file
