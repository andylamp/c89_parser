# Makefile for building the c89p project.
CC = gcc -g
FLEX  = flex
BISON = bison

#------------------------------------------
# flags
#------------------------------------------

INCLUDE_PATH=-I. 

BASICFLAGS= -std=c11 -D_GNU_SOURCE
DEBUGFLAGS=  -g 
PLFLAGS=
OPTFLAGS= -finline -march=native -O3 -DNDEBUG

CFLAGS= -Wall -D_GNU_SOURCE $(BASICFLAGS)

BISON_FLAGS  = -d
FLEX_FLAGS = 
LDFLAGS= $(PLFLAGS) $(BASICFLAGS)
LIBS=-lfl

#------------------------------------------
# app
#------------------------------------------

C_PROG= cc89p
C_SOURCES= cc89p.c
C_GEN= c89_parser.tab.c c89_parser.tab.h c89_lexer.c

C_SRC= $(C_SOURCES) $(C_GEN)
C_OBJECTS=$(C_SRC:.c=.o)

.PHONY: all
     
all: c89_lexer.c cc89p

cc89p: 	cc89p.o c89_lexer.o c89_parser.tab.o
	$(CC) $(CFLAGS) -o $@ $+ $(LIBS)

c89_lexer.c: c89_lexer.l c89_parser.tab.h
	$(FLEX) -o c89_lexer.c c89_lexer.l	
	
c89_parser.tab.c c89_parser.tab.h: c89_parser.y
	$(BISON) $(BISON_FLAGS) c89_parser.y


#-----------------------------------------------------
# Build control
#-----------------------------------------------------

distclean: realclean
	-touch .depend
	-rm *~

realclean:
	-rm $(C_PROG) $(C_OBJECTS) $(C_GEN) .depend *.o
	-rm .depend
	-touch .depend

clean: realclean

include .depend
