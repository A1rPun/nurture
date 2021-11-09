from sly import Parser
from lexer import CalcLexer
from math import sqrt


class CalcParser(Parser):
    tokens = CalcLexer.tokens

    precedence = (
        ('left', PLUS, MINUS),
        ('left', TIMES, DIVIDE),
        ('left', MOD),
        ('left', "."),
        ('right', UMINUS),
    )

    def __init__(self, names: dict = None):
        self.names = names or {}
        self.stack = []

    @property
    def last_item_on_stack(self):
        return self.stack[-1] if len(self.stack) > 0 else None

    @_('IDENTIFIER ASSIGN expr')
    def statement(self, p):
        self.names[p.IDENTIFIER] = p.expr

    @_('expr')
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

    @_('MINUS expr %prec UMINUS')
    def expr(self, p):
        return -p.expr

    @_('LPAREN expr RPAREN')
    def expr(self, p):
        return p.expr
