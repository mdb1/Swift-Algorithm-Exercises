//: [Previous](@previous)

import Foundation

/**
There are three types of characeter edits on strings: insert, replace, or delete.
Write a function to return if one string is 0 or 1 edit away from the other
*/
func oneOrZeroAway(_ strA: String, _ strB: String) -> Bool {
    let wordA = strA.toCharArray()
    let wordB = strB.toCharArray()
    let (shorterWord, longerWord) = strA.count > strB.count
        ? (wordB, wordA)
        : (wordA, wordB)

    let countDiff = longerWord.count - shorterWord.count

    guard countDiff <= 1  else {
        // If the longer word has more than 1 character than the shorter one, then they are not `one away`
        return false
    }

    // Store in dictionaries the count of letters on each word
    var shortWordDict: [Character: Int] = [:]
    for char in shorterWord {
        shortWordDict[char] = (shortWordDict[char] ?? 0) + 1
    }

    var longWordDict: [Character: Int] = [:]
    for char in longerWord {
        longWordDict[char] = (longWordDict[char] ?? 0) + 1
    }

    // Count the differences between the characters in each dict
    var diffCount = 0
    for entry in shortWordDict {
        if longWordDict[entry.key] == entry.value {
            // No need to update the diff count here, since there is no diff for this character
            continue
        }

        // We need the absolute diff for each character
        let diffForCharacter = abs(
            (longWordDict[entry.key] ?? 0) - (entry.value)
        )

        // Update the diff count
        diffCount += diffForCharacter

        // If the sum of the character difference is greater than one, then they are not `one away`
        if diffCount > 1 {
            // I.e: From the moment that one of the words has 2 or more characters than the other one doesn't,
            // that's enough to say that the 2 words are not `one away`
            return false
        }
    }

    return true
}

extension String {
    // Convert a string into a character array
    func toCharArray() -> [Character] {
        var charArray: [Character] = []
        for char in self {
            charArray.append(char)
        }

        return charArray
    }
}

assert(!oneOrZeroAway("aaa", "aaadsaaa")) // Differency count, not one away
assert(oneOrZeroAway("aaa", "aaab"))      // One deletion away
assert(oneOrZeroAway("aaa", "aa"))        // One addition away
assert(oneOrZeroAway("aaa", "aab"))       // One edit away
assert(oneOrZeroAway("aaa", "aaa"))       // Already equals, zero edit aways
assert(!oneOrZeroAway("aaa", "abb"))      // Same count, but not one away

//: [Next](@next)
