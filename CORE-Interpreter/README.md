# CSE 3341 CORE Interpreter Project

## Overview

This project is a comprehensive interpreter for the CORE language, developed as part of the CSE 3341 course. It includes multiple components like a scanner, parser, and an execution environment. Each component focused on a different aspect of interpreter design and implementation, embedding crucial programming concepts and language processing techniques.

### Project 1: Core Scanner
- **Key Concepts**: Lexical Analysis, Tokenization
- **Implementation Details**: 
  - Developed a scanner for the Core language.
  - Focused on breaking down raw input into a structured format of tokens.
  - Laid the groundwork for syntax analysis in the parsing stage.

### Project 2: CORE Parser
- **Key Concepts**: Syntax Analysis, Parse Trees, Error Handling
- **Implementation Details**: 
  - Built a Java-based parser for analyzing Core language syntax.
  - Implemented parse trees for structural representation of programs.
  - Enhanced parser with error handling mechanisms for invalid program rejection.

### Project 3: CORE Interpreter
- **Key Concepts**: Execution, Semantic Analysis, Memory Management
- **Implementation Details**: 
  - Developed the executor component, completing the interpreter.
  - Integrated a lexical analyzer (scanner), syntax analyzer (parser), and an executor using recursive descent.
  - Emphasized semantic analysis and the execution process of parsed code.

### Project 4: Function Calls
- **Key Concepts**: Function Calls, Recursion, Stack Management
- **Implementation Details**: 
  - Enhanced the interpreter to handle function definitions and recursive calls.
  - Modified parser and executor to support function call functionality.
  - Explored stack management in the context of recursive function execution.

### Project 5: Garbage Collection
- **Key Concepts**: Garbage Collection, Memory Optimization, Reference Counting
- **Implementation Details**: 
  - Added garbage collection via reference counting to the interpreter.
  - Focused on efficient memory management and object lifecycle.
  - Addressed the complexities of tracking and freeing memory in interpreter design.

Each lab in this project not only reinforced concepts learned in class but also provided insights into the inner workings of programming language interpreters. The project spanned from fundamental topics like lexical analysis to advanced concepts such as garbage collection, illustrating the full spectrum of interpreter design and execution.

## How to Run

1. Subscribe to `JDK-CURRENT`.
2. Compile using the `Make` command (javac is configured for auto-compilation).
3. Run using `java Main <inputCodeFileName> <inputDataFileName>` or use the provided scripts for testing.

   **Note**: Java source files and their compiled versions are included. You can recompile if needed, but pre-compiled files are provided for convenience.
   
   **Troubleshooting**: If you encounter any issues, please use `make` to clean and re-compile the codes.

## Files Description

- `Core.java`: Provided by the instructor, contains keywords and symbols for the CORE language.
- `Scanner.java`: Scanner written for Project 1, includes all the developed code for lexical analysis.
- `Main.java`: Main class for running tests. Contains the `main` function.
- `Correct/`: Directory with correct input files provided by the instructor.
- `Error/`: Directory with erroneous input files provided by the instructor.
- `Parser`: Parser class containing functions for syntax analysis, semantic checks, and various utilities like `printTable`, `declare`, `assign`, and methods for handling global/local variables.
- `ParserInterface`: General interface for all grammar functions.

## Grammar Description:
- Procedure: <procedure> ::= procedure ID is <decl-seq> begin <stmt-seq> end | procedure ID is begin <stmt-seq> end
- DeclSeq: <decl-seq> ::= <decl > | <decl><decl-seq> | <function><decl-seq>
- StmtSeq: <stmt-seq> ::= <stmt> | <stmt><stmt-seq> 
- Decl: <decl> ::= <decl-integer> | <decl-record> 
- DeclInteger: <decl-integer> ::= integer ID ;
- DeclRecord: <decl-record> ::= record ID ;
- DeclFunction: <function> ::= procedure ID ( <parameters> ) is <stmt-seq> end
- Parameter: <parameters> ::= ID | ID , <parameters> 
- Stmt: <stmt> ::= <assign> | <if> | <loop> | <out> | <decl> 
- Call: <call> ::= begin ID ( <parameters> ) ;
- AssignStmt: <assign> ::= id <index> := <expr> ; | id := new record [ <expr> ]; | id := record id; 
- IfStmt: <if> ::= if <cond> then <stmt-seq> end | if <cond> then <stmt-seq> else <stmt-seq> end
- LoopStmt: <out> ::= out ( <expr> ) ;
- OutStmt: <out> ::= out ( <expr> ) ;
- Index: <index> ::= [ <expr> ] | epsilon 
- Cond: <cond> ::= <cmpr> | not <cond> | <cmpr> or <cond> | <cmpr> and <cond> 
- Cmpr: <cmpr> ::= <expr> = <expr> | <expr> < <expr> 
- Expr: <expr> ::= <term> | <term> + <expr> | <term> – <expr>
- Term: <term> ::= <factor> | <factor> * <term> | <factor> / <term>
- Factor: <factor> ::= id | id [ <expr> ] | const | ( <expr> ) | in ( )

## Refer to the PDF project descriptions for more details.