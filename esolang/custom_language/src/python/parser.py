from sly import Parser
from lexer import CalcLexer
from math import sqrt


class CalcParser(Parser):
    tokens = CalcLexer.tokens

    precedence = (
        ('left', PLUS, MINUS),
        ('left', TIMES, DIVIDE),
        ('left', MOD, SQRT),
        ('left', DOT),
        ('right', UMINUS),
    )

    def __init__(self):
        self.names = { }

    @_('NAME ASSIGN expr')
    def statement(self, p):
        self.names[p.NAME] = p.expr

    @_('expr')
    def statement(self, p):
        # print(p.expr)
        pass

    @_('PRINT expr')
    def statement(self, p):
        print(p.expr)

    @_('expr PLUS expr')
    def expr(self, p):
        return p.expr0 + p.expr1

    @_('expr MINUS expr')
    def expr(self, p):
        return p.expr0 - p.expr1

    @_('expr TIMES expr')
    def expr(self, p):
        return p.expr0 * p.expr1

    @_('expr DIVIDE expr')
    def expr(self, p):
        return p.expr0 / p.expr1

    @_('expr MOD expr')
    def expr(self, p):
        return p.expr0 ** p.expr1

    @_('SQRT expr')
    def expr(self, p):
        return sqrt(p.expr)

    @_('MINUS expr %prec UMINUS')
    def expr(self, p):
        return -p.expr

    @_('LPAREN expr RPAREN')
    def expr(self, p):
        return p.expr

    @_('LACCOL expr RACCOL')
    def expr(self, p):
        return round(p.expr)

    @_('NUMBER')
    def expr(self, p):
        return p.NUMBER

    @_('NUMBER DOT NUMBER')
    def expr(self, p):
        # return 0
        return float(f"{p.NUMBER0}.{p.NUMBER1}")

    @_('STRING')
    def expr(self, p):
        return p.STRING[1:-1]

    @_('NAME')
    def expr(self, p):
        try:
            return self.names[p.NAME]
        except LookupError:
            print("Undefined name '%s'" % p.NAME)
            return 0
