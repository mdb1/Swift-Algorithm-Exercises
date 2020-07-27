//: [Previous](@previous)

import Foundation

typealias Matrix = [[Int]]

/**
 Rotate an NxN matrix by 90 degrees to the right
*/
func rotate90Degrees(_ matrix: Matrix) -> Matrix {

    // We know that in order to rotate the matrix 90 degrees we can use this rule:
    // original[out][in] -> rotated[in][matrix.count - 1 - out] --> We figured that out by drawing an example on paper
    // Another way to put it is that if the original value is (x, y) in an NxN matrix,
    // then rotating that by 90 degrees to the right would be the same as having: (y, (N - x))
    var rotatedMatrix = matrix
    // Since we know the matrix is NxN is safe to use the count of only the arrays count
    let matrixCount = matrix.count

    var rowIndex = 0
    for row in matrix {
        var elementIndex = 0
        for element in row {
            rotatedMatrix[elementIndex][matrixCount - 1 - rowIndex] = element // Rotate following the rule
            elementIndex += 1
        }
        rowIndex += 1
    }

    return rotatedMatrix
}

// |  1 |  2 |  3 |  4 |
// |  5 |  6 |  7 |  8 |
// |  9 | 10 | 11 | 12 |
// | 13 | 14 | 15 | 16 |
let originalMatrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

// | 13 |  9 |  5 |  1 |
// | 14 | 10 |  6 |  2 |
// | 15 | 11 |  7 |  3 |
// | 16 | 12 |  8 |  4 |
let originalMatrixRotated90Degrees = [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]
assert(originalMatrixRotated90Degrees == rotate90Degrees(originalMatrix))

// | 1 | 1 |
// | 2 | 2 |
let matrix2x2 = [[1, 1], [2, 2]]

// | 2 | 1 |
// | 2 | 1 |
let matrix2x2Rotated90Degrees = [[2, 1], [2, 1]]
assert(matrix2x2Rotated90Degrees == rotate90Degrees(matrix2x2))

//: [Next](@next)
