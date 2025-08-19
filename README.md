# Bracket Puzzle
### Checks if brackets given are balanced. Finds the total number of solutions for balancing brackets by adding or removing a single bracket.

## Example Queries
```
?- solveBracket(N,["(","(","(",")","(",")",")"]).
N = 11

?- solveBracket(N,["(",")","(",")",")"]).
N = 8.

?- solveBracket(N,["("]).
N = 2.

?- solveBracket(N,[")"]).
N = 2.

?- solveBracket(N,[]).
N = 1.
```
## Rules
 - bracket(B)
    - checks if a list of brackets are balanced. Brackets are considered balanced if the brackets are closed properly.
 - addBracket(N,B)
    - checks how many N ways there are to add one open or closed bracket to brackets list B to properly balance the list of brackets.
 - addOpenBracket(N,B)
    - checks how many N ways there are to add an open bracket to the list of brackets B to properly balance the list of brackets B.
 - addCloseBracket(N,B)
    - checks how many N ways there are to add a closed bracket to the list of brackets B to properly balance the list of brackets B.
 - removeBracket(N,B)
    - checks how many N ways there are to remove a bracket from the list of brackets B to properly balance the list of brackets B.
 - solveBracket(N,B)
    - checks how many N ways there are to add or remove a bracket to the list of brackets B to properly balance the list of brackets B.
