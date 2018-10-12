import ply.lex as lex
import re
import codecs
import os
import sys

clase = 0

errL = False
isComment = 0

# Tokens para catalogar los lexemas
tokens = ['ID','RPC','LPC','NUMBER','REG','COMMA','MINUS','NUM','DP']


<<<<<<< HEAD
kword = ['ADD','SUB','MUL','B','BEQ','BNE','MOV','NOP','EOR','STR','LDR','CMP','ORR','AND','LSL','BGT','BLT','PRM','UMB','SUBS']
=======
kword = ['ADD','SUB','MUL','B','BEQ','BNE','MOV','NOP','EOR','STR','LDR','CMP','ORR','AND','LSL','BGT','BLT','PRM','UMB']
>>>>>>> dfdba57908b97b96622a4e6564238ea08eee88e9
tokens = tokens+ kword
## 'ORR','AND','LSL','BGT','BLT','PRM','UMB'
t_RPC = r'\]'
t_LPC = r'\['
t_COMMA = r','
t_MINUS = r'\-'
t_NUM = r'\#'
t_DP = r'\:'

<<<<<<< HEAD
def t_SUBS(t):
    r'SUBS|subs'
    t.value = t.value.upper()
    return t

def t_PRM(t):
    r'PRM|prm'
    t.value = t.value.upper()
    return t

def t_UMB(t):
    r'UMB|umb'
    t.value = t.value.upper()
    return t

=======
def t_PRM(t):
    r'PRM|prm'
    t.value = t.value.upper()
    return t

def t_UMB(t):
    r'UMB|umb'
    t.value = t.value.upper()
    return t

>>>>>>> dfdba57908b97b96622a4e6564238ea08eee88e9
def t_ORR(t):
    r'ORR|orr'
    t.value = t.value.upper()
    return t

def t_AND(t):
    r'AND|and'
    t.value = t.value.upper()
    return t

def t_LSL(t):
    r'LSL|lsl'
    t.value = t.value.upper()
    return t

def t_BGT(t):
    r'BGT|bgt'
    t.value = t.value.upper()
    return t

def t_BLT(t):
    r'BLT|blt'
    t.value = t.value.upper()
    return t

def t_ADD(t):
    r'ADD|add'
    t.value = t.value.upper()
    return t


def t_SUB(t):
    r'SUB|sub'
    t.value = t.value.upper()
    return t

def t_MUL(t):
    r'MUL|mul'
    t.value = t.value.upper()
    return t

def t_MOV(t):
    r'MOV|mov'
    t.value = t.value.upper()
    return t

def t_CMP(t):
    r'CMP|cmp'
    t.value = t.value.upper()
    return t

def t_EOR(t):
    r'EOR|eor'
    t.value = t.value.upper()
    return t

def t_NOP(t):
    r'NOP|nop'
    t.value = t.value.upper()
    return t

def t_STR(t):
    r'STR|str'
    t.value = t.value.upper()
    return t

def t_LDR(t):
    r'LDR|ldr'
    t.value = t.value.upper()
    return t

def t_BEQ(t):
    r'BEQ|beq'
    t.value = t.value.upper()
    return t

def t_BNE(t):
    r'BNE|bne'
    t.value = t.value.upper()
    return t



def t_B(t):
    r'B|b'
    t.value = t.value.upper()
    return t

def t_ID(t):
    r'[a-qs-zA-QS-Z][a-zA-Z0-9]*'
    return t

def t_REG(t):
    r'[rR][0-9]+'
    t.value = t.value.upper()
    return t

def t_COMMENT(t):
    r';.*'
    global isComment
    isComment += 1
    t.lexer.skip(1)

def t_NUMBER(t):
    r'\d+|\-\d+'
    return t

def t_error(t):
    global errL
    errL = True
    print("Aqui hay un error",t.value[0])
    t.lexer.skip(1)
    
def t_nonespace(t):
    r'\s+'
    pass

def getErrL():
    global errL
    return errL










        
