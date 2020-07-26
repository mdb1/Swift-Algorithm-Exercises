//: [Previous](@previous)

import Foundation

/**
Implement a method to perform basic string compression using the counts of repeated characters.
 I.e.: "aaaabbccc" => "a4b2c3"
 Then return the shorter version.
*/
func stringCompression(_ strA: String) -> String {

    let word = strA.toCharArray()
    var compressedString = ""

    // Iterate through the letters and check against the next one
    var currentLetterCount = 0  // Save repetition value of a letter in this var
    for i in 0..<word.count {
        currentLetterCount += 1 // Increase repetation of current letter

        // Check for last letter in the word
        guard i != word.count - 1 else {
            // If it is the last letter, then append it to the string with it's current repetition value
            compressedString.append(word[i], times: currentLetterCount)
            break
        }

        if word[i] == word[i+1] {
            continue // If the next letter is the same as the current, continue with the loop
        }

        // If not, append the current letter with the repetition value to the compressed string
        compressedString.append(word[i], times: currentLetterCount)
        // Then reset the repetition variable
        currentLetterCount = 0
    }

    // Return the shorter word
    return compressedString.count < strA.count
        ? compressedString
        : strA
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

    mutating func append(_ letter: Character, times: Int) {
        self.append(letter)
        self.append(String(describing: times))
    }
}

assert(stringCompression("aaabbbccc") == "a3b3c3")
assert(stringCompression("aaabbbcccd") == "a3b3c3d1")
assert(stringCompression("abcd") == "abcd") // This is one is shorter as it is

//: [Next](@next)
