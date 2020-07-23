//: [Previous](@previous)

import Foundation

/**
Write a method to replace all spaces in a string with "%20"
*/
func URLify(_ str: String) -> String {
    return str.trimmingCharacters(in: .whitespaces) // Trim whitespaces at the end and the beggining of the string
        .replacingOccurrences(of: " ", with: "%20") // and then replace the ones in the middle with '%20'
}

assert(URLify("  this is not a url ") == "this%20is%20not%20a%20url")

// Now solve it without that string magic method
func URLifyCustom(_ str: String) -> String {
    var url = ""
    let trimmedString = trimWhitespaces(str)

    for character in trimmedString {
        if character == " " {
            url.append("%20")
            continue
        }

        url.append(character)
    }

    return url
}

// Custom method to trim whitespaces
func trimWhitespaces(_ str: String) -> String {
    let stringAsCharArray = str.toCharArray()
    var prefixSpacesCount = 0
    var suffixSpacesCount = 0

    // Count spaces at the beggining of the string
    for i in 0..<stringAsCharArray.count {
        if stringAsCharArray[i] != " " {
            break
        }

        prefixSpacesCount = prefixSpacesCount + 1
    }

    // Count spaces at the end of the string
    for i in (0..<stringAsCharArray.count).reversed() {
        if stringAsCharArray[i] != " " {
            break
        }

        suffixSpacesCount = suffixSpacesCount + 1
    }

    // Drop all the spaces at the beggining and at the end of the string
    return String(describing: str.dropFirst(prefixSpacesCount).dropLast(suffixSpacesCount))
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

assert(URLifyCustom("  this is not a url ") == "this%20is%20not%20a%20url")
assert(URLifyCustom("  ") == "")

//: [Next](@next)
