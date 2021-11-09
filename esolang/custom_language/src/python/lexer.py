from sly import Lexer


class CalcLexer(Lexer):
    tokens = {IDENTIFIER, NUMBER, PLUS, TIMES, MINUS, DIVIDE,
              MOD, SQRT, ASSIGN, LPAREN, RPAREN, QUOTE}
    ignore = ' \t'
    literals = {'.', '!'}

    # Special Symbols
    LPAREN = r'\('
    RPAREN = r'\)'
    QUOTE = r'\''

    # Arithmetic Operators
    PLUS = r'\+'
    MINUS = r'-'
    TIMES = r'\*'
    DIVIDE = r'/'
    MOD = r'\^'
    SQRT = r'√'

    # Assigment Operators
    ASSIGN = r'='

    # Logical Operators
    # OR = r'\|\|'
    # AND = r'\&\&'

    # Relational Operators
    # EQUALITY = r'(===|==)'
    # INEQUALITY = r'(!==|!=)'
    # BIGGER = r'(>=|>)'
    # SMALLER = r'(<=|<)'

    @_(r"(0|[1-9][0-9]*)")
    def NUMBER(self, t):
        t.value = int(t.value)
        return t

    IDENTIFIER = r'[a-zA-Z_][a-zA-Z0-9_]*'

    ignore_newline = r'\n+'

    def ignore_newline(self, t):
        self.lineno += t.value.count('\n')

    def error(self, t):
        print("Illegal character '%s'" % t.value[0])
        self.index += 1
