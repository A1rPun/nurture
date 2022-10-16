import sys
from lexer import CalcLexer
from parser import CalcParser


def repl(lexer, parser):
    print('Custom language v0.0.1')
    print('Type "exit" to quit the REPL')

    linecount = 0
    while True:
        try:
            text = input(f'λ({linecount}) ⇒ ')
        except EOFError:
            break
        if text:
            if text == 'exit':
                break
            run(lexer, parser, text)
            linecount = linecount + 1


def run(lexer, parser, text):
    tokens = lexer.tokenize(text)
    parser.parse(tokens)


def runFile(lexer, parser, fileName):
    with open(fileName) as f:
        content = f.readlines()
    for line in content:
        run(lexer, parser, line)


if __name__ == '__main__':
    lexer = CalcLexer()
    parser = CalcParser()

    if len(sys.argv) > 1:
        runFile(lexer, parser, sys.argv[1])
    else:
        repl(lexer, parser)
