# C89 Parser

This is a `flex` & `bison` implementation that parses successfully the (ANSI) `C` language -- it's also known as `c89`. This is a slightly edited version of the lexer and parser located [here][1] and [here][2] respectively. Original author is Jeff Lee (circa. 1985). I got it from Jutta Degener's mirror ([here][3])

All I did was to fix some small errors and combine the files in a convenient package that one can use and play with. Feel free to use it as a reference to learn, play and enjoy a C-parser.

# Compiling

As I said above we can compile and play with the project in a matter of seconds; after a successful clone go to the directory that you cloned the project into and type:

```
$ make all
```

Then after compiling you can run (parse) a `C` file like this:

```
$ ./c89p < file.c
```

If all went well, you should be greeted with a happy message from the parser.

[1]: http://www.lysator.liu.se/c/ANSI-C-grammar-l.html
[2]: http://www.lysator.liu.se/c/ANSI-C-grammar-y.html
[3]: http://www.lysator.liu.se/c/
