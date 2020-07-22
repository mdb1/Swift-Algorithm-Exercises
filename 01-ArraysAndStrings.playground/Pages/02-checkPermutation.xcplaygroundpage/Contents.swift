//: [Previous](@previous)

import Foundation

/**
Given 2 strings, write a method to determine if one is a permutation of the other
*/
func checkPermutation(_ strA: String, _ strB: String) -> Bool {
    // Check if the strings have the same amount of characters
    if strA.count != strB.count {
        return false
    }

    // Sort them and check if the results are equal
    return strA.sorted() == strB.sorted()
}

assert(checkPermutation("buenos aires", "anios bueres"))
// Check two strings with different lengths
assert(!checkPermutation("this is short", "this is very very very long"))
// Check two strings that are not permutation of each other
assert(!checkPermutation("this is short", "this is great"))

// MARK: - HINTS

// 1. There is a solution that is O(N log N) time. Another solution uses some space but is O(N) time.
/// * Our current solution is O(N log N)
/// * Lets think about one in O(N) time:
func checkPermutationInNTime(_ strA: String, _ strB: String) -> Bool {
    // Check if the strings have the same amount of characters
    if strA.count != strB.count {
        return false
    }

    // Define dictionaries for each string where we will count the times a character is repeated
    var dictA: [Character: Int] = [:]
    var dictB: [Character: Int] = [:]

    for char in strA {
        // Check nullabillity
        dictA[char] = (dictA[char] ?? 0) + 1
    }

    for char in strB {
        // Check nullabillity
        dictB[char] = (dictB[char] ?? 0) + 1
    }

    // We did it! This method is O(N) time
    return dictA == dictB
}

assert(checkPermutationInNTime("buenos aires", "anios bueres"))
// Check two strings with different lengths
assert(!checkPermutationInNTime("this is short", "this is very very very long"))
// Check two strings that are not permutation of each other
assert(!checkPermutationInNTime("this is short", "this is great"))

// 2. Could a hash table be useful?
/// We used hash tables in the hint 1, so yes!

//: [Next](@next)

