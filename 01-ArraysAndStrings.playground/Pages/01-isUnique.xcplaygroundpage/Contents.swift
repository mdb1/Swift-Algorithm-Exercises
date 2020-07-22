//: [Previous](@previous)

/**
 Implement an algorith to determine if a string has all unique characters.
 What if you cannot use additional data structures?
 */

func isUnique(str: String) -> Bool {
    // Use a dictionary to store the amount of times a character is in a string.
    var dictionary: [Character: Int] = [:]

    // Iterate through the characters in the string
    for character in str {
        if let amountOfTimesInString = dictionary[character], amountOfTimesInString > 0 {
            // If the character exists on the dict, then it has to be a repeated value
            return false
        }

        dictionary[character] = 1
    }

    return true
}

assert(!isUnique(str: "Here is to the crazy ones"))
assert(isUnique(str: "12345678"))

// No additional data structs
func isUniqueWithNoAdditionalDataStructures(str: String) -> Bool {
    // Sort the string alphabetically
    let sortedStr = str.sorted()

    // Iterare between the first character of the sortedArray and 1 before the last one
    // Since we will be comparing value at position `i` with value at position `i + 1` we can't iterate through the
    // complete array. Otherwise, once we reach the final character, we'd ask for the character at the next position
    // and it'd be out of the bounds of the array.
    for i in 0..<sortedStr.count - 1 {
        // Check if character at position `i` is equal to character at position `i + 1`
        if sortedStr[i] == sortedStr[i+1] {
            return false
        }
        // We could've used a `for-where` instead of `for-if` statement here
    }

    return true
}

// Try a string with repeated characters
assert(!isUniqueWithNoAdditionalDataStructures(str: "Here is to the crazy ones"))
// Try a string with repeated characters at the end -> This tests the edge case described in the big comment
assert(!isUniqueWithNoAdditionalDataStructures(str: "abcdd"))
// Try a string with repeated characters at the beggining
assert(!isUniqueWithNoAdditionalDataStructures(str: "aabcd"))
// Try a string with repeated emojis
assert(!isUniqueWithNoAdditionalDataStructures(str: "🥇🥈🥇"))
// Try a string without repeated characters
assert(isUniqueWithNoAdditionalDataStructures(str: "UncopyRightable🚀"))

// MARK: - Hints

// 1. Try a hash table
/// We used a hash table on the implementation of the `isUnique` method. Check out Apple's documentation for more info.

// 2. Could a bit vector be useful?
/// Will come back to this one in the future

// 3. Can you solve it in O(N log N) time?
/// Current solutions are:
/// * O(N) for `isUnique`
/// * O(N log N) for `isUniqueWithNoAdditionalDataStructures`
/// --> string.sorted() complexity is O(N log N)
// So both of our solutions are good samples for this hint.

//: [Next](@next)

