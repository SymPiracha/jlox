# jlox

Building an interpreter in Java for the `lox` programming language.

This project is guided by the book *Crafting Interpreters* by Robert Nystrom.

## Overview

`jlox` is a Java implementation of the `lox` programming language, which is a simple, dynamic language designed to illustrate how interpreters work. The project follows along with the examples and structure laid out in *Crafting Interpreters*.\

## Features

- **Lexical Analysis (Scanning):** Converts raw source code into tokens.
- **Parsing:** Builds an Abstract Syntax Tree (AST) from tokens.
- **Evaluation:** Executes the parsed code.

## Setup

### Prerequisites

- Java Development Kit (JDK) installed (version 11 or later).
- `Makefile` for build automation.
- JUnit for running tests.

### Building the Project

To compile the project:

```bash
make
```

## Grammar

# jlox

Building an interpreter in Java for the `lox` programming language.

This project is guided by the book *Crafting Interpreters* by Robert Nystrom.

## Overview

`jlox` is a Java implementation of the `lox` programming language, which is a simple, dynamic language designed to illustrate how interpreters work. The project follows along with the examples and structure laid out in *Crafting Interpreters*.

## Features

- **Lexical Analysis (Scanning):** Converts raw source code into tokens.
- **Parsing:** Builds an Abstract Syntax Tree (AST) from tokens.
- **Evaluation:** Executes the parsed code.

## Grammar

The following grammar defines the structure of `lox`:

```
program        → declaration* EOF ;
declaration    → varDecl | statement ;
statement      → exprStmt | forStmt | ifStmt | printStmt | whileStmt | block ;
exprStmt       → expression ";" ;
forStmt        → "for" "(" ( varDecl | exprStmt | ";" ) expression? ";" expression? ")" statement ;
ifStmt         → "if" "(" expression ")" statement ( "else" statement )? ;
printStmt      → "print" expression ";" ;
varDecl        → "var" IDENTIFIER ( "=" expression )? ";" ;
whileStmt      → "while" "(" expression ")" statement ;
block          → "{" declaration* "}" ;
expression     → assignment ;
assignment     → IDENTIFIER "=" assignment | or ;
or             → and ( "or" and )* ;
and            → equality ( "and" equality )* ;
equality       → comparison ( ( "!=" | "==" ) comparison )* ;
comparison     → term ( ( ">" | ">=" | "<" | "<=" ) term )* ;
term           → factor ( ( "-" | "+" ) factor )* ;
factor         → unary ( ( "/" | "*" ) unary )* ;
unary          → ( "!" | "-" ) unary | primary ;
primary        → "false" | "true" | "nil" | NUMBER | STRING | IDENTIFIER | "(" expression ")" ;
```