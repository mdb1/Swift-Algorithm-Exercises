//: [Previous](@previous)

import Foundation

typealias Matrix = [[Int]]

/**
 Write an algorithm such that if an element in an  MxN matrix is 0, its entire row and column are set to 0
*/
func zeroMatrix(_ matrix: Matrix) -> Matrix {

    // get a copy of the original matrix to prevent index out of bounds when zeroing values
    var zeroedMatrix = matrix

    // We'll store the rows and columns with zero values on these arrays
    var zeroInRowIndexes = [Int]()
    var zeroInColumnIndexes = [Int]()

    var rowIndex = 0
    for row in matrix {
        var columnIndex = 0
        for element in row {
            if element == 0 {
                zeroInRowIndexes.append(rowIndex)           // Store row index with zero value
                zeroInColumnIndexes.append(columnIndex)     // Store column index with zero value
            }
            columnIndex += 1
        }
        rowIndex += 1
    }

    rowIndex = 0
    for row in matrix {
        var columnIndex = 0
        for _ in row {
            // If one of the indexes is in one of the arrays, then we need to set that [row][column] to 0
            if zeroInRowIndexes.contains(rowIndex) || zeroInColumnIndexes.contains(columnIndex) {
                zeroedMatrix[rowIndex][columnIndex] = 0
            }
            columnIndex += 1
        }
        rowIndex += 1
    }

    return zeroedMatrix
}

// Input
// |  1 |  2 |  0 |  4 |
// |  5 |  6 |  7 |  8 |
// |  9 | 10 | 11 | 12 |
// | 13 | 14 | 15 | 16 |
let originalMatrix = [[1, 2, 0, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

// Output
// |  0 |  0 |  0 |  0 |
// |  5 |  6 |  0 |  8 |
// |  9 | 10 |  0 | 12 |
// | 13 | 14 |  0 | 16 |
let output = [[0, 0, 0, 0], [5, 6, 0, 8], [9, 10, 0, 12], [13, 14, 0, 16]]
assert(zeroMatrix(originalMatrix) == output)

// | 0 | 1 | 2 |
// | 2 | 2 | 0 |
let matrixNxM = [[0, 1, 2], [2, 2, 0]]

// | 0 | 0 | 0 |
// | 0 | 0 | 0 |
let outputNxM = [[0, 0, 0], [0, 0, 0]]
assert(zeroMatrix(matrixNxM) == outputNxM)

//: [Next](@next)
