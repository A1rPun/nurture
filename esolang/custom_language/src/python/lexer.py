from sly import Lexer


class CalcLexer(Lexer):
    tokens = { NAME, STRING, NUMBER, ASSIGN, LPAREN, RPAREN, LACCOL, RACCOL,
             PLUS, TIMES, MINUS, DIVIDE, MOD, SQRT, DOT, PRINT }
    ignore = ' \t'
    literals = { '=' }

    # Special Symbols
    ASSIGN = r'='
    LPAREN = r'\('
    RPAREN = r'\)'
    LACCOL = r'\{'
    RACCOL = r'\}'

    # Arithmetic Operators
    PLUS = r'\+'
    MINUS = r'-'
    TIMES = r'\*'
    DIVIDE = r'/'
    MOD = r'\^'
    SQRT = r'√'

    # Tokens
    NAME = r'[a-zA-Z_][a-zA-Z0-9_]*'
    NAME['print'] = PRINT
    STRING = r'\".*\"'
    DOT = r'\.'

    # Logical Operators
    # OR = r'\|\|'
    # AND = r'\&\&'

    # Relational Operators
    # EQUALITY = r'(=== | ==)'
    # INEQUALITY = r'(!== | !=)'
    # GREATER = r'(>= | >)'
    # LESSER = r'(<= | <)'

    @_(r'\d+')
    def NUMBER(self, t):
        t.value = int(t.value)
        return t

    @_(r'\n+')
    def newline(self, t):
        self.lineno += t.value.count('\n')

    def error(self, t):
        print("Illegal character '%s'" % t.value[0])
        self.index += 1
