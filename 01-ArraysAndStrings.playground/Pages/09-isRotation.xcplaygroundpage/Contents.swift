//: [Previous](@previous)

import Foundation

/**
  Write a function to determine if one string is a rotation of the other, using only 1 call to the substring method
*/
func isRotation(_ strA: String, _ strB: String) -> Bool {

    // Rotation example: "Hello" -> "lloHe"
    // So an easy way to do this is appending the first word back to back to itself -> "HelloHello"
    // And then ask if the new word contains the second one.

    var doubleWord = strA
    doubleWord.append(strA)

    return doubleWord.contains(strB)

}

assert(isRotation("Hello", "lloHe"))
assert(!isRotation("Hello", "Heoll"))

//: [Next](@next)
