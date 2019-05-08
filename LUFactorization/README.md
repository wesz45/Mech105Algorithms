# LU Factorization
Matlab function that accepts a square matrix A as an input and performs LU decomposition, resulting in a lower triangular matrix L of coefficients used in elimination, an upper triangular matrix U resulting from the eliminations, and a modified identity matrix P that is used to keep track of row switches used to reduce errors. Inputs and outputs resolve such that L*U=P*A.
Subtraction can result in subtractive cancellation errors, but these are minimized in the code.
