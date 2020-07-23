//: [Previous](@previous)

import Foundation

/**
Given a string, write a method to determine if it is a permutation of a palindrome.
*/
func isPermutationOfPalindrome(_ str: String) -> Bool {

    // We'll assume that the palindrome strings won't take spaces into account.
    let strWithoutSpaces = str.replacingOccurrences(of: " ", with: "")

    // We know that a palindrome string will have either:
    // * 1 character repeated an odd amount of times or (Ex: "meNem")
    // * 0 characters repeated an odd amount of times (Ex: "haah")
    // Knowing that property, we can create a hash map to count the times any character is in the string
    // and then ask for the amount of odd count characters
    var charDict: [Character: Int] = [:]

    for char in strWithoutSpaces {
        charDict[char] = (charDict[char] ?? 0) + 1
    }

    // Filter the characters in the dict with odd repetitions
    let oddRepeatedCharacters = charDict.filter({
        $0.value % 2 == 1
    })

    // Check against the previously stated property of a palindrome string.
    return oddRepeatedCharacters.count <= 1
}

// Here the only odd repeating letter is n and it is only 1 time in the string
assert(isPermutationOfPalindrome("memen"))
// Here we don't have any character repeated an odd amount of times
assert(isPermutationOfPalindrome("manu  manu"))
// Here we have 2 letters repeated an odd number of times. 3 'm' and 3 'e' -> So there is not permutation of a palindrome string
assert(!isPermutationOfPalindrome("mememe"))

//: [Next](@next)
