#include <stdio.h>

#include "c89_parser.tab.h"
extern int yyerror_count;

int main(int argc, char **argv)
{
  fprintf(stderr, " ** Parsing from standard input\n");
	yyparse();
	fprintf(stderr, " ** End of parsing -- %s\n", 
	  yyerror_count > 0 ? "failed to parse given input." : 
	                      "successfully parsed given input.");
}

